<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%	
	//index
	//프로젝트 시작처리 페이지
	MemberBean mb = (MemberBean) session.getAttribute("sessMember");
	
	if(mb == null){ //로그인을 안 했으면.
		
		pageContext.forward("./user/login.jsp");
		
	}else{
		//로그인을 했으면 리스트페이지로 포워드
		pageContext.forward("./list.jsp");
		
	}


%>