<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String hp = request.getParameter("hp");
	
	int result=0;
	// DB
	String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	String user = "yeeunkim0701";
	String pass = "1234";
	
	try{
		//1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계
		String sql="SELECT COUNT(`hp`) FROM `member` WHERE `hp`=?;";
		PreparedStatement pmst = conn.prepareStatement(sql);
		pmst.setString(1, hp);
		
		//4단계
		ResultSet rs = pmst.executeQuery();
		
		//5단계
		if(rs.next()){
			result=rs.getInt(1);
		}
		
		//6단계
		rs.close();
		pmst.close();
		conn.close();
		
	}catch(Exception e){
		
	}
	
	//JSON
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);
%>