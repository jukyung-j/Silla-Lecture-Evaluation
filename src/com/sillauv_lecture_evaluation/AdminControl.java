package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

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
 * Servlet implementation class AdminControl
 */
@WebServlet("/lecture-evaluation/admin/*")
public class AdminControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String pathInfo = request.getPathInfo();
		String action = request.getParameter("action");
		String viewName = null;
		MemberDO member = new MemberDO(); 
		LectureDO lecture = new LectureDO();
		SillaDao dao = (SillaDao)session.getAttribute("dao");
		
		if(dao == null) {
			ServletContext context = getServletContext();
			dao = new SillaDBCPDAO(
					context.getInitParameter("dbcp_resource_name"), 
					context.getInitParameter("db_url"),
					context.getInitParameter("db_userid"),
					context.getInitParameter("db_passwd")
			);
			session.setAttribute("dao", dao);
		}
		
		if(pathInfo == null) {
			String nick = (String) session.getAttribute("nick");
			if(nick.equals("관리자")) {
				List<LectureDO> admin_eval = null;
				try {
					admin_eval = dao.Search_admin();	// 모든 내용들 출력
					request.setAttribute("admin_eval", admin_eval);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					viewName="/view/admin.jsp";
			}
			else 
				viewName="redirect:/lecture-evaluation/main";
		}
		if(action!=null) {
			if(action.equals("search")) {
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
			else if(action.equals("update_form")) {
				int idx = Integer.parseInt(request.getParameter("idx"));
				lecture = null;
				
				try {
					lecture = dao.SearchIdx(idx);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.setAttribute("lecture", lecture);
				viewName="/view/update_form.jsp";
				
			}
			else if(action.equals("update")) {
				lecture.setIdx(Integer.parseInt(request.getParameter("idx")));
				lecture.setLec_name(request.getParameter("lec_name"));
				lecture.setP_name(request.getParameter("p_name"));
				lecture.setStar(Integer.parseInt(request.getParameter("star")));
				lecture.setAttendance(Integer.parseInt(request.getParameter("attendance")));
				lecture.setAssign(Integer.parseInt(request.getParameter("assign")));
				lecture.setGrade(Integer.parseInt(request.getParameter("grade")));
				lecture.setLearning(Integer.parseInt(request.getParameter("learning")));
				lecture.setDifficulty(Integer.parseInt(request.getParameter("difficulty")));
				lecture.setContent(request.getParameter("content"));
				
				try {
					dao.updateAdmin(lecture);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="redirect:/lecture-evaluation/admin";
			}
			else if(action.equals("delete")) {
				int idx = Integer.parseInt(request.getParameter("idx"));
				
				try {
					dao.delete(idx);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="redirect:/lecture-evaluation/admin";
			}
			else if(action.equals("lecture_delete")) {
				String lec_name = request.getParameter("lec_name");
				String p_name = request.getParameter("p_name");
				
				try {
					dao.lecture_delete(lec_name, p_name);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				viewName="redirect:/lecture-evaluation/admin";
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
