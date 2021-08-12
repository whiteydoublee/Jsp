<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
		TermsBean tb = new TermsBean();
		
	try{
		//1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계 - SQL 실행 객체 생성 
		Statement stmt = conn.createStatement();
		
		//4단계 - SQL 실행
		
		ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
		
		//5단계 - 결과셋 처리 (SELECT 문일 경우)
		
		if (rs.next()){
			
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
			
		}
		
		//6단계 - DB 종료
		rs.close();
		conn.close();
		stmt.close();
		
	}catch (Exception e){
		e.printStackTrace();
	}

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
    <%--jQuery로 이벤트를 생성 (조건이 모두 만족되어야 다음 페이지로 넘어갈 수 있어야함) --%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
    	$(document).ready(function(){
    		var btnNext=$('.terms> div> a:nth-child(2)')
    		btnNext.click(function(){
    			//JQuery는 연쇄적으로 호출 가능
    			var isChecked1 = $('input[name=chk1]').is(':checked'); // : < 상태선택자
    			var isChecked2 = $('input[name=chk2]').is(':checked');
    			
    			// check가 되어있지 않아야 하므로, !(not)isChecked#을 조건으로 해줌 ||(or): 하나라도 안 되어 있을 경우 거짓(두 박스 중 하나라도 체크되지 않으면 페이지를 넘길 수 없다.)
    			if (!isChecked1 || !isChecked2){ // 체크를 하지 않고 '다음' 버튼을 클릭할 경우 대비(return false: a tag 링크 이동을 취소시켜줌 )
    				alert('동의 체크를 하셔야합니다.');
    				return false;
    			}else {
    				return true;
    			}
    		});
    		
    	});
    </script>
        
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%=tb.getTerms() %></textarea>
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
                        <textarea readonly><%=tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>