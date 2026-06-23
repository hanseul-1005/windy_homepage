package windy.homepage.model;

public class DatabaseModel {

	// 실서버
	//private String jdbcUrl ="jdbc:mariadb://mariadb114.windygnt.myds.me:63307/homedb?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	//private String user = "wind";
	//private String password = "wind@0136";

	// 로컬
	private String jdbcUrl = "jdbc:mariadb://localhost:3306/homepage_windy?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
	private String user = "homepage_windy";
	private String password = "homepage@0136";

    public String getJdbcUrl() { return jdbcUrl; }
    public String getUser()    { return user; }
    public String getPassword(){ return password; }
}
