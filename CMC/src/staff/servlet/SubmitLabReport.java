package staff.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;

/**
 * Servlet implementation class SubmitLabReport
 */
@WebServlet("/submitLabReport")
public class SubmitLabReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitLabReport() {
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
		try {			
			// get doctor lab report id
			int labReportId = Integer.parseInt((String)request.getParameter("labId"));
			DatabaseHelper databaseHelper = new DatabaseHelper();
			int status = databaseHelper.updateLabReport(labReportId, (String)request.getParameter("result"), 
					Integer.parseInt((String)request.getParameter("itemId")));
			if (status<=0) {
				//error
				// redirect to login
				redirectToLogin(request, response);
				return;
			}
			// redirect to lab person dashboard
			RequestDispatcher rs = request.getRequestDispatcher("labPerson");
			rs.forward(request, response);
			return;
		} catch (Exception e) {
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
