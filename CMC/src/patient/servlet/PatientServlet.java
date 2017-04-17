package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import patient.modal.Patient;

import database.DatabaseHelper;

/**
 * Servlet implementation class Patient
 */
@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			int personId = (int)request.getAttribute("personId");
			//get patient details
			Patient patient= new DatabaseHelper().getPatient(personId);

			if(patient==null)
			{
				//redirect to login
				redirectToLogin(request, response);
				return;
			}
			//redirect to person dashboard
			RequestDispatcher rs = request.getRequestDispatcher("patient.jsp");
			request.setAttribute("patient",patient);
	        rs.forward(request, response);
			return;			
		}catch(Exception e)
		{
			//redirect to login
			redirectToLogin(request,response );
		}
	}

	private void redirectToLogin(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("login.jsp");
		request.setAttribute("error","Please login again");
        rs.forward(request, response);		
	}

}
