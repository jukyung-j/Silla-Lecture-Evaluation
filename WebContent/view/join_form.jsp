<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>신라대 강의평가</title>
        <!-- Favicon-->
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <span class="navbar-brand js-scroll-trigger">신라대 강의평가</span>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
           
        </header>
        <!-- Portfolio Section-->
        
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">회원가입</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Contact Section Form-->
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <!-- To configure the contact form email address, go to mail/contact_me.php and update the email address in the PHP file on line 19.-->
                        <form id="contactForm" name="sentMessage" novalidate="novalidate" action='${pageContext.request.contextPath}/lecture-evaluation?action=join' method="POST">
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>NAME</label>
                                    <input class="form-control" id="name" name="name" type="text" placeholder="NAME" required />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>DEPARTMENT</label>
                                    <input class="form_control" value="DEPARTMENT" readonly>
                                    &nbsp;&nbsp;<%pageContext.include("dept.jsp"); %>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>ID</label>
                                    <input class="form-control" id="user_id" name="user_id" type="text" placeholder="ID" required />
                                    <p class="help-block text-danger"></p>
                                    <span id="id_check"></span>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>PASSWORD</label>
                                    <input class="form-control" id="user_pw" name="pwd" type="password" placeholder="PASSWORD" required />
                                    <p class="help-block text-danger"></p>
                                    <span id="pw_check"></span>
                                </div>
                            </div>
                             <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>PASSWORD CHECK</label>
                                    <input class="form-control" id="user_pw2" type="password" placeholder="PASSWORD CHECK" required />
                                    <p class="help-block text-danger"></p>
                                    <span id="pw2_check"></span>
                                </div>
                            </div>
                             <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>NICKNAME</label>
                                    <input class="form-control" id="user_nick" name="nickname" type="text" placeholder="NICKNAME" required />
                                    <p class="help-block text-danger"></p>
                                    <span id="nick_check"></span>
                                </div>
                            </div>
                             <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>Email Address</label>
                                    <input class="form-control" id="user_email" name="email" type="email" value="@sillain.ac.kr" placeholder="Email Address" required />
                                    <br><a href="http://outlook.com/sillain.ac.kr" target="_blank">이메일 접속</a>
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <input type="button" value="이메일 인증"  id="check_mail" class="btn btn-primary btn-xl"/><br>
   						    <input type="text"  class="form-control mr-sm-2"  placeholder="인증번호 입력" id="e_code" style="width:50%; margin-left:2rem" >
   						    <button type="button"  id="code_btn" class="btn btn-outline-primary">확인</button>
   							<span class="textbox" id="code_check"></span><br>
                            <br />
                            <div class="form-group"><button class="btn btn-primary btn-xl" id="reg_submit" type="submit">회원가입</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025김유진, 201795081 정주경</small></div>
        </div>
        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
       
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/js/JoinScript.js"> </script>
    </body>