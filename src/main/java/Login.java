

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

/**
 * Servlet implementation class Login
 */
@WebServlet(name = "login", urlPatterns = { "/login.windy" })
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsps/admin/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);


		request.setCharacterEncoding("UTF-8");

		String mode = request.getParameter("mode");
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		HttpSession session = request.getSession();

		System.out.println("mode : "+mode);

		if ("login".equals(mode)) {
			
			System.out.println("id : "+ id);
			System.out.println("passwd : "+ passwd);
			
			if(!"admin".equals(id) || !"windy0136".equals(passwd)) {
				
				JSONObject objResult = new JSONObject();
				response.setContentType("text/json; charset=utf-8");
				objResult.put("result", "false");
				
				PrintWriter out = response.getWriter();					
				out.print(objResult);
			}
			else{
				session.setAttribute("id", id);
				session.setAttribute("pw", passwd);			
				session.setMaxInactiveInterval(60 * 60 * 10);
				

				JSONObject objResult = new JSONObject();
				response.setContentType("text/json; charset=utf-8");
				objResult.put("result", "true");	
				
				
				PrintWriter out = response.getWriter();					
				out.print(objResult);
			}
	
		}
	}

}
