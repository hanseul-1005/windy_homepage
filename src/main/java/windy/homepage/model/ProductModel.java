package windy.homepage.model;

import java.util.List;

public class ProductModel {
    private int productId;
    private String title;
    private String summary;
    private String createdAt;
    private String updatedAt;
    private List<ProductFeatureModel> features;
    private List<ProductImageModel> images;

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }

    public List<ProductFeatureModel> getFeatures() { return features; }
    public void setFeatures(List<ProductFeatureModel> features) { this.features = features; }

    public List<ProductImageModel> getImages() { return images; }
    public void setImages(List<ProductImageModel> images) { this.images = images; }
}
