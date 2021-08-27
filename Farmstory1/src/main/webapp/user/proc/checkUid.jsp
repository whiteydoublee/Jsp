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
	
	int result = 0;
	
	try{
		
		Connection conn = DBConfig.getInstance().getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
		psmt.setString(1, uid);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			
			// result 값이 1이 되는 경우는 이미 아이디가 존재, 따라서 1이 나오면 CheckUser에서 중복 검사잡아줌 
			result = rs.getInt(1); 
		}
		rs.close();
		conn.close();
		psmt.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}
	
	//Json출력
	JsonObject json = new JsonObject();
	json.addProperty("result", result);
	out.print(json);

%>