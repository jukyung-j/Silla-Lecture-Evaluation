# Silla-Lecture-Evaluation
# 신라대 강의 평가 페이지

## 프로젝트 목적

기존에 신라대 강의평가 페이지나 게시물이 없어서 만들기로 하였다.  
모바일에서도 쉽게 보이도록 반응형 웹으로 제작하였다.  
Servlet & JSP 를 사용.  
서버는 tomcat를 이용. AWS를 이용해 업로드
WebContent의 view 폴더에는 html과jsp, src에는 Servlet이 들어있다.   

## 소스설명  
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
ajax

	function check_ajax(id,user,$check,J,index){		// 아이디와 닉네임 중복 확인을 위한 함수
		$.ajax({
			url : '${pageContext.request.contextPath}/lecture-evaluation?action=overlapping_check&'+id+'='+user,
			type : 'get',
			success : function(data){
				console.log("data:"+data);
				if(data == 1){	// 중복
					$check.text("사용중입니다.");
					$check.css("color","red");
					join[index]=1;
					
				} else{
					if(J.test(user)){	// 길이, 문자열 검사
						$check.text("사용 가능합니다.");
						$check.css('color','blue');
						join[index]=0;
					} else {
						$check.text("다시 입력해주세요.");
						$check.css('color','red');
						$("#reg_submit").attr("disabled",true);
						join[index]=1;
					}
				}
			}, error : function(){
				console.log("중복체크실패");
			}
		});
	}

mail


	if(action != null){
			if(action.equals("send_mail")) {		// 이메일 인증번호 
				String to_email = request.getParameter("usermail"); //메일 받을 주소
				 //mail server 설정
                String host = "smtp.naver.com";
                String user = "judyj801@naver.com"; //자신의 네이버 계정
                String password = "wldh9698";//자신의 네이버 패스워드
                
                //SMTP 서버 정보를 설정한다.
                Properties props = new Properties();
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.port", 465);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.ssl.enable", "true");
                props.put("mail.smtp.starttls.enable","false");
                //인증 번호 생성기
                int key = (int)Math.floor((Math.random()*100000+1));
                
                System.out.println("key"+key);
                Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(user,password);
                    }
                });
                
                // email 전송
                try {
                    MimeMessage msg = new MimeMessage(session);
                    msg.setFrom(new InternetAddress(user, "신라대 강의평가"));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                    
                    //메일 제목
                    msg.setSubject("안녕하세요. 신라대 강의평가 인증 메일입니다.");
                    //메일 내용
                    msg.setText("인증 번호는 :"+key);
                    
                    Transport.send(msg);
                    System.out.println("이메일 전송");
                    
                }catch (Exception e) {
                    e.printStackTrace();// TODO: handle exception
                    System.out.println("실패");
                }
                HttpSession saveKey = request.getSession();
                //saveKey.setAttribute("key", key);
            	response.getWriter().print(key);
			}
		}
	}
3. main.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100747053-e3306a00-3424-11eb-8b31-2251b7c51f5b.jpg" width="50%" height="70%"></img>  
로그인 한뒤의 화면이다. 메인페이지에는 자신의 학과의 최신글3개를 볼 수 있다.
	
  DAO
  
  
  	public List<LectureDO> Search_dept(String dept) throws SQLException {
			ArrayList<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql="SET @ROWNUM:=0";
				stmt = con.prepareStatement(sql);
				rs = stmt.executeQuery();
				sql = "select @ROWNUM:=@ROWNUM+1 AS rownum, e.lec_name, e.p_name, e.dept, e.star, e.attendance, e.assign, e.grade, e.learning,e.difficulty, e.content,e.writer, e.todate,e.idx "
						+ "from (SELECT * FROM eval ORDER BY todate DESC)e "
						+ "where dept = ? LIMIT 3";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, dept);
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lecture.setStar(rs.getInt("star"));
						lecture.setAttendance(rs.getInt("attendance"));
						lecture.setAssign(rs.getInt("assign"));
						lecture.setGrade(rs.getInt("grade"));
						lecture.setLearning(rs.getInt("learning"));
						lecture.setDifficulty(rs.getInt("difficulty"));
						lecture.setDept(rs.getString("dept"));
						lecture.setContent(rs.getString("content"));
						lecture.setWriter(rs.getString("writer"));
						lecture.setTodate(rs.getString("todate"));
						lecture.setIdx(rs.getInt("idx"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
4. search.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100747285-2f7baa00-3425-11eb-9489-909c0853eb05.jpg" width="50%" height="70%"></img>  

강의명이나 교수명을 검색하면 그에 해당하는 결과들이 나온다.  

DAO

	public List<LectureDO> Search(String name) throws SQLException {
			List<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT lec_name, p_name from lecture where lec_name LIKE ? or p_name LIKE ?";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, "%"+name+"%");
				stmt.setString(2, "%"+name+"%");
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}

5. register.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100747654-afa20f80-3425-11eb-85af-cb0097123fc5.jpg" width="50%" height="70%"></img>  

자기가 찾고자 하는 강의가 없을 경우 스스로 강의를 등록할 수 있다.  
강의명과 교수명 강의에 해당하는 학과를 선택하면 등록이 가능하다.

강의를 등록하고나면 등록한 강의로 search페이지로 이동한다.


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

6. inquiry.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100748389-9baadd80-3426-11eb-87b5-8ee94079ab8a.jpg" width="50%" height="70%"></img>  

강의를 선택하고 난뒤의 페이지다. 해당 강의에 대한 정보를 볼 수 있다.  
상단에는 해당 강의의 총별점의 평균을 볼 수 있다.  
하단에는 강의들의 총 별점, 작성자, 작성시간, 작성내용들이 나오고  
출석체크, 난이도, 학습량, 과제, 학점의 점수들이 polygon chart radar로 나오게 된다.


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
DAO


	public List<LectureDO> inquiry(String lec_name,String p_name) throws SQLException {
			ArrayList<LectureDO> lectureList = null;
			connectDB();
			PreparedStatement stmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT * "
						+ "FROM (SELECT * FROM eval where lec_name = ? AND p_name = ? ORDER BY todate DESC) e";
				stmt = con.prepareStatement(sql);
				stmt.setString(1,lec_name);
				stmt.setString(2, p_name);
				rs = stmt.executeQuery();
				
				if(rs.isBeforeFirst()) {
					lectureList = new ArrayList<LectureDO>();
					while(rs.next()) {
						LectureDO lecture = new LectureDO();
						lecture.setLec_name(rs.getString("lec_name"));
						lecture.setP_name(rs.getString("p_name"));
						lecture.setStar(rs.getInt("star"));
						lecture.setAttendance(rs.getInt("attendance"));
						lecture.setAssign(rs.getInt("assign"));
						lecture.setGrade(rs.getInt("grade"));
						lecture.setLearning(rs.getInt("learning"));
						lecture.setDifficulty(rs.getInt("difficulty"));
						lecture.setContent(rs.getString("content"));
						lecture.setWriter(rs.getString("writer"));
						lecture.setTodate(rs.getString("todate"));
						lecture.setIdx(rs.getInt("idx"));
						lectureList.add(lecture);
					}
				}
			}catch(SQLException e) {
				throw e;
			}finally {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return lectureList;
		}
	
7.add_eval.jsp

<img src="https://user-images.githubusercontent.com/68947314/100749097-884c4200-3427-11eb-9147-d7b49984b256.jpg" width="50%" height="70%"></img>

강의평가를 등록하는 페이지다. 총 별점과 출석체크, 난이도 등등을 별점을 이용해 받았다.  
총 별점은 inquiry 페이지에 오른쪽에 별모양으로 나타나고 출석체크, 난이도 등은 polygon chart를 통해 나타나게 될것이다.  
강의를 등록하면 현재 시간과 작성자의 닉네임도 같이 저장하게 한다.  
강의를 등록하면 inquiry 페이지를 작성한 강의로 redirect시킨다.


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
			
DAO  
강의들의 pk를 주기위해 idx라는 pk를 생성한다. 이 값은 강의가 들어오면 값이 하나씩 늘어나게 만들었다.


	public int insert_eval(LectureDO lecture) throws SQLException {
			connectDB();
			
			int result = 0;
			ResultSet rs = null;
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
			String ss=sdf.format(new java.util.Date());
			Timestamp time= Timestamp.valueOf(ss);
			PreparedStatement stmt = null;
			try {
				String dept = "SELECT dept FROM lecture WHERE lec_name = ? AND p_name = ?";
				stmt = con.prepareStatement(dept);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				rs = stmt.executeQuery();
				rs.next();
				dept = rs.getString("dept");
				String sql= "insert into eval(lec_name, p_name, dept, star,attendance,assign,grade,learning,difficulty, content,writer, todate,idx)"
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?,(SELECT IFNULL(MAX(idx)+1,1) FROM eval a))";
				stmt = con.prepareStatement(sql);
				stmt.setString(1, lecture.getLec_name());
				stmt.setString(2, lecture.getP_name());
				stmt.setString(3, dept);
				stmt.setInt(4, lecture.getStar());
				stmt.setInt(5, lecture.getAttendance());
				stmt.setInt(6, lecture.getAssign());
				stmt.setInt(7, lecture.getGrade());
				stmt.setInt(8, lecture.getLearning());
				stmt.setInt(9, lecture.getDifficulty());
				stmt.setString(10, lecture.getContent());
				stmt.setString(11, lecture.getWriter());
				stmt.setTimestamp(12, time);
				result = stmt.executeUpdate();	
			} catch(SQLException e) {
				throw e;
			}finally {
				if(stmt != null) stmt.close();
				disconnectDB();
			}
			return result;
		}
	
	
## Admin페이지
관리자로 로그인하면 강의에 대한 수정 및 삭제가 가능하게 한다.

1.admin.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100749907-ab2b2600-3428-11eb-9818-d1cab17adcf7.jpg" width="50%" height="70%"></img>  
admin페이지에는 다른 회원들이 자신의 관련학과 최신글3개글을 보지만 관리자로 로그인 할 시 모든 강의를 볼 수 있게 하였다.  
모든 강의는 수정 및 삭제가 가능하다.  
만약 url로 admin을 접속할 경우를 대비해서 nickname이 관리자일경우에만 admin페이지로 이동하게 만들었다. nickname은 unique key이기 때문에 중복을 허용하지 않는다.


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

2. search  
<img src="https://user-images.githubusercontent.com/68947314/100750300-2d1b4f00-3429-11eb-934b-ad70b680fd61.jpg" width="50%" height="70%"></img>  
관리자로 접속해서 검색할 경우 강의 자체를 삭제 할 수 있다.
CASCADE로 하였기 때문에 fk지만 삭제가 가능하다.

3.update_form.jsp  
<img src="https://user-images.githubusercontent.com/68947314/100750493-753a7180-3429-11eb-8b93-f707b0f9a99a.jpg" width="50%" height="70%"></img>  

강의를 수정할때의 페이지이다.idx값을 이용해 강의정보를 가져온다.
수정페이지에서는 입력된 정보들을 똑같이 띄우게 한다.

4. delete  
강의내용 삭제 또는 강의를 삭제할 경우 idx값을 변경시키기 위해 rownum을 이용해 idx값을 갱신시킨다.

	
		public int delete(int idx) throws  SQLException {
				connectDB();
				int result = 0;
				LectureDO lecture = new LectureDO();
				PreparedStatement stmt = null;
				try {

					String sql="DELETE FROM eval WHERE idx=?";						
					stmt = con.prepareStatement(sql);
					stmt.setInt(1, idx);
					result =stmt.executeUpdate();

					sql = "SET @ROWNUM:=0";
					stmt = con.prepareStatement(sql);
					result = stmt.executeUpdate();
					// idx값 업데이트하기
					sql="UPDATE eval AS e,"
							+ "(SELECT @ROWNUM:=@ROWNUM+1 rownum,idx"
							+ "FROM (SELECT idx FROM eval ORDER BY todate)"
							+ "SET idx=rownum";
					stmt = con.prepareStatement(sql);
					result = stmt.executeUpdate();
				} catch(SQLException e) {
					throw e;
				}finally {
					if(stmt != null) stmt.close();
					disconnectDB();
				}

				return result;
			}



	





