<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>
<%
	String mode = request.getParameter("mode");
	
	
	if(mode==null){
		mode="l";//list mode
	}
	
%>       
   <!--마크업 - 모든 페이지의 기본 structure-->
   <div id="sub" class="cate3">
       <div><img src="../img/sub_top_tit3.png" alt="CROPTALK"></div>
       <section>
           <aside>
               <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기">
               <ul>
                   <li class="on"><a href="./story.html">농작물이야기</a></li>
                   <li><a href="./grow.html">텃밭가꾸기</a></li>
                   <li><a href="./school.html">귀농학교</a></li>
               </ul>

           </aside>
           <article>
               <nav>
                   <img src="../img/sub_nav_tit_cate3_tit1.png" alt="농작물이야기">
                   <p>
                       HOME > 농작물이야기> <strong>농작물이야기</strong>
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