package windy.homepage.model;

import java.util.List;

public class PortfolioModel {
    private int portfolioId;
    private String title;
    private String category;
    private String summary;
    private String rightContent;
    private String bottomContent;
    private String createdAt;
    private String updatedAt;
    private List<PortfolioImageModel> images;

    public int getPortfolioId() { return portfolioId; }
    public void setPortfolioId(int portfolioId) { this.portfolioId = portfolioId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }

    public String getSummary() { return summary; }
    public void setSummary(String summary) { this.summary = summary; }

    public String getRightContent() { return rightContent; }
    public void setRightContent(String rightContent) { this.rightContent = rightContent; }

    public String getBottomContent() { return bottomContent; }
    public void setBottomContent(String bottomContent) { this.bottomContent = bottomContent; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }

    public List<PortfolioImageModel> getImages() { return images; }
    public void setImages(List<PortfolioImageModel> images) { this.images = images; }
}
