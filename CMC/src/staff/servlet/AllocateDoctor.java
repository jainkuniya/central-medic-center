package staff.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import database.DatabaseHelper;
import utils.DateUtils;

/**
 * Servlet implementation class AllocateDoctor
 */
@WebServlet("/allocateDoctor")
public class AllocateDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllocateDoctor() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// redirect to login
		redirectToLogin(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get appointmentDetails from DB
		try {
			int appointmentId = Integer.parseInt((String) request.getParameter("appointmentId"));
			int doctorId = Integer.parseInt((String) request.getParameter("doctorId"));
			String allocatedDate = (String)request.getParameter("allocatedDate");
			// allocate doctor 
			DatabaseHelper databaseHelper = new DatabaseHelper();
			int status = databaseHelper.allocateDoctor(appointmentId, doctorId, DateUtils.getLongFromDate(allocatedDate));	
					
			if (status > 0) {				
				// redirect to receptionlist detailed appointment
				RequestDispatcher rs = request.getRequestDispatcher("receptionistAppointmentDetails");
				request.setAttribute("appointmentId", appointmentId);
				rs.forward(request, response);
				return;
			}
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
		rs.forward(request, response);
	}

}
