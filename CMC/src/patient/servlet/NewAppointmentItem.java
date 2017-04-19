package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;
import modal.AppointmentItems;
import utils.DateUtils;

/**
 * Servlet implementation class NewAppointmentItem
 */
@WebServlet("/newAppointmentItem")
public class NewAppointmentItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewAppointmentItem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// redirect to login
		redirectToLogin(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int appointmentId = Integer.valueOf(request.getParameter("appointmentId"));
			// insert in DB
			int status = new DatabaseHelper().addItemInAppointment(appointmentId,
					Integer.valueOf((String)request.getParameter("type")), (String) request.getParameter("description"));
			if (status > 0) {
				// successfully inserted
				// redirect to detailedPatientAppointment
				RequestDispatcher rs;
				rs = request.getRequestDispatcher("patientAppointmentDetails");
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
