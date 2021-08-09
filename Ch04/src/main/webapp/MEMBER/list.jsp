<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		//DB 정보
		String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
		String user = "yeeunkim0701";
		String pass = "1234";
		
		List <MemberBean> members = new ArrayList<>();
		
		try{
			//1단계 JDBC 드라이버 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			//2단계 DB 접속
			Connection conn = DriverManager.getConnection(host,user,pass);
			
			//3단계 SQL 실행객체 생성
			Statement stmt = conn.createStatement();
			
			//4단계 Query문 실행
			String sql = "SELECT * FROM `MEMBER`;";
			ResultSet rs = stmt.executeQuery(sql);
			
			//5단계 ResultSet 처리
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
			
			//6단계 DB 종료 
			rs.close();
			stmt.close();
			conn.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>list</title>
</head>
<body>

	<h3>직원목록</h3>
	<a href ="./register.jsp">직원등록</a>
	
	<table border="1">
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>휴대폰</th>
			<th>직급</th>
			<th>부서</th>
			<th>입사일</th>
			<th>기타</th>
		</tr>
		
		<%
			for (MemberBean member : members){
		%>
		
			<tr>
			<td><%= member.getUid() %></td>
			<td><%= member.getName() %></td>
			<td><%= member.getHp() %></td>
			<td><%= member.getPos() %></td>
			<td><%= member.getDep() %></td>
			<td><%= member.getRdate().substring(2,10) %></td>
			<td>
				<a href="./modify.jsp?uid=<%= member.getUid()%>">수정</a>
				<a href="./proc/deleteProc.jsp?uid=<%= member.getUid()%>">삭제</a>
			</td>
		</tr>
		<%
			}
		%>
	</table>
	

</body>
</html>