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
<link rel="stylesheet" href="<c:url value='/resources/dist/css/sb-admin-2.css'/>" >

<!-- DataTables CSS -->
<link rel="stylesheet" href="<c:url value='/resources/datatables-plugins/dataTables.bootstrap.css'/>" >

<!-- DataTables Responsive CSS -->
<link rel="stylesheet" href="<c:url value='/resources/datatables-responsive/dataTables.responsive.css'/>" >

<!-- Custom Fonts -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" >
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

<!-- jQuery -->
<script src="<c:url value='/resources/js/jquery-1.11.3.min.js'/>"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<title>LOTTE DATA COMMUNICATION COMPANY</title>
	
<script>
	
	//onload script
	$(document).ready(function(){
		
		 $('#dataTables-example').DataTable({
	            responsive: true
	        });

		 $("#addBtn").click(function() {
		 			var uId = $("#uId").val();
		 			var uName = $("#uName").val();
		 			var uMail = $("#uMail").val();
		 			var uPwd = $("#uPwd").val();
		 			var gender = $("#gender").val();
		 			var birth = $("#birth").val();
		 			var callNum = $("#callNum").val();
		 			
		 		
		 			// 상품 정보 전송
		 			document.UserVO.action = "/registUserAction";
		 			document.UserVO.submit();
			});
			// 상품 목록이동
			$("#listBtn").click(function() {
				location.href = '/product';
			});
		 
		/*
		// 로그인 여부 확인
		var logChk = $("#loginChk").val();
		
		if(logChk == ""){
			alert("본 서비스는 로그인 후 이용 가능합니다.");
			$(location).attr("href","${path}/lotte_member.do?method=logForm");
		}
		
		// 검색 클릭 함수
		$("#searchBtn").click(function(){
			
			$("#searchForm").attr("action","${path}/lotte_shopping.do?method=shopForm");
			$("#searchForm").submit();
			
		});
		*/
	
		
		
	});

</script>	

</head>



<body background="<c:url value='/resources/img/header-bg.jpg'/>">
<center>
	
	<%-- <input type="hidden" id="loginChk" value="${mem.name}"> --%>
	
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
                <a class="navbar-brand " href="${path}/lotte_member.do?method=mainForm">LOTTE DATA COMMUNICATION COMPANY</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<c:url value='/ldcc/main/main.do'/>">Home</a>
                    </li>
                	<li>
                        <a class="page-scroll" href="<c:url value='/ldcc/main/main.do'/>">Cart</a>
                    </li>
                	
                    <li>
                        <a class="page-scroll" href="<c:url value='/ldcc/main/main.do'/>">PayInfo</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="<c:url value='/ldcc/main/main.do'/>" style="color:red;">Logout</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	     
	<section id="services">
	
            <div class="row">
                <div class="col-lg-12" style=" width: 70%; margin-left: 15%; ">
                    <div class="panel panel-default" style="text-align: left;">
                        <div class="panel-heading">
                            회원등록
                        </div>

                        <!-- /.panel-heading -->
                        <div class="panel-body">
       
                            <form id="UserVO" name="UserVO"   method="post">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <tr>
				<td>이름</td>
				<td><input type="text" name="uName" id="uName"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uId" id="uId"></td><td><input type="submit" value="중복검사" id = "dupleBtn">  </td>
			</tr>
			<tr>
				<td>e-Mail</td>
				<td><input type="text" name="uMail" id="uMail"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPwd" id="uPwd"></td>
			</tr>
			<tr>
				<td>비밀번호 재입력</td>
				<td><input type="password" name="test" id="test"></td>
			</tr>
				<tr>
				<td>성별</td>
				<td> <input type="radio" name="gender" value="0">남성
						<input type="radio" name="gender" value="1">여성
				</td>
			</tr>
				<tr>
				<td>전화번호</td>
				<td><input type="text" name="callNum" id="callNum"></td>
			</tr>
				<tr>
				<td>생년월일</td>
				<td><input type="text" name="birth" id="birth"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
				 <input type="submit" value="등록" id = "addBtn"> 
				<input type="submit" value="목록" id="listBtn"> 
              </td>
			</tr>
                            </table>
                            </form>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
            </div>
            
	</section>
	 
	

</center>

<!-- Bootstrap Core JavaScript -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

<!-- Plugin JavaScript -->
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="<c:url value='/resources/js/classie.js'/>"></script>
<script src="<c:url value='/resources/js/cbpAnimatedHeader.js'/>"></script>

<!-- DataTables JavaScript -->
<script src="<c:url value='/resources/datatables/js/jquery.dataTables.min.js'/>"></script>
<script src="<c:url value='/resources/datatables-plugins/dataTables.bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/datatables-responsive/dataTables.responsive.js'/>"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value='/resources/dist/js/sb-admin-2.js'/>"></script>
        
<!-- Contact Form JavaScript -->
<script src="<c:url value='/resources/js/jqBootstrapValidation.js'/>"></script>
<script src="<c:url value='/resources/js/contact_me.js'/>"></script>

<!-- Custom Theme JavaScript -->
<script src="<c:url value='/resources/js/agency.js'/>"></script>

</body>
</html>