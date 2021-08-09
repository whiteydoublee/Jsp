<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>	 
<%
	/*
	날짜: 2021/08/09
	이름: 김예은
	내용: JSP JSON 데이터 실습
	
	Json 데이터
	 - JavaScript Object Notation(자바 객체 표기법)
	 - 이기종간의 데이터 교환 시 사용하는 표준 포맷
	*/
	// javascript 표기법: String str ="{string의 경우 ""가 오면 escape문을 써주어야한다. \"\key값":\"value값\"}"; 
	String jsonData ="{\"uid\":\"A101\",\"name\":\"홍길동\",\"hp\":\"010-1234-5678\",\"age\":25}";
	out.print(jsonData);
	
%>