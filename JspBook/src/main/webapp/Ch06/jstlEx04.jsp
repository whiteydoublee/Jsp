<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL core tag : forTokens</title>
		<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: JSTL core 태그 forTokens 실습하기
	 -->
</head>
<body>
	
	<h3>JSTL core 태그예제 - forTokens</h3>
	<c:forTokens var="tech" items="금광불괴, 허공담보, 열양기공, 천마군림보" delims=",">
		<p> 익혀야 할 기술: <c:out value="${tech }"/>
	</c:forTokens>

</body>
</html>