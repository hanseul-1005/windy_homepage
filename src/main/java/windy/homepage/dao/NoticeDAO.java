package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.NoticeModel;

public class NoticeDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<NoticeModel> selectListNotice() {
        List<NoticeModel> list = new ArrayList<NoticeModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT notice_id, title, content, created_at, updated_at " +
                "FROM notice ORDER BY notice_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                NoticeModel model = new NoticeModel();
                model.setNoticeId(rs.getInt("notice_id"));
                model.setTitle(rs.getString("title"));
                model.setContent(rs.getString("content"));
                model.setCreatedAt(rs.getString("created_at"));
                model.setUpdatedAt(rs.getString("updated_at"));
                list.add(model);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public NoticeModel selectNotice(int noticeId) {
        NoticeModel model = new NoticeModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT notice_id, title, content, created_at, updated_at " +
                "FROM notice WHERE notice_id = ?");
            pstmt.setInt(1, noticeId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setNoticeId(rs.getInt("notice_id"));
                model.setTitle(rs.getString("title"));
                model.setContent(rs.getString("content"));
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

    public int insertNotice(NoticeModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO notice(title, content) VALUES(?, ?)");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateNotice(NoticeModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE notice SET title=?, content=? WHERE notice_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            pstmt.setInt(3, model.getNoticeId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteNotice(int noticeId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM notice WHERE notice_id=?");
            pstmt.setInt(1, noticeId);
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
