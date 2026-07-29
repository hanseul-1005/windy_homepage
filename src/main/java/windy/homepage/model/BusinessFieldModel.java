package windy.homepage.model;

/**
 * 비즈니스 필드(Business Field) 데이터 모델
 * - 홈페이지 메인의 "Business Field" 섹션 카드 하나를 표현
 * - icon: Bootstrap 아이콘 클래스명(bi-xxx) 또는 업로드 이미지 경로(uploads/business_field/...)
 */
public class BusinessFieldModel {

    private int    businessFieldId = -1; // PK
    private String icon            = ""; // Bootstrap 아이콘 클래스 또는 이미지 경로
    private String title           = ""; // 카드 제목 (예: AI, Data)
    private String content         = ""; // 카드 설명 내용
    private int    sortOrder       = 0;  // 표시 순서 (오름차순 정렬)
    private String createdAt       = ""; // 등록일시

    public int getBusinessFieldId()                        { return businessFieldId; }
    public void setBusinessFieldId(int businessFieldId)    { this.businessFieldId = businessFieldId; }

    public String getIcon()                { return icon; }
    public void setIcon(String icon)       { this.icon = icon; }

    public String getTitle()               { return title; }
    public void setTitle(String title)     { this.title = title; }

    public String getContent()             { return content; }
    public void setContent(String content) { this.content = content; }

    public int getSortOrder()                  { return sortOrder; }
    public void setSortOrder(int sortOrder)    { this.sortOrder = sortOrder; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
