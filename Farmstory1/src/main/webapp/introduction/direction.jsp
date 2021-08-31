<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file ="../_header.jsp" %>

    
        <!--마크업 - 모든 페이지의 기본 structure-->
        <div id="sub" class="cate1">
            <div><img src="../img/sub_top_tit1.png" alt="INTRODUCTION"></div>
            <section>
                <aside>
                    <img src="../img/sub_aside_cate1_tit2.png" alt="찾아오시는 길">
                    <ul>
                        <li><a href="./hello.jsp">인사말</a></li>
                        <li class="on"><a href="./direction.jsp">찾아오시는 길</a></li>
                    </ul>

                </aside>
                <article>
                    <nav>
                        <img src="../img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는 길">
                        <p>
                            HOME > 팜스토리 소개> <strong>찾아오시는 길</strong>
                        </p>
                    </nav>

                    <!--컨텐츠내용 시작-->
                    <!-- * 카카오맵 - 지도퍼가기 -->
                        <!-- 1. 지도 노드 -->
                        <div id="daumRoughmapContainer1629772683474" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                        <!--
                            2. 설치 스크립트
                            * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                        -->
                        <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                        <!-- 3. 실행 스크립트 -->
                        <script charset="UTF-8">
                            new daum.roughmap.Lander({
                                "timestamp" : "1629772683474",
                                "key" : "2746h",
                                "mapWidth" : "700",
                                "mapHeight" : "500"
                            }).render();
                        </script>

                    <!--컨텐츠내용 끝-->

                </article>
            </section>
        </div>
<%@ include file="../_footer.jsp" %>