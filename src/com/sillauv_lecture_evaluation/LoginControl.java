package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
				viewName = "/view/index2.jsp";
			}
			else if(pathInfo.equals("/join_form")) {
				viewName="/view/join_form2.jsp";
			}
		}
		else
			viewName="/view/index2.jsp";

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
							request.setAttribute("message", message);
						}
						else {		// 비밀번호 실패
							message = false;
							request.setAttribute("message", message);
							
						}
					}
					else {			// 아이디 실패
						message = false;
						request.setAttribute("message", message);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/index2.jsp";
			}
			else if(action.equals("overlapping_check")) {		// 아이디와 닉네임 중복 확인
				response.setCharacterEncoding("UTF-8");
				String id;
				int data = 0;
				if(request.getParameter("userid") != null) {
					id = request.getParameter("userid");
					try {
						data = dao.Over_Confirm(id, "id");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				else if(request.getParameter("usernick") != null){
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
