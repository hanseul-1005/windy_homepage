package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.PopupModel;

public class PopupDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    /** 현재 날짜 기준 노출 중인 팝업 목록 (메인 페이지용) */
    public List<PopupModel> selectActivePopups() {
        List<PopupModel> list = new ArrayList<PopupModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT popup_id, title, image_path, description, link_url, start_date, end_date, display_order, hide_options, use_yn, created_at " +
                "FROM popup " +
                "WHERE use_yn = 'Y' AND CURDATE() BETWEEN start_date AND end_date " +
                "ORDER BY display_order, popup_id");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    /** 전체 팝업 목록 (관리 화면용) */
    public List<PopupModel> selectListPopup() {
        List<PopupModel> list = new ArrayList<PopupModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT popup_id, title, image_path, description, link_url, start_date, end_date, display_order, hide_options, use_yn, created_at " +
                "FROM popup ORDER BY display_order, popup_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(map(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return list;
    }

    public PopupModel selectPopup(int popupId) {
        PopupModel model = new PopupModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT popup_id, title, image_path, description, link_url, start_date, end_date, display_order, hide_options, use_yn, created_at " +
                "FROM popup WHERE popup_id = ?");
            pstmt.setInt(1, popupId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model = map(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return model;
    }

    public int insertPopup(PopupModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO popup(title, image_path, description, link_url, start_date, end_date, display_order, hide_options, use_yn) " +
                "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getImagePath());
            pstmt.setString(3, model.getDescription().isEmpty() ? null : model.getDescription());
            pstmt.setString(4, model.getLinkUrl().isEmpty() ? null : model.getLinkUrl());
            pstmt.setString(5, model.getStartDate());
            pstmt.setString(6, model.getEndDate());
            pstmt.setInt(7, model.getDisplayOrder());
            pstmt.setString(8, model.getHideOptions());
            pstmt.setString(9, model.getUseYn());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    public int updatePopup(PopupModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE popup SET title=?, image_path=?, description=?, link_url=?, start_date=?, end_date=?, display_order=?, hide_options=?, use_yn=? " +
                "WHERE popup_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getImagePath());
            pstmt.setString(3, model.getDescription().isEmpty() ? null : model.getDescription());
            pstmt.setString(4, model.getLinkUrl().isEmpty() ? null : model.getLinkUrl());
            pstmt.setString(5, model.getStartDate());
            pstmt.setString(6, model.getEndDate());
            pstmt.setInt(7, model.getDisplayOrder());
            pstmt.setString(8, model.getHideOptions());
            pstmt.setString(9, model.getUseYn());
            pstmt.setInt(10, model.getPopupId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    public int deletePopup(int popupId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement("DELETE FROM popup WHERE popup_id=?");
            pstmt.setInt(1, popupId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }

    private PopupModel map(ResultSet rs) throws SQLException {
        PopupModel model = new PopupModel();
        model.setPopupId(rs.getInt("popup_id"));
        model.setTitle(rs.getString("title"));
        model.setImagePath(rs.getString("image_path") != null ? rs.getString("image_path") : "");
        model.setDescription(rs.getString("description") != null ? rs.getString("description") : "");
        model.setLinkUrl(rs.getString("link_url") != null ? rs.getString("link_url") : "");
        model.setStartDate(rs.getString("start_date") != null ? rs.getString("start_date").substring(0, 10) : "");
        model.setEndDate(rs.getString("end_date") != null ? rs.getString("end_date").substring(0, 10) : "");
        model.setDisplayOrder(rs.getInt("display_order"));
        model.setHideOptions(rs.getString("hide_options") != null ? rs.getString("hide_options") : "1,7,30");
        model.setUseYn(rs.getString("use_yn"));
        model.setCreatedAt(rs.getString("created_at") != null ? rs.getString("created_at") : "");
        return model;
    }

    private void close() {
        if (rs    != null) { try { rs.close();         } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null) { try { pstmt.close();      } catch (SQLException e) { e.printStackTrace(); } }
        if (connection != null) { try { connection.close(); } catch (SQLException e) { e.printStackTrace(); } }
    }
}
