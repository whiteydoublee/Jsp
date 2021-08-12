<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//데이터 전송 수신 
	request.setCharacterEncoding("UTF-8");
	String nick = request.getParameter("nick");
	
	int result =0;
	
	try{
		//1,2단계
				Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계

		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
		psmt.setString(1,nick);
		
		//4단계
		ResultSet rs = psmt.executeQuery();
		
		//5단계
		if (rs.next()){
			result = rs.getInt(1);
		}
		
		//6단계
		psmt.close();
		rs.close();
		conn.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}
	
	//Json출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	
	out.print(json);

%>