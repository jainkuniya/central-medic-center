package patient.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseHelper;

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
			int sendType = Integer.valueOf((String)request.getParameter("sendType"));
			int status = 0;
			if(sendType == 1 || sendType == 2 || sendType == 6){
				status = new DatabaseHelper().addItemInAppointment(appointmentId,
						sendType, (String) request.getParameter("description"));
			}else if(sendType == 3){
				status = new DatabaseHelper().addItemInAppointment(appointmentId,
						sendType, "Medicine Prescribed");
			}else if(sendType == 4){
				status = new DatabaseHelper().addItemInAppointment(appointmentId,
						sendType, "Lab Report Generated For "+ request.getParameter("labName"));
			}else if(sendType == 5){
				status = new DatabaseHelper().addItemInAppointment(appointmentId,
						sendType, request.getParameter("labName")+": Lab Report Request");
			}
			System.out.println(status);	
			if (status > 0) {
				// successfully inserted
				// redirect to detailedPatientAppointment
				if(sendType == 3){
					new DatabaseHelper().addPrescription(request.getParameter("medicineName"),
							Double.parseDouble(request.getParameter("quantity")),Integer.parseInt(request.getParameter("times")),status);
				}
				else if(sendType == 5){
					new DatabaseHelper().addLab(request.getParameter("labName"),
							request.getParameter("testFor"),status);
				}
				RequestDispatcher rs;
				rs = request.getRequestDispatcher((String)request.getParameter("requestDispatcher"));
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
