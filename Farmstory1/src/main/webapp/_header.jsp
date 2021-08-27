<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 로그인에 관한 객체는 session 
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>팜스토리</title>
    <link rel ="stylesheet" href="/Farmstory1/css/style.css">
</head>
<body>
    <div id="wrapper">
        <header>
            <a href="/Farmstory1" class="logo"><img src="/Farmstory1/img/logo.png" alt="로고"></a>
            <p>
                <a href="/Farmstory1">HOME |</a>
                <%if(mb==null){//로그인이 되어 있지 않으면의 조건  %> 
	                <a href="/Farmstory1/user/login.jsp">Login |</a>
	                <a href="/Farmstory1/user/terms.jsp">Join |</a>
	            <%} else{ %>
                <a href="/Farmstory1/user/logout.jsp">Logout |</a>
                <%} %>
                <a href="/Farmstory1/community/qna.jsp">Contact us</a>
            </p>

            <img src="/Farmstory1/img/head_txt_img.png" alt="3만원 이상 무료배송, 팜카드 10%적립">

            <ul class="gnb">
                <li><a href="/Farmstory1/introduction/hello.jsp">팜스토리 소개</a></li>
                <li><a href="/Farmstory1/market/market.jsp"><img src="/Farmstory1/img/head_menu_badge.png" class="badge">장보기</a></li>
                <li><a href="/Farmstory1/croptalk/story.jsp">농작물 이야기</a></li>
                <li><a href="/Farmstory1/event/event.jsp">이벤트</a></li>
                <li><a href="/Farmstory1/community/notice.jsp">커뮤니티</a></li>
           </ul>

        </header>
        