# Silla-Lecture-Evaluation
# 신라대 강의 평가 페이지

## 프로젝트 목적

기존에 강의평가 페이지나 게시물이 없어서 만들기로 하였다.  
모바일에서도 쉽게 보이도록 반응형 웹으로 제작하였다.  
Servlet & JSP 를 사용.  
서버는 AWS를 이용.  
WebContent의 view 폴더에는 html과jsp, src에는 Servlet이 들어있다.   

1.index.jsp


<img src="https://user-images.githubusercontent.com/68947314/98551653-e7afaa00-22e0-11eb-9d7d-49f2cf2aafe3.jpg" width="50%" height="70%"></img>

로그인 버튼을 누를시 DB에 값이 있고 비밀번호가 일치하면 로그인성공
성공시 session에 값을 저장한다.
틀리면 jsp에 message값을 request해서 alert을 띄운다.

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

session에 값이 있으면 main페이지로 바로 이동
관리자 로그인시 관리자 페이지로 이동

    if(pathInfo.equals("/index")) {
				viewName = "/view/index.jsp";
				if(session.getAttribute("nick")!=null) {
					viewName = "redirect:/lecture-evaluation/main";
					if(session.getAttribute("nick").equals("관리자")) {
						viewName="redirect:/lecture-evaluation/admin";
					}
				}
