package kr.co.jboard1.db;

public class Sql {
	
	//사용자관련
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // class 변수
	
	public static final String INSERT_MEMBER = "INSERT INTO `member` SET"
							 + "`uid`=?,"
							 + "`pass`=PASSWORD(?)," // 비밀번호는 암호화되어야하므로, PASSWORD()함수를 써줌 (약함)
							 + "`name`=?,"
							 + "`nick`=?,"
							 + "`email`=?,"
							 + "`hp`=?,"
							 + "`zip`=?,"
							 + "`addr1`=?,"
							 + "`addr2`=?,"
							 + "`regip`=?,"
							 + "`rdate`=NOW();"; // NOW():함수 
	
	public static final String SELECT_COUNT_UID="SELECT COUNT(`uid`) FROM `member` WHERE `uid`=?;"; // count 쿼리(있는 숫자만큼 나타내주므로 count를 씀.)
	public static final String SELECT_COUNT_NICK="SELECT COUNT(`nick`) FROM `member` WHERE `nick`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `member` WHERE `email`=?;";
	public static final String SELECT_COUNT_HP="SELECT COUNT(`hp`) FROM `member` WHERE `hp`=?;";

}
