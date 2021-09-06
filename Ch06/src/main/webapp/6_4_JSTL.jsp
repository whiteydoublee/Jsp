<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>6_4_JSTL</title>
	<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: JSTL(Java Standards Tag Library) 실습하기
	 -->
</head>
<body>
	<h3>JSTL 실습하기</h3>
	<h4>스크립트릿 표현</h4>	
	<%
		String str = "Hello";
		out.print("<p>str: "+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		//조건문
		if(num1 < num2){
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		if(num1 > num2){
			out.print("<p>num1은 num2보다 크다.</p>");
		}else {
			out.print("<p>num1은 num2보다 작다.</p>");
		}
		
		if(num1 > num2){
			out.print("<p>num1은 num2보다 크다.</p>");
		}else if(num2> num3){
			out.print("<p>num2은 num3보다 크다.</p>");
		}else {
			out.print("<p>num3가 가장 크다.</p>");
		}
		
		//반복문
		for(int i=1; i<=5;i++){
			out.print("<p>"+i+".Hello JSTL!</p>");
		}
		
		String people [] ={"김유신","김춘추","강감찬","장보고","이순신"};
		
		for (String person:people){
			out.print("<em>"+person+"</em>,");
		}
		
		int sum = 0;
		for(int k=1;k<=10;k++){
			sum+=k;
		}
		
		out.print("<p>1부터 10까지의 합: "+sum+"</p>");
		
		//문자열 처리
		String hello = "Hello Korea";
		
		out.print("<p>문자열 길이: "+hello.length()+"</p>");
		out.print("<p>문자열 자르기: "+hello.substring(6,11)+"</p>");
		out.print("<p>문자열 교체: "+hello.replace("Korea","Busan")+"</p>");
		out.print("<p>문자열 인덱스: "+hello.indexOf("e")+"</p>");
		
	%>
	
	<h4>JSTL 표현 : 변수 선언 태그</h4>
	<!-- 변수 생성 및 출력 -->
	<c:set var = "str" value="Hello"/>
	<p>str : ${str}</p>
	
	<c:set var = "num1" value="1"/>
	<c:set var = "num2" value="2"/>
	<c:set var = "num3" value="3"/>
	
	<!-- 조건문	-->
	<c:if test="${num1 lt num2}">
		<p>num1은 num2보다 작다.</p>
	</c:if>
	
	<c:choose>
		<c:when test="${num1 gt num2 }">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1은 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1은 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3 }">
			<p>num2은 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3가 가장 크다.</p>
		</c:otherwise>
	</c:choose>
	
	<!-- 반복문 -->
	<c:forEach var ="i" begin="1" end="5">
		<p>${i}.Hello JSTL!</p>
	</c:forEach>
	
	<c:set var = "people">김유신,김춘추,강감찬,장보고,이순신</c:set>
	<c:forEach var = "person" items="${people }">
		<em>${person }</em>
	</c:forEach>
	
	<c:set var="sum" value="0"/>
	<c:forEach var="k" begin="1" end="10">
		<c:set var="sum" value="${sum+k }"/>
	</c:forEach>
	<p>1부터 10까지 합: ${sum }</p>
	
	<!-- 문자열 처리 -->
	<c:set var="hello" value="Hello Korea"/>
	<p>문자열 길이: ${f:length(hello) }</p>
	<p>문자열 자르기: ${f:substring(hello,6,11)}</p>
	<p>문자열 교체: ${f:replace(hello,"Korea","Busan") }</p>
	<p>문자열 인덱스: ${f:indexOf(hello,"e") }</p>
	
</body>
</html>