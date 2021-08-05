<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3_4_Session</title>
	<%--
	 	날짜: 2021/08/05
		이름: 김예은
		내용: JSP Session 내장객체 실습하기
	 --%>
</head>
<body>
	<h4>4. session 내장객체 실습하기</h4>
	
	<form action="./proc/sessionProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"/></td> <!-- type: 입력방식 -->
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"/></td>
			</tr>
			<tr>
				<td colspan ="2" align ="right">
				<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	
	</form>
	

</body>
</html>