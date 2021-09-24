<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/Farmstory3/js/zipcode.js"></script>
 		
    <script>
    $(function(){
    	
    	//정규표현식 (Regular Expression)
    	var reUid = /^[a-z]+[a-z0-9]{3,10}$/; // 아이디
    	var rePass =  /^(?=.*[a-zA-Z])(?=.*[0-9]).{4,}$/;
    	var reName= /^[가-힣]{2,10}$/;
    	var reNick = /^[a-z가-힣0-9]{2,10}$/;

    	var isUidOk = false;
    	var isPassOk = false;
    	var isNameOk = false;
    	var isNickOk = false;
    	
    	// 아이디 중복체크
        $('input[name=uid]').focusout(function(){

            var uid = $(this).val(); //내가 선택한 필드의 값

            $.ajax({
                url:'/Farmstory3/member/checkUid.do?uid='+uid,
                type:'get',
                dataType:'json',
                success:function(data){
                	if(data.result == 1){
                	$('.resultId').css('color','red').text('이미 사용중인 아이디 입니다.');
 					isUidOk=false;
 					}else {
 						$('.resultId').css('color','red').text('사용가능한 아이디입니다.');
 						//아이디유효성 검사
 						if (reUid.test(uid)){
 							$('.resultId').css('color','green').text('사용 가능한 아이디 입니다.');
 							isUidOk = true;
 						}else {
 							$('.resultId').css('color','red').text('아이디는 영문 소문자, 숫자 조합 4-10자까지 입니다.');
 							isUidOk = false;
 						}

                }
            });
        });
    	
    	//비밀번호 유효성 검사
   		$('input[name=pass2]').focusout(function(){
   		var pass1 = $('input[name=pass1]').val();
   		var pass2 = $('input[name=pass2]').val();
   		
   		if(pass1==pass2){
   			if(rePass.test(pass2)){// 비밀번호가 숫자, 영문, 특수문자로 조합이 되어있지 않은 경우
   				$('.resultPass').css('color','green').text('비밀번호가 일치합니다.');
   				isPassOk=true;
   			}else {
   				$('.resultPass').css('color','red').text('비밀번호가 영문,숫자 조합되어 4자이상이 되어야 합니다.');
   				isPassOk=false;
   			}
   		}else {
   			$('.resultPass').css('color','red').text('비밀번호가 일치하지 않습니다.');
   			isPassOk = false;
   		}
   	});
    	
   	//이름 유효성 검사 
   		$('input[name=name]').focusout(function(){
   			var name = $(this).val();
   			
   			if (reName.test(name)){// 이름이 유효하면
   				isNameOk=true;
   			}else {
   				$('.resultName').css('color','red').text('이름이 유효하지 않습니다.');
   				isNameOk=false;
   			}
   			
   		});
   		//닉네임 중복체크
   		$('input[name=nick]').focusout(function(){
   			
   			var nick = $(this).val();
   			
   			$.ajax({
   				url: '/Farmstory3/member/checkNick.do?nick='+nick,
   				type: 'get',
   				dataType: 'json',
   				success: function(data){
   					if(data.result == 1){					    						
   						$('.resultNick').css('color', 'red').text('이미 사용중인 닉네임 입니다.');
   						isNickOk = false;
   					}else{
   						if(reNick.test(nick)){
   							$('.resultNick').css('color', 'green').text('사용 가능한 닉네임 입니다.');
   							isNickOk = true;	
   						}else{
   							$('.resultNick').css('color', 'red').text('닉네임은 영문, 한글, 숫자포함 2 ~ 10자 입니다.');
   							isNickOk = false;
   						}
   					}
   				}    				
   			});
   		});
   		
   		//이메일 중복 체크 
   		$('input[name=email]').focusout(function(){
   			
   			var email = $(this).val();
   			
   			$.ajax({
   				url: '/Farmstory3/member/checkEmail.do?email='+email,
   				type: 'get',
   				dataType: 'json',
   				success: function(data){
   					if(data.result == 1){    						
   						$('.resultEmail').css('color', 'red').text('이미 사용중인 이메일 입니다.');
   					}else{
   						$('.resultEmail').css('color', 'green').text('사용 가능한 이메일 입니다.');
   					}
   				}    				
   			});
   		});
   		
   		//휴대전화 중복 체크 
   		$('input[name=hp]').focusout(function(){
   			var hp = $(this).val();
   			$.ajax({
   				url: '/Farmstory3/member/checkHp.do?hp='+hp,
   				type: 'get',
   				dataType: 'json',
   				success: function(data){
   					if (data.result==1){
   						$('.resultHp').css('color','red').text('이미 사용중인 번호입니다.');
   					}else{
   						$('.resultHp').css('color','green').text('사용가능한 번호입니다.');
   					}
   				}
   				});
   			});
   	});

    </script>
    
    <%@ include file="../_header.jsp" %>

        <section id="user" class="register">
            <form action="/Farmstory3/member/register.do" method="POST">
                <table border="1">
                    <caption>사이트 이용정보 입력</caption>
                    <tr>
                        <td>아이디</td>
                        <td>
                            <input type="text" name="uid" placeholder="아이디 입력"/>
                            <span class="resultId"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td>
                            <input type="password" name="pass1" placeholder="비밀번호 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>비밀번호 확인</td>
                        <td>
                            <input type="password" name="pass2" placeholder="비밀번호 확인 입력"/>
                            <span class="resultPass"></span>
                        </td>
                    </tr>
                </table>
                <table border="1">
                    <caption>개인정보 입력</caption>
                    <tr>
                        <td>이름</td>
                        <td>
                            <input type="text" name="name" placeholder="이름 입력"/>                            
                        </td>
                    </tr>
                    <tr>
                        <td>별명</td>
                        <td>
                            <p>공백없이 한글, 영문, 숫자만 입력가능</p>
                            <input type="text" name="nick" placeholder="별명 입력"/>
                            <span class="resultNick"></span>                            
                        </td>
                    </tr>
                    <tr>
                        <td>E-Mail</td>
                        <td>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                        </td>
                    </tr>
                    <tr>
                        <td>휴대폰</td>
                        <td>
                            <input type="text" name="hp" placeholder="- 포함 13자리 입력" minlength="13" maxlength="13" />
                        </td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td>
                            <div>
                                <input type="text" name="zip" placeholder="우편번호" readonly/>
                               <button type = "button" class="btnZip" onclick="zipcode()">주소검색</button>
                            </div>                            
                            <div>
                                <input type="text" name="addr1" placeholder="주소를 검색하세요." readonly/>
                            </div>
                            <div>
                                <input type="text" name="addr2" placeholder="상세주소를 입력하세요."/>
                            </div>
                        </td>
                    </tr>
                </table>

                <div>
                    <a href="/Farmstory3/member/login.do" class="btnCancel">취소</a>
                    <input type="submit"   class="btnJoin" value="회원가입"/>
                </div>

            </form>
        </section>
<%@ include file="../_footer.jsp" %>
