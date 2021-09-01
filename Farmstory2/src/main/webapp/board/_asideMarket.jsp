<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");

	String title = "";
	
	if(cate.equals("market")){
		title="장보기";
	}
%>

<!--마크업 - 모든 페이지의 기본 structure-->
 <div id="sub" class="cate2">
   <div><img src="../img/sub_top_tit2.png" alt="MARKET"></div>
   <section>
       <aside>
           <img src="../img/sub_aside_cate2_tit.png" alt="장보기">
           <ul>
               <li class="<%= cate.equals("market") ?"on":"off"%>"><a href="./list.jsp?group=Market&cate=market">농작물이야기</a></li>
           </ul>

       </aside>
       <article>
           <nav>
               <img src="../img/sub_nav_tit_cate2_<%=cate %>.png" alt="<%=title%>">
               <p>
                   HOME > 농작물이야기> <strong><%=title %></strong>
               </p>
           </nav>

           <!--컨텐츠내용 시작-->


	
