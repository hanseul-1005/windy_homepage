package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.PortfolioImageModel;
import windy.homepage.model.PortfolioModel;

public class PortfolioDAO {

    private DatabaseModel dbModel  = new DatabaseModel();
    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    private Connection getConnection() throws Exception {
        Class.forName(dbDriver);
        return DriverManager.getConnection(jdbcUrl, user, password);
    }

    public List<PortfolioModel> selectListPortfolio() {
        List<PortfolioModel> list = new ArrayList<>();
        String sql = "SELECT p.portfolio_id, p.title, p.category, p.summary, p.created_at, " +
                     "(SELECT image_path FROM portfolio_image WHERE portfolio_id = p.portfolio_id ORDER BY sort_order LIMIT 1) AS first_image " +
                     "FROM portfolio p ORDER BY p.portfolio_id DESC";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                PortfolioModel m = new PortfolioModel();
                m.setPortfolioId(rs.getInt("portfolio_id"));
                m.setTitle(rs.getString("title"));
                m.setCategory(rs.getString("category"));
                m.setSummary(rs.getString("summary"));
                m.setCreatedAt(rs.getString("created_at"));
                String firstImage = rs.getString("first_image");
                if (firstImage != null) {
                    PortfolioImageModel img = new PortfolioImageModel();
                    img.setImagePath(firstImage);
                    List<PortfolioImageModel> imgs = new ArrayList<>();
                    imgs.add(img);
                    m.setImages(imgs);
                }
                list.add(m);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public PortfolioModel selectPortfolio(int portfolioId) {
        PortfolioModel portfolio = null;
        String sql = "SELECT portfolio_id, title, category, summary, right_content, bottom_content, created_at FROM portfolio WHERE portfolio_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, portfolioId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    portfolio = new PortfolioModel();
                    portfolio.setPortfolioId(rs.getInt("portfolio_id"));
                    portfolio.setTitle(rs.getString("title"));
                    portfolio.setCategory(rs.getString("category"));
                    portfolio.setSummary(rs.getString("summary"));
                    portfolio.setRightContent(rs.getString("right_content"));
                    portfolio.setBottomContent(rs.getString("bottom_content"));
                    portfolio.setCreatedAt(rs.getString("created_at"));
                    portfolio.setImages(selectImages(conn, portfolioId));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return portfolio;
    }

    private List<PortfolioImageModel> selectImages(Connection conn, int portfolioId) throws Exception {
        List<PortfolioImageModel> list = new ArrayList<>();
        String sql = "SELECT image_id, image_path, sort_order FROM portfolio_image WHERE portfolio_id = ? ORDER BY sort_order";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, portfolioId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PortfolioImageModel img = new PortfolioImageModel();
                    img.setImageId(rs.getInt("image_id"));
                    img.setPortfolioId(portfolioId);
                    img.setImagePath(rs.getString("image_path"));
                    img.setSortOrder(rs.getInt("sort_order"));
                    list.add(img);
                }
            }
        }
        return list;
    }

    public int insertPortfolio(PortfolioModel model) {
        String sql = "INSERT INTO portfolio (title, category, summary, right_content, bottom_content) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getCategory() != null ? model.getCategory() : "AI");
            ps.setString(3, model.getSummary());
            ps.setString(4, model.getRightContent());
            ps.setString(5, model.getBottomContent());
            int result = ps.executeUpdate();
            if (result > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public int insertImage(int portfolioId, String imagePath, int sortOrder) {
        String sql = "INSERT INTO portfolio_image (portfolio_id, image_path, sort_order) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, portfolioId);
            ps.setString(2, imagePath);
            ps.setInt(3, sortOrder);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int updatePortfolio(PortfolioModel model) {
        String sql = "UPDATE portfolio SET title=?, category=?, summary=?, right_content=?, bottom_content=? WHERE portfolio_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getCategory() != null ? model.getCategory() : "AI");
            ps.setString(3, model.getSummary());
            ps.setString(4, model.getRightContent());
            ps.setString(5, model.getBottomContent());
            ps.setInt(6, model.getPortfolioId());
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int deleteImage(int imageId) {
        String sql = "DELETE FROM portfolio_image WHERE image_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, imageId);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int deletePortfolio(int portfolioId) {
        String sql = "DELETE FROM portfolio WHERE portfolio_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, portfolioId);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}
