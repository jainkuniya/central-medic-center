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
import patient.modal.DashBoard;
import staff.modal.Staff;
import utils.DashUtils;

/**
 * Servlet implementation class DoctorServlet
 */
@WebServlet("/receptionist")
public class ReceptionistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionistServlet() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			session = request.getSession();
			if (session.isNew()){
				redirectToLogin(request, response);
				 }
			else{
			
			int personId = (int) session.getAttribute("UserID");
			// get receptionist details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			DashBoard dashBoard = new DashBoard(DashUtils.getUnapprovedAppointment(), 
					DashUtils.getTotalAppointment(),DashUtils.getProfileRating(personId, 5));
			Staff receptionist = databaseHelper.getStaff(personId);
			ArrayList<ArrayList<Appointment>> appointments = databaseHelper.getAppointments(personId, null);
			if (receptionist == null || appointments == null) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to receptionist dashboard
			RequestDispatcher rs = request.getRequestDispatcher("receptionist.jsp");
			request.setAttribute("receptionist", receptionist);
			request.setAttribute("dashBoard", dashBoard);
			request.setAttribute("appointments", appointments);
			rs.forward(request, response);
			return;
			}
		} catch (Exception e) {
			// redirect to login
			redirectToLogin(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error", "Please login again");
		rs.forward(request, response);
	}
}
