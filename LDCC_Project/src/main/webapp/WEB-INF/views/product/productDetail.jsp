<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 상세정보</title>
</head>
<body>
    <h2>상품 상세정보</h2>
    <table border="1">
        <tr>
            <td><img src= <c:url value = "/resources/image/6.jpg"  />  width="340ox" height="300px"></td>
            
            <td>
                <table border="1" style="height: 300px; width: 400px;">
                    <tr align="center">
                        <td>상품명</td>
                        <td>${oneProduct.pName}</td>
                    </tr>
                    <tr align="center">
                        <td>가격</td>
<%--                         <td><fmt:formatNumber value="${oneProduct.pPrice}" pattern="###,###,###"/></td>
 --%>                    <td>${oneProduct.pPrice}</td>
 </tr>
                    <tr align="center">
                        <td>상품소개</td>
                        <td>${oneProduct.pExplain}</td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <form name="form1" method="post" action="$insert.do">
                                <input type="hidden" name="pId" value="${oneProduct.pId}">
                                <select name="amount">
                                    <c:forEach begin="1" end="10" var="num">
                                        <option value="${num}">${num}</option>
                                    </c:forEach>
                                </select>&nbsp;개
                                <input type="submit" value="장바구니에 담기">
                            </form>
                            <a href="product">상품목록</a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>