package windy.homepage.model;

public class PopupModel {

    private int    popupId      = -1;
    private String title        = "";
    private String imagePath    = "";
    private String description  = "";
    private String linkUrl      = "";
    private String startDate    = "";
    private String endDate      = "";
    private int    displayOrder = 0;
    private String hideOptions  = "1,7,30";
    private String useYn        = "Y";
    private String createdAt    = "";

    public int    getPopupId()                      { return popupId; }
    public void   setPopupId(int popupId)           { this.popupId = popupId; }

    public String getTitle()                        { return title; }
    public void   setTitle(String title)            { this.title = title; }

    public String getImagePath()                    { return imagePath; }
    public void   setImagePath(String imagePath)    { this.imagePath = imagePath; }

    public String getDescription()                       { return description; }
    public void   setDescription(String description)     { this.description = description; }

    public String getLinkUrl()                      { return linkUrl; }
    public void   setLinkUrl(String linkUrl)        { this.linkUrl = linkUrl; }

    public String getStartDate()                    { return startDate; }
    public void   setStartDate(String startDate)    { this.startDate = startDate; }

    public String getEndDate()                      { return endDate; }
    public void   setEndDate(String endDate)        { this.endDate = endDate; }

    public int    getDisplayOrder()                         { return displayOrder; }
    public void   setDisplayOrder(int displayOrder)         { this.displayOrder = displayOrder; }

    public String getHideOptions()                          { return hideOptions; }
    public void   setHideOptions(String hideOptions)        { this.hideOptions = hideOptions; }

    public String getUseYn()                        { return useYn; }
    public void   setUseYn(String useYn)            { this.useYn = useYn; }

    public String getCreatedAt()                    { return createdAt; }
    public void   setCreatedAt(String createdAt)    { this.createdAt = createdAt; }
}
