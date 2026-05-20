package windy.homepage.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import windy.homepage.dao.AdminDAO;
import windy.homepage.model.AdminModel;

@WebServlet(name = "login", urlPatterns = { "/login.windy" })
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/login.jsp");
        dispatcher.forward(request, response);
    }

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/json; charset=utf-8");

        String mode = request.getParameter("mode");

        if ("login".equals(mode)) {
            String id     = request.getParameter("id");
            String passwd = request.getParameter("passwd");

            AdminDAO adminDAO = new AdminDAO();
            AdminModel admin  = adminDAO.selectAdmin(id, passwd);

            JSONObject objResult = new JSONObject();

            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("adminId", admin.getAdminId());
                session.setAttribute("adminName", admin.getAdminName());
                session.setMaxInactiveInterval(60 * 60 * 10);
                objResult.put("result", "true");
            } else {
                objResult.put("result", "false");
            }

            PrintWriter out = response.getWriter();
            out.print(objResult);
        }
    }
}
