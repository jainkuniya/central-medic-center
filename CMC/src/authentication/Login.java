package authentication;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (!response.isCommitted()) {// redirect to login page
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		// validate credentials and get user type
		int personType[] = new DatabaseHelper().getPersonType(userName, password);
		RequestDispatcher rs;
		switch (personType[0]) {
		case -1:
			// can't connect to DB
			out.println("can't connect to DB");
			rs = request.getRequestDispatcher("login.jsp");
			rs.include(request, response);
			break;
		case 0:
			// not valid credentials
			out.println("Username or Password incorrect");
			request.setAttribute("error", "We can't recognize you!!");
			rs = request.getRequestDispatcher("login.jsp");
			rs.forward(request, response);
			break;
		case 1:
			// person is patient
			rs = request.getRequestDispatcher("patient");
			request.setAttribute("personId", personType[1]);
			rs.forward(request, response);
			break;
		case 2:
			// person is doctor
			rs = request.getRequestDispatcher("doctor");
			rs.forward(request, response);
			break;
		default:
			// redirect to login page
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}

		doGet(request, response);
	}

}
