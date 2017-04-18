package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;
import modal.Appointment;

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
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Appointment appointment = new Appointment(Integer.valueOf(request.getParameter("patientId")),
				(String) request.getParameter("symptons"), (String) request.getParameter("disease"), 1234566);

		// insert in DB
		int status = new DatabaseHelper().createAppointment(appointment);
		if (status > 0) {
			// successfully inserted
			// redirect to dashboard
			RequestDispatcher rs;
			rs = request.getRequestDispatcher("patient");
			request.setAttribute("personId", appointment.getPatientId());
			rs.forward(request, response);
		} else {
			// error
		}
	}

}