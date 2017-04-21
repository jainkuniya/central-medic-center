package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;

/**
 * Servlet implementation class CloseAppointment
 */
@WebServlet("/closeAppointment")
public class CloseAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CloseAppointment() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//redirect to login
		redirectToLogin(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int appointmentId = Integer.valueOf(request.getParameter("appointmentId"));
			String by = (String)request.getParameter("by");
			int status = new DatabaseHelper().closeAppointment(appointmentId, by);
			if (status > 0) {
				// successfully inserted
				RequestDispatcher rs;
				rs = request.getRequestDispatcher((String)request.getParameter("requestDispatcher"));
				request.setAttribute("appointmentId", appointmentId);
				rs.forward(request, response);
			} else {
				// redirect to login
				redirectToLogin(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}
}
