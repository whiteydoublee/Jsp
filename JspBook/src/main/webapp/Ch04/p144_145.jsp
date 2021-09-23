<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<h2>request예제 - 요청 메소드</h2>
	
	<form method="post" action="./proc/requestTest1.jsp">
		<dl>
			<dd>
				<label for="name">이름</label>
				<input id="name" name ="name" type="text"
				placeholder= "KRISTINA" autofocus required>
			</dd>
			
			<dd>
				<label for="age">나이</label>
				<input id="age" age ="name" type="number"
				min="20" max="99" value="20" required>
			</dd>
			
			<dd><fieldset>
			<legend>성별</legend>
			
				<input id="gender" name ="gender" type="radio" value ="m" checked>
				<label for ="gender">남</label>
				<input id="gender" name ="gender" type="radio" value ="f">
				<label for ="gender">여</label>
			</fieldset></dd>
			
			<dd>
				<label for="hobby">취미</label>
				<select id = "hobby" namee="hobby" required>
					<option value ="Sleeping" selected>Sleeping
					<option value ="Wathcing soap drama">Watching TV
					<option value ="Watching Comics">Watching Comics
					<option value = "Building Robots">Building toys
				</select>
				
			</dd>
			
			<dd>
				<input type="submit" value="transfer">
			</dd>
			
		</dl>
	
	
	</form>

</body>
</html>