package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import windy.homepage.model.AdminModel;
import windy.homepage.model.DatabaseModel;

public class AdminDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public AdminModel selectAdmin(String adminName, String adminPw) {

        AdminModel admin = null;

        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);

            pstmt = connection.prepareStatement(
                "SELECT admin_id, admin_name, admin_pw " +
                "FROM admin " +
                "WHERE admin_name = ? AND admin_pw = ?");

            pstmt.setString(1, adminName);
            pstmt.setString(2, adminPw);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                admin = new AdminModel();
                admin.setAdminId(rs.getInt("admin_id"));
                admin.setAdminName(rs.getString("admin_name"));
                admin.setAdminPw(rs.getString("admin_pw"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return admin;
    }

    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (rs != null)   { try { rs.close();   } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null){ try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
        if (conn != null) { try { conn.close();  } catch (SQLException e) { e.printStackTrace(); } }
    }
}
