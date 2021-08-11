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
	
	// DB정보 
	String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	String user = "yeeunkim0701";
	String pass = "1234";
	
	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계
		String sql="SELECT COUNT(`nick`) FROM `member` WHERE `nick`=?;";
		PreparedStatement psmt = conn.prepareStatement(sql);
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