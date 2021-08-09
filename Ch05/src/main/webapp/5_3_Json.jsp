<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
	날짜: 2021/08/09
	이름: 김예은
	내용: JSP JSON 데이터 실습
	*/
	
	//DB정보
			String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
			String user = "yeeunkim0701";
			String pass = "1234";
	
			List<MemberBean> members = new ArrayList<>();
	try{
		//1단계. 
			Class.forName("com.mysql.jdbc.Driver");
		
		//2단계. 
			Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계. SQL 실행객체 (Statement )
			Statement stmt = conn.createStatement();
		
		//4단계. 
			String sql = "SELECT * FROM `MEMBER`;";
			ResultSet rs = stmt.executeQuery(sql);
		
		//5단계. 
			while(rs.next()){
				
				MemberBean mb = new MemberBean();
				
				mb.setUid(rs.getString(1));
				mb.setName(rs.getString(2));
				mb.setHp(rs.getString(3));
				mb.setPos(rs.getString(4));
				mb.setDep(rs.getInt(5));
				mb.setRdate(rs.getString(6));
				
				members.add(mb);
				
			}
		
		//6단계. 
		rs.close();
		stmt.close();
		conn.close();
		
	} catch (Exception e){
		e.printStackTrace();
	}


	// List를 Json변환 
	Gson gson = new Gson();
	String jsonData = gson.toJson(members);
	
	// Json 출력 (Client로 전송)
	out.print(jsonData);
%>