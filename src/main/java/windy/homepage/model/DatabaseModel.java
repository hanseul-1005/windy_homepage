package windy.homepage.model;

public class DatabaseModel {

    private String jdbcUrl = "jdbc:mariadb://localhost:3306/windy_homepage?characterEncoding=UTF-8&serverTimezone=Asia/Seoul";
    private String user     = "windy_homepage";
    private String password = "homepage@0136";

    public String getJdbcUrl() { return jdbcUrl; }
    public String getUser()    { return user; }
    public String getPassword(){ return password; }
}
