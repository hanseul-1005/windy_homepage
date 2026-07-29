package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.PortfolioCategoryModel;

/**
 * 포트폴리오 카테고리 DAO
 * - portfolio_category 테이블 CRUD
 * - 카테고리 name은 portfolio.category(VARCHAR)에 그대로 저장됨
 */
public class PortfolioCategoryDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    /** 카테고리 전체 목록 조회 - sort_order 오름차순 */
    public List<PortfolioCategoryModel> selectListCategory() {
        List<PortfolioCategoryModel> list = new ArrayList<>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT category_id, name, sort_order, created_at " +
                "FROM portfolio_category ORDER BY sort_order ASC, category_id ASC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                PortfolioCategoryModel m = new PortfolioCategoryModel();
                m.setCategoryId(rs.getInt("category_id"));
                m.setName(rs.getString("name"));
                m.setSortOrder(rs.getInt("sort_order"));
                m.setCreatedAt(rs.getString("created_at"));
                list.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    /** 카테고리 단건 조회 */
    public PortfolioCategoryModel selectCategory(int categoryId) {
        PortfolioCategoryModel m = new PortfolioCategoryModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT category_id, name, sort_order, created_at " +
                "FROM portfolio_category WHERE category_id = ?");
            pstmt.setInt(1, categoryId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                m.setCategoryId(rs.getInt("category_id"));
                m.setName(rs.getString("name"));
                m.setSortOrder(rs.getInt("sort_order"));
                m.setCreatedAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return m;
    }

    /** 카테고리 등록 */
    public int insertCategory(PortfolioCategoryModel m) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO portfolio_category(name, sort_order) VALUES(?, ?)");
            pstmt.setString(1, m.getName());
            pstmt.setInt(2, m.getSortOrder());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    /** 카테고리 수정 */
    public int updateCategory(PortfolioCategoryModel m) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE portfolio_category SET name=?, sort_order=? WHERE category_id=?");
            pstmt.setString(1, m.getName());
            pstmt.setInt(2, m.getSortOrder());
            pstmt.setInt(3, m.getCategoryId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    /** 카테고리 삭제 */
    public int deleteCategory(int categoryId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM portfolio_category WHERE category_id=?");
            pstmt.setInt(1, categoryId);
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
