package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.VideoModel;

public class VideoDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<VideoModel> selectListVideo() {
        List<VideoModel> list = new ArrayList<VideoModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT video_id, title, youtube_url, description, created_at, updated_at " +
                "FROM video ORDER BY video_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                VideoModel model = new VideoModel();
                model.setVideoId(rs.getInt("video_id"));
                model.setTitle(rs.getString("title"));
                model.setYoutubeUrl(rs.getString("youtube_url") != null ? rs.getString("youtube_url") : "");
                model.setDescription(rs.getString("description") != null ? rs.getString("description") : "");
                model.setCreatedAt(rs.getString("created_at"));
                model.setUpdatedAt(rs.getString("updated_at") != null ? rs.getString("updated_at") : "");
                list.add(model);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public VideoModel selectVideo(int videoId) {
        VideoModel model = new VideoModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT video_id, title, youtube_url, description, created_at, updated_at " +
                "FROM video WHERE video_id = ?");
            pstmt.setInt(1, videoId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setVideoId(rs.getInt("video_id"));
                model.setTitle(rs.getString("title"));
                model.setYoutubeUrl(rs.getString("youtube_url") != null ? rs.getString("youtube_url") : "");
                model.setDescription(rs.getString("description") != null ? rs.getString("description") : "");
                model.setCreatedAt(rs.getString("created_at"));
                model.setUpdatedAt(rs.getString("updated_at") != null ? rs.getString("updated_at") : "");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertVideo(VideoModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO video(title, youtube_url, description) VALUES(?, ?, ?)");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getYoutubeUrl());
            pstmt.setString(3, model.getDescription().isEmpty() ? null : model.getDescription());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateVideo(VideoModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE video SET title=?, youtube_url=?, description=? WHERE video_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getYoutubeUrl());
            pstmt.setString(3, model.getDescription().isEmpty() ? null : model.getDescription());
            pstmt.setInt(4, model.getVideoId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteVideo(int videoId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement("DELETE FROM video WHERE video_id=?");
            pstmt.setInt(1, videoId);
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
