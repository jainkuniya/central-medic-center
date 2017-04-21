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
import staff.modal.Staff;

/**
 * Servlet implementation class UpdatePatientProfile
 */
@WebServlet("/updateReceptionistProfile")
public class UpdateReceptionistProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReceptionistProfile() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			int receptionistId = (int) session.getAttribute("UserID");
			// get receptionist details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(receptionistId, null);
			Staff receptionist = databaseHelper.getStaff(receptionistId);
			if (receptionist == null ) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to receptionist dashboard
			RequestDispatcher rs = request.getRequestDispatcher("editReceptionistProfile.jsp");
			request.setAttribute("receptionist", receptionist);
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
