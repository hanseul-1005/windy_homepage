

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Admin
 */
@WebServlet(name = "admin", urlPatterns = { "/admin.windy" })
public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		String menu = request.getParameter("menu");
		
		System.out.println("menu : "+menu);
		if(menu==null) menu = "main";
		
		if("main".equals(menu)) {

			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/dash_board.jsp");
			dispatcher.forward(request, response);
		}
		else if("notice_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("notice_add".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_add.jsp");
			dispatcher.forward(request, response);
		}
		else if("notice_modify".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/notice/notice_modify.jsp");
			dispatcher.forward(request, response);
		}
		else if("portfolio_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("portfolio_add".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_add.jsp");
			dispatcher.forward(request, response);
		}
		else if("portfolio_modify".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/portfolio/portfolio_modify.jsp");
			dispatcher.forward(request, response);
		}
		else if("contact_list".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/contact_us/contact_list.jsp");
			dispatcher.forward(request, response);
		}
		else if("contact_detail".equals(menu)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/contact_us/contact_detail.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
