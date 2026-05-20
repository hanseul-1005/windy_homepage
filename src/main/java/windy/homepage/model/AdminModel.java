package windy.homepage.model;

public class AdminModel {

    private int    adminId   = -1;
    private String adminName = "";
    private String adminPw   = "";

    public int getAdminId()          { return adminId; }
    public void setAdminId(int adminId) { this.adminId = adminId; }

    public String getAdminName()             { return adminName; }
    public void setAdminName(String adminName) { this.adminName = adminName; }

    public String getAdminPw()           { return adminPw; }
    public void setAdminPw(String adminPw) { this.adminPw = adminPw; }
}
