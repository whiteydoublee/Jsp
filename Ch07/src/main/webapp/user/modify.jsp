<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify</title>
</head>
<body>
	<h3>User 수정</h3>
	
	<form action="/Ch07/user/modify.do" method="post">
	<table border="1">
			<tr>
				<td>아이디</td> <!--  readonly : 읽기모드 (수정불가) -->
				<td><input type="text" name="uid" readonly value ="${user.uid}"/></td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value ="${user.name}"/></td>
			</tr>
			
			<tr>
				<td>휴대폰</td>
				<td><input type="text" name="hp" value="${user.hp}"/></td>
			</tr>
			
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" value ="${user.age}"/></td>
			</tr>
			
			<tr>
				<td colspan="2" align =" right"></td>
				<td><input type="submit" value="수정하기"></td>
			</tr>
	</table>
	</form>
	

</body>
</html>