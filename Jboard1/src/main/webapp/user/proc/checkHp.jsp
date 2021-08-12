<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
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
	
	try{
		//1,2단계
				Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계
		
		PreparedStatement pmst = conn.prepareStatement(Sql.SELECT_COUNT_HP);
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