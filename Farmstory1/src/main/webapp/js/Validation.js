/**
 //유효성 검증 (Validation): 한 가지라도 조건이 만족하지  않을 시 다음 페이지로 넘어가지 않고, 다시 입력하도록 유도* 
 */

	$(document).ready(function(){
		$('.register>form').submit(function(){
			
			if(!isUidOk){//아이디가 유효하지 않으면
				alert('아이디가 유효하지 않습니다. 다시 입력하세요.');
			return false;
			}
			if(!isPassOk){
				alert('비밀번호가 유효하지 않습니다. 다시 입력하세요.');
			return flase;
			}
			if (!isNickOk){
				alert('닉네임이 유효하지 않습니다. 다시 입력하세요.');
			return false;
			}else {
				return true;
			}
		});
	});

