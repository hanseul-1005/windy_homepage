package windy.homepage.model;

public class VideoModel {

    private int    videoId     = -1;
    private String title       = "";
    private String youtubeUrl  = "";
    private String description = "";
    private String createdAt   = "";
    private String updatedAt   = "";

    public int getVideoId()                    { return videoId; }
    public void setVideoId(int videoId)        { this.videoId = videoId; }

    public String getTitle()                   { return title; }
    public void setTitle(String title)         { this.title = title; }

    public String getYoutubeUrl()                      { return youtubeUrl; }
    public void setYoutubeUrl(String youtubeUrl)       { this.youtubeUrl = youtubeUrl; }

    public String getDescription()                     { return description; }
    public void setDescription(String description)     { this.description = description; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public String getUpdatedAt()               { return updatedAt; }
    public void setUpdatedAt(String updatedAt) { this.updatedAt = updatedAt; }
}
