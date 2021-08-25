<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String mode = request.getParameter("mode");
	
	
	if(mode==null){
		mode="l";//list mode
	}
	
%>  
       
   <!--마크업 - 모든 페이지의 기본 structure-->
   <div id="sub" class="cate5">
       <div><img src="../img/sub_top_tit5.png" alt="COMMUNITY"></div>
       <section>
         <aside>
             <img src="../img/sub_aside_cate5_tit.png" alt="커뮤니티">
             <ul>
                 <li class="on"><a href="./notice.html">공지사항</a></li>
                 <li><a href="./menu.html">오늘의 식단</a></li>
                 <li><a href="./chef.html">나도요리사</a></li>
                 <li><a href="./qna.html">1:1고객문의</a></li>
                 <li><a href="./fnq.html">자주묻는질문</a></li>
             </ul>

         </aside>
         <article>
             <nav>
                 <img src="../img/sub_nav_tit_cate5_tit1.png" alt="공지사항">
                 <p>
                     HOME > 커뮤니티 > <strong>공지사항</strong>
                 </p>
             </nav>

             <!--컨텐츠내용 시작-->
              <%if(mode.equals("l")){ %>
             	<jsp:include page="../board/list.jsp"/>
             <%}else if(mode.equals("w")){ %>
             	<jsp:include page="../board/write.jsp"/>
             <%}else if( mode.equals("v")){ %>
             	<jsp:include page="../board/view.jsp"/>
             <%}else if (mode.equals("m")){ %>
             	<jsp:include page="../board/modify.jsp"/>
             <%} %>

             <!--컨텐츠내용 끝-->
         </article>
       </section>
   </div>
 <%@ include file="../_footer.jsp" %>