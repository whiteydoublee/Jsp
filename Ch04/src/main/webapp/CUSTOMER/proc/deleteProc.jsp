<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String custid = request.getParameter("custid");
	
			//DB정보
			String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
			String user = "yeeunkim0701";
			String pass = "1234";
			
			try{
				//1단계 JDBC Driver 로드
				Class.forName("com.mysql.jdbc.Driver");
				
				//2단계 DB 접속
				Connection conn = DriverManager.getConnection(host,user,pass);
				
				//3단계 SQL 실행객체 생성 
				Statement stmt = conn.createStatement();
				
				//4단계 Query문 실행
				String sql = "DELETE FROM `CUSTOMER` WHERE `custid`='"+custid+"'";
				stmt.executeUpdate(sql);
				
				//5단계 ResultSet 처리(select 문만 )
				//6단계 DB 종료 
				stmt.close();
				conn.close();
				
			}catch (Exception e){
				e.printStackTrace();
			}
			
			//리다이렉트
			response.sendRedirect("../list.jsp");
			
			

%>