package windy.homepage.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import windy.homepage.model.BoardModel;
import windy.homepage.model.BoardPostModel;
import windy.homepage.model.DatabaseModel;

public class BoardDAO {

    private Connection        connection = null;
    private PreparedStatement pstmt      = null;
    private ResultSet         rs         = null;
    private DatabaseModel     dbModel    = new DatabaseModel();

    private String dbDriver = "org.mariadb.jdbc.Driver";
    private String jdbcUrl  = dbModel.getJdbcUrl();
    private String user     = dbModel.getUser();
    private String password = dbModel.getPassword();

    // ===================== 게시판 (board) =====================

    /** 노출중인 게시판 목록 (메뉴 렌더링용) */
    public List<BoardModel> selectActiveBoards() {
        List<BoardModel> list = new ArrayList<BoardModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT board_id, board_name, menu_group, board_type, display_order, use_yn, created_at " +
                "FROM board WHERE use_yn = 'Y' ORDER BY menu_group, display_order, board_id");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(mapBoard(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    /** 전체 게시판 목록 + 글 개수 (관리 화면용) */
    public List<BoardModel> selectListBoard() {
        List<BoardModel> list = new ArrayList<BoardModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT b.board_id, b.board_name, b.menu_group, b.board_type, b.display_order, b.use_yn, b.created_at, " +
                "       (SELECT COUNT(*) FROM board_post p WHERE p.board_id = b.board_id) AS post_count " +
                "FROM board b ORDER BY b.menu_group, b.display_order, b.board_id");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardModel model = mapBoard(rs);
                model.setPostCount(rs.getInt("post_count"));
                list.add(model);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public BoardModel selectBoard(int boardId) {
        BoardModel model = new BoardModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT board_id, board_name, menu_group, board_type, display_order, use_yn, created_at " +
                "FROM board WHERE board_id = ?");
            pstmt.setInt(1, boardId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model = mapBoard(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    public int insertBoard(BoardModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO board(board_name, menu_group, board_type, display_order, use_yn) VALUES(?, ?, ?, ?, ?)");
            pstmt.setString(1, model.getBoardName());
            pstmt.setString(2, model.getMenuGroup());
            pstmt.setString(3, model.getBoardType());
            pstmt.setInt(4, model.getDisplayOrder());
            pstmt.setString(5, model.getUseYn());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updateBoard(BoardModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE board SET board_name=?, menu_group=?, board_type=?, display_order=?, use_yn=? WHERE board_id=?");
            pstmt.setString(1, model.getBoardName());
            pstmt.setString(2, model.getMenuGroup());
            pstmt.setString(3, model.getBoardType());
            pstmt.setInt(4, model.getDisplayOrder());
            pstmt.setString(5, model.getUseYn());
            pstmt.setInt(6, model.getBoardId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deleteBoard(int boardId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement("DELETE FROM board WHERE board_id=?");
            pstmt.setInt(1, boardId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    // ===================== 게시글 (board_post) =====================

    public List<BoardPostModel> selectListPost(int boardId) {
        List<BoardPostModel> list = new ArrayList<BoardPostModel>();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT post_id, board_id, title, content, view_count, created_at, updated_at " +
                "FROM board_post WHERE board_id = ? ORDER BY post_id DESC");
            pstmt.setInt(1, boardId);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(mapPost(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return list;
    }

    public BoardPostModel selectPost(int postId) {
        BoardPostModel model = new BoardPostModel();
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "SELECT post_id, board_id, title, content, view_count, created_at, updated_at " +
                "FROM board_post WHERE post_id = ?");
            pstmt.setInt(1, postId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                model = mapPost(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return model;
    }

    /** 조회수 증가 */
    public void increaseViewCount(int postId) {
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE board_post SET view_count = view_count + 1 WHERE post_id = ?");
            pstmt.setInt(1, postId);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
    }

    public int insertPost(BoardPostModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "INSERT INTO board_post(board_id, title, content) VALUES(?, ?, ?)");
            pstmt.setInt(1, model.getBoardId());
            pstmt.setString(2, model.getTitle());
            pstmt.setString(3, model.getContent());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int updatePost(BoardPostModel model) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement(
                "UPDATE board_post SET title=?, content=? WHERE post_id=?");
            pstmt.setString(1, model.getTitle());
            pstmt.setString(2, model.getContent());
            pstmt.setInt(3, model.getPostId());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    public int deletePost(int postId) {
        int result = -1;
        try {
            Class.forName(dbDriver);
            connection = DriverManager.getConnection(jdbcUrl, user, password);
            pstmt = connection.prepareStatement("DELETE FROM board_post WHERE post_id=?");
            pstmt.setInt(1, postId);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs, pstmt, connection);
        }
        return result;
    }

    // ===================== 공통 =====================

    private BoardModel mapBoard(ResultSet rs) throws SQLException {
        BoardModel model = new BoardModel();
        model.setBoardId(rs.getInt("board_id"));
        model.setBoardName(rs.getString("board_name"));
        model.setMenuGroup(rs.getString("menu_group"));
        model.setBoardType(rs.getString("board_type"));
        model.setDisplayOrder(rs.getInt("display_order"));
        model.setUseYn(rs.getString("use_yn"));
        model.setCreatedAt(rs.getString("created_at"));
        return model;
    }

    private BoardPostModel mapPost(ResultSet rs) throws SQLException {
        BoardPostModel model = new BoardPostModel();
        model.setPostId(rs.getInt("post_id"));
        model.setBoardId(rs.getInt("board_id"));
        model.setTitle(rs.getString("title"));
        model.setContent(rs.getString("content") != null ? rs.getString("content") : "");
        model.setViewCount(rs.getInt("view_count"));
        model.setCreatedAt(rs.getString("created_at"));
        model.setUpdatedAt(rs.getString("updated_at") != null ? rs.getString("updated_at") : "");
        return model;
    }

    public void close(ResultSet rs, PreparedStatement pstmt, Connection conn) {
        if (rs != null)   { try { rs.close();   } catch (SQLException e) { e.printStackTrace(); } }
        if (pstmt != null){ try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
        if (conn != null) { try { conn.close();  } catch (SQLException e) { e.printStackTrace(); } }
    }
}
