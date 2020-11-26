package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
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
		
		if(dao == null) {
			ServletContext context = getServletContext();
			dao = new SillaDBCPDAO(
					context.getInitParameter("dbcp_resource_name")
			);
			session.setAttribute("dao", dao);
		}
		
		if(pathInfo == null) {		// main 페이지(로그인된 페이지)
			List<LectureDO> deptlist = null;
			String dept = (String) session.getAttribute("user_dept");
			
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
				double avg_star;
				List<LectureDO> eval_list = null;
				try {
					eval_list=dao.inquiry(lec_name, p_name);
					avg_star = dao.avg_star(lec_name, p_name);
					session.setAttribute("eval_list", eval_list);
					session.setAttribute("avg_star", avg_star);
					session.setAttribute("lec_name", lec_name);
					session.setAttribute("p_name", p_name);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="/view/inquiry.jsp";
				
			}
			else if(pathInfo.equals("/search")) {		// 강의명이나 교수명 검색
				String search_id = request.getParameter("search_id");
				List<LectureDO> lecture_List = new ArrayList<LectureDO>();
				try {
					lecture_List = dao.Search(search_id);
					session.setAttribute("lectureList", lecture_List);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
					
				}
				viewName="/view/search.jsp";
			}
		}
		if(action!=null) {
			if(action.equals("register")) {	// 강의가 없으면 강의 등록
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				lecture.setLec_name(lec_name);
				lecture.setP_name(p_name);
				lecture.setDept(request.getParameter("dept"));
			
				try {
					dao.insertdept(lecture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				lec_name = URLEncoder.encode(lec_name, "UTF-8");	// 한글로 인코딩
				viewName="redirect:/lecture-evaluation/main/search?search_id="+lec_name;
			}
			else if(action.equals("add_eval")) {
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				session.setAttribute("lec_name", lec_name);
				session.setAttribute("p_name", p_name);
				
				viewName="/view/insert_eval.jsp";
			}
			else if(action.equals("insert_eval")) {		// 강의 평가 저장
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				String writer = (String) session.getAttribute("nick");
				int star = Integer.parseInt(request.getParameter("star"));
				int attendance = Integer.parseInt(request.getParameter("attendance"));
				int assign = Integer.parseInt(request.getParameter("assign"));
				int grade = Integer.parseInt(request.getParameter("grade"));
				int difficulty = Integer.parseInt(request.getParameter("difficulty"));
				int learning = Integer.parseInt(request.getParameter("learning"));
				
				lecture.setLec_name(lec_name);
				lecture.setP_name(p_name);
				lecture.setStar(star);
				lecture.setAttendance(attendance);
				lecture.setAssign(assign);
				lecture.setGrade(grade);
				lecture.setDifficulty(difficulty);
				lecture.setLearning(learning);
				lecture.setContent(request.getParameter("content"));
				lecture.setWriter(writer);
				try {
					dao.insert_eval(lecture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				lec_name = URLEncoder.encode(lec_name, "UTF-8");	// 한글로 인코딩
				p_name = URLEncoder.encode(p_name,"UTF-8");
				viewName="redirect:/lecture-evaluation/main/inquiry?lec_name="+lec_name+"&p_name="+p_name;
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
