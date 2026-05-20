package windy.homepage.model;

public class CertificationModel {

    private int    certId    = -1;
    private String title     = "";
    private String filePath  = "";
    private String fileType  = "";
    private String createdAt = "";

    public int getCertId()                 { return certId; }
    public void setCertId(int certId)      { this.certId = certId; }

    public String getTitle()               { return title; }
    public void setTitle(String title)     { this.title = title; }

    public String getFilePath()                { return filePath; }
    public void setFilePath(String filePath)   { this.filePath = filePath; }

    public String getFileType()                { return fileType; }
    public void setFileType(String fileType)   { this.fileType = fileType; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
