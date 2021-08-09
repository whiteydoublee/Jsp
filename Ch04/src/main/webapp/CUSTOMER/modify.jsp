<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.CustomerBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");
	String custid = request.getParameter("custid");

		//DB정보
		String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
		String user = "yeeunkim0701";
		String pass = "1234";

		CustomerBean cb = new CustomerBean();
		
	try{
	//1단계 JDBC 드라이버 로드
	Class.forName("com.mysql.jdbc.Driver");
	
	//2단계 DB 접속
	Connection conn =DriverManager.getConnection(host, user, pass);
	
	//3단계 SQL 실행객체 생성
	Statement stmt = conn.createStatement();
	
	//4단계 Query문 실행
	String sql = "SELECT * FROM `CUSTOMER` WHERE `custid`='"+custid+"'";
	ResultSet rs = stmt.executeQuery(sql);
	
	//5단계 결과셋 처리 (Select일 경우)
	if(rs.next()){
		// 수정데이터 
		cb.setCustid(rs.getInt(1));
		cb.setName(rs.getString(2));
		cb.setAddress(rs.getString(3));
		cb.setPhone(rs.getString(4));
		
	}
	
	//6단계 DB종료
	rs.close();
	stmt.close();
	conn.close();
	
	} catch (Exception e){
		e.printStackTrace();
	}

%>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>modify</title>
	<%--
		날짜: 2021/08/06
		이름: 김예은
		내용: JSP DB연동(CUSTOMER) 실습하기
	--%>
	
</head>
<body>

	<h3>고객수정</h3>
	
	<form action="./proc/modifyProc.jsp" method="post">
	<table border="1">
		
		<tr>
			<td>아이디</td>
			<td><input type="text" name="custid" readonly/></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="name"></td>
		</tr>
		
		<tr>
			<td>주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="phone"></td>
		</tr>
		
		<tr>
			<td colspan="2" align =" right"></td>
			<td><input type="submit" value="수정하기"></td>
		</tr>
	
	</table>
	</form>

</body>
</html>