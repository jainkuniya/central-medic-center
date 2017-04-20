package staff.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DatabaseHelper;
import staff.modal.Staff;

/**
 * Servlet implementation class UpdatePatientProfile
 */
@WebServlet("/updateLabPersonProfile")
public class UpdateLabPersonProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLabPersonProfile() {
        super();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			HttpSession session = request.getSession();
			int labPersonId = (int) session.getAttribute("UserID");
			// get labPerson details
			DatabaseHelper databaseHelper = new DatabaseHelper();
			Staff labPerson = databaseHelper.getStaff(labPersonId);
			if (labPerson == null ) {
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to labPerson dashboard
			RequestDispatcher rs = request.getRequestDispatcher("editLabPersonProfile.jsp");
			request.setAttribute("labPerson", labPerson);
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
