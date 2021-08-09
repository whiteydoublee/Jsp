<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>5_4_Ajax</title>
	<%--
	날짜: 2021/08/09
	이름: 김예은
	내용: JSP AJAX 데이터 실습
	
	AJAX(Asynchronous Javascript And Xml)
	 - 일반적인 페이지 요청을 위한 HTTP 통신과 다르게 데이터 요청을 위한 부분적인 통신 (비동기)
	 - 데이터 결과는 일반적으로 Json을 사용
	 
	 --%>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	 <script >
	 	$(document).ready(function(){
	 		
	 		// 데이터 출력 태그객체 선택
	 		var tds= $('tr>td:nth-child(2)');
	 		
	 		//버튼이벤트 구현 ($('button'): button 클릭하라, click (핸들러: function(){}))
	 		$('button').click(function(){
	 			//Ajax 통신 (데이터 요청)
	 			$.ajax({ // Ajax 함수의 기본 옵션들 
	 				url: './5_1_Json.jsp',
	 				type:'get',
	 				dataType: 'json',
	 				success: function(data){
	 					
	 					tds.eq(0).text(data.uid);
	 					tds.eq(1).text(data.name); //text(): <td>사이에 있는 텍스트</td>
	 					tds.eq(2).text(data.hp);
	 					tds.eq(3).text(data.age);
	 				}
	 				
	 			});
	 		});
	 			
	 		
	 		
	 	}); // Jquery 시작함수($:jquery)
	 
	 </script>
</head>
<body>
	<h3>4. Ajax통신 실습하기</h3>
	
	<button>데이터 가져오기</button>
	
	<table border="1">
		<tr>
		 <td>아이디</td>
		 <td>-</td>
		</tr>
	
		<tr>
		 <td>이름</td>
		 <td>-</td>
		</tr>
		
		<tr>
		 <td>휴대폰</td>
		 <td>-</td>
		</tr>
		
		<tr>
		 <td>나이</td>
		 <td>-</td>
		</tr>
	
	</table>

</body>
</html>