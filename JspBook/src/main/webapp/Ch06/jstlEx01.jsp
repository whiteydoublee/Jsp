<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSTL core태그 예제</title>
	<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: JSTL core태그 
	 -->
</head>
<body>
	<h3>JSTL core 태그 예제 - set,out,remove</h3>
	<p>brower 변수값 설정
		<c:set var="browser" value="${header['User-Agent'] }"/><br/>
		<c:out value = "${browser }" /><p>
	
	<p>browser 변수값 제거 후
	<c:remove var="browser"/>
	<c:out value="${browser }"/>

</body>
</html>