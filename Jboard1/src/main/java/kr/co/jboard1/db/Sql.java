package kr.co.jboard1.db;

public class Sql {
	
	//����ڰ���
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // class ����
	public static final String SELECT_MEMBER = "SELECT * FROM `member` WHERE `uid`=? AND `pass`=PASSWORD(?);"; // ��ȣȭ���ѳ����Ƿ� �Ȱ��� ��ȣȭ���·� ����
	public static final String INSERT_MEMBER = "INSERT INTO `member` SET"
							 + "`uid`=?,"
							 + "`pass`=PASSWORD(?)," // ��й�ȣ�� ��ȣȭ�Ǿ���ϹǷ�, PASSWORD()�Լ��� ���� (����)
							 + "`name`=?,"
							 + "`nick`=?,"
							 + "`email`=?,"
							 + "`hp`=?,"
							 + "`zip`=?,"
							 + "`addr1`=?,"
							 + "`addr2`=?,"
							 + "`regip`=?,"
							 + "`rdate`=NOW();"; // NOW():�Լ� 
	
	public static final String SELECT_COUNT_UID="SELECT COUNT(`uid`) FROM `member` WHERE `uid`=?;"; // count ����(�ִ� ���ڸ�ŭ ��Ÿ���ֹǷ� count�� ��.)
	public static final String SELECT_COUNT_NICK="SELECT COUNT(`nick`) FROM `member` WHERE `nick`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `member` WHERE `email`=?;";
	public static final String SELECT_COUNT_HP="SELECT COUNT(`hp`) FROM `member` WHERE `hp`=?;";
	
}
