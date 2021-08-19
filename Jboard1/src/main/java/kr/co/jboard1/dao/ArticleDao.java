package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.bean.ArticleBean;
import kr.co.jboard1.bean.FileBean;
import kr.co.jboard1.db.DBConfig;
import kr.co.jboard1.db.Sql;

//DAO(Data Access Object)클래스
public class ArticleDao {
	
	
	//싱글톤 객체 생성 : 싱글톤은 객체가 1개만 생성되어야할때 사용됨 (constructor: private, method: static)
	private static ArticleDao instance = new ArticleDao();
	
	public static ArticleDao getInstance() {
		return instance;
	} // 메서드 
	
	private ArticleDao() {}
	
	// Method
	public int selectCountTotal() {
			
		int total=0;
		
		try {
			//1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COUNT_TOTAL);
			
			//4
			ResultSet rs= psmt.executeQuery();
			
			//5
			if(rs.next()) {
				 total = rs.getInt(1);
			}
			
			//6
			rs.close();
			conn.close();
			psmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	// view scriptlet
	public ArticleBean selectArticle(String seq){
		ArticleBean ab = null;
		FileBean fb = null;
		
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt=conn.prepareStatement(Sql.SELECT_ARTICLE);
			// 글번호 맵핑해야하므로 psmt.setInt or string 
			psmt.setString(1, seq);
			
			//4단계
			ResultSet rs = psmt.executeQuery();
			
			//5단계
			if(rs.next()) {
				ab = new ArticleBean();
				
				ab.setSeq(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				
				fb = new FileBean();
				fb.setFseq(rs.getInt(12));
				fb.setParent(rs.getInt(13));
				fb.setOriName(rs.getString(14));
				fb.setNewName(rs.getString(15));
				fb.setDownload(rs.getInt(16));
				fb.setRdate(rs.getString(17));
				
				//ArticleBean에 FileBean의 객체를 추가해주어야함 
				ab.setFb(fb);
			}
			
			//6단계
			rs.close();
			conn.close();
			psmt.close();
			
			}catch(Exception e){
				e.printStackTrace();
			}
		return ab;
	}
	
	//list scriptlet
	public List<ArticleBean> selectArticles (int start) { // start: 매개변수 선언
		
		List<ArticleBean> articles	= new ArrayList<>();
		
		try{
			//1단계,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_ARTICLES);
			psmt.setInt(1, start);
			// ? (입력해야하는 사항이 없으므로 )
			
			//4단계
			ResultSet rs = psmt.executeQuery();
			
			//5단계
			while(rs.next()){
				ArticleBean ab = new ArticleBean();
				ab.setSeq(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				ab.setNick(rs.getString(12)); //닉네임 데이터
				
				articles.add(ab);
				
			}
			
			//6단계
			rs.close();
			conn.close();
			psmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return articles;
		
	}
	
	public List<ArticleBean> selectComments(String seq){
		List<ArticleBean> comments	= new ArrayList<>();
		
		try{
			//1단계,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_COMMENTS);
			psmt.setString(1, seq); // 받아오는 parent값 = seq 
			
			//4단계
			ResultSet rs = psmt.executeQuery();
			
			//5단계
			while(rs.next()){
				ArticleBean ab = new ArticleBean();
				ab.setSeq(rs.getInt(1));
				ab.setParent(rs.getInt(2));
				ab.setComment(rs.getInt(3));
				ab.setCate(rs.getString(4));
				ab.setTitle(rs.getString(5));
				ab.setContent(rs.getString(6));
				ab.setFile(rs.getInt(7));
				ab.setHit(rs.getInt(8));
				ab.setUid(rs.getString(9));
				ab.setRegip(rs.getString(10));
				ab.setRdate(rs.getString(11));
				ab.setNick(rs.getString(12)); //닉네임 데이터
				
				comments.add(ab);
				
			}
			
			//6단계
			rs.close();
			conn.close();
			psmt.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return comments;
		
	}
	
	public void insertArticle() {}
	public void insertComment(ArticleBean ab) {
		
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt =conn.prepareStatement(Sql.INSERT_COMMENT);
			psmt.setInt(1, ab.getParent());
			psmt.setString(2, ab.getContent());
			psmt.setString(3, ab.getUid());
			psmt.setString(4, ab.getRegip());
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			conn.close();
			psmt.close();
			
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	
	public void updateArticle() {}
	public void updateArticleHit(String seq) {
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_HIT);
			psmt.setString(1, seq);
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			conn.close();
			psmt.close();
			
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	public void updateArticleCommentCount(String parent, int type) {
		try {
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			
			PreparedStatement psmt = null;
			if (type >0) {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT);
			}else {
				psmt = conn.prepareStatement(Sql.UPDATE_ARTICLE_COMMENT_MINUS);
			}
			psmt.setString(1, parent);
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			conn.close();
			psmt.close();
			//6단계
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int updateComment(String content, String seq) {
		
		int result=0;
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = conn.prepareStatement(Sql.UPDATE_COMMENT);
			psmt.setString(1, content);
			psmt.setString(2, seq);
			
			result = psmt.executeUpdate(); // 리턴값 사용 
			psmt.close();
			conn.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public void deleteArticle() {}
	public void deleteComment(String seq) {
		
		try{
			//1,2단계
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3단계
			PreparedStatement psmt = conn.prepareStatement(Sql.DELETE_COMMENT);
			psmt.setString(1, seq);
			
			//4단계
			psmt.executeUpdate();
			
			//5단계
			//6단계
			psmt.close();
			conn.close();
			
		}catch (Exception e){
			e.printStackTrace();
		}
	}
	
	
	
}
