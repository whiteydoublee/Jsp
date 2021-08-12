/**
 * 
 */

// 유효성 검증 (Validation) : 한 가지라도 조건이 만족하지 않을 시 다음페이지로 넘어가지 않고, 다시 입력하도록 유도 
	$(document).ready(function(){
		
		$('.register>form').submit(function(){
			
			if(!isUidOk){ // 아이디가 유효하지 않으면 
				alert('아이디가 유효하지 않습니다. 다시 입력하세요.');
			return false; // 전송취소 (전송이 되지 않음)
			}
			
			if(!isPassOk){ // 비번이 유효하지 않으면 
				alert('비밀번호가 유효하지 않습니다. 다시 입력하세요.');
			return false; // 전송취소 (전송이 되지 않음)
			}
			
			if(!isNameOk){ // 이름이 유효하지 않으면 
				alert('이름이 유효하지 않습니다. 다시 입력하세요.');
			return false; // 전송취소 (전송이 되지 않음)
			}
			
			if(!isNickOk){ // 별명이 유효하지 않으면 
				alert('닉네임이 유효하지 않습니다. 다시 입력하세요.');
			return false; // 전송취소 (전송이 되지 않음)
			}
			else{
			return true;
			}
		});
		
	});
	