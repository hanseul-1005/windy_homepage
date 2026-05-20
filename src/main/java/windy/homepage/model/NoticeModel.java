package windy.homepage.model;

public class NoticeModel {

    private int    noticeId  = -1;
    private String title     = "";
    private String content   = "";
    private String createdAt = "";
    private String updatedAt = "";

    public int getNoticeId()               { return noticeId; }
    public void setNoticeId(int noticeId)  { this.noticeId = noticeId; }

    public String getTitle()               { return title; }
    public void setTitle(String title)     { this.title = title; }

    public String getContent()             { return content; }
    public void setContent(String content) { this.content = content; }

    public String getCreatedAt()                 { return createdAt; }
    public void setCreatedAt(String createdAt)   { this.createdAt = createdAt; }

    public String getUpdatedAt()                 { return updatedAt; }
    public void setUpdatedAt(String updatedAt)   { this.updatedAt = updatedAt; }
}
