package kr.co.jboard2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import kr.co.jboard2.db.DBConfig;
import kr.co.jboard2.db.Sql;
import kr.co.jboard2.vo.TermsVo;

public class UserDao {
	
	private static UserDao instance = new UserDao();
	
	public static UserDao getInstance() {
		return instance;
	}
	
	private UserDao() {}
	
	public void insertUser() {}
	public TermsVo selectTerms() {
		
		TermsVo vo = null;
		
		try {
			Connection conn = DBConfig.getInstance().getConnection();
			Statement stmt = conn.createStatement();
			
			ResultSet rs = stmt.executeQuery(Sql.SELECT_TERMS);
			
			if(rs.next()) {
				vo = new TermsVo();
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
			}
			
			stmt.close();
			conn.close();
			rs.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return vo;
		
	}
	public void selectUser() {}
	public void selectUsers() {}
	public void updateUser() {}
	public void deleteUser() {}
	

}
