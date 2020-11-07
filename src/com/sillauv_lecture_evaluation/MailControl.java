package com.sillauv_lecture_evaluation;

import java.io.IOException;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MailControl
 */
//@WebServlet("/lecture-evaluation/mailsend")
public class MailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MailControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
