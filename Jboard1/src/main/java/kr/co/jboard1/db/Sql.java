package kr.co.jboard1.db;

public class Sql {
	
	//사용자관련
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // class 변수
	public static final String SELECT_MEMBER = "SELECT * FROM `member` WHERE `uid`=? AND `pass`=PASSWORD(?);"; // 암호화시켜놨으므로 똑같이 암호화상태로 맵핑
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
	//게시판 관련
	//8/18
	public static final String SELECT_ARTICLE = "SELECT * FROM `article` AS a "
												+ "LEFT JOIN `Jboard_file` AS b "
												+ "ON a.seq = b.parent "
												+ "WHERE `seq`=?;";
	//8/17
	public static final String SELECT_COUNT_TOTAL="SELECT COUNT(`seq`) FROM `article` WHERE `parent`=0;";
	
	public static final String SELECT_ARTICLES	="SELECT a.*, b.nick FROM `article` AS a "
												+ "JOIN `member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 "
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?,10;";
	
	//8/18
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `article` AS a "
												+ "JOIN `member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC ";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `article`;";
	
	public static final String SELECT_FILE = "SELECT * FROM `Jboard_file` WHERE `fseq`=?;";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `article` SET "
												+"`title`=?,"
												+"`content`=?,"
												+"`file`=?,"
												+"`uid`=?,"
												+"`regip`=?,"
												+"`rdate`=NOW();";
										
	public static final String INSERT_FILE = "INSERT INTO `Jboard_file` SET "
											+"`parent`=?,"
											+"`oriName`=?,"
											+"`newName`=?,"
											+"`rdate`=NOW();";
	//댓글
		public static final String INSERT_COMMENT="INSERT INTO `article` SET "
													+ "`parent`=?,"
													+ "`content`=?,"	
													+ "`uid`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW();";
		
		public static final String DELETE_COMMENT = "DELETE FROM `article` WHERE `seq`=?;";
											
	
	public static final String SELECT_COUNT_UID="SELECT COUNT(`uid`) FROM `member` WHERE `uid`=?;"; // count 쿼리(있는 숫자만큼 나타내주므로 count를 씀.)
	public static final String SELECT_COUNT_NICK="SELECT COUNT(`nick`) FROM `member` WHERE `nick`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `member` WHERE `email`=?;";
	public static final String SELECT_COUNT_HP="SELECT COUNT(`hp`) FROM `member` WHERE `hp`=?;";
	
	//8/18조회수
	public static final String UPDATE_ARTICLE_HIT="UPDATE `article` SET `hit` =`hit`+1 "
													+"WHERE `seq`=?;";
	public static final String UPDATE_ARTICLE_COMMENT = "UPDATE `article` SET `comment` = `comment`+1 WHERE `seq`=?;";
	public static final String UPDATE_ARTICLE_COMMENT_MINUS = "UPDATE `article` SET `comment` = `comment`-1 WHERE `seq`=?;";
	
	public static final String UPDATE_COMMENT ="UPDATE `article` SET `content`=? WHERE `seq`=?;";
	// content = 바뀐 내용, seq= 댓글 번호 

	public static final String UPDATE_FILE_DOWNLOAD = "UPDATE `Jboard_file` SET `download`=`download` + 1 WHERE `fseq`=?";
	
}
