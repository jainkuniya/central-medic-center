package authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session;
		Date createTime;
		String userName = request.getParameter("username");
		String password = request.getParameter("password");

		// validate credentials and get user type
		int personType[] = new DatabaseHelper().getPersonType(userName, password);
		switch (personType[0]) {
		case -1:
			// can't connect to DB
			out.println("can't connect to DB");
			request.getRequestDispatcher("login.jsp").include(request, response);
			break;
		case 0:
			// not valid credentials
			out.println("Username or Password incorrect");
			request.setAttribute("error", "We can't recognize you!!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			break;
		case 1:
			// person is patient
			session = request.getSession();
			session.setAttribute("UserID", personType[1]);
			session.setAttribute("UserType", "patient");
			session.setMaxInactiveInterval(60000);
			createTime = new Date(session.getCreationTime());
			session.setAttribute("CreateTime", createTime);
			session.setAttribute("LastAccess", createTime);
			request.getRequestDispatcher("patient").forward(request, response);
			break;
		case 2:
			// person is doctor
			session = request.getSession();
			session.setAttribute("UserID", personType[1]);
			session.setAttribute("UserType", "doctor");
			session.setMaxInactiveInterval(60000);
			createTime = new Date(session.getCreationTime());
			session.setAttribute("CreateTime", createTime);
			session.setAttribute("LastAccess", createTime);
			request.getRequestDispatcher("doctor").forward(request, response);
			break;
		case 3:
			// person is admin
			session = request.getSession();
			session.setAttribute("UserID", personType[1]);
			session.setAttribute("UserType", "admin");
			session.setMaxInactiveInterval(60000);
			createTime = new Date(session.getCreationTime());
			session.setAttribute("CreateTime", createTime);
			session.setAttribute("LastAccess", createTime);
			request.getRequestDispatcher("admin").forward(request, response);
			break;
		case 4:
			// person is labPerson
			session = request.getSession();
			session.setAttribute("UserID", personType[1]);
			session.setAttribute("UserType", "labPerson");
			session.setMaxInactiveInterval(60000);
			createTime = new Date(session.getCreationTime());
			session.setAttribute("CreateTime", createTime);
			session.setAttribute("LastAccess", createTime);
			request.getRequestDispatcher("labPerson").forward(request, response);
			break;
		case 5:
			// person is receptionist
			session = request.getSession();
			session.setAttribute("UserID", personType[1]);
			session.setAttribute("UserType", "receptionist");
			session.setMaxInactiveInterval(60000);
			createTime = new Date(session.getCreationTime());
			session.setAttribute("CreateTime", createTime);
			session.setAttribute("LastAccess", createTime);
			request.getRequestDispatcher("receptionist").forward(request, response);
			break;
		default:
			// redirect to login page
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		
		doGet(request, response);
	}
	
	 
}
