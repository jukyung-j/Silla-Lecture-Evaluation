# Silla-Lecture-Evaluation
# 신라대 강의 평가 페이지

## 프로젝트 목적

기존에 강의평가 페이지나 게시물이 없어서 만들기로 하였다.  
모바일에서도 쉽게 보이도록 반응형 웹으로 제작하였다.  
Servlet & JSP 를 사용.  
서버는 tomcat를 이용. AWS를 이용해 업로드
WebContent의 view 폴더에는 html과jsp, src에는 Servlet이 들어있다.   

1.index.jsp


<img src="https://user-images.githubusercontent.com/68947314/100744878-cfcfcf80-3421-11eb-8021-503bb933a70b.jpg" width="50%" height="70%"></img>

로그인 버튼을 누를시 DB에 값이 있고 비밀번호가 일치하면 로그인성공   
성공시 session에 값을 저장한다.   
틀리면 jsp에 message값을 보내서 alert을 띄운다.

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
  				
2. join_form.jsp
<img src="https://user-images.githubusercontent.com/68947314/100745047-0c9bc680-3422-11eb-9a14-916112d8d588.jpg" width="50%" height="70%"></img>

ajax를 이용해 데이터를 비동기적으로 처리한다.  
id를 pk로 하고 nickname을 unique key로 두어 중복되지 않게 처리한다.  
아이디,비밀번호,닉네임,이메일을 정규표현식으로 두어 표현식에 맞지않게 적으면 빨간글씨가 뜨게 만들었다.  
이메일은 해당학교의 학생들만 이용하기 위해 sillain메일을 이용해 인증번호를 보낸다.
폼을 다작성하지 않으면 alert창이 뜬다.  
  아이디와 닉네임의 중복을 체크하는 코드
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

  회원가입처리하는 코드
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
