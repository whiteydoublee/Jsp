<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../_header.jsp" %>

        <!--마크업 - 모든 페이지의 기본 structure-->
        <div id="sub" class="cate3">
            <div><img src="../img/sub_top_tit3.png" alt="CROPTALK"></div>
            <section>
                <aside>
                    <img src="../img/sub_aside_cate3_tit.png" alt="농작물이야기">
                    <ul>
                        <li><a href="./story.jsp">농작물이야기</a></li>
                        <li><a href="./grow.jsp">텃밭가꾸기</a></li>
                        <li class="on"><a href="./school.jsp">귀농학교</a></li>
                    </ul>

                </aside>
                <article>
                    <nav>
                        <img src="../img/sub_nav_tit_cate3_tit3.png" alt="귀농학교">
                        <p>
                            HOME > 농작물이야기> <strong>귀농학교</strong>
                        </p>
                    </nav>

                    <!--컨텐츠내용 시작-->
                     <%if(mode.equals("l")){ %>
               	<jsp:include page="../board/list.jsp"/>
               <%}else if(mode.equals("w")){ %>
               	<jsp:include page="../board/write.jsp">
            		<jsp:param name="uid" value="<%= mb.getUid() %>"/>
            	</jsp:include>
               <%}else if( mode.equals("v")){ %>
               	<jsp:include page="../board/view.jsp">
               		<jsp:param value="<%=mb.getUid() %>" name="uid"/>
          		</jsp:include>
               <%}else if (mode.equals("m")){ %>
               	<jsp:include page="../board/modify.jsp">
	               	<jsp:param value="<%=mb.getUid() %>" name="uid"/>
	          	</jsp:include>
               <%} %>

                    <!--컨텐츠내용 끝-->
                </article>
            </section>
        </div>
<%@ include file="../_footer.jsp" %>