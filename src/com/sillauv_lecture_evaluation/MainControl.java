package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
			Cookie[] cookies = request.getCookies();
			String dept = cookies[3].getValue();
			try {					// 해당학과의 최신글 조회
				deptlist = dao.Search_dept(dept);
				request.setAttribute("deptlist", deptlist);
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
				List<LectureDO> eval_list = null;
				try {
					eval_list=dao.inquiry(lec_name, p_name);
					session.setAttribute("eval_list", eval_list);
					session.setAttribute("lec_name", lec_name);
					session.setAttribute("p_name", p_name);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/inquiry.jsp";
				
			}
		}
		
		
		if(action!=null) {
			if(action.equals("search")) {		// 강의명이나 교수명 검색
				String search_id = request.getParameter("search_id");
				List<LectureDO> lectureList = null;
				try {
					lectureList = dao.Search(search_id);
					session.setAttribute("lectureList", lectureList);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/search.jsp";
			}
			else if(action.equals("register")) {	// 강의가 없으면 강의 등록
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
			else if(action.equals("add_eval")) {
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				session.setAttribute("lec_name", lec_name);
				session.setAttribute("p_name", p_name);
				
				viewName="/view/insert_eval.jsp";
			}
			else if(action.equals("insert_eval")) {		// 강의 평가 저장
				
				lecture.setLec_name(request.getParameter("lec_name"));
				lecture.setP_name(request.getParameter("p_name"));
				lecture.setStar(Integer.parseInt(request.getParameter("star")));
				lecture.setContent(request.getParameter("content"));
				try {
					dao.insert_eval(lecture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/inquiry.jsp";
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
