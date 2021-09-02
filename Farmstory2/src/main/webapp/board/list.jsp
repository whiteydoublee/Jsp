<%@page import="java.util.List"%>
<%@page import="kr.co.farmstory2.dao.ArticleDao"%>
<%@page import="kr.co.farmstory2.bean.ArticleBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	//전송데이터 수신
	request.setCharacterEncoding("UTF-8");
	String pg = request.getParameter("pg");
	String group = request.getParameter("group");
	String cate = request.getParameter("cate");
	
	String includeFile = "./_aside"+group+".jsp";
	
	if(pg==null){
		pg="1";
	}
	
	//페이지 계산 처리
	int start =0 ;
	int currentPage = Integer.parseInt(pg);
	int total = ArticleDao.getInstance().selectCountTotal(cate);
	int lastPageNum=0;
	
	if (total % 10 ==0){ //글목록의 수가 10개이면, 한 페이지 
		lastPageNum = total / 10;
	}else { // 글 목록수가 나누어 떨어지지 않으면 나머지가 있으므로, 한 페이지 더 생성해야함 
		lastPageNum = total / 10 + 1;
	}
	start = (currentPage - 1) *10;
	
	int pageStartNum = total - start;
	int groupCurrent = (int) Math.ceil(currentPage/10.0);
	int groupStart = (groupCurrent-1) *10+1;
	int groupEnd = groupCurrent*10;
	
	if(groupEnd > lastPageNum){
		groupEnd=lastPageNum;
	}
	
	//게시물 가져오기 
	List <ArticleBean> articles = ArticleDao.getInstance().selectArticles(cate,start);
	
	
	
%>


<jsp:include page="<%=includeFile %>">
	<jsp:param value="<%=cate %>" name="cate"/>
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
	            <%for (ArticleBean article: articles){ %>
	            <tr>
	                <td><%= pageStartNum-- %></td>
	                <td><a href="/Farmstory2/board/view.jsp?group=<%=group%>&cate=<%=cate%>&seq=<%= article.getSeq()%>"><%=article.getTitle() %></a>&nbsp;[<%= article.getComment() %>]</td>
	                <td><%= article.getNick() %></td>
	                <td><%= article.getRdate().substring(2,10) %></td>
	                <td><%= article.getHit() %></td>
	            </tr>
	            <%} %>
	        </table>
	    </article>
	
	    <!-- 페이지 네비게이션 -->
	    <div class="paging">
	    	<% if (groupStart > 1){ %>
	       	 	<a href="/Farmstory2/board/list.jsp?cate=<%=cate %>&pg=<%= groupStart -1 %>" class="prev">이전</a>
	        <%} %>
	        <%for (int i = groupStart ; i <= groupEnd; i++){ %>
	        	<a href="/Farmstory2/board/list.jsp?cate=<%=cate %>&pg=<%=i %>" class="num <%= (currentPage == i) ? "current":""%>"><%=i %></a>  
	        <%} %>      
	        <%if (groupEnd < lastPageNum){ %>        
	       	 	<a href="/Farmstory2/board/list.jsp?cate=<%=cate %>&pg=<%=groupEnd +1 %>" class="next">다음</a>
	        <%} %>
	    </div>
	
	    <!-- 글쓰기 버튼 -->
	    <a href="/Farmstory2/board/write.jsp?cate=<%=cate %>&group=<%=group %>" class="btnWrite">글쓰기</a>
	
	
		  <!--컨텐츠내용 끝-->
	    </article>
	 </section>
</div>
	 
<%@ include file="../_footer.jsp" %>