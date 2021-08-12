package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {
	// 싱글톤 : 본인 객체 생성을 본인 클래스내에서 생성 (자주쓰는 클래스-> 싱글톤을 주로 사용)
	private static DBConfig instance = new DBConfig(); // class 변수
	
	//생성자 : 외부에서 생성을 막기위해 private 으로 선언
	private DBConfig() {}
	
	public static DBConfig getInstance() { // 클래스 메서드 
		return instance;
	}
	
	//DB 정보 (FINAL 상수가 되면 이름은 대문자를 사용)
	private final String  HOST = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	private final String  USER = "yeeunkim0701";
	private final String  PASS = "1234";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		//1단계 - JDBC Driver 로드
		Class.forName("com.mysql.jdbc.Driver");
		
		//2단계 - DB접속
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
	}
	}
