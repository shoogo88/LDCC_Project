<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}" /> 

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 반응형 웹을 위한 viewPort 설정 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" >

<!-- Custom CSS -->
<link rel="stylesheet" href="<c:url value='/resources/css/agency.css'/>" >

<!-- Custom Fonts -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" >
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- jQuery -->
<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>

<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?libraries=places&region=KOR&key=AIzaSyDW8YjyjkfmnGPkR7pWxD3JSzGGzVR_2As"></script> 

<title>LOTTE DATA COMMUNICATION</title>
	
<script>
	
	$(document).ready(function(){
		
		/* Google Map 활성화 */
		mapInit();
		
		/*	
		// 로그인 여부 확인
		var logChk = $("#loginChk").val();
		
		if(logChk == ""){
			alert("본 서비스는 로그인 후 이용 가능합니다.");
			$(location).attr("href","${path}/lotte_member.do?method=logForm");
		}

		$("#sendMail").click(function(){
			
			var subject = $("#subject").val();
			var message = $("#message").val(); 
			var id = $("#id").val();
			var name = $("#name").val();
			
			//alert(subject+" "+message+" "+id+" "+name);
			
			
			if(subject == ""){
				alert("제목을 입력해 주십시오.");
				subject.focus();
			}else if(message == ""){
				alert("내용을 입력해 주십시오.");
				message.focus();
			}else{
				$("#mailFrm").attr("action","${path}/lotte_member.do?method=memberQNA");
				$("#mailFrm").submit();
			}
			
		});
	 */
	 
		
	});
	
	
	
	// 구글 API를 이용한 롯데정보통신 위치 띄우기
	function mapInit(){
		
		var myLatlng = new google.maps.LatLng(37.483726, 126.876453); 
		var mapOptions = { 
		        zoom: 17, 
		        center: myLatlng, 
		        mapTypeId: google.maps.MapTypeId.ROADMAP 
		} 
		
		// Map Setting
		var map = new google.maps.Map(document.getElementById('map'), mapOptions); 	
		
		// Marker 생성
		var marker = new google.maps.Marker({ 
	        position: myLatlng, 
	        map: map, 
	        title: "롯데정보통신" 
		});
		
		// Marker 말풍선 띄우기
		var infowindow = new google.maps.InfoWindow( 
		          { 
		            content: "<h3>롯데정보통신</h3>", 
		            maxWidth: 300 
		          } 
		); 

		google.maps.event.addListener(marker, 'mouseover', function() { 
		 infowindow.open(map, marker); 
		});
		
	}	
	
	
	 
	

</script>	

</head>

<body>
<center>
	
	<input type="hidden" id="loginChk" value="${mem.name}">
	
	<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
              	
                <a class="navbar-brand " href="${path}/lotte_member.do?method=mainForm">LOTTE DATA COMMUNICATION</a>
            	
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    <!-- 메뉴 구성 사항 -->
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    
                    
                    <li>
                        <a class="page-scroll" href="<c:url value='/product'/>">Board</a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="#services">Location</a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="#contact">Contact us</a>
                    </li>
                    
                    <li>
                        <a class="page-scroll" href="${path}/lotte_member.do?method=logout" style="color:red;">Logout</a>
                    </li>
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	
	
	<!-- Header -->
    <header id="main">
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">DB_담당</div>
                <div class="intro-heading">DB_이름 님 환영합니다.</div>
            </div>
        </div>
    </header>
    
    
    
    <!-- Services Section -->
    <section id="services" style=" padding: 0px 0px; height: 400px; ">
    
		<div id="map" style="width:100%; height:500px;"></div>
        
    </section>
    
    
    <!-- Contact Section -->
    <section id="contact">
    	
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h3 class="section-subheading text-muted">관리자에게 궁금한 사항을 메일로 보내주세요.</h3>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                
                    <form id="mailFrm" method="post">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Name *" id="name" name="name" readonly value="DB_이름">
                                </div>
                                <div class="form-group">
                                    <input type="email" class="form-control" placeholder="Your Email *" id="id" name="id" readonly value="DB_ID">
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Your Subject *" id="subject" name="subject" >
                                </div> 
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <textarea class="form-control" placeholder="Your Message *" id="message" name="message"></textarea>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <div class="col-lg-12 text-center">
                                <div id="success"></div>
                                <button type="button" class="btn btn-xl" id="sendMail">Send Message</button>
                            </div>
                        </div>
                    </form>
                
                </div>
            </div>
        </div>
    </section>

	<!-- Footer -->
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; Your Website 2017</span>
                </div>
                <div class="col-md-4">
                    <ul class="list-inline social-buttons">
                        <li class="list-inline-item"><a href="#"><i class="fa fa-twitter" style="margin-top: 20%;font-size: 25px;"></i></a>
                        </li>
                        <li class="list-inline-item"><a href="#"><i class="fa fa-facebook" style="margin-top: 20%;font-size: 25px;"></i></a>
                        </li>
                        <li class="list-inline-item"><a href="#"><i class="fa fa-linkedin" style="margin-top: 20%;font-size: 25px;"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
		
</center>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="<c:url value='/resources/js/classie.js'/>"></script>
<script src="<c:url value='/resources/js/cbpAnimatedHeader.js'/>"></script>

<!-- Contact Form JavaScript -->
<script src="<c:url value='/resources/js/jqBootstrapValidation.js'/>"></script>
<script src="<c:url value='/resources/js/contact_me.js'/>"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value='/resources/js/agency.js'/>"></script>

</body>
</html>