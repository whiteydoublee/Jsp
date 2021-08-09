<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<% 
	request.setCharacterEncoding("UTF-8");

		//DB정보
		String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
		String user = "yeeunkim0701";
		String pass = "1234";
		
		
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		
		try{
		//1단계 JDBC 드라이브 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계 데이터베이스 접속
		Connection conn =DriverManager.getConnection(host,user,pass);
		
		//3단계 SQL 실행객체 생성 
		Statement stmt = conn.createStatement();
		
		//4단계 Query문 실행 
		String sql="INSERT INTO `CUSTOMER`(`name`,`address`,`phone`) VALUES('"+name+"','"+address+"','"+phone+"');";
		stmt.executeUpdate(sql);
		
		
		//5단계
		//6단계
		stmt.close();
		conn.close();
		} catch (Exception e){
			e.printStackTrace();
		}
		
		response.sendRedirect("../list.jsp");
		
%>