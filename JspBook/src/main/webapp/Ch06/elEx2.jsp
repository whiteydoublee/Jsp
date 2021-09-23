<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>표현언어의 내장 객체 사용</title>
	<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: 표현언어의 내장객첸 사용
	 -->
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<form action="elEx2.jsp" method="post">
		<ul>
			<li><label for ="name">이름</label>
			<input type="text" id ="name" name="name" value="${param['name'] }">
			<input type="submit" value ="확인">
			<li><p>이름은:${param.name }입니다.
		</ul>
	</form>

</body>
</html>