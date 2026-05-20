package windy.homepage.model;

public class HistoryModel {

    private int    historyId    = -1;
    private int    historyYear  = 0;
    private int    historyMonth = 0;
    private int    historyDay   = 0;
    private String content      = "";
    private String createdAt    = "";

    public int getHistoryId()                  { return historyId; }
    public void setHistoryId(int historyId)    { this.historyId = historyId; }

    public int getHistoryYear()                { return historyYear; }
    public void setHistoryYear(int historyYear){ this.historyYear = historyYear; }

    public int getHistoryMonth()                   { return historyMonth; }
    public void setHistoryMonth(int historyMonth)  { this.historyMonth = historyMonth; }

    public int getHistoryDay()                 { return historyDay; }
    public void setHistoryDay(int historyDay)  { this.historyDay = historyDay; }

    public String getContent()                 { return content; }
    public void setContent(String content)     { this.content = content; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
