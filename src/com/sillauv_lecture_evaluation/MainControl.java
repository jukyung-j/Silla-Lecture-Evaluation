package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MainControl
 */
@WebServlet("/lecture-evaluation/main/*")
public class MainControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String pathInfo = request.getPathInfo();
		String action = request.getParameter("action");
		String viewName = null;
		LectureDO lecture = new LectureDO(); 
		SillaDao dao = (SillaDao)session.getAttribute("dao");
		
		if(pathInfo == null) {		// main 페이지(로그인된 페이지)
			List<LectureDO> deptlist = null;
			String dept = (String) session.getAttribute("dept");
			
			try {					// 해당학과의 최신글 조회
				deptlist = dao.Search_dept(dept);
				session.setAttribute("deptlist", deptlist);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			viewName="/view/main.jsp";
		}else {

			if(pathInfo.equals("/register_form")) {
				viewName="/view/register.jsp";
			}
			else if(pathInfo.equals("/inquiry")) {
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				
				viewName="/view/inquiry.jsp";
				
			}
		}
		
		
		if(action!=null) {
			if(action.equals("search")) {		// 강의명이나 교수명 검색
				String search_id = request.getParameter("search_id");
				List<LectureDO> lectureList = null;
				try {
					lectureList = dao.Search(search_id);
					request.setAttribute("lectureList", lectureList);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/search.jsp";
			}
			else if(action.equals("register")) {
				lecture.setLec_name(request.getParameter("lec_name"));
				lecture.setP_name(request.getParameter("p_name"));
				lecture.setDept(request.getParameter("dept"));
			
				try {
					dao.insertdept(lecture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				viewName="/view/main.jsp";
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
