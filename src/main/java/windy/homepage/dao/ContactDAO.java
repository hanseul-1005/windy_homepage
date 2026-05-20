package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.ContactModel;
import windy.homepage.model.DatabaseModel;

public class ContactDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    public List<ContactModel> selectListContact() {
        List<ContactModel> list = new ArrayList<ContactModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT contact_id, name, email, subject, created_at " +
                "FROM contact ORDER BY contact_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                ContactModel model = new ContactModel();
                model.setContactId(rs.getInt("contact_id"));
                model.setName(rs.getString("name"));
                model.setEmail(rs.getString("email"));
                model.setSubject(rs.getString("subject"));
                model.setCreatedAt(rs.getString("created_at"));
                list.add(model);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public ContactModel selectContact(int contactId) {
        ContactModel model = new ContactModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT contact_id, name, email, subject, content, created_at " +
                "FROM contact WHERE contact_id = ?");
            pstmt.setInt(1, contactId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model.setContactId(rs.getInt("contact_id"));
                model.setName(rs.getString("name"));
                model.setEmail(rs.getString("email"));
                model.setSubject(rs.getString("subject"));
                model.setContent(rs.getString("content"));
                model.setCreatedAt(rs.getString("created_at"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertContact(ContactModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO contact(name, email, subject, content) VALUES(?, ?, ?, ?)");
            pstmt.setString(1, model.getName());
            pstmt.setString(2, model.getEmail());
            pstmt.setString(3, model.getSubject());
            pstmt.setString(4, model.getContent());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteContact(int contactId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "DELETE FROM contact WHERE contact_id = ?");
            pstmt.setInt(1, contactId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (rs != null)   { try { rs.close();   } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null){ try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
        if (conn != null) { try { conn.close();  } catch (SQLException e) { e.printStackTrace(); } }
    }
}
