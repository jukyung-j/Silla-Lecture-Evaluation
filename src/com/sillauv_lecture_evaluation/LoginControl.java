package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LecControl
 */
@WebServlet("/lecture-evaluation/*")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginControl() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// step #1. get request parameters
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String pathInfo = request.getPathInfo();
		String action = request.getParameter("action");
		String viewName = null;
		MemberDO member = new MemberDO(); 
		SillaDao dao = (SillaDao)session.getAttribute("dao");
		boolean message = true;		// 로그인 알림 메세지

		if(dao == null) {
			ServletContext context = getServletContext();
			dao = new SillaDBCPDAO(
					context.getInitParameter("dbcp_resource_name")
			);
			session.setAttribute("dao", dao);
		}
		
		// step #2. data processing
		// get routing info.
		if(pathInfo != null && pathInfo.length() > 1) {
			if(pathInfo.equals("/index")) {
				viewName = "/view/index.jsp";
				if(session.getAttribute("nick")!=null) {
					viewName = "redirect:/lecture-evaluation/main";
					if(session.getAttribute("nick").equals("관리자")) {
						viewName="redirect:/lecture-evaluation/admin";
					}
				}
			}
			else if(pathInfo.equals("/join_form")) {
				viewName="/view/join_form.jsp";
			}
			else if(pathInfo.equals("/mailsend")) {
				MailControl mail = new MailControl();
				mail.doGet(request, response);
			}
		}

		if(action != null){
			if(action.equals("login")) {		// 로그인 확인
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				
				message = true;	// 잘못된 로그인 확인
				
				try {
					member = dao.Login(id);
					if(member != null) {
						if(member.getPwd().equals(pwd)) {	// 로그인 성공
							message = true;
							session.setAttribute("nick", member.getNickname());
							session.setAttribute("user_dept", member.getDept());
							request.setAttribute("message", message);
							viewName="redirect:/lecture-evaluation/main";
							if(member.getId().equals("admin")) {		// 관리자 로그인
				            	viewName="redirect:/lecture-evaluation/admin";
				            }
						}
						else {		// 비밀번호 실패
							message = false;
							request.setAttribute("message", message);
							viewName="/view/index.jsp";
						}
					}
					else {			// 아이디 실패
						message = false;
						request.setAttribute("message", message);
						viewName="/view/index.jsp";
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else if(action.equals("overlapping_check")) {		// 아이디와 닉네임 중복 확인
				response.setCharacterEncoding("UTF-8");
				String id;
				int data = 0;
				if(request.getParameter("userid") != null) {	// 아이디 중복 확인
					id = request.getParameter("userid");
					try {
						data = dao.Over_Confirm(id, "id");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(request.getParameter("usernick") != null){	// 닉네임 중복 확인
					id = request.getParameter("usernick");
					try {
						data = dao.Over_Confirm(id, "nickname");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				viewName = null;
				response.getWriter().print(data);
			}
			else if(action.equals("join")) {		// 회원가입 DB 등록
				member.setName(request.getParameter("name"));
				member.setNickname(request.getParameter("nickname"));
				member.setId(request.getParameter("user_id"));
				member.setPwd(request.getParameter("pwd"));
				member.setDept(request.getParameter("dept"));
				member.setEmail(request.getParameter("email"));

				try {
					dao.Join(member);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="redirect:/lecture-evaluation/index";
			}
			else if(action.equals("logout")) {
				session.invalidate();
				viewName="redirect:/lecture-evaluation/index";
			}
			
		}
		if(viewName != null) {
			if(viewName.contains("redirect:")) {
				String location = viewName.split(":")[1];
				response.sendRedirect(request.getContextPath()+location);
			}
			else{
				
				RequestDispatcher view = request.getRequestDispatcher(viewName);
				view.forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
