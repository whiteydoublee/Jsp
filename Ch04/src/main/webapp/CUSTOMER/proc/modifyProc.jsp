<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//DB정보
	String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	String user = "yeeunkim0701";
	String pass = "1234";
	
	String custid = request.getParameter("custid");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	
	try{
	//1단계 JDBC 드리아브 로드
	Class.forName("com.mysql.jdbc.Driver");	
	
	//2단계 DB 접속
	Connection conn = DriverManager.getConnection(host,user,pass);
	
	//3단계 SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 Query문 실행 
	String sql = "UPDATE `CUSTOMER` SET";
		sql+="`name`="+name+"";
		sql+="`address`="+address+"";
		sql+="`phone`="+phone+"";
		sql+="WHERE `custid='"+custid+"'";
		
		stmt.executeUpdate(sql);
	
	//5단계 (SELECT 문만 )
	//6단계
	stmt.close();
	conn.close();
	
	} catch (Exception e){
		e.printStackTrace();
	}
	



%>