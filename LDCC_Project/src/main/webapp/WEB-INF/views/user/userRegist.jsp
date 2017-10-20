<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %><html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
<script>
	$(document).ready(function() {
		// 상품 등록 유효성검사
		$("#addBtn").click(function() {
			var pName = $("#pName").val();
			var pPrice = $("#pPrice").val();
			var pExplain = $("#pExplain").val();
			var pImagePath = $("#pImagePath").val();
			
		
			if (pName == "") {
				alert("상품명을 입력해주세요");
				pName.foucs();
			} else if (pPrice == "") {
				alert("상품 가격을 입력해주세요");
				pPrice.focus();
			} else if (pExplain == "") {
				alert("상품 설명을 입력해주세요");
				pExplain.focus();
			} else if (pImagePath == "") {
				alert("상품 사진을 입력해주세요");
				pImagePath.focus();
			}
			// 상품 정보 전송
			document.UserVO.action = "/regist";
			document.UserVO.submit();
		});
		// 상품 목록이동
		$("#listBtn").click(function() {
			location.href = '/product';
		});
	});
</script>
</head>

<body>
	<h2>회원가입</h2>
	
	 <form id="UserVO" name="UserVO"   method="post">
		<table border="1">
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
				<td><input type="text" name="uMail" id="uMail">testlotte.net</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uName" id="uName"></td>
			</tr>
			<tr>
				<td>비밀번호 재입력</td>
				<td><input type="password" name="uName" id="uName"></td>
			</tr>
				<tr>
				<td>성별</td>
				<td> <input type="radio" name="chk_info" value="man">남성
						<input type="radio" name="chk_info" value="woman">여성
				</td>
			</tr>
				<tr>
				<td>이름</td>
				<td><input type="text" name="uName" id="uName"></td>
			</tr>
				<tr>
				<td>이름</td>
				<td><input type="text" name="uName" id="uName"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"> 
				 <input type="submit" value="등록" id = "addBtn"> 
				<input type="submit" value="목록" id="listBtn"> 
              </td>
			</tr>
		</table>
	</form>
</body>
</html>