<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리::찾아오시는 길</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
       

        /*팜스토리소개*/


        /*장보기*/
        /*농작물이야기*/
        /*이벤트*/
        /*커뮤니티*/
    </style>
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="#" class="logo"><img src="../img/logo.png" alt="로고"></a>
            <p>
                <a href="#">HOME |</a>
                <a href="#">Login |</a>
                <a href="#">Join |</a>
                <a href="#">Contact us</a>
            </p>

            <img src="../img/head_txt_img.png" alt="3만원 이상 무료배송, 팜카드 10%적립">   

            <ul class="gnb">
                <li><a href="#">팜스토리 소개</a></li>
                <li><a href="#"><img src="../img/head_menu_badge.png" class="badge">장보기</a></li>
                <li><a href="#">농작물 이야기</a></li>
                <li><a href="#">이벤트</a></li>
                <li><a href="#">커뮤니티</a></li>
           </ul>
        </header>

    
        <!--마크업 - 모든 페이지의 기본 structure-->
        <div id="sub" class="cate1">
            <div><img src="../img/sub_top_tit1.png" alt="INTRODUCTION"></div>
            <section>
                <aside>
                    <img src="../img/sub_aside_cate1_tit2.png" alt="찾아오시는 길">
                    <ul>
                        <li><a href="./hello.html">인사말</a></li>
                        <li class="on"><a href="./direction.html">찾아오시는 길</a></li>
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