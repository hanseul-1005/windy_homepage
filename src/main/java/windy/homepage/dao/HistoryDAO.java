package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.HistoryModel;

public class HistoryDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<HistoryModel> selectListHistory() {
        List<HistoryModel> list = new ArrayList<HistoryModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT history_id, history_year, history_month, content, created_at " +
                "FROM history ORDER BY history_year DESC, history_month DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                HistoryModel model = new HistoryModel();
                model.setHistoryId(rs.getInt("history_id"));
                model.setHistoryYear(rs.getInt("history_year"));
                model.setHistoryMonth(rs.getInt("history_month"));
                model.setContent(rs.getString("content"));
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

    public HistoryModel selectHistory(int historyId) {
        HistoryModel model = new HistoryModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT history_id, history_year, history_month, content, created_at " +
                "FROM history WHERE history_id = ?");
            pstmt.setInt(1, historyId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setHistoryId(rs.getInt("history_id"));
                model.setHistoryYear(rs.getInt("history_year"));
                model.setHistoryMonth(rs.getInt("history_month"));
                model.setContent(rs.getString("content"));
                model.setCreatedAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertHistory(HistoryModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO history(history_year, history_month, content) VALUES(?, ?, ?)");
            pstmt.setInt(1, model.getHistoryYear());
            pstmt.setInt(2, model.getHistoryMonth());
            pstmt.setString(3, model.getContent());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateHistory(HistoryModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE history SET history_year=?, history_month=?, content=? WHERE history_id=?");
            pstmt.setInt(1, model.getHistoryYear());
            pstmt.setInt(2, model.getHistoryMonth());
            pstmt.setString(3, model.getContent());
            pstmt.setInt(4, model.getHistoryId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteHistory(int historyId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM history WHERE history_id=?");
            pstmt.setInt(1, historyId);
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
