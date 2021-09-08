package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import vo.UserVo;

public class UserDao {
	
	private static UserDao instance = new UserDao();
	public static UserDao getInstance() {
		return instance;
	}
	
	private UserDao() {}
	
	private final String  HOST = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	private final String  USER = "yeeunkim0701";
	private final String  PASS = "1234";

	public void insertUser(UserVo vo) {
		try {
			//1�ܰ�
				Class.forName("com.mysql.jdbc.Driver");
				
			//2�ܰ�
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
			//3�ܰ�
				String sql = "INSERT INTO `USER1` VALUES(?,?,?,?);";
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setString(1,vo.getUid());
				psmt.setString(2,vo.getName());
				psmt.setString(3,vo.getHp());
				psmt.setInt(4,vo.getAge());
				
			//4�ܰ�
				psmt.executeUpdate();
				
			//5�ܰ�
			//6�ܰ�
				conn.close();
				psmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	
	}
	public UserVo selectUser(String uid) {
			UserVo vo = null;
		
		try {
			//1�ܰ�
				Class.forName("com.mysql.jdbc.Driver");
				
			//2�ܰ�
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
			//3�ܰ�
				PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `USER1` WHERE `uid`=?;");
				psmt.setString(1, uid);
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {
					vo = new UserVo();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setHp(rs.getString(3));
					vo.setAge(rs.getInt(4));
				}
			
				rs.close();
				conn.close();
				psmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		return vo;
		
	}
	public List<UserVo> selectUsers() {
		
		List<UserVo> users = new ArrayList<>();
		
		try {
			//1�ܰ�
				Class.forName("com.mysql.jdbc.Driver");
				
			//2�ܰ�
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
			//3�ܰ�
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM `USER1`");
				
				while(rs.next()) {
					UserVo vo = new UserVo();
					vo.setUid(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setHp(rs.getString(3));
					vo.setAge(rs.getInt(4));
					
					users.add(vo);
				}
			
				rs.close();
				conn.close();
				stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		return users;
		
	}
	public void updateUser(UserVo vo) {
		
		try {
			//1�ܰ�
				Class.forName("com.mysql.jdbc.Driver");
				
			//2�ܰ�
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
			//3�ܰ�
				String sql = "UPDATE `USER1` SET `name`=?, `hp`=?, `age`=? WHERE `uid`=?;";
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setString(1,vo.getName());
				psmt.setString(2,vo.getHp());
				psmt.setInt(3,vo.getAge());
				psmt.setString(4,vo.getUid());
				
			//4�ܰ�
				psmt.executeUpdate();
				
			//5�ܰ�
			//6�ܰ�
				conn.close();
				psmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
	public void deleteUser(String uid) {
		
		try {
			//1�ܰ�
				Class.forName("com.mysql.jdbc.Driver");
				
			//2�ܰ�
				Connection conn = DriverManager.getConnection(HOST,USER,PASS);
				
			//3�ܰ�
				String sql = "DELETE FROM `USER1` WHERE `uid`=?;";
				PreparedStatement psmt = conn.prepareStatement(sql);
				psmt.setString(1,uid);
				psmt.executeUpdate();
				conn.close();
				psmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
	}
}
