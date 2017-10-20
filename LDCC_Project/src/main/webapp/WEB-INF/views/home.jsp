<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
<table>
<c:forEach var="uList" items="${userList}">
<tr>
	<td>${uList.uId}</td>	
	<td>${uList.uName}</td>	
	<td>${uList.uPwd}</td>	
	<td>${uList.gender}</td>	
	<td>${uList.birth}</td>	
	<td>${uList.callNum}</td>	
	<td>${uList.regist_date}</td>	
	<td>${uList.using}</td>	
	<td>${uList.modify_date}</td>	

</tr>	
</c:forEach>

</table>



</body>
</html>
