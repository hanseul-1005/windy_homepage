package windy.homepage.model;

public class BoardModel {

    private int    boardId      = -1;
    private String boardName    = "";
    private String menuGroup    = "";   // technology / about
    private String boardType    = "list"; // list / gallery
    private int    displayOrder = 0;
    private String useYn        = "Y";
    private String createdAt    = "";
    private int    postCount    = 0;    // 관리 화면용 글 개수

    public int getBoardId()                  { return boardId; }
    public void setBoardId(int boardId)      { this.boardId = boardId; }

    public String getBoardName()             { return boardName; }
    public void setBoardName(String boardName) { this.boardName = boardName; }

    public String getMenuGroup()             { return menuGroup; }
    public void setMenuGroup(String menuGroup) { this.menuGroup = menuGroup; }

    public String getBoardType()             { return boardType; }
    public void setBoardType(String boardType) { this.boardType = boardType; }

    public int getDisplayOrder()             { return displayOrder; }
    public void setDisplayOrder(int displayOrder) { this.displayOrder = displayOrder; }

    public String getUseYn()                 { return useYn; }
    public void setUseYn(String useYn)       { this.useYn = useYn; }

    public String getCreatedAt()             { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public int getPostCount()                { return postCount; }
    public void setPostCount(int postCount)  { this.postCount = postCount; }
}
