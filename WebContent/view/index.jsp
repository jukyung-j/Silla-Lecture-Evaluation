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
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <!-- Masthead Heading-->
                <form action='${pageContext.request.contextPath}/lecture-evaluation/main/search' method="POST">
					<div class="search">
					<input type="text" name="search_id" class="masthead-subheading font-weight-light mb-0" placeholder="과목명 또는 교수명 입력"/>
					<button type="submit" class="btn btn-xl btn-outline-light">검색</button>	
					</div>
						
				</form>
                <!-- Icon Divider-->
                
                <!-- Masthead Subheading-->
            </div>
        </header>
        <!-- Portfolio Section-->
        
        <!-- Contact Section-->
        <section class="page-section" id="contact">
            <div class="container">
                <!-- Contact Section Heading-->
                <img class="logo" src="${pageContext.request.contextPath}/img/sillalogo.png"></img>
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
                        <form id="contactForm" name="sentMessage" novalidate="novalidate" action='${pageContext.request.contextPath}/lecture-evaluation?action=login' method="POST">
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>ID</label>
                                    <input class="form-control" id="name" name="id" type="text" placeholder="ID" required="required" data-validation-required-message="Please enter your id." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="form-group floating-label-form-group controls mb-0 pb-2">
                                    <label>PASSWORD</label>
                                    <input class="form-control" id="message" name="pwd" type="password" placeholder="PASSWORD" required="required" data-validation-required-message="Please enter your password." />
                                    <p class="help-block text-danger"></p>
                                </div>
                            </div>
                           
                            <br />
                            <div id="success"></div>
                            <div class="form-group"><button class="btn btn-primary btn-xl" id="sendMessageButton" type="submit">로그인</button>
                             <a href='${pageContext.request.contextPath}/lecture-evaluation/join_form'>회원가입</a>
                             </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- Footer-->
        <c:if test="${message==false}" >
			<script>
				alert("아이디나 비밀번호를 다시 입력해주세요.");
			</script>
		</c:if> 
        <!-- Copyright Section-->
        <div class="copyright py-4 text-center text-white">
            <div class="container"><small>Copyright © 201795025 김유진, 201795081정주경</small></div>
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
    </body>
</html>
