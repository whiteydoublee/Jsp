<%@page import="kr.co.jboard1.dao.ArticleDao"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String parent = request.getParameter("parent"); // 원글 번호
	String seq = request.getParameter("seq"); // 댓글 번호 
	
	ArticleDao dao = ArticleDao.getInstance();
	//댓글삭제
	dao.deleteComment(seq);
	
	//댓글 카운트 -1
	dao.updateArticleCommentCount(parent,-1);
	
	//Redirect
	response.sendRedirect("/Jboard1/view.jsp?seq="+parent);


%>