package kr.co.farmstory3.db;

public class Sql {
	
	//����ڰ���?
	public static final String SELECT_TERMS = "SELECT * FROM `Jboard_terms`;"; // class ����
	public static final String SELECT_MEMBER = "SELECT * FROM `member` WHERE `uid`=? AND `pass`=PASSWORD(?);"; // ��ȣȭ���ѳ����Ƿ� �Ȱ��� ��ȣȭ���·� ����
	public static final String INSERT_MEMBER = "INSERT INTO `member` SET"
							 + "`uid`=?,"
							 + "`pass`=PASSWORD(?)," 
							 + "`name`=?,"
							 + "`nick`=?,"
							 + "`email`=?,"
							 + "`hp`=?,"
							 + "`zip`=?,"
							 + "`addr1`=?,"
							 + "`addr2`=?,"
							 + "`regip`=?,"
							 + "`rdate`=NOW();"; // NOW():�Լ� 
	//�Խ��� ����
	//8/18
	public static final String SELECT_ARTICLE = "SELECT * FROM `article` AS a "
												+ "LEFT JOIN `Jboard_file` AS b "
												+ "ON a.seq = b.parent "
												+ "WHERE `seq`=?;";
	//8/17
	public static final String SELECT_COUNT_TOTAL="SELECT COUNT(`seq`) FROM `article` WHERE `parent`=0 AND `cate`=?;";
	
	public static final String SELECT_LATEST = "SELECT `seq`,`title`,`rdate` FROM `article`"
												+ "WHERE `cate`=? AND `parent`=0 "
												+ "ORDER BY `seq` DESC LIMIT 5;";
	
	public static final String SELECT_ARTICLES	="SELECT a.*, b.nick FROM `article` AS a "
												+ "JOIN `member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=0 AND `cate`=? "
												+ "ORDER BY `seq` DESC "
												+ "LIMIT ?,10;";
	
	//8/18
	public static final String SELECT_COMMENTS = "SELECT a.*, b.nick FROM `article` AS a "
												+ "JOIN `member` AS b "
												+ "ON a.uid = b.uid "
												+ "WHERE `parent`=? "
												+ "ORDER BY `seq` ASC ";
	
	public static final String SELECT_MAX_SEQ = "SELECT MAX(`seq`) FROM `article`;";
	
	public static final String INSERT_ARTICLE = "INSERT INTO `article` SET "
												+"`cate`=?, "
												+"`title`=?, "
												+"`content`=?, "
												+"`file`=?, "
												+"`uid`=?, "
												+"`regip`=?, "
												+"`rdate`=NOW();";
	public static final String SELECT_FILE = "SELECT * FROM `Jboard_file` WHERE `fseq`=?;";
										
	public static final String INSERT_FILE = "INSERT INTO `Jboard_file` SET "
											+"`parent`=?,"
											+"`oriName`=?,"
											+"`newName`=?,"
											+"`rdate`=NOW();";
	//���?
		public static final String INSERT_COMMENT="INSERT INTO `article` SET "
													+ "`parent`=?,"
													+ "`content`=?,"	
													+ "`uid`=?,"
													+ "`regip`=?,"
													+ "`rdate`=NOW();";
		
		public static final String DELETE_COMMENT = "DELETE FROM `article` WHERE `seq`=?;";
		public static final String DELETE_ARTICLE = "DELETE FROM `article` WHERE `seq`=?;";
											
	
	public static final String SELECT_COUNT_UID="SELECT COUNT(`uid`) FROM `member` WHERE `uid`=?;"; // count ����(�ִ� ���ڸ�ŭ ��Ÿ���ֹǷ� count�� ��.)
	public static final String SELECT_COUNT_NICK="SELECT COUNT(`nick`) FROM `member` WHERE `nick`=?;";
	public static final String SELECT_COUNT_EMAIL = "SELECT COUNT(`email`) FROM `member` WHERE `email`=?;";
	public static final String SELECT_COUNT_HP="SELECT COUNT(`hp`) FROM `member` WHERE `hp`=?;";
	
	//8/18��ȸ��
	public static final String UPDATE_ARTICLE_HIT="UPDATE `article` SET `hit` =`hit`+1 "
													+"WHERE `seq`=?;";
	public static final String UPDATE_ARTICLE_COMMENT = "UPDATE `article` SET `comment` = `comment`+1 WHERE `seq`=?;";
	public static final String UPDATE_ARTICLE_COMMENT_MINUS = "UPDATE `article` SET `comment` = `comment`-1 WHERE `seq`=?;";
	
	public static final String UPDATE_COMMENT ="UPDATE `article` SET `content`=? WHERE `seq`=?;";
	// content = �ٲ� ����, seq= ���? ��ȣ 
	
	public static final String UPDATE_ARTICLE = "UPDATE `article` SET "
												+ "`title`=?, "
												+ "`content`=?, "
												+ "WHERE `seq` =?;";

	
}
