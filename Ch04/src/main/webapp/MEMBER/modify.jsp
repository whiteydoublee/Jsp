<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	
			//DB정보
			String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
			String user = "yeeunkim0701";
			String pass = "1234";
			
			MemberBean mb = new MemberBean();

	try{
		//1단계 JDBC 드라이브 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계 DB 접속
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계 SQL 실행객체 생성 
		Statement stmt = conn.createStatement();
		
		//4단계 Query문 실행
		String sql ="SELECT * FROM `MEMBER` WHERE `uid`='"+uid+"';";
		ResultSet rs = stmt.executeQuery(sql);
		
		//5단계 ResultSet 처리 (Select문인 경우만)
		while (rs.next()){
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		}
		
		
		//6단계 DB 종료
		rs.close();
		conn.close();
		stmt.close();
		
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
		내용: JSP DB연동 실습하기
	--%>
	
</head>
<body>

	<h3>직원수정</h3>
	
	<form action="./proc/modifyProc.jsp" method="post">
	<table border="1">
	
		<tr>
			<td>아이디</td>
			<td><input type="text" name="uid" readonly value ="<%=mb.getUid() %>" ></td>
		</tr>
		
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value ="<%=mb.getName() %>"></td>
		</tr>
		
		<tr>
			<td>휴대폰</td>
			<td><input type="text" name="hp" value ="<%=mb.getHp() %>"></td>
		</tr>
		
		<tr>
			<td>직급</td>
			<td>
				<select name="pos">
					<option>사원</option>
					<option>대리</option>
					<option>과장</option>
					<option>차장</option>
					<option>부장</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td>부서</td>
			<td>
				<select name="dep">
					<option value="101">영업1부</option>
					<option value="102">영업2부</option>
					<option value="103">영업3부</option>
					<option value="104">영업지원부</option>
					<option value="105">인사부</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align =" right"></td>
			<td><input type="submit" value="수정하기"></td>
		</tr>
	
	</table>
	</form>

</body>
</html>