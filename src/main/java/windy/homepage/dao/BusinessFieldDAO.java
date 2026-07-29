package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.BusinessFieldModel;
import windy.homepage.model.DatabaseModel;

public class BusinessFieldDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<BusinessFieldModel> selectListBusinessField() {
        List<BusinessFieldModel> list = new ArrayList<>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT business_field_id, icon, title, content, sort_order, created_at " +
                "FROM business_field ORDER BY sort_order ASC, business_field_id ASC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BusinessFieldModel model = new BusinessFieldModel();
                model.setBusinessFieldId(rs.getInt("business_field_id"));
                model.setIcon(rs.getString("icon"));
                model.setTitle(rs.getString("title"));
                model.setContent(rs.getString("content"));
                model.setSortOrder(rs.getInt("sort_order"));
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

    public BusinessFieldModel selectBusinessField(int businessFieldId) {
        BusinessFieldModel model = new BusinessFieldModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT business_field_id, icon, title, content, sort_order, created_at " +
                "FROM business_field WHERE business_field_id = ?");
            pstmt.setInt(1, businessFieldId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setBusinessFieldId(rs.getInt("business_field_id"));
                model.setIcon(rs.getString("icon"));
                model.setTitle(rs.getString("title"));
                model.setContent(rs.getString("content"));
                model.setSortOrder(rs.getInt("sort_order"));
                model.setCreatedAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertBusinessField(BusinessFieldModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO business_field(icon, title, content, sort_order) VALUES(?, ?, ?, ?)");
            pstmt.setString(1, model.getIcon());
            pstmt.setString(2, model.getTitle());
            pstmt.setString(3, model.getContent());
            pstmt.setInt(4, model.getSortOrder());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateBusinessField(BusinessFieldModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE business_field SET icon=?, title=?, content=?, sort_order=? WHERE business_field_id=?");
            pstmt.setString(1, model.getIcon());
            pstmt.setString(2, model.getTitle());
            pstmt.setString(3, model.getContent());
            pstmt.setInt(4, model.getSortOrder());
            pstmt.setInt(5, model.getBusinessFieldId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteBusinessField(int businessFieldId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM business_field WHERE business_field_id=?");
            pstmt.setInt(1, businessFieldId);
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
