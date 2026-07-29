package windy.homepage.model;

/**
 * 포트폴리오 카테고리 데이터 모델
 * - portfolio 테이블의 category 컬럼(VARCHAR)에 name 값을 저장
 */
public class PortfolioCategoryModel {

    private int    categoryId = -1; // PK
    private String name       = ""; // 카테고리명 (예: AI, Data)
    private int    sortOrder  = 0;  // 표시 순서
    private String createdAt  = ""; // 등록일시

    public int getCategoryId()                      { return categoryId; }
    public void setCategoryId(int categoryId)       { this.categoryId = categoryId; }

    public String getName()                { return name; }
    public void setName(String name)       { this.name = name; }

    public int getSortOrder()                   { return sortOrder; }
    public void setSortOrder(int sortOrder)     { this.sortOrder = sortOrder; }

    public String getCreatedAt()                { return createdAt; }
    public void setCreatedAt(String createdAt)  { this.createdAt = createdAt; }
}
