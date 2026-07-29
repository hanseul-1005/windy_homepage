package windy.homepage.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

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
import windy.homepage.model.PopupModel;
import windy.homepage.model.CertificationModel;
import windy.homepage.model.ContactModel;
import windy.homepage.model.HistoryModel;
import windy.homepage.model.NoticeModel;
import windy.homepage.model.PortfolioModel;
import windy.homepage.model.PressModel;
import windy.homepage.model.ProductModel;
import windy.homepage.model.VideoModel;

@WebServlet(name = "admin", urlPatterns = { "/admin.windy" })
@MultipartConfig(maxFileSize = 20 * 1024 * 1024, maxRequestSize = 50 * 1024 * 1024)
public class Admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            response.sendRedirect(request.getContextPath() + "/login.windy");
            return;
        }

        String menu = request.getParameter("menu");
        if (menu == null) menu = "main";

        NoticeDAO          noticeDAO        = new NoticeDAO();
        ContactDAO         contactDAO       = new ContactDAO();
        HistoryDAO         historyDAO       = new HistoryDAO();
        CertificationDAO   certDAO          = new CertificationDAO();
        PortfolioDAO       portfolioDAO     = new PortfolioDAO();
        ProductDAO         productDAO       = new ProductDAO();
        PressDAO           pressDAO         = new PressDAO();
        VideoDAO           videoDAO         = new VideoDAO();
        BusinessFieldDAO   businessFieldDAO = new BusinessFieldDAO();

        if ("main".equals(menu)) {
            request.setAttribute("listNotice",    noticeDAO.selectListNotice());
            request.setAttribute("listContact",   contactDAO.selectListContact());
            request.setAttribute("listPortfolio", portfolioDAO.selectListPortfolio());
            request.setAttribute("listProduct",   productDAO.selectListProduct());
            request.setAttribute("listPress",     pressDAO.selectListPress());
            request.setAttribute("listVideo",     videoDAO.selectListVideo());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/dash_board.jsp");
            dispatcher.forward(request, response);

        } else if ("notice_list".equals(menu)) {
            List<NoticeModel> list = noticeDAO.selectListNotice();
            request.setAttribute("listNotice", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_list.jsp");
            dispatcher.forward(request, response);

        } else if ("notice_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_add.jsp");
            dispatcher.forward(request, response);

        } else if ("notice_modify".equals(menu)) {
            int noticeId = Integer.parseInt(request.getParameter("noticeId"));
            NoticeModel notice = noticeDAO.selectNotice(noticeId);
            request.setAttribute("notice", notice);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("portfolio_list".equals(menu)) {
            request.setAttribute("listPortfolio", portfolioDAO.selectListPortfolio());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_list.jsp");
            dispatcher.forward(request, response);

        } else if ("portfolio_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_add.jsp");
            dispatcher.forward(request, response);

        } else if ("portfolio_modify".equals(menu)) {
            int portfolioId = Integer.parseInt(request.getParameter("portfolioId"));
            request.setAttribute("portfolio", portfolioDAO.selectPortfolio(portfolioId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("contact_list".equals(menu)) {
            List<ContactModel> listContact = contactDAO.selectListContact();
            request.setAttribute("listContact", listContact);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/contact_us/contact_list.jsp");
            dispatcher.forward(request, response);

        } else if ("contact_detail".equals(menu)) {
            int contactId = Integer.parseInt(request.getParameter("contactId"));
            ContactModel contact = contactDAO.selectContact(contactId);
            request.setAttribute("contact", contact);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/contact_us/contact_detail.jsp");
            dispatcher.forward(request, response);

        // ── Business Field 관리 (목록/등록/수정) ──────────────────────────────────
        } else if ("business_field_list".equals(menu)) {
            request.setAttribute("listBusinessField", businessFieldDAO.selectListBusinessField());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/business_field/business_field_list.jsp");
            dispatcher.forward(request, response);

        } else if ("business_field_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/business_field/business_field_add.jsp");
            dispatcher.forward(request, response);

        } else if ("business_field_modify".equals(menu)) {
            int businessFieldId = Integer.parseInt(request.getParameter("businessFieldId"));
            request.setAttribute("businessField", businessFieldDAO.selectBusinessField(businessFieldId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/business_field/business_field_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("history_list".equals(menu)) {
            List<HistoryModel> listHistory = historyDAO.selectListHistory();
            request.setAttribute("listHistory", listHistory);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/history/history_list.jsp");
            dispatcher.forward(request, response);

        } else if ("history_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/history/history_add.jsp");
            dispatcher.forward(request, response);

        } else if ("history_modify".equals(menu)) {
            int historyId = Integer.parseInt(request.getParameter("historyId"));
            HistoryModel history = historyDAO.selectHistory(historyId);
            request.setAttribute("history", history);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/history/history_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("cert_list".equals(menu)) {
            List<CertificationModel> listCert = certDAO.selectListCert();
            request.setAttribute("listCert", listCert);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/certification/cert_list.jsp");
            dispatcher.forward(request, response);

        } else if ("cert_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/certification/cert_add.jsp");
            dispatcher.forward(request, response);

        } else if ("cert_modify".equals(menu)) {
            int certId = Integer.parseInt(request.getParameter("certId"));
            CertificationModel cert = certDAO.selectCert(certId);
            request.setAttribute("cert", cert);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/certification/cert_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("product_list".equals(menu)) {
            request.setAttribute("listProduct", productDAO.selectListProduct());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/product/product_list.jsp");
            dispatcher.forward(request, response);

        } else if ("product_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/product/product_add.jsp");
            dispatcher.forward(request, response);

        } else if ("product_modify".equals(menu)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            request.setAttribute("product", productDAO.selectProduct(productId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/product/product_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("press_list".equals(menu)) {
            request.setAttribute("listPress", pressDAO.selectListPress());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/press/press_list.jsp");
            dispatcher.forward(request, response);

        } else if ("press_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/press/press_add.jsp");
            dispatcher.forward(request, response);

        } else if ("press_modify".equals(menu)) {
            int pressId = Integer.parseInt(request.getParameter("pressId"));
            request.setAttribute("press", pressDAO.selectPress(pressId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/press/press_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("video_list".equals(menu)) {
            request.setAttribute("listVideo", videoDAO.selectListVideo());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/video/video_list.jsp");
            dispatcher.forward(request, response);

        } else if ("video_add".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/video/video_add.jsp");
            dispatcher.forward(request, response);

        } else if ("video_modify".equals(menu)) {
            int videoId = Integer.parseInt(request.getParameter("videoId"));
            request.setAttribute("video", videoDAO.selectVideo(videoId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/video/video_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("board_list".equals(menu)) {
            BoardDAO boardDAO = new BoardDAO();
            request.setAttribute("listBoard", boardDAO.selectListBoard());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/board/board_list.jsp");
            dispatcher.forward(request, response);

        } else if ("board_post_list".equals(menu)) {
            BoardDAO boardDAO = new BoardDAO();
            int boardId = Integer.parseInt(request.getParameter("boardId"));
            request.setAttribute("board", boardDAO.selectBoard(boardId));
            request.setAttribute("listPost", boardDAO.selectListPost(boardId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/board/post_list.jsp");
            dispatcher.forward(request, response);

        } else if ("board_post_add".equals(menu)) {
            BoardDAO boardDAO = new BoardDAO();
            int boardId = Integer.parseInt(request.getParameter("boardId"));
            request.setAttribute("board", boardDAO.selectBoard(boardId));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/board/post_add.jsp");
            dispatcher.forward(request, response);

        } else if ("board_post_modify".equals(menu)) {
            BoardDAO boardDAO = new BoardDAO();
            int postId = Integer.parseInt(request.getParameter("postId"));
            BoardPostModel post = boardDAO.selectPost(postId);
            request.setAttribute("post", post);
            request.setAttribute("board", boardDAO.selectBoard(post.getBoardId()));
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/board/post_modify.jsp");
            dispatcher.forward(request, response);

        } else if ("popup_list".equals(menu)) {
            PopupDAO popupDAO = new PopupDAO();
            request.setAttribute("listPopup", popupDAO.selectListPopup());
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/popup/popup_list.jsp");
            dispatcher.forward(request, response);
        }
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json; charset=utf-8");

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminId") == null) {
            JSONObject obj = new JSONObject();
            obj.put("result", "false");
            obj.put("msg", "로그인이 필요합니다.");
            PrintWriter out = response.getWriter();
            out.print(obj);
            return;
        }

        String mode = request.getParameter("mode");
        NoticeDAO          noticeDAO        = new NoticeDAO();
        ContactDAO         contactDAO       = new ContactDAO();
        HistoryDAO         historyDAO       = new HistoryDAO();
        CertificationDAO   certDAO          = new CertificationDAO();
        PortfolioDAO       portfolioDAO     = new PortfolioDAO();
        ProductDAO         productDAO       = new ProductDAO();
        PressDAO           pressDAO         = new PressDAO();
        VideoDAO           videoDAO         = new VideoDAO();
        BusinessFieldDAO   businessFieldDAO = new BusinessFieldDAO();
        JSONObject         objResult        = new JSONObject();

        if ("notice_add".equals(mode)) {
            String title   = request.getParameter("title");
            String content = request.getParameter("content");

            NoticeModel model = new NoticeModel();
            model.setTitle(title);
            model.setContent(content);

            int result = noticeDAO.insertNotice(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("notice_update".equals(mode)) {
            int    noticeId = Integer.parseInt(request.getParameter("noticeId"));
            String title    = request.getParameter("title");
            String content  = request.getParameter("content");

            NoticeModel model = new NoticeModel();
            model.setNoticeId(noticeId);
            model.setTitle(title);
            model.setContent(content);

            int result = noticeDAO.updateNotice(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("notice_delete".equals(mode)) {
            int noticeId = Integer.parseInt(request.getParameter("noticeId"));
            int result   = noticeDAO.deleteNotice(noticeId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("contact_delete".equals(mode)) {
            int contactId = Integer.parseInt(request.getParameter("contactId"));
            int result    = contactDAO.deleteContact(contactId);
            objResult.put("result", result > 0 ? "true" : "false");

        // ── Business Field 등록: iconFile 파트가 있으면 이미지 업로드, 없으면 icon 파라미터(Bootstrap 클래스) 사용 ──
        } else if ("business_field_add".equals(mode)) {
            String title     = request.getParameter("title");
            String content   = request.getParameter("content");
            int    sortOrder = Integer.parseInt(request.getParameter("sortOrder"));

            String icon;
            Part iconFilePart = request.getPart("iconFile");
            if (iconFilePart != null && iconFilePart.getSize() > 0) {
                // 이미지 업로드: 외부 디렉토리에 저장 후 경로를 icon에 저장
                String fileName = saveUploadFile(iconFilePart, "business_field");
                icon = (fileName != null) ? "uploads/business_field/" + fileName : "bi-star";
            } else {
                icon = request.getParameter("icon");
                if (icon == null || icon.trim().isEmpty()) icon = "bi-star";
            }

            BusinessFieldModel model = new BusinessFieldModel();
            model.setIcon(icon);
            model.setTitle(title);
            model.setContent(content);
            model.setSortOrder(sortOrder);

            int result = businessFieldDAO.insertBusinessField(model);
            objResult.put("result", result > 0 ? "true" : "false");

        // ── Business Field 수정: icon이 null/빈값이면 아이콘 제외 업데이트(기존 이미지 유지) ──
        } else if ("business_field_update".equals(mode)) {
            int    businessFieldId = Integer.parseInt(request.getParameter("businessFieldId"));
            String title           = request.getParameter("title");
            String content         = request.getParameter("content");
            int    sortOrder       = Integer.parseInt(request.getParameter("sortOrder"));

            String icon;
            Part iconFilePart = request.getPart("iconFile");
            if (iconFilePart != null && iconFilePart.getSize() > 0) {
                // 새 이미지 선택: 외부 디렉토리에 저장
                String fileName = saveUploadFile(iconFilePart, "business_field");
                icon = (fileName != null) ? "uploads/business_field/" + fileName : null;
            } else {
                // Bootstrap 탭이면 icon 파라미터, 이미지 탭에서 파일 미선택이면 null
                icon = request.getParameter("icon");
            }

            BusinessFieldModel model = new BusinessFieldModel();
            model.setBusinessFieldId(businessFieldId);
            model.setTitle(title);
            model.setContent(content);
            model.setSortOrder(sortOrder);

            int result;
            if (icon != null && !icon.trim().isEmpty()) {
                model.setIcon(icon);
                result = businessFieldDAO.updateBusinessField(model);
            } else {
                // 이미지 탭에서 파일 미선택 → 아이콘 제외 나머지만 업데이트
                result = businessFieldDAO.updateBusinessFieldNoIcon(model);
            }
            objResult.put("result", result > 0 ? "true" : "false");

        // ── Business Field 삭제 ──
        } else if ("business_field_delete".equals(mode)) {
            int businessFieldId = Integer.parseInt(request.getParameter("businessFieldId"));
            int result          = businessFieldDAO.deleteBusinessField(businessFieldId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("history_add".equals(mode)) {
            int    historyYear  = Integer.parseInt(request.getParameter("historyYear"));
            int    historyMonth = Integer.parseInt(request.getParameter("historyMonth"));
            String dayParam     = request.getParameter("historyDay");
            int    historyDay   = (dayParam != null && !dayParam.trim().isEmpty() && !dayParam.equals("0")) ? Integer.parseInt(dayParam) : 0;
            String content      = request.getParameter("content");

            HistoryModel model = new HistoryModel();
            model.setHistoryYear(historyYear);
            model.setHistoryMonth(historyMonth);
            model.setHistoryDay(historyDay);
            model.setContent(content);

            int result = historyDAO.insertHistory(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("history_update".equals(mode)) {
            int    historyId    = Integer.parseInt(request.getParameter("historyId"));
            int    historyYear  = Integer.parseInt(request.getParameter("historyYear"));
            int    historyMonth = Integer.parseInt(request.getParameter("historyMonth"));
            String dayParam     = request.getParameter("historyDay");
            int    historyDay   = (dayParam != null && !dayParam.trim().isEmpty() && !dayParam.equals("0")) ? Integer.parseInt(dayParam) : 0;
            String content      = request.getParameter("content");

            HistoryModel model = new HistoryModel();
            model.setHistoryId(historyId);
            model.setHistoryYear(historyYear);
            model.setHistoryMonth(historyMonth);
            model.setHistoryDay(historyDay);
            model.setContent(content);

            int result = historyDAO.updateHistory(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("history_delete".equals(mode)) {
            int historyId = Integer.parseInt(request.getParameter("historyId"));
            int result    = historyDAO.deleteHistory(historyId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("cert_add".equals(mode)) {
            String title    = request.getParameter("title");
            Part   filePart = request.getPart("file");
            String fileName = saveFile(filePart, request);

            if (fileName != null) {
                String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
                CertificationModel model = new CertificationModel();
                model.setTitle(title);
                model.setFilePath("uploads/certification/" + fileName);
                model.setFileType(ext);
                int result = certDAO.insertCert(model);
                objResult.put("result", result > 0 ? "true" : "false");
            } else {
                objResult.put("result", "false");
                objResult.put("msg", "파일 업로드에 실패했습니다.");
            }

        } else if ("cert_update".equals(mode)) {
            int    certId   = Integer.parseInt(request.getParameter("certId"));
            String title    = request.getParameter("title");
            Part   filePart = request.getPart("file");

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = saveFile(filePart, request);
                if (fileName != null) {
                    String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
                    CertificationModel model = new CertificationModel();
                    model.setCertId(certId);
                    model.setTitle(title);
                    model.setFilePath("uploads/certification/" + fileName);
                    model.setFileType(ext);
                    int result = certDAO.updateCert(model);
                    objResult.put("result", result > 0 ? "true" : "false");
                } else {
                    objResult.put("result", "false");
                }
            } else {
                int result = certDAO.updateCertTitle(certId, title);
                objResult.put("result", result > 0 ? "true" : "false");
            }

        } else if ("cert_delete".equals(mode)) {
            int certId = Integer.parseInt(request.getParameter("certId"));
            int result = certDAO.deleteCert(certId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("portfolio_add".equals(mode)) {
            String title         = request.getParameter("title");
            String category      = request.getParameter("category");
            String summary       = request.getParameter("summary");
            String rightContent  = request.getParameter("rightContent");
            String bottomContent = request.getParameter("bottomContent");

            PortfolioModel model = new PortfolioModel();
            model.setTitle(title);
            model.setCategory(category);
            model.setSummary(summary);
            model.setRightContent(rightContent);
            model.setBottomContent(bottomContent);

            int portfolioId = portfolioDAO.insertPortfolio(model);
            if (portfolioId > 0) {
                List<Part> fileParts = new ArrayList<>(request.getParts());
                int order = 0;
                for (Part part : fileParts) {
                    if (!"images".equals(part.getName())) continue;
                    if (part.getSize() == 0) continue;
                    String fileName = savePortfolioImage(part, request);
                    if (fileName != null) {
                        portfolioDAO.insertImage(portfolioId, "uploads/portfolio/" + fileName, order++);
                    }
                }
                objResult.put("result", "true");
            } else {
                objResult.put("result", "false");
            }

        } else if ("portfolio_update".equals(mode)) {
            int    portfolioId   = Integer.parseInt(request.getParameter("portfolioId"));
            String title         = request.getParameter("title");
            String category      = request.getParameter("category");
            String summary       = request.getParameter("summary");
            String rightContent  = request.getParameter("rightContent");
            String bottomContent = request.getParameter("bottomContent");

            PortfolioModel model = new PortfolioModel();
            model.setPortfolioId(portfolioId);
            model.setTitle(title);
            model.setCategory(category);
            model.setSummary(summary);
            model.setRightContent(rightContent);
            model.setBottomContent(bottomContent);

            int result = portfolioDAO.updatePortfolio(model);

            List<Part> fileParts = new ArrayList<>(request.getParts());
            int order = 100;
            for (Part part : fileParts) {
                if (!"images".equals(part.getName())) continue;
                if (part.getSize() == 0) continue;
                String fileName = savePortfolioImage(part, request);
                if (fileName != null) {
                    portfolioDAO.insertImage(portfolioId, "uploads/portfolio/" + fileName, order++);
                }
            }
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("portfolio_image_delete".equals(mode)) {
            int imageId = Integer.parseInt(request.getParameter("imageId"));
            int result  = portfolioDAO.deleteImage(imageId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("portfolio_delete".equals(mode)) {
            int portfolioId = Integer.parseInt(request.getParameter("portfolioId"));
            int result      = portfolioDAO.deletePortfolio(portfolioId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("product_add".equals(mode)) {
            String title   = request.getParameter("title");
            String summary = request.getParameter("summary");
            String[] features = request.getParameterValues("features");

            ProductModel model = new ProductModel();
            model.setTitle(title);
            model.setSummary(summary);

            int productId = productDAO.insertProduct(model);
            if (productId > 0) {
                if (features != null) {
                    for (int i = 0; i < features.length; i++) {
                        if (features[i] != null && !features[i].trim().isEmpty()) {
                            productDAO.insertFeature(productId, features[i].trim(), i);
                        }
                    }
                }
                List<Part> fileParts = new ArrayList<>(request.getParts());
                int order = 0;
                for (Part part : fileParts) {
                    if (!"images".equals(part.getName())) continue;
                    if (part.getSize() == 0) continue;
                    String fileName = saveProductImage(part, request);
                    if (fileName != null) {
                        productDAO.insertImage(productId, "uploads/product/" + fileName, order++);
                    }
                }
                objResult.put("result", "true");
            } else {
                objResult.put("result", "false");
            }

        } else if ("product_update".equals(mode)) {
            int    productId = Integer.parseInt(request.getParameter("productId"));
            String title     = request.getParameter("title");
            String summary   = request.getParameter("summary");
            String[] features = request.getParameterValues("features");

            ProductModel model = new ProductModel();
            model.setProductId(productId);
            model.setTitle(title);
            model.setSummary(summary);

            productDAO.updateProduct(model);
            productDAO.deleteFeaturesByProductId(productId);
            if (features != null) {
                for (int i = 0; i < features.length; i++) {
                    if (features[i] != null && !features[i].trim().isEmpty()) {
                        productDAO.insertFeature(productId, features[i].trim(), i);
                    }
                }
            }
            List<Part> fileParts = new ArrayList<>(request.getParts());
            int order = 100;
            for (Part part : fileParts) {
                if (!"images".equals(part.getName())) continue;
                if (part.getSize() == 0) continue;
                String fileName = saveProductImage(part, request);
                if (fileName != null) {
                    productDAO.insertImage(productId, "uploads/product/" + fileName, order++);
                }
            }
            objResult.put("result", "true");

        } else if ("product_image_delete".equals(mode)) {
            int imageId = Integer.parseInt(request.getParameter("imageId"));
            int result  = productDAO.deleteImage(imageId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("product_delete".equals(mode)) {
            int productId = Integer.parseInt(request.getParameter("productId"));
            int result    = productDAO.deleteProduct(productId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("press_add".equals(mode)) {
            String title     = request.getParameter("title");
            String sourceUrl = request.getParameter("sourceUrl");
            String content   = request.getParameter("content");
            Part   thumbPart = request.getPart("thumbnail");

            PressModel model = new PressModel();
            model.setTitle(title);
            model.setContent(content != null ? content : "");
            model.setSourceUrl(sourceUrl != null ? sourceUrl : "");

            if (thumbPart != null && thumbPart.getSize() > 0) {
                String fileName = savePressImage(thumbPart, request);
                if (fileName != null) model.setThumbnailPath("uploads/press/" + fileName);
            }

            int result = pressDAO.insertPress(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("press_update".equals(mode)) {
            int    pressId   = Integer.parseInt(request.getParameter("pressId"));
            String title     = request.getParameter("title");
            String sourceUrl = request.getParameter("sourceUrl");
            String content   = request.getParameter("content");
            Part   thumbPart = request.getPart("thumbnail");

            PressModel model = new PressModel();
            model.setPressId(pressId);
            model.setTitle(title);
            model.setContent(content != null ? content : "");
            model.setSourceUrl(sourceUrl != null ? sourceUrl : "");

            pressDAO.updatePress(model);

            if (thumbPart != null && thumbPart.getSize() > 0) {
                String fileName = savePressImage(thumbPart, request);
                if (fileName != null) pressDAO.updatePressThumbnail(pressId, "uploads/press/" + fileName);
            }
            objResult.put("result", "true");

        } else if ("press_delete".equals(mode)) {
            int pressId = Integer.parseInt(request.getParameter("pressId"));
            int result  = pressDAO.deletePress(pressId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("video_add".equals(mode)) {
            String title       = request.getParameter("title");
            String youtubeUrl  = request.getParameter("youtubeUrl");
            String description = request.getParameter("description");

            VideoModel model = new VideoModel();
            model.setTitle(title);
            model.setYoutubeUrl(youtubeUrl != null ? youtubeUrl : "");
            model.setDescription(description != null ? description : "");

            int result = videoDAO.insertVideo(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("video_update".equals(mode)) {
            int    videoId     = Integer.parseInt(request.getParameter("videoId"));
            String title       = request.getParameter("title");
            String youtubeUrl  = request.getParameter("youtubeUrl");
            String description = request.getParameter("description");

            VideoModel model = new VideoModel();
            model.setVideoId(videoId);
            model.setTitle(title);
            model.setYoutubeUrl(youtubeUrl != null ? youtubeUrl : "");
            model.setDescription(description != null ? description : "");

            int result = videoDAO.updateVideo(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("video_delete".equals(mode)) {
            int videoId = Integer.parseInt(request.getParameter("videoId"));
            int result  = videoDAO.deleteVideo(videoId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("board_add".equals(mode)) {
            BoardDAO boardDAO = new BoardDAO();
            BoardModel model = new BoardModel();
            model.setBoardName(request.getParameter("boardName"));
            model.setMenuGroup(request.getParameter("menuGroup"));
            model.setBoardType(request.getParameter("boardType"));
            String orderParam = request.getParameter("displayOrder");
            model.setDisplayOrder(orderParam != null && !orderParam.trim().isEmpty() ? Integer.parseInt(orderParam) : 0);
            model.setUseYn("Y".equals(request.getParameter("useYn")) ? "Y" : "N");

            int result = boardDAO.insertBoard(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("board_update".equals(mode)) {
            BoardDAO boardDAO = new BoardDAO();
            BoardModel model = new BoardModel();
            model.setBoardId(Integer.parseInt(request.getParameter("boardId")));
            model.setBoardName(request.getParameter("boardName"));
            model.setMenuGroup(request.getParameter("menuGroup"));
            model.setBoardType(request.getParameter("boardType"));
            String orderParam = request.getParameter("displayOrder");
            model.setDisplayOrder(orderParam != null && !orderParam.trim().isEmpty() ? Integer.parseInt(orderParam) : 0);
            model.setUseYn("Y".equals(request.getParameter("useYn")) ? "Y" : "N");

            int result = boardDAO.updateBoard(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("board_delete".equals(mode)) {
            BoardDAO boardDAO = new BoardDAO();
            int boardId = Integer.parseInt(request.getParameter("boardId"));
            int result  = boardDAO.deleteBoard(boardId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("board_post_add".equals(mode)) {
            // POST 용량 초과(maxPostSize) 시 파라미터가 전부 null로 들어옴
            if (request.getParameter("boardId") == null) {
                objResult.put("result", "false");
                objResult.put("msg", "본문 용량이 너무 큽니다. 이미지 크기를 줄여주세요.");
            } else {
                BoardDAO boardDAO = new BoardDAO();
                BoardPostModel model = new BoardPostModel();
                model.setBoardId(Integer.parseInt(request.getParameter("boardId")));
                model.setTitle(request.getParameter("title"));
                model.setContent(request.getParameter("content"));

                int result = boardDAO.insertPost(model);
                objResult.put("result", result > 0 ? "true" : "false");
            }

        } else if ("board_post_update".equals(mode)) {
            if (request.getParameter("postId") == null) {
                objResult.put("result", "false");
                objResult.put("msg", "본문 용량이 너무 큽니다. 이미지 크기를 줄여주세요.");
            } else {
                BoardDAO boardDAO = new BoardDAO();
                BoardPostModel model = new BoardPostModel();
                model.setPostId(Integer.parseInt(request.getParameter("postId")));
                model.setTitle(request.getParameter("title"));
                model.setContent(request.getParameter("content"));

                int result = boardDAO.updatePost(model);
                objResult.put("result", result > 0 ? "true" : "false");
            }

        } else if ("board_post_delete".equals(mode)) {
            BoardDAO boardDAO = new BoardDAO();
            int postId = Integer.parseInt(request.getParameter("postId"));
            int result = boardDAO.deletePost(postId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("popup_add".equals(mode)) {
            PopupDAO popupDAO = new PopupDAO();
            Part imagePart = request.getPart("imageFile");
            String imagePath = "";
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = saveUploadFile(imagePart, "popup");
                if (fileName != null) imagePath = "uploads/popup/" + fileName;
            }
            if (imagePath.isEmpty()) {
                objResult.put("result", "false");
                objResult.put("msg", "이미지를 업로드해주세요.");
            } else {
                PopupModel model = new PopupModel();
                model.setTitle(request.getParameter("title"));
                model.setImagePath(imagePath);
                model.setDescription(request.getParameter("description") != null ? request.getParameter("description") : "");
                model.setLinkUrl(request.getParameter("linkUrl") != null ? request.getParameter("linkUrl") : "");
                model.setStartDate(request.getParameter("startDate"));
                model.setEndDate(request.getParameter("endDate"));
                String orderParam = request.getParameter("displayOrder");
                model.setDisplayOrder(orderParam != null && !orderParam.trim().isEmpty() ? Integer.parseInt(orderParam) : 0);
                model.setHideOptions(buildHideOptions(request));
                model.setUseYn(request.getParameter("useYn") != null ? request.getParameter("useYn") : "Y");
                int result = popupDAO.insertPopup(model);
                objResult.put("result", result > 0 ? "true" : "false");
            }

        } else if ("popup_update".equals(mode)) {
            PopupDAO popupDAO = new PopupDAO();
            int popupId = Integer.parseInt(request.getParameter("popupId"));
            PopupModel model = popupDAO.selectPopup(popupId);
            // 새 이미지가 업로드된 경우에만 교체
            Part imagePart = request.getPart("imageFile");
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = saveUploadFile(imagePart, "popup");
                if (fileName != null) model.setImagePath("uploads/popup/" + fileName);
            }
            model.setTitle(request.getParameter("title"));
            model.setDescription(request.getParameter("description") != null ? request.getParameter("description") : "");
            model.setLinkUrl(request.getParameter("linkUrl") != null ? request.getParameter("linkUrl") : "");
            model.setStartDate(request.getParameter("startDate"));
            model.setEndDate(request.getParameter("endDate"));
            String orderParam = request.getParameter("displayOrder");
            model.setDisplayOrder(orderParam != null && !orderParam.trim().isEmpty() ? Integer.parseInt(orderParam) : 0);
            model.setHideOptions(buildHideOptions(request));
            model.setUseYn(request.getParameter("useYn") != null ? request.getParameter("useYn") : "Y");
            int result = popupDAO.updatePopup(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("popup_delete".equals(mode)) {
            PopupDAO popupDAO = new PopupDAO();
            int popupId = Integer.parseInt(request.getParameter("popupId"));
            int result = popupDAO.deletePopup(popupId);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("editor_image_upload".equals(mode)) {
            // Quill 에디터 이미지 업로드: 파일로 저장 후 URL 반환 (base64 대신)
            Part imagePart = request.getPart("image");
            if (imagePart != null && imagePart.getSize() > 0) {
                String fileName = saveUploadFile(imagePart, "board");
                if (fileName != null) {
                    objResult.put("result", "true");
                    objResult.put("url", "uploads/board/" + fileName);
                } else {
                    objResult.put("result", "false");
                    objResult.put("msg", "이미지 저장에 실패했습니다.");
                }
            } else {
                objResult.put("result", "false");
                objResult.put("msg", "이미지 파일이 없습니다.");
            }
        }

        PrintWriter out = response.getWriter();
        out.print(objResult);
    }

    /** 공통 파일 저장 메서드: uploadBasePath 하위 subDir 에 저장 */
    private String saveUploadFile(Part filePart, String subDir) {
        try {
            String originalName = filePart.getSubmittedFileName();
            if (originalName == null || originalName.isEmpty()) return null;

            String ext      = originalName.substring(originalName.lastIndexOf('.'));
            String fileName = UUID.randomUUID().toString() + ext;

            String basePath = (String) getServletContext().getAttribute("uploadBasePath");
            if (basePath == null) {
                // fallback: getRealPath (이전 방식)
                basePath = getServletContext().getRealPath("/uploads/") + File.separator;
            }

            String uploadDir = basePath + subDir;
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            filePart.write(uploadDir + File.separator + fileName);
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /** 팝업 안보기 옵션: 라디오 선택값 (1 / 7 / 30 / none) */
    private String buildHideOptions(HttpServletRequest request) {
        String val = request.getParameter("hideOption");
        if ("7".equals(val) || "30".equals(val) || "none".equals(val)) return val;
        return "1";
    }

    private String saveProductImage(Part filePart, HttpServletRequest request) {
        return saveUploadFile(filePart, "product");
    }

    private String savePortfolioImage(Part filePart, HttpServletRequest request) {
        return saveUploadFile(filePart, "portfolio");
    }

    private String savePressImage(Part filePart, HttpServletRequest request) {
        return saveUploadFile(filePart, "press");
    }

    private String saveFile(Part filePart, HttpServletRequest request) {
        return saveUploadFile(filePart, "certification");
    }
}
