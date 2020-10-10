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
		SILLADAO dao = (SILLADAO)session.getAttribute("dao");
		

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
			}
		}

		if(action != null){
			if(action.equals("login")) {		// 로그인 화면
				String id = request.getParameter("id");
				String pwd = request.getParameter("pwd");
				boolean message = true;	// 로그인 메세지
	
				try {
					member = dao.Login(id);
					if(member != null) {
						if(member.getPwd().equals(pwd)) {	// 로그인 성공
							message = true;
							request.setAttribute("message", message);
						}
						else {		// 비밀번호 잘못 입력
							message = false;
							request.setAttribute("message", message);
							
						}
					}
					else {			// 아이디 잘못 입력
						message = false;
						request.setAttribute("message", message);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/index.jsp";
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
