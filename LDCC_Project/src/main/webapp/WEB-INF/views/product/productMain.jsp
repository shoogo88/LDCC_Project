<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>first</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
<h2>상품 목록</h2>&nbsp;&nbsp;<button width = "10" ><a href="registPage">상품등록</a></button>

<table style="border:1px solid #ccc">
    <colgroup>
        <col width="10%"/>
        <col width="*"/>
        <col width="15%"/>
        <col width="20%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">상품번호</th>
            <th scope="col">상품명</th>
            <th scope="col">이미지</th>
            <th scope="col">가격</th>
            <th scope="col">등록일</th>
            <th scope="col">수정일</th>
            
        </tr>
    </thead>
    <tbody>
    
        <c:choose>
				<c:when test="${fn:length(productList) > 0}">

                <c:forEach items="${productList}" var="pList">
                    <tr>
                        <td>${pList.pId }</td>
                        <td>  <a href="productDetail?pId=${pList.pId}"> ${pList.pName }</a></td>
                        <td>
 					<%-- <a href="${path}/shop/product/detail/${row.productId}"> --%>
                    <img src= <c:url value = "/resources/image/6.jpg"  />  width="120ox" height="110px"> </a>
						</td>
                        <td>${pList.pPrice }</td>
                        <td>${pList.registDate }</td>
						<td>  <a href="productModify?pId=${pList.pId}"> ${pList.modifyDate }</a></td>                       
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">조회된 결과가 없습니다.</td>
                </tr>
            </c:otherwise>
        </c:choose>
         
    </tbody>
</table>


</body>
</html>


