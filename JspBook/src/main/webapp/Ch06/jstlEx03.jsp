<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL core tag: forEach</title>
	<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: JSTL core 태그 forEach 실습하기
	 -->
</head>
<body>

	<h3>Header 정보</h3>
	<c:forEach var ="head" items="${headerValues }">
	<p>param:<c:out value="${head.key }"/>
	<p> values;
		<c:forEach var ="val" items="${head.value }">
		<c:out value="${val }"/>
		</c:forEach>
	</c:forEach>
</body>
</html>