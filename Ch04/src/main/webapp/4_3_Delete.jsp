<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("UTF-8");
		String uid = request.getParameter("uid");

	//DB정보
		String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
		String user = "yeeunkim0701";
		String pass = "1234";

	try{
	//1단계 JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계 DB 접속 
	Connection conn = DriverManager.getConnection(host,user,pass);
	
	//3단계 SQL 실행객체 생성  
	Statement stmt = conn.createStatement();
	
	//4단계 Query문 실행 
	String sql = "DELETE FROM `USER1` WHERE `uid`='"+uid+"';";
	stmt.executeUpdate(sql);
	
	//5단계 결과셋 처리 (Select일 경우)
	//6단계 DB종료
	stmt.close();
	conn.close();
	
		}catch(Exception e){
			e.printStackTrace();
		}
	
	// 리다이렉트
	response.sendRedirect("./4_2_Select.jsp");
%>
	<%--
		날짜: 2021/08/06
		이름: 김예은
		내용: JSP Select 페이지 Delete 실습하기
	--%>
	
