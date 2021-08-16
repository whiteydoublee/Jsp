<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberBean mb= (MemberBean) session.getAttribute("sessMember");

	//null checking
	if(mb == null){
		// 로그인을 하지 않고 list 페이지를 요청했을 때 
		response.sendRedirect("/Jboard1/user/login.jsp?success=103");
		return; //프로그램의 종료 시점을 return 키워드로 종료 
	}	
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>글쓰기</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>
</head>
<body>
    <div id="wrapper">
        <section id="board" class="write">
            <h3>글쓰기</h3>
            <article>
                <form action="/Jboard1/proc/writeProc.jsp" method="post" enctype = "multipart/form-data">
                <!-- hidden: 아이디를 표시해 줄 필요가 없으므로. 로그인해야 가능 -->
                	<input type="hidden" name="uid" value=<%=mb.getUid() %>>
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/></td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content"></textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="fname"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Jboard1/list.jsp" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="작성완료">
                    </div>
                </form>
            </article>
        </section>
    </div>
</body>
</html>