<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>표현언어의 표현식 사용예제-연산자 사용</title>
		<!-- 
		날짜: 20211/09/06
		이름: 김예은
		내용: 표현언어의 연산자 사용
	 -->
</head>
<body>
	<h3>표현식 = 값</h3>
	<p>
		\${2+5 }=${2+5 }
	</p>
	<p>
		\${4/5 }=${4/5 }
	</p>
	<p>
		\${7 mod 5 }=${7 mod 5 }
	</p>
	<p>
		\${2 < 3}=${2<3}
	</p>
	<p>
		\${3.1 le 3.2 }=${3.1 le 3.2 }
	</p>
	<p>
		\${(5 gt 3)?5:3}=${(5 gt 3)?5:3 }
	</p>
	

</body>
</html>