package authentication;

import java.io.IOException;
import java.util.Date;
import javax.servlet.RequestDispatcher;
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
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		request.getRequestDispatcher("signup.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
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
