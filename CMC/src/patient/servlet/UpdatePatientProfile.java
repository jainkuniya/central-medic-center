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
 * Servlet implementation class UpdatePatientProfile
 */
@WebServlet("/updatePatientProfile")
public class UpdatePatientProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePatientProfile() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			int patientId = (int) session.getAttribute("UserID");
			// get patient details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Patient patient = databaseHelper.getPatient(patientId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(patientId, "patientId");
			if (patient == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to person dashboard
			RequestDispatcher rs = request.getRequestDispatcher("editProfile.jsp");
			request.setAttribute("patient", patient);
			request.setAttribute("appointments", appointments);
			rs.forward(request, response);
			return;
		} catch (Exception e) {
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//update patient
		doGet(request,response);
	}
	
	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}

}
