<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file ="../_header.jsp" %>

<jsp:include page ="${includeFile }">
	<jsp:param value="${group }" name="group"/>
	<jsp:param value="${cate }" name="cate"/>
</jsp:include>

	 <section id="board" class="list">
	     <h3>글목록</h3>
	     <article>
	         <table border="0">
	             <tr>
	                 <th>번호</th>
	                 <th>제목</th>
	                 <th>글쓴이</th>
	                 <th>날짜</th>
	                 <th>조회</th>
	             </tr>
	             
	              <c:forEach var="vo" items="${articles}">
	              <tr>
	                  <td>${pageStartNum = pageStartNum +1}</td>
	                  <td><a href="/Farmstory3/board/view.do?group=${group }&cate=${cate }&seq=${vo.seq }">${vo.title}</a>&nbsp;[${vo.comment}]</td>
	                  <td>${vo.nick}</td>
	                  <td>${vo.rdate.substring(2,10)}</td>
	                  <td>${vo.hit}</td>
	              </tr>
	             </c:forEach>
	             
	         </table>
	     </article>
	
	     <!-- 페이지 네비게이션 -->
	     <div class="paging">
	     	<c:if test="${groups[0] > 1 }">
	        		<a href="/Farmstory3/board/list.do?pg=${ groups[0]-1}" class="prev">이전</a>
	         </c:if>
	         
	         <c:forEach var="i" begin="${groups[0] }" end="${groups[1] }">
	         	<a href="/Farmstory3/board/list.do?pg=${i}" class="num ${currentPage == i ?'current':'off'}">${i}</a>                
	         </c:forEach>
	         <c:if test="${groups[1] < lastPageNum }">
	         	<a href="/Farmstory3/board/list.do?pg=${groups[1] +1 }" class="next">다음</a>
	        	</c:if>
	     </div>
	
	     <!-- 글쓰기 버튼 -->
	     <a href="/Farmstory3/board/write.do?group=${group }&cate=${cate}" class="btnWrite">글쓰기</a>

        </article>
        </section>
        </div>
<%@include file ="../_footer.jsp" %>