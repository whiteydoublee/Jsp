<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int seq	=0;
	//Multipart 전송데이터 수신(파일 업로드와 동시에 처리)
	String path = request.getServletContext().getRealPath("/file");
	int maxSize = 1024 * 1024 * 10; // 1MB * 10 = 10MB
	
	// tomcat 저장소에 파일을 저장 
	MultipartRequest mRequest = new MultipartRequest( request,path ,maxSize ,"UTF-8", new DefaultFileRenamePolicy()); 
	// request: 전송객체, path,size,encoding, 

	String uid = mRequest.getParameter("uid");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getFilesystemName("fname"); // 첨부파일 이름 
	String regip = request.getRemoteAddr();
	
	try{
		
		//1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3 단계
		Statement stmt = conn.createStatement();
		PreparedStatement pmst = conn.prepareStatement(Sql.INSERT_ARTICLE);
		pmst.setString(1, title);
		pmst.setString(2, content);
		pmst.setInt(3, fname== null? 0:1);
		pmst.setString(4, uid);
		pmst.setString(5, regip);

		
		//4단계
		pmst.executeUpdate();
		ResultSet rs = stmt.executeQuery(Sql.SELECT_MAX_SEQ);
		
		//5
		if (rs.next()){
			 seq = rs.getInt(1);
		}
		
		//6
		rs.close();
		stmt.close();
		conn.close();
		pmst.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//파일첨부를 했으면 파일 처리작업
	if(fname != null){
		//파일명 수정 
		int i = fname.lastIndexOf("."); // 인덱스 번호를 구해줌: IndexOf => .의 인덱스 번호를 찾아줌
		String ext = fname.substring(i);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss_");
		String now = sdf.format(new Date());
		String newName = now+uid+ext;
		
		File oriFile = new File(path+"/"+fname);
		File newFile = new File(path+"/"+newName);
		
		oriFile.renameTo(newFile);
		
		//파일 테이블 INSERT작업
		try{
		//1,2단계
		Connection conn = DBConfig.getInstance().getConnection();
		
		//3단계
		
		PreparedStatement psmt= conn.prepareStatement(Sql.INSERT_FILE);
		psmt.setInt(1, seq);
		psmt.setString(2, fname);
		psmt.setString(3, newName);
		
		//4단계
		psmt.executeUpdate();
		
		//5단계
		//6단계
		conn.close();
		psmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}

	response.sendRedirect("/Jboard1/list.jsp");
	
%>