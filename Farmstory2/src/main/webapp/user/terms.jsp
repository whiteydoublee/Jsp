<%@page import="kr.co.farmstory2.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory2.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory2.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	TermsBean tb = null;

	try{
		
		Connection conn = DBConfig.getInstance().getConnection();
		PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_TERMS);
		ResultSet rs = psmt.executeQuery();
		
		if (rs.next()){
			tb = new TermsBean();
			
			tb.setTerms(rs.getString(1));
			tb.setPrivacy(rs.getString(2));
		
		rs.close();
		conn.close();
		psmt.close();
		
		}
		
	}catch (Exception e){
		e.printStackTrace();
	}

%>
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

<%@ include file ="../_header.jsp" %>
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
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
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Farmstory2/user/login.jsp">취소</a>
                <a href="/Farmstory2/user/register.jsp">다음</a>
            </div>
        </section>
 <%@ include file ="../_footer.jsp" %>