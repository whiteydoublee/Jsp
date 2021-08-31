package kr.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import kr.co.farmstory1.bean.MemberBean;
import kr.co.farmstory1.bean.TermsBean;
import kr.co.farmstory1.db.DBConfig;
import kr.co.farmstory1.db.Sql;

public class MemberDao {
	//싱글통 -> 
	private static MemberDao instance = new MemberDao();
	
	public static MemberDao getInstance() {
		return instance;
	}
	
	private MemberDao() {}
	
	public void insertMember(){}
	
	public TermsBean selectTerms() {
		return null;
	}
	
	public int selectCountUserInfo(int type, String checkData) {
		int result =0;
		
		try{
			Connection conn = DBConfig.getInstance().getConnection();
			PreparedStatement psmt = null;
			
			if(type==1) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_UID);
			}else if (type==2) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_NICK);
			}else if (type==3) {
				psmt = conn.prepareStatement(Sql.SELECT_COUNT_EMAIL);
			}else if (type==4) {
				psmt=conn.prepareStatement(Sql.SELECT_COUNT_HP);
			}
			
			psmt.setString(1, checkData);
			
			ResultSet rs = psmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
			conn.close();
			psmt.close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	public MemberBean selectMember(String uid, String pass){
			
		MemberBean mb = null;
			
		try {
			//1,2
			Connection conn = DBConfig.getInstance().getConnection();
			
			//3
			PreparedStatement psmt = conn.prepareStatement(Sql.SELECT_MEMBER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			//4
			ResultSet rs= psmt.executeQuery();
			
			//5
			if(rs.next()) {
				
				mb = new MemberBean();
				
				mb.setUid(rs.getString(1));
				mb.setPass(rs.getString(2));
				mb.setName(rs.getString(3));
				mb.setNick(rs.getString(4));
				mb.setEmail(rs.getString(5));
				mb.setHp(rs.getString(6));
				mb.setGrade(rs.getInt(7));
				mb.setZip(rs.getString(8));
				mb.setAddr1(rs.getString(9));
				mb.setAddr2(rs.getString(10));
				mb.setRegip(rs.getString(11));
				mb.setRdate(rs.getString(12));
			}
			
			//6
			psmt.close();
			rs.close();
			conn.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mb;
	}
	public void selecttMembers(){}
	public void updateMember(){}
	public void deleteMember(){}
}
