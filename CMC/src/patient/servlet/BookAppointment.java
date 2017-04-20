package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseHelper;
import modal.Appointment;
import patient.modal.Patient;
import utils.DateUtils;

/**
 * Servlet implementation class BookAppointment
 */
@WebServlet("/bookAppointment")
public class BookAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookAppointment() {
		super();
		 
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// error 
		//redirect to login
		redirectToLogin(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session;
		session = request.getSession();
		if (session.isNew()) {
			redirectToLogin(request, response);
		} else {
			Patient patient = new DatabaseHelper().getPatient((int) session.getAttribute("UserID"));
			Appointment appointment = new Appointment(patient, (String) request.getParameter("symptons"),
					(String) request.getParameter("disease"),
					DateUtils.getLongFromDate((String) request.getParameter("preferredDate")),
					(String)request.getParameter("title"));


			// insert in DB
			int status = new DatabaseHelper().createAppointment(appointment);
			if (status > 0) {
				// successfully inserted
				// redirect to patient dashboard
				RequestDispatcher rs;
				rs = request.getRequestDispatcher("patient");
				request.setAttribute("personId", appointment.getPatient().getId());
				rs.forward(request, response);
			} else {
				// error 
				//redirect to login
				redirectToLogin(request, response);
			}
		}
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}
}
