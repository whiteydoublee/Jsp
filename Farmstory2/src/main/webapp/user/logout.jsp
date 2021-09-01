<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.invalidate(); // 세션을 없애고 속해있는 모든 값을 없앰
	response.sendRedirect("/Farmstory2");
	
%>