package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.CertificationModel;
import windy.homepage.model.DatabaseModel;

public class CertificationDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<CertificationModel> selectListCert() {
        List<CertificationModel> list = new ArrayList<CertificationModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT cert_id, title, file_path, file_type, created_at " +
                "FROM certification ORDER BY cert_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                CertificationModel model = new CertificationModel();
                model.setCertId(rs.getInt("cert_id"));
                model.setTitle(rs.getString("title"));
                model.setFilePath(rs.getString("file_path"));
                model.setFileType(rs.getString("file_type"));
                model.setCreatedAt(rs.getString("created_at"));
                list.add(model);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public CertificationModel selectCert(int certId) {
        CertificationModel model = new CertificationModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT cert_id, title, file_path, file_type, created_at " +
                "FROM certification WHERE cert_id = ?");
            pstmt.setInt(1, certId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setCertId(rs.getInt("cert_id"));
                model.setTitle(rs.getString("title"));
                model.setFilePath(rs.getString("file_path"));
                model.setFileType(rs.getString("file_type"));
                model.setCreatedAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertCert(CertificationModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO certification(title, file_path, file_type) VALUES(?, ?, ?)");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getFilePath());
            pstmt.setString(3, model.getFileType());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateCertTitle(int certId, String title) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE certification SET title=? WHERE cert_id=?");
            pstmt.setString(1, title);
            pstmt.setInt(2, certId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateCert(CertificationModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE certification SET title=?, file_path=?, file_type=? WHERE cert_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getFilePath());
            pstmt.setString(3, model.getFileType());
            pstmt.setInt(4, model.getCertId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteCert(int certId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM certification WHERE cert_id=?");
            pstmt.setInt(1, certId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (rs != null)   { try { rs.close();   } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null){ try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
        if (conn != null) { try { conn.close();  } catch (SQLException e) { e.printStackTrace(); } }
    }
}
