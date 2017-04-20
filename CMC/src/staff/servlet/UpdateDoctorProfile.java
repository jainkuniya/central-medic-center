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
import staff.modal.Doctor;

/**
 * Servlet implementation class UpdatePatientProfile
 */
@WebServlet("/updateDoctorProfile")
public class UpdateDoctorProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateDoctorProfile() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			int doctorId = (int) session.getAttribute("UserID");
			// get doctor details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Doctor doctor = databaseHelper.getDoctor(doctorId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(doctorId, "doctorId");
			if (doctor == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to doctor dashboard
			RequestDispatcher rs = request.getRequestDispatcher("editDoctorProfile.jsp");
			request.setAttribute("doctor", doctor);
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
