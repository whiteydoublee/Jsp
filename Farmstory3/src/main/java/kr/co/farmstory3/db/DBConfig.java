package kr.co.farmstory3.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import kr.co.farmstory3.db.DBConfig;

public class DBConfig {
	
	private static DBConfig instance = new DBConfig();
	
	private DBConfig() {}
	
	public static DBConfig getInstance() {  
		return instance;
	}
	
	private final String  HOST = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	private final String  USER = "yeeunkim0701";
	private final String  PASS = "1234";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
	}
}
