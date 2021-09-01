<%@page import="kr.co.farmstory2.dao.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String email = request.getParameter("email");
	
	int result = MemberDao.getInstance().selectCountUserInfo(3, email);
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);
%>