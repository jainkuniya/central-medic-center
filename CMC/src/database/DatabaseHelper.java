package database;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import modal.Appointment;
import modal.AppointmentItems;
import modal.Person;
import patient.modal.Patient;
import staff.modal.Doctor;
import utils.DateUtils;

public class DatabaseHelper {

	Connection connection;

	public DatabaseHelper() {
		connection = DatabaseConnector.getDatabase();
	}

	public int[] getPersonType(String userName, String password) {
		int result[] = { -1, 0 };

		if (connection == null) {
			return result;
		}

		try {
			PreparedStatement ps = connection.prepareStatement

			("select * from person where userName=? and password=?");

			ps.setString(1, userName);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				result[0] = rs.getInt("personType");
				result[1] = rs.getInt("personId");
			} else {
				result[0] = 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}
	public int checkPerson(String username) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select * from person where userName=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return 0;
			}
			else {
				return 1;
			}
			// get patient from database
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}

		
	}

	public Patient getPatient(int id) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select * from person where personId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// get patient from database
				ps = connection.prepareStatement("select * from patient where patientId=?");
				ps.setInt(1, id);
				ResultSet rsPatient = ps.executeQuery();
				if (rsPatient.next()) {
					return new Patient(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"), rs.getString("gender"),
							rs.getString("address"), rs.getString("contactNumber"), rsPatient.getInt("weight"),
							rsPatient.getInt("height"), rsPatient.getString("bloodGroup"));
				}
			}
			// get patient from database
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public Doctor getDoctor(int id) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select * from person where personId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// get patient from database
				ps = connection.prepareStatement("select * from doctor where doctorId=?");
				ps.setInt(1, id);
				ResultSet rsDoctor = ps.executeQuery();
				if (rsDoctor.next()) {
					return new Doctor(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"), rs.getString("gender"),
							rs.getString("address"), rs.getString("contactNumber"), rsDoctor.getString("degree"),
							rsDoctor.getString("specialization"));
				}
			}
			// get patient from database
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public Person getPerson(int id) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select * from person where personId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
					return new Person(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"), rs.getString("gender"),
							rs.getString("address"), rs.getString("contactNumber"));
				}
			
			// get patient from database
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	

	public int createAppointment(Appointment appointment) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement(
					"insert into appointment (patientId, dateCreated, symptons, disease, preferredDate, "
					+ "title) values(?,?,?,?,?,?)");
			ps.setInt(1, appointment.getPatient().getId());
			ps.setLong(2, System.currentTimeMillis());
			ps.setString(3, appointment.getSymptons());
			ps.setString(4, appointment.getDisease());
			ps.setLong(5, appointment.getPreferredDate());
			ps.setString(6, appointment.getTitle());

			int status = ps.executeUpdate();
			// create an item
			if (status > 0) {
				return addItemInAppointment(status, 6, "Created");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int addItemInAppointment(int id, int type, String description) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into appointmentItems (appointmentId, typeId, date, description) values(?,?,?,?)");
			ps.setInt(1, id);
			ps.setInt(2, type);
			ps.setLong(3, System.currentTimeMillis());
			ps.setString(4, description);

			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<ArrayList<Appointment>> getAppointments(int personId, String mactingColumn) {
		ArrayList<ArrayList<Appointment>> arrayList = new ArrayList<ArrayList<Appointment>>();
		ArrayList<Appointment> upcommingAppointments = new ArrayList<Appointment>();
		ArrayList<Appointment> closedAppointments = new ArrayList<Appointment>();
		ArrayList<Appointment> unconfirmedAppointments = new ArrayList<Appointment>();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointment where " + mactingColumn +" =? order by dateCreated desc");
			ps.setInt(1, personId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("appointmentId");
				int isClosed = rs.getInt("isClosed");
				int doctorId = rs.getInt("doctorId");
				int patientId = rs.getInt("patientId");
				Doctor doctor = getDoctor(doctorId);
				Patient patient = getPatient(patientId);
				Appointment appointment = new Appointment(id, doctor, rs.getString("title"), rs.getLong("dateCreated"), patient);
				if(rs.getLong("allocatedDate") == 0 && mactingColumn.equals("admin"))
				{
					unconfirmedAppointments.add(appointment);
				}else if(isClosed==0)
				{
					upcommingAppointments.add(appointment);
				}else {
					closedAppointments.add(appointment);
				}
				
			}
			arrayList.add(upcommingAppointments);
			arrayList.add(closedAppointments);
			if(mactingColumn.equals("doctorId")){
				arrayList.add(unconfirmedAppointments);
			}
			return arrayList;

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	

	public ArrayList<AppointmentItems> getAppointmentsItems(int id) {
		ArrayList<AppointmentItems> items = new ArrayList<AppointmentItems>();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointmentItems where appointmentId=? order by date asc");
			ps.setInt(1, id);
			ResultSet itemSet = ps.executeQuery();
			while (itemSet.next()) {
				AppointmentItems item = new AppointmentItems(itemSet.getLong("date"), itemSet.getString("description"), 
						itemSet.getInt("typeId"), itemSet.getInt("appointmentId"));
				items.add(item);
			}
			return items;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public Appointment getDetailedAppointment(int appointmentId) {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointment where appointmentId=?");
			ps.setInt(1, appointmentId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("appointmentId");
				int doctorId = rs.getInt("doctorId");
				int patientId = rs.getInt("patientId");
				Doctor doctor = getDoctor(doctorId);
				Patient patient = getPatient(patientId);
				Appointment appointment = new Appointment(id, doctor, rs.getString("title"), rs.getLong("dateCreated"),
						rs.getString("symptons"), rs.getString("disease"), patient);
				appointment.setItems(getAppointmentsItems(id));
				return appointment;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public int updatePatient(int patientId, HttpServletRequest request) {
		try {
			// update person
			updatePerson(patientId, request);

			// update patient
			PreparedStatement ps = connection
					.prepareStatement("update patient set height=?, weight=?, bloodGroup=? where patientId=?");
			ps.setInt(1, Integer.valueOf((String) request.getParameter("height")));
			ps.setInt(2, Integer.valueOf((String) request.getParameter("weight")));
			ps.setString(3, request.getParameter("bloodGroup"));
			ps.setInt(4, patientId);

			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int updateDoctor(int doctorId, HttpServletRequest request) {
		try {
			// update person
			updatePerson(doctorId, request);

			// update patient
			PreparedStatement ps = connection
					.prepareStatement("update doctor set degree=?, specialization=? where doctorId=?");
			ps.setString(1, (String) request.getParameter("degree"));
			ps.setString(2, (String) request.getParameter("specialization"));
			ps.setInt(3, doctorId);

			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	private int updatePerson(int patientId, HttpServletRequest request) {
		try {
			// update person
			if (!request.getParameter("password").isEmpty()) {
				PreparedStatement ps = connection
						.prepareStatement("update person set password=?, dob=?, address=?, contactNumber=? where personId=?");
				ps.setString(1, request.getParameter("password"));
				ps.setLong(2, DateUtils.getLongFromDate(request.getParameter("dob")));
				ps.setString(3, request.getParameter("address"));
				ps.setString(4, request.getParameter("contactNumber"));
				ps.setInt(5, patientId);
				return ps.executeUpdate();

			} else {
				PreparedStatement ps = connection
						.prepareStatement("update person set dob=?, address=?, contactNumber=? where personId=?");
				ps.setLong(1, System.currentTimeMillis());
				ps.setString(2, request.getParameter("address"));
				ps.setString(3, request.getParameter("contactNumber"));
				ps.setInt(4, patientId);
				return ps.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;

	}

	public void createPerson(HttpServletRequest request) {
		try {
			PreparedStatement ps,ts,ps1,ps2;
			ps = connection.prepareStatement(
					"insert into person(firstName,lastName,userName,password,dob,token,personType,gender,address,contactNumber) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, request.getParameter("firstName"));
			ps.setString(2, request.getParameter("lastName"));
			ps.setString(3, request.getParameter("userName"));
			ps.setString(4, request.getParameter("password"));
			ps.setLong(5,  DateUtils.getLongFromDate(request.getParameter("dob")));
			ps.setString(6, "1");
			ps.setInt(7, Integer.parseInt(request.getParameter("userType")) );
			ps.setString(8, request.getParameter("gender"));
			ps.setString(9, request.getParameter("address"));
			ps.setString(10, request.getParameter("contactNumber"));
			ps.executeUpdate();
			
			ts = connection.prepareStatement(
					"Select personId from person where userName=?");
			ts.setString(1, request.getParameter("userName"));
			ResultSet rs = ts.executeQuery();
			int userId=0;
			if (rs.next()) {
				userId = rs.getInt("personId");
			} 
			int uType = Integer.parseInt(request.getParameter("userType"));
			if (uType == 1) {
				ps1 = connection
						.prepareStatement("insert into patient(patientId,height,weight,bloodGroup) values(?,?,?,?)");
				ps1.setInt(1, userId);
				ps1.setString(2, request.getParameter("height"));
				ps1.setString(3, request.getParameter("weight"));
				ps1.setString(4, request.getParameter("bloodGroup"));
				 ps1.executeUpdate();
			} else if (uType == 2) {
				ps2 = connection
						.prepareStatement("insert into doctor(doctorId,degree,specialization) values(?,?,?)");
				ps2.setInt(1, userId);
				ps2.setString(2, request.getParameter("degree"));
				ps2.setString(3, request.getParameter("specialization"));
				 ps2.executeUpdate();
			} 
			 
			

		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
	}
}
