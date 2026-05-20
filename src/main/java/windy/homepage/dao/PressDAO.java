package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.PressModel;

public class PressDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<PressModel> selectListPress() {
        List<PressModel> list = new ArrayList<PressModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT press_id, title, thumbnail_path, source_url, created_at " +
                "FROM press ORDER BY press_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PressModel model = new PressModel();
                model.setPressId(rs.getInt("press_id"));
                model.setTitle(rs.getString("title"));
                model.setThumbnailPath(rs.getString("thumbnail_path") != null ? rs.getString("thumbnail_path") : "");
                model.setSourceUrl(rs.getString("source_url") != null ? rs.getString("source_url") : "");
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

    public PressModel selectPress(int pressId) {
        PressModel model = new PressModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT press_id, title, content, thumbnail_path, source_url, created_at, updated_at " +
                "FROM press WHERE press_id = ?");
            pstmt.setInt(1, pressId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setPressId(rs.getInt("press_id"));
                model.setTitle(rs.getString("title"));
                model.setContent(rs.getString("content") != null ? rs.getString("content") : "");
                model.setThumbnailPath(rs.getString("thumbnail_path") != null ? rs.getString("thumbnail_path") : "");
                model.setSourceUrl(rs.getString("source_url") != null ? rs.getString("source_url") : "");
                model.setCreatedAt(rs.getString("created_at"));
                model.setUpdatedAt(rs.getString("updated_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertPress(PressModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO press(title, content, thumbnail_path, source_url) VALUES(?, ?, ?, ?)");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            pstmt.setString(3, model.getThumbnailPath().isEmpty() ? null : model.getThumbnailPath());
            pstmt.setString(4, model.getSourceUrl().isEmpty() ? null : model.getSourceUrl());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updatePress(PressModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE press SET title=?, content=?, source_url=? WHERE press_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            pstmt.setString(3, model.getSourceUrl().isEmpty() ? null : model.getSourceUrl());
            pstmt.setInt(4, model.getPressId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updatePressThumbnail(int pressId, String thumbnailPath) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE press SET thumbnail_path=? WHERE press_id=?");
            pstmt.setString(1, thumbnailPath);
            pstmt.setInt(2, pressId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deletePress(int pressId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM press WHERE press_id=?");
            pstmt.setInt(1, pressId);
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
