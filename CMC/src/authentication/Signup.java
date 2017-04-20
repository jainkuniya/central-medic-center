package authentication;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.getRequestDispatcher("signup.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String username = request.getParameter("userName");
		int check = new DatabaseHelper().checkPerson(username);
		 
		switch(check){
		case 0:
			request.setAttribute("error", "user already exist");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
			 
			break;
		case 1:
			new DatabaseHelper().createPerson(request);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		default:
			request.setAttribute("error", "error in signup");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
			break;
			
		}
		 
	}

}
