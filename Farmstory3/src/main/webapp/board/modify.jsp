<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../_header.jsp" %>
<jsp:include page="./_aside${group }.jsp"/>

        <section id="board" class="modify">
            <h3>글수정</h3>
            <article>
                <form action="/Farmstory3/board/modify.do?group=${group }&cate=${cate}&seq=${vo.seq}">
                    <table>
                        <tr>
                            <td>제목</td>
                            <td><input type="text" name="title" placeholder="제목을 입력하세요."/>${vo.title }</td>
                        </tr>
                        <tr>
                            <td>내용</td>
                            <td>
                                <textarea name="content">${vo.content}</textarea>                                
                            </td>
                        </tr>
                        <tr>
                            <td>첨부</td>
                            <td><input type="file" name="file"/></td>
                        </tr>
                    </table>
                    <div>
                        <a href="/Farmstory3/board/view.do?group=${group }&cate=${cate}&seq=${vo.seq}" class="btnCancel">취소</a>
                        <input type="submit"  class="btnWrite" value="수정완료">
                    </div>
                </form>
            </article>
        </section>
<%@include file ="../_footer.jsp" %>