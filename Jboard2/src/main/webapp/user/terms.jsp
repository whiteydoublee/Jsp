<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
		// a:nth-child(2): '다음' 버튼
		var btnNext=$('.terms > div > a:nth-child(2)')
		btnNext.click(function(){
			//Jquery는 연쇄적으로 호출이 가능(순서가 중요)
			var isChecked1 = $('input[name=chk1]').is(':checked'); // : 상태선택자
			var isChecked2 = $('input[name=chk2]').is(':checked');
			
			//check가 되어 있지 않아야 하므로, !(not)checked#을 조건으로 해줌 
			//* ||(or):하나라도 안 되어 잇을 경우 거짓 (두 박스 중 하나라도 체크되지 않으면 페이지를 넘기지 않음)
			if (!isChecked1 || !isChecked2){
				alert('동의 체크를 하셔야합니다.');
				return false;
			}else{
				return true;
			}
		});
		
	});

</script>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="../css/style.css"/>    
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly>${requestScope.vo.getTerms() }</textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly>${vo.privacy }</textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard2/user/login.do">취소</a>
                <a href="/Jboard2/user/register.do">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>