package windy.homepage.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Main", urlPatterns = { "/main.windy" })
public class Main extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");

        String menu = request.getParameter("menu");
        if (menu == null) menu = "home";

        if ("home".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/main.jsp");
            dispatcher.forward(request, response);
        } else if ("history_list".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/history_list.jsp");
            dispatcher.forward(request, response);
        } else if ("service_info".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/service_info.jsp");
            dispatcher.forward(request, response);
        } else if ("certification".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/certification_info.jsp");
            dispatcher.forward(request, response);
        } else if ("product_list".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/product_list.jsp");
            dispatcher.forward(request, response);
        } else if ("portfolio_list".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_list.jsp");
            dispatcher.forward(request, response);
        } else if ("portfolio_detail".equals(menu)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/portfolio_detail.jsp");
            dispatcher.forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
