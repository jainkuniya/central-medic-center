package patient.servlet;

import java.io.IOException;
import java.util.ArrayList;

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

/**
 * Servlet implementation class PatientAppointmentDetails
 */
@WebServlet("/patientAppointmentDetails")
public class PatientAppointmentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientAppointmentDetails() {
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
		// get appointmentDetails from DB
		try {
			HttpSession session = request.getSession();
			int patientId = (int) session.getAttribute("UserID");
			int appointmentId = Integer.parseInt((String) request.getParameter("appointmentId"));
			// get appointment details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Appointment apointment = databaseHelper.getDetailedAppointment(appointmentId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(patientId, "patientId");
			Patient patient = databaseHelper.getPatient(patientId);
			if (apointment == null || patient == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to person detailed appointment
			RequestDispatcher rs = request.getRequestDispatcher("patientDetailedAppointment.jsp");
			request.setAttribute("apointment", apointment);
			request.setAttribute("patient", patient);
			request.setAttribute("appointments", appointments);
			rs.forward(request, response);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		//rs.forward(request, response);
	}

}
