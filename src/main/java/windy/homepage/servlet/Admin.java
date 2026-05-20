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

import windy.homepage.dao.CertificationDAO;
import windy.homepage.dao.ContactDAO;
import windy.homepage.dao.HistoryDAO;
import windy.homepage.dao.NoticeDAO;
import windy.homepage.dao.PortfolioDAO;
import windy.homepage.dao.ProductDAO;
import windy.homepage.model.CertificationModel;
import windy.homepage.model.ContactModel;
import windy.homepage.model.HistoryModel;
import windy.homepage.model.NoticeModel;
import windy.homepage.model.PortfolioModel;
import windy.homepage.model.ProductModel;

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

        NoticeDAO          noticeDAO     = new NoticeDAO();
        ContactDAO         contactDAO    = new ContactDAO();
        HistoryDAO         historyDAO    = new HistoryDAO();
        CertificationDAO   certDAO       = new CertificationDAO();
        PortfolioDAO       portfolioDAO  = new PortfolioDAO();
        ProductDAO         productDAO    = new ProductDAO();

        if ("main".equals(menu)) {
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
        NoticeDAO        noticeDAO    = new NoticeDAO();
        ContactDAO       contactDAO   = new ContactDAO();
        HistoryDAO       historyDAO   = new HistoryDAO();
        CertificationDAO certDAO      = new CertificationDAO();
        PortfolioDAO     portfolioDAO = new PortfolioDAO();
        ProductDAO       productDAO   = new ProductDAO();
        JSONObject       objResult    = new JSONObject();

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

        } else if ("history_add".equals(mode)) {
            int    historyYear  = Integer.parseInt(request.getParameter("historyYear"));
            int    historyMonth = Integer.parseInt(request.getParameter("historyMonth"));
            String content      = request.getParameter("content");

            HistoryModel model = new HistoryModel();
            model.setHistoryYear(historyYear);
            model.setHistoryMonth(historyMonth);
            model.setContent(content);

            int result = historyDAO.insertHistory(model);
            objResult.put("result", result > 0 ? "true" : "false");

        } else if ("history_update".equals(mode)) {
            int    historyId    = Integer.parseInt(request.getParameter("historyId"));
            int    historyYear  = Integer.parseInt(request.getParameter("historyYear"));
            int    historyMonth = Integer.parseInt(request.getParameter("historyMonth"));
            String content      = request.getParameter("content");

            HistoryModel model = new HistoryModel();
            model.setHistoryId(historyId);
            model.setHistoryYear(historyYear);
            model.setHistoryMonth(historyMonth);
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
            String rightContent  = request.getParameter("rightContent");
            String bottomContent = request.getParameter("bottomContent");

            PortfolioModel model = new PortfolioModel();
            model.setTitle(title);
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
            String rightContent  = request.getParameter("rightContent");
            String bottomContent = request.getParameter("bottomContent");

            PortfolioModel model = new PortfolioModel();
            model.setPortfolioId(portfolioId);
            model.setTitle(title);
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
        }

        PrintWriter out = response.getWriter();
        out.print(objResult);
    }

    private String saveProductImage(Part filePart, HttpServletRequest request) {
        try {
            String originalName = filePart.getSubmittedFileName();
            if (originalName == null || originalName.isEmpty()) return null;

            String ext      = originalName.substring(originalName.lastIndexOf('.'));
            String fileName = UUID.randomUUID().toString() + ext;

            String uploadDir = getServletContext().getRealPath("/uploads/product/");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            filePart.write(uploadDir + File.separator + fileName);
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String savePortfolioImage(Part filePart, HttpServletRequest request) {
        try {
            String originalName = filePart.getSubmittedFileName();
            if (originalName == null || originalName.isEmpty()) return null;

            String ext      = originalName.substring(originalName.lastIndexOf('.'));
            String fileName = UUID.randomUUID().toString() + ext;

            String uploadDir = getServletContext().getRealPath("/uploads/portfolio/");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            filePart.write(uploadDir + File.separator + fileName);
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    private String saveFile(Part filePart, HttpServletRequest request) {
        try {
            String originalName = filePart.getSubmittedFileName();
            if (originalName == null || originalName.isEmpty()) return null;

            String ext      = originalName.substring(originalName.lastIndexOf('.'));
            String fileName = UUID.randomUUID().toString() + ext;

            String uploadDir = getServletContext().getRealPath("/uploads/certification/");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            filePart.write(uploadDir + File.separator + fileName);
            return fileName;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
