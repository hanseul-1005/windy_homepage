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

/**
 * 비즈니스 필드(Business Field) DAO
 * - 홈페이지 메인의 Business Field 섹션 카드 목록을 DB에서 관리
 * - icon 컬럼은 Bootstrap 아이콘 클래스(bi-xxx) 또는 업로드 이미지 경로를 저장
 */
public class BusinessFieldDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    /** 비즈니스 필드 전체 목록 조회 - sort_order 오름차순, 동일하면 ID 오름차순 */
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

    /** 비즈니스 필드 단건 조회 - 수정 화면 진입 시 사용 */
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

    /** 비즈니스 필드 등록 */
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

    /** 비즈니스 필드 수정 (아이콘 포함 전체 업데이트) */
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

    /**
     * 비즈니스 필드 수정 (아이콘 제외)
     * - 이미지 업로드 탭에서 새 파일을 선택하지 않은 경우 기존 아이콘을 유지하기 위해 사용
     */
    public int updateBusinessFieldNoIcon(BusinessFieldModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE business_field SET title=?, content=?, sort_order=? WHERE business_field_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            pstmt.setInt(3, model.getSortOrder());
            pstmt.setInt(4, model.getBusinessFieldId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    /** 비즈니스 필드 삭제 */
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

    /** DB 리소스 일괄 반환 */
    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (rs != null)   { try { rs.close();   } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null){ try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
        if (conn != null) { try { conn.close();  } catch (SQLException e) { e.printStackTrace(); } }
    }
}
