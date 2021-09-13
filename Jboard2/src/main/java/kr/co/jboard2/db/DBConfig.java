package kr.co.jboard2.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {
	// �̱��� : ���� ��ü ������ ���� Ŭ���������� ���� (���־��� Ŭ����-> �̱����� �ַ� ���?)
	private static DBConfig instance = new DBConfig(); // class ����
	
	//������ : �ܺο��� ������ �������� private ���� ����
	private DBConfig() {}
	
	public static DBConfig getInstance() { // Ŭ���� �޼��� 
		return instance;
	}
	
	//DB ���� (FINAL �����? �Ǹ� �̸��� �빮�ڸ� ���?)
	
	//private final String  HOST = "jdbc:mysql://3.36.92.8:3306/yeeunkim0701";
	private final String  HOST = "jdbc:mysql://54.180.160.240:3306/yeeunkim0701";
	private final String  USER = "yeeunkim0701";
	private final String  PASS = "1234";
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		//1�ܰ� - JDBC Driver �ε�
		Class.forName("com.mysql.jdbc.Driver");
		
		//2�ܰ� - DB����
		Connection conn = DriverManager.getConnection(HOST,USER,PASS);
		
		return conn;
	}
	}
