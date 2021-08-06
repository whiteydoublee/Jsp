<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="bean.User1Bean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

		
		//DB정보
		String host = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
		String user = "yeeunkim0701";
		String pass = "1234";
		
		// DB정보를 담을 LIST구조 통을 하나 만듦
		List <User1Bean> users = new ArrayList<>();
		
		
	try {
		//1단계 - JDBC드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계- DB접속 
		Connection conn = DriverManager.getConnection(host,user,pass);
		
		//3단계 - SQL 실행객체 생성
		Statement stmt = conn.createStatement();
		
		//4단계 - Query문 실행 
		String sql = "SELECT * FROM `USER1`;";
		ResultSet rs = stmt.executeQuery(sql); // select문 실행방법
		
		//5단계 - 결과셋 처리 (Select일 경우)
		while(rs.next()){
			
			User1Bean ub = new User1Bean();
			ub.setUid(rs.getString(1));
			ub.setName(rs.getString(2));
			ub.setHp(rs.getString(3));
			ub.setAge(rs.getInt(4));
			
			users.add(ub);
			
		}
			
			
		//6단계 - DB종료
		rs.close();
		stmt.close();
		conn.close();
		
	} catch(Exception e){
		e.printStackTrace();
	}

%>




<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>4_2_Select</title>
	<%--
		날짜: 2021/08/05
		이름: 김예은
		내용: JSP Select 페이지 실습하기
	--%>
</head>
<body>
	<h3>2. JSP Select 실습하기</h3>
	
	<a href="./4_1_Insert.jsp">사용자 등록하기</a>
	
	<h4>사용자 목록</h4>
	<table border="1">
	 <tr>
	 	<th>아이디</th>
	 	<th>이름</th>
	 	<th>휴대폰</th>
	 	<th>나이</th>
	 	<th>관리</th>
	 	
	 </tr>
	 
	 <%
	 	for(User1Bean ub: users){
	 
	 %>
	 
	 <tr>
	 	<td><%=ub.getUid() %></td>
	 	<td><%= ub.getName() %></td>
	 	<td><%=ub.getHp() %></td>
	 	<td><%= ub.getAge() %></td>
	 	<td>
			<a href="#">수정</a>
			<a href="./4_3_Delete.jsp?uid=<%=ub.getUid()%>">삭제</a>
		</td>
	 	
	 </tr>
	 <%
	 }
	 %>
	
	</table>

</body>
</html>