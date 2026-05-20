package windy.homepage.model;

public class ProductFeatureModel {
    private int featureId;
    private int productId;
    private String content;
    private int sortOrder;

    public int getFeatureId() { return featureId; }
    public void setFeatureId(int featureId) { this.featureId = featureId; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public int getSortOrder() { return sortOrder; }
    public void setSortOrder(int sortOrder) { this.sortOrder = sortOrder; }
}
