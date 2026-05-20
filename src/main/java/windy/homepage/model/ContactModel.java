package windy.homepage.model;

public class ContactModel {

    private int    contactId = -1;
    private String name      = "";
    private String email     = "";
    private String subject   = "";
    private String content   = "";
    private String createdAt = "";

    public int getContactId()                  { return contactId; }
    public void setContactId(int contactId)    { this.contactId = contactId; }

    public String getName()                    { return name; }
    public void setName(String name)           { this.name = name; }

    public String getEmail()                   { return email; }
    public void setEmail(String email)         { this.email = email; }

    public String getSubject()                 { return subject; }
    public void setSubject(String subject)     { this.subject = subject; }

    public String getContent()                 { return content; }
    public void setContent(String content)     { this.content = content; }

    public String getCreatedAt()               { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
