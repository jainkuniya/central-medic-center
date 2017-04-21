package staff.servlet;

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
import staff.modal.Doctor;
import staff.modal.Staff;

/**
 * Servlet implementation class DoctorServlet
 */
@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			session = request.getSession();
			if (session.isNew()) {
				redirectToLogin(request, response);
			} else {

				int personId = (int) session.getAttribute("UserID");
				// get patient details
				DatabaseHelper databaseHelper = new DatabaseHelper();
				Staff admin = databaseHelper.getStaff(personId);
				ArrayList<Doctor> doctors = databaseHelper.getDoctors();
				ArrayList<Patient> patients = databaseHelper.getPatients();
				ArrayList<Appointment> appointments =  databaseHelper.getAppointment();
				ArrayList<Staff> staffs =  databaseHelper.getStaff();
				if (admin == null || doctors==null || patients==null || appointments == null) {
					// redirect to login
					redirectToLogin(request, response);
					return;
				}
				// redirect to person dashboard
				RequestDispatcher rs = request.getRequestDispatcher("admin.jsp");
				request.setAttribute("admin", admin);
				request.setAttribute("doctors", doctors);
				request.setAttribute("patients", patients);
				request.setAttribute("appointments", appointments);
				request.setAttribute("staffs", staffs);
				rs.forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}
}
