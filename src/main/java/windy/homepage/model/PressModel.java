package windy.homepage.model;

public class PressModel {

    private int    pressId       = -1;
    private String title         = "";
    private String content       = "";
    private String thumbnailPath = "";
    private String sourceUrl     = "";
    private String createdAt     = "";
    private String updatedAt     = "";

    public int getPressId()                    { return pressId; }
    public void setPressId(int pressId)        { this.pressId = pressId; }

    public String getTitle()                   { return title; }
    public void setTitle(String title)         { this.title = title; }

    public String getContent()                 { return content; }
    public void setContent(String content)     { this.content = content; }

    public String getThumbnailPath()                       { return thumbnailPath; }
    public void setThumbnailPath(String thumbnailPath)     { this.thumbnailPath = thumbnailPath; }

    public String getSourceUrl()               { return sourceUrl; }
    public void setSourceUrl(String sourceUrl) { this.sourceUrl = sourceUrl; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getUpdatedAt()               { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
