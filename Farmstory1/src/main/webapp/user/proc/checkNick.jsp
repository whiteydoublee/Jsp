<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.JsonObject"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 전송 수신
	request.setCharacterEncoding("UTF-8");
	String nick = request.getParameter("nick");
	
	int result = 0;
	
	try{
		Connection conn = DBConfig.getInstance().getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
		psmt.setString(1, nick);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			result = rs.getInt(1);
		}
		
		psmt.close();
		conn.close();
		rs.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}
	
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);

%>