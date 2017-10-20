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
			document.ProductVO.action = "/regist";
			document.ProductVO.submit();
		});
		// 상품 목록이동
		$("#listBtn").click(function() {
			location.href = '/product';
		});
	});
</script>
</head>

<body>
	<h2>상품 등록</h2>
	<!-- <form id="ProductVO" name="ProductVO" enctype="multipart/form-data" method="post">
	 -->
	 <form id="ProductVO" name="ProductVO"   method="post">
		<table border="1">
			<tr>
				<td>상품명</td>
				<td><input type="text" name="pName" id="pName"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="pPrice" id="pPrice"></td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td><textarea rows="5" cols="60" name="pExplain" id="pExplain"></textarea></td>
			</tr>
			<tr>
				<td>상품이미지</td>
				     
           <!--  <td><input type="file" name="productPhoto" id="productPhoto"></td>
            --> <td><input type="text" name="pImagePath" id="pImagePath"></td>
            
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