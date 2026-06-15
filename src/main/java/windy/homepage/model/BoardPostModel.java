package windy.homepage.model;

public class BoardPostModel {

    private int    postId    = -1;
    private int    boardId   = -1;
    private String title     = "";
    private String content   = "";
    private int    viewCount = 0;
    private String createdAt = "";
    private String updatedAt = "";

    public int getPostId()                 { return postId; }
    public void setPostId(int postId)      { this.postId = postId; }

    public int getBoardId()                { return boardId; }
    public void setBoardId(int boardId)    { this.boardId = boardId; }

    public String getTitle()               { return title; }
    public void setTitle(String title)     { this.title = title; }

    public String getContent()             { return content; }
    public void setContent(String content) { this.content = content; }

    public int getViewCount()              { return viewCount; }
    public void setViewCount(int viewCount){ this.viewCount = viewCount; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getUpdatedAt()               { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
