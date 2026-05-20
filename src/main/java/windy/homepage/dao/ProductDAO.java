package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.DatabaseModel;
import windy.homepage.model.ProductFeatureModel;
import windy.homepage.model.ProductImageModel;
import windy.homepage.model.ProductModel;

public class ProductDAO {

    private DatabaseModel dbModel  = new DatabaseModel();
    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    private Connection getConnection() throws Exception {
        Class.forName(dbDriver);
        return DriverManager.getConnection(jdbcUrl, user, password);
    }

    public List<ProductModel> selectListProduct() {
        List<ProductModel> list = new ArrayList<>();
        String sql = "SELECT p.product_id, p.title, p.summary, p.created_at, " +
                     "(SELECT image_path FROM product_image WHERE product_id = p.product_id ORDER BY sort_order LIMIT 1) AS first_image " +
                     "FROM product p ORDER BY p.product_id DESC";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                ProductModel m = new ProductModel();
                m.setProductId(rs.getInt("product_id"));
                m.setTitle(rs.getString("title"));
                m.setSummary(rs.getString("summary"));
                m.setCreatedAt(rs.getString("created_at"));
                String firstImage = rs.getString("first_image");
                if (firstImage != null) {
                    ProductImageModel img = new ProductImageModel();
                    img.setImagePath(firstImage);
                    List<ProductImageModel> imgs = new ArrayList<>();
                    imgs.add(img);
                    m.setImages(imgs);
                }
                list.add(m);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    public ProductModel selectProduct(int productId) {
        ProductModel product = null;
        String sql = "SELECT product_id, title, summary, created_at FROM product WHERE product_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new ProductModel();
                    product.setProductId(rs.getInt("product_id"));
                    product.setTitle(rs.getString("title"));
                    product.setSummary(rs.getString("summary"));
                    product.setCreatedAt(rs.getString("created_at"));
                    product.setFeatures(selectFeatures(conn, productId));
                    product.setImages(selectImages(conn, productId));
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return product;
    }

    private List<ProductFeatureModel> selectFeatures(Connection conn, int productId) throws Exception {
        List<ProductFeatureModel> list = new ArrayList<>();
        String sql = "SELECT feature_id, content, sort_order FROM product_feature WHERE product_id = ? ORDER BY sort_order";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductFeatureModel f = new ProductFeatureModel();
                    f.setFeatureId(rs.getInt("feature_id"));
                    f.setProductId(productId);
                    f.setContent(rs.getString("content"));
                    f.setSortOrder(rs.getInt("sort_order"));
                    list.add(f);
                }
            }
        }
        return list;
    }

    private List<ProductImageModel> selectImages(Connection conn, int productId) throws Exception {
        List<ProductImageModel> list = new ArrayList<>();
        String sql = "SELECT image_id, image_path, sort_order FROM product_image WHERE product_id = ? ORDER BY sort_order";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductImageModel img = new ProductImageModel();
                    img.setImageId(rs.getInt("image_id"));
                    img.setProductId(productId);
                    img.setImagePath(rs.getString("image_path"));
                    img.setSortOrder(rs.getInt("sort_order"));
                    list.add(img);
                }
            }
        }
        return list;
    }

    public int insertProduct(ProductModel model) {
        String sql = "INSERT INTO product (title, summary) VALUES (?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getSummary());
            int result = ps.executeUpdate();
            if (result > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) return rs.getInt(1);
                }
            }
        } catch (Exception e) { e.printStackTrace(); }
        return -1;
    }

    public int insertFeature(int productId, String content, int sortOrder) {
        String sql = "INSERT INTO product_feature (product_id, content, sort_order) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.setString(2, content);
            ps.setInt(3, sortOrder);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int insertImage(int productId, String imagePath, int sortOrder) {
        String sql = "INSERT INTO product_image (product_id, image_path, sort_order) VALUES (?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ps.setString(2, imagePath);
            ps.setInt(3, sortOrder);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int updateProduct(ProductModel model) {
        String sql = "UPDATE product SET title=?, summary=? WHERE product_id=?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, model.getTitle());
            ps.setString(2, model.getSummary());
            ps.setInt(3, model.getProductId());
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int deleteFeaturesByProductId(int productId) {
        String sql = "DELETE FROM product_feature WHERE product_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int deleteImage(int imageId) {
        String sql = "DELETE FROM product_image WHERE image_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, imageId);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    public int deleteProduct(int productId) {
        String sql = "DELETE FROM product WHERE product_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, productId);
            return ps.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}
