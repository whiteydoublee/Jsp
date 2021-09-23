<!-- date.jsp -->
<!-- jsp 예제 -->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 예제</title>
</head>
<body>

	<%
		Date nowDate = new Date(); // 현재 날짜와 시간을 가져옴 
		// 날짜 형식을 yyyy년 mm월 dd 일 형태로 사용하기 위해 SimpleDateFormat객체 생성
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		//현재 날짜와 시간에 yyyy년 MM월 dd일 형식을 format() 메소드를 사용해서 적용 
		String formatDate = dateFormat.format(nowDate);
	%>
	
	<p> 일반적인 JSP 페이지의 형태로 아래와 같이 현재 날자를 제공합니다. <br/>
	현재 날짜는 <%= formatDate %>입니다.
	</p>
	

</body>
</html>