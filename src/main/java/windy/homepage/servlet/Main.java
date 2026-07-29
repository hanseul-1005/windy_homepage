package windy.homepage.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import windy.homepage.dao.BoardDAO;
import windy.homepage.dao.BusinessFieldDAO;
import windy.homepage.dao.PopupDAO;
import windy.homepage.dao.CertificationDAO;
import windy.homepage.dao.ContactDAO;
import windy.homepage.dao.HistoryDAO;
import windy.homepage.dao.NoticeDAO;
import windy.homepage.dao.PortfolioDAO;
import windy.homepage.dao.PressDAO;
import windy.homepage.dao.ProductDAO;
import windy.homepage.dao.VideoDAO;
import windy.homepage.model.BoardModel;
import windy.homepage.model.BoardPostModel;
import windy.homepage.model.BusinessFieldModel;
import windy.homepage.model.ProductModel;
import windy.homepage.model.ContactModel;
import windy.homepage.model.NoticeModel;
import windy.homepage.model.PortfolioModel;
import windy.homepage.model.VideoModel;

@WebServlet(name = "Main", urlPatterns = { "/main.windy" })
public class Main extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");

        String menu = request.getParameter("menu");
        if (menu == null) menu = "home";

        NoticeDAO        noticeDAO         = new NoticeDAO();
        ContactDAO       contactDAO        = new ContactDAO();
        HistoryDAO       historyDAO        = new HistoryDAO();
        CertificationDAO certDAO           = new CertificationDAO();
        PortfolioDAO     portfolioDAO      = new PortfolioDAO();
        ProductDAO       productDAO        = new ProductDAO();
        PressDAO         pressDAO          = new PressDAO();
        VideoDAO         videoDAO          = new VideoDAO();
        BoardDAO         boardDAO          = new BoardDAO();
        PopupDAO         popupDAO          = new PopupDAO();
        BusinessFieldDAO businessFieldDAO  = new BusinessFieldDAO();

        // 동적 게시판 메뉴 (모든 페이지의 top_menu에서 사용)
        request.setAttribute("menuBoards", boardDAO.selectActiveBoards());

        if ("home".equals(menu)) {
            List<PortfolioModel>    listPortfolio    = portfolioDAO.selectListPortfolio();
            List<NoticeModel>       listNotice       = noticeDAO.selectListNotice();
            List<VideoModel>        listVideo        = videoDAO.selectListVideo();
            List<BusinessFieldModel> listBusinessField = businessFieldDAO.selectListBusinessField(); // 메인 Business Field 카드 목록
            request.setAttribute("listPortfolio", listPortfolio);
            request.setAttribute("listNotice", listNotice);
            request.setAttribute("listVideo", listVideo);
            request.setAttribute("listBusinessField", listBusinessField);
            request.setAttribute("listPopup", popupDAO.selectActivePopups());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/main.jsp");
            dispatcher.forward(request, response);

        } else if ("history_list".equals(menu)) {
            request.setAttribute("listHistory", historyDAO.selectListHistory());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/history_list.jsp");
            dispatcher.forward(request, response);

        } else if ("service_info".equals(menu)) {
            // Business Field 카드 목록을 동적으로 표시
            request.setAttribute("listBusinessField", businessFieldDAO.selectListBusinessField());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/service_info.jsp");
            dispatcher.forward(request, response);

        } else if ("certification".equals(menu)) {
            request.setAttribute("listCert", certDAO.selectListCert());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/certification_info.jsp");
            dispatcher.forward(request, response);

        } else if ("product_list".equals(menu)) {
            request.setAttribute("listProduct", productDAO.selectListProduct());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/product_list.jsp");
            dispatcher.forward(request, response);

        } else if ("portfolio_list".equals(menu)) {
            request.setAttribute("listPortfolio", portfolioDAO.selectListPortfolio());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_list.jsp");
            dispatcher.forward(request, response);

        } else if ("portfolio_detail".equals(menu)) {
            int portfolioId = Integer.parseInt(request.getParameter("portfolioId"));
            request.setAttribute("portfolio", portfolioDAO.selectPortfolio(portfolioId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_detail.jsp");
            dispatcher.forward(request, response);

        } else if ("product_detail".equals(menu)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            request.setAttribute("product", productDAO.selectProduct(productId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/product_detail.jsp");
            dispatcher.forward(request, response);

        } else if ("press_list".equals(menu)) {
            request.setAttribute("listPress", pressDAO.selectListPress());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/press_list.jsp");
            dispatcher.forward(request, response);

        } else if ("press_detail".equals(menu)) {
            int pressId = Integer.parseInt(request.getParameter("pressId"));
            request.setAttribute("press", pressDAO.selectPress(pressId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/press_detail.jsp");
            dispatcher.forward(request, response);

        } else if ("video_list".equals(menu)) {
            request.setAttribute("listVideo", videoDAO.selectListVideo());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/video_list.jsp");
            dispatcher.forward(request, response);

        } else if ("board".equals(menu)) {
            int boardId = Integer.parseInt(request.getParameter("boardId"));
            BoardModel board = boardDAO.selectBoard(boardId);
            request.setAttribute("board", board);
            request.setAttribute("listPost", boardDAO.selectListPost(boardId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/board_list.jsp");
            dispatcher.forward(request, response);

        } else if ("board_detail".equals(menu)) {
            int postId = Integer.parseInt(request.getParameter("postId"));
            boardDAO.increaseViewCount(postId);
            BoardPostModel post = boardDAO.selectPost(postId);
            request.setAttribute("post", post);
            request.setAttribute("board", boardDAO.selectBoard(post.getBoardId()));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/board_detail.jsp");
            dispatcher.forward(request, response);
        }
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json; charset=utf-8");

        String mode = request.getParameter("mode");
        ContactDAO contactDAO = new ContactDAO();
        JSONObject objResult  = new JSONObject();

        if ("contact_add".equals(mode)) {
            String name    = request.getParameter("name");
            String email   = request.getParameter("email");
            String subject = request.getParameter("subject");
            String content = request.getParameter("content");

            ContactModel model = new ContactModel();
            model.setName(name);
            model.setEmail(email);
            model.setSubject(subject);
            model.setContent(content);

            int result = contactDAO.insertContact(model);
            objResult.put("result", result > 0 ? "true" : "false");
        }

        PrintWriter out = response.getWriter();
        out.print(objResult);
    }
}
