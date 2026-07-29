package windy.homepage.model;

public class BusinessFieldModel {

    private int    businessFieldId = -1;
    private String icon            = "";
    private String title           = "";
    private String content         = "";
    private int    sortOrder       = 0;
    private String createdAt       = "";

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
