<%@page import="kr.co.farmstory1.dao.MemberDao"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
	int result = MemberDao.getInstance().selectCountUserInfo(1, uid);
	
	//Json출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);

%>