package database;

import java.sql.*;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import modal.Appointment;
import modal.AppointmentItemType;
import modal.AppointmentItems;
import modal.Person;
import modal.PersonType;
import patient.modal.Patient;
import prescription.Lab;
import prescription.Prescription;
import staff.modal.Doctor;
import staff.modal.Staff;
import utils.DateUtils;

public class DatabaseHelper {

	Connection connection;

	public DatabaseHelper() {
		connection = DatabaseConnector.getDatabase();
	}
	
	public void createPerson(HttpServletRequest request) {
		try {
			PreparedStatement ps, ts, ps1, ps2;
			ps = connection.prepareStatement(
					"insert into person(firstName,lastName,userName,password,dob,token,personType,gender,address,contactNumber) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, request.getParameter("firstName"));
			ps.setString(2, request.getParameter("lastName"));
			ps.setString(3, request.getParameter("userName"));
			ps.setString(4, request.getParameter("password"));
			ps.setLong(5, DateUtils.getLongFromDate(request.getParameter("dob")));
			ps.setString(6, "1");
			ps.setInt(7, Integer.parseInt(request.getParameter("userType")));
			ps.setString(8, request.getParameter("gender"));
			ps.setString(9, request.getParameter("address"));
			ps.setString(10, request.getParameter("contactNumber"));
			ps.executeUpdate();

			ts = connection.prepareStatement("Select personId from person where userName=?");
			ts.setString(1, request.getParameter("userName"));
			ResultSet rs = ts.executeQuery();
			int userId = 0;
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
				ps2 = connection.prepareStatement("insert into doctor(doctorId,degree,specialization) values(?,?,?)");
				ps2.setInt(1, userId);
				ps2.setString(2, request.getParameter("degree"));
				ps2.setString(3, request.getParameter("specialization"));
				ps2.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

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

			e.printStackTrace();
		}

		return result;

	}

	public int checkPerson(String username) {
		try {
			// check person in database
			PreparedStatement ps = connection.prepareStatement("select * from person where userName=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return 0;
			} else {
				return 1;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}

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

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public ArrayList<Person> getPerson() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from person");
			ResultSet rs = ps.executeQuery();
			ArrayList<Person> persons = new ArrayList<Person>();
			while (rs.next()) {
				Person person = new Person(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
						rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"), rs.getString("gender"),
						rs.getString("address"), rs.getString("contactNumber"));
				persons.add(person);
			}
			return persons;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int updatePerson(int patientId, HttpServletRequest request) {
		try {
			// update person
			if (!request.getParameter("password").isEmpty()) {
				PreparedStatement ps = connection.prepareStatement(
						"update person set password=?, dob=?, address=?, contactNumber=? where personId=?");
				ps.setString(1, request.getParameter("password"));
				ps.setLong(2, DateUtils.getLongFromDate(request.getParameter("dob")));
				ps.setString(3, request.getParameter("address"));
				ps.setString(4, request.getParameter("contactNumber"));
				ps.setInt(5, patientId);
				return ps.executeUpdate();

			} else {
				PreparedStatement ps = connection
						.prepareStatement("update person set dob=?, address=?, contactNumber=? where personId=?");
				ps.setLong(1, DateUtils.getLongFromDate(request.getParameter("dob")));
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
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"),
							rs.getString("gender"), rs.getString("address"), rs.getString("contactNumber"),
							rsPatient.getInt("weight"), rsPatient.getInt("height"), rsPatient.getString("bloodGroup"));
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
				// get doctor from database
				ps = connection.prepareStatement("select * from doctor where doctorId=?");
				ps.setInt(1, id);
				ResultSet rsDoctor = ps.executeQuery();
				if (rsDoctor.next()) {
					return new Doctor(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"),
							rs.getString("gender"), rs.getString("address"), rs.getString("contactNumber"),
							rsDoctor.getString("degree"), rsDoctor.getString("specialization"));
				}
			}
			// get doctor from database
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

	public Staff getStaff(int id) {
		try {
			// get staff from database
			PreparedStatement ps = connection.prepareStatement("select * from person where personId=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return new Staff(rs.getInt("personId"), rs.getString("firstName"), rs.getString("lastName"),
						rs.getString("userName"), rs.getLong("dob"), rs.getInt("personType"), rs.getString("gender"),
						rs.getString("address"), rs.getString("contactNumber"));
			}

			// get staff from database
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public int createAppointment(Appointment appointment) {
		try {
			// create appointment in database
			PreparedStatement ps = connection.prepareStatement(
					"insert into appointment (patientId, dateCreated, symptons, disease, preferredDate, "
							+ "title) values(?,?,?,?,?,?)");
			ps.setInt(1, appointment.getPatient().getId());
			ps.setLong(2, System.currentTimeMillis());
			ps.setString(3, appointment.getSymptons());
			ps.setString(4, appointment.getDisease());
			ps.setLong(5, DateUtils.getLongFromDate(appointment.getStringPreferredDate()));
			ps.setString(6, appointment.getTitle());

			ps.executeUpdate();
			ps = connection.prepareStatement(
					"Select appointmentId from appointment order by appointmentId desc LIMIT 1");
			ResultSet rs = ps.executeQuery();
			// create an item
			if (rs.next()) {
				return addItemInAppointment(rs.getInt("appointmentId"), 6, "Appointment Created");
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

			ps.executeUpdate();

			ps = connection.prepareStatement(
					"Select itemId from appointmentItems order by itemId desc LIMIT 1");
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				return rs.getInt("itemId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<ArrayList<Appointment>> getAppointments(int personId, String mactingColumn) {
		ArrayList<ArrayList<Appointment>> arrayList = new ArrayList<ArrayList<Appointment>>();
		ArrayList<Appointment> upcommingAppointments = new ArrayList<Appointment>();
		ArrayList<Appointment> closedAppointments = new ArrayList<Appointment>();
		ArrayList<Appointment> unallocatedAppointments = new ArrayList<Appointment>();
		ArrayList<Appointment> allocatedAppointments = new ArrayList<Appointment>();
		try {
			PreparedStatement ps;
			if(mactingColumn!=null)
			{
				ps = connection.prepareStatement(
					"select * from appointment where " + mactingColumn + " =? order by dateCreated desc");
				ps.setInt(1, personId);
			}else
			{
				//from receptionist
				ps = connection.prepareStatement(
						"select * from appointment  order by dateCreated desc");
			}

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("appointmentId");
				int isClosed = rs.getInt("isClosed");
				int doctorId = rs.getInt("doctorId");
				int patientId = rs.getInt("patientId");
				Doctor doctor = getDoctor(doctorId);
				Patient patient = getPatient(patientId);
				Appointment appointment = new Appointment(id, doctor, rs.getString("title"), rs.getLong("dateCreated"),
						patient, rs.getString("disease"));
				
				if(mactingColumn!=null)
				{
					if (isClosed == 0) {
						upcommingAppointments.add(appointment);
					} else {
						closedAppointments.add(appointment);
					}
				}else
				{
					//from receptionist
					if(rs.getLong("allocatedDate") == 0){
						unallocatedAppointments.add(appointment);
					}else{
						allocatedAppointments.add(appointment);
					}
				}

			}
			if(mactingColumn!=null)
			{
				arrayList.add(upcommingAppointments);
				arrayList.add(closedAppointments);
			}else
			{
				arrayList.add(unallocatedAppointments);
				arrayList.add(allocatedAppointments);
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
			PreparedStatement ps = connection
					.prepareStatement("select * from appointmentItems where appointmentId=? order by date asc");
			ps.setInt(1, id);
			ResultSet itemSet = ps.executeQuery();
			while (itemSet.next()) {
				AppointmentItems item = new AppointmentItems(itemSet.getInt("itemId"), itemSet.getLong("date"), itemSet.getInt("typeId"),
						itemSet.getString("description"), itemSet.getInt("appointmentId"));
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
						rs.getString("symptons"), rs.getString("disease"), patient, rs.getLong("allocatedDate"), rs.getLong("preferredDate"), rs.getInt("isClosed"));
				appointment.setItems(getAppointmentsItems(id));
				return appointment;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public ArrayList<PersonType> getPersonType() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from personType");
			ResultSet rs = ps.executeQuery();
			ArrayList<PersonType> personTypes = new ArrayList<PersonType>();
			while (rs.next()) {
				PersonType personType = new PersonType(rs.getInt("typeId"), rs.getString("description"), rs.getString("type"));
				personTypes.add(personType);
			}
			return personTypes;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<Appointment> getAppointment() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointment order by dateCreated desc");
			ResultSet rs = ps.executeQuery();
			ArrayList<Appointment> appointments = new ArrayList<Appointment>();
			while (rs.next()) {
				int doctorId = rs.getInt("doctorId");
				int patientId = rs.getInt("patientId");
				Doctor doctor = getDoctor(doctorId);
				Patient patient = getPatient(patientId);
				ArrayList<AppointmentItems> items = getAppointmentsItems(rs.getInt("appointmentId"));
				Appointment appointment = new Appointment(rs.getInt("appointmentId"),doctor, patient, rs.getInt("isClosed"), 
						rs.getLong("preferredDate"), rs.getLong("allocatedDate"),rs.getLong("dateCreated"), items, 
						rs.getString("symptons"), rs.getString("disease"), rs.getString("title"));
				appointments.add(appointment);
			}
			return appointments;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	public int getAppointmentCount(int personId, String matchingColumn){
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement("select COUNT(*) AS rowcount from appointment where " + matchingColumn +" =?");
			ps.setInt(1, personId);

			ResultSet rs = ps.executeQuery();
			return (rs.next()) ? rs.getInt("rowcount") : 0;
		} catch (SQLException e) {			
			e.printStackTrace();
			return 0;
		}
	}
	
	public int getPatientCount(int personId){
		PreparedStatement ps;
		try {
			ps = connection.prepareStatement("select COUNT(DISTINCT patientId) AS rowcount from appointment where doctorId =?");
			ps.setInt(1, personId);

			ResultSet rs = ps.executeQuery();
			return (rs.next()) ? rs.getInt("rowcount") : 0;
		} catch (SQLException e) {			
			e.printStackTrace();
			return 0;
		}
	}
	
	public ArrayList<AppointmentItemType> getAppointmentItemType() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointmentItemType order by date desc");
			ResultSet rs = ps.executeQuery();
			ArrayList<AppointmentItemType> appointmentItemTypes = new ArrayList<AppointmentItemType>();
			while (rs.next()) {
				AppointmentItemType appointmentItemType = new AppointmentItemType(rs.getInt("typeId"), rs.getString("description"));
				appointmentItemTypes.add(appointmentItemType);
			}
			return appointmentItemTypes;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Prescription> getPrescription() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from prescription");
			ResultSet rs = ps.executeQuery();
			ArrayList<Prescription> prescriptions = new ArrayList<Prescription>();
			while (rs.next()) {
				Prescription prescription = new Prescription(rs.getInt("medicineId"), rs.getString("medicineName"), rs.getDouble("quantity"),rs.getInt("times"), rs.getInt("itemId"));
				prescriptions.add(prescription);
			}
			return prescriptions;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Lab> getLab() {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from lab");
			ResultSet rs = ps.executeQuery();
			ArrayList<Lab> labs = new ArrayList<Lab>();
			while (rs.next()) {
				Lab lab = new Lab(rs.getInt("labId"), rs.getString("labName"), rs.getString("testFor"),rs.getString("labResult"),
						rs.getString("reportFile"),rs.getInt("itemId"),getDoctor(rs.getInt("doctorId")));
				labs.add(lab);
			}
			return labs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<ArrayList<Lab>> getAllLabForLabPerson() {
		try {
			ArrayList<ArrayList<Lab>> labs = new ArrayList<ArrayList<Lab>>();
			ArrayList<Lab> openLab = new ArrayList<>();
			ArrayList<Lab> closedLab = new ArrayList<>();
			PreparedStatement ps = connection.prepareStatement("select * from lab order by labId desc");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Lab lab = new Lab(rs.getInt("labId"), rs.getString("labName"), rs.getString("testFor")
						,rs.getString("labResult"), rs.getString("reportFile"),rs.getInt("itemId"), getDoctor(rs.getInt("doctorId")));
				if(rs.getString("labResult")==null)
				{
					openLab.add(lab);
				}else
				{
					closedLab.add(lab);
				}
			}
			labs.add(openLab);
			labs.add(closedLab);
			return labs;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public int addLab(String labName, String testFor, int itemId, int doctorId) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into lab (labName, testFor, itemId, doctorId) values(?,?,?,?)");
			ps.setString(1, labName);
			ps.setString(2, testFor);
			ps.setInt(3, itemId);
			ps.setInt(4, doctorId);
			
			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public int addPrescription(String medicineName, Double quantity, int times, int itemId) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into prescription (medicineName,quantity,times,itemId) values(?,?,?,?)");
			ps.setString(1, medicineName);
			ps.setDouble(2, quantity);
			ps.setInt(3, times);
			ps.setInt(4, itemId);

			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Doctor> getDoctors() {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select personId from person where personType=2");
			ResultSet rs = ps.executeQuery();
			ArrayList<Doctor> arrayList = new ArrayList<>();
			while (rs.next()) {
				// get doctor from database
				arrayList.add(getDoctor(rs.getInt("personId")));
			}
			return arrayList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public ArrayList<Staff> getStaff() {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select personId from person where personType<>2 AND personType<>1");
			ResultSet rs = ps.executeQuery();
			ArrayList<Staff> arrayList = new ArrayList<>();
			while (rs.next()) {
				// get doctor from database
				arrayList.add(getStaff(rs.getInt("personId")));
			}
			return arrayList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public ArrayList<Patient> getPatients() {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select personId from person where personType=1");
			ResultSet rs = ps.executeQuery();
			ArrayList<Patient> arrayList = new ArrayList<>();
			while (rs.next()) {
				// get doctor from database
				arrayList.add(getPatient(rs.getInt("personId")));
			}
			return arrayList;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;

	}

	public int allocateDoctor(int appointmentId, int doctorId, long allocatedDate) {
		try {
			// update appointment
			PreparedStatement ps = connection.prepareStatement("update appointment set doctorId=?, allocatedDate=? where appointmentId=?");
			ps.setInt(1, doctorId);
			ps.setLong(2, allocatedDate);
			ps.setInt(3, appointmentId);
			int status = ps.executeUpdate();
			if(status>0)
			{
				return addItemInAppointment(appointmentId, 6, "Date Allocated :- " + DateUtils.getStringFromDate(allocatedDate));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int updateLabReport(int labReportId, String result, int itemId) {
		try {
			//get appointment item 
			PreparedStatement ps = connection.prepareStatement("SELECT appointmentId from appointmentItems where itemId=?");
			ps.setInt(1, itemId);
			ResultSet rs = ps.executeQuery();
			System.out.println("qwerty1 " + itemId);
			if(rs.next())
			{
				System.out.println("qwerty1 " + itemId);
				//create appointment item 
				int status = addItemInAppointment(rs.getInt("appointmentId"), 4, "Lab Report arrived");
				if(status>0)
				{
					//update in lab table
					ps = connection.prepareStatement("update lab set labResult=?, itemId=? where labId=?");
					ps.setString(1, result);
					ps.setInt(2, getMaxAppointmentItemId());
					ps.setInt(3, labReportId);
					
					return ps.executeUpdate();			
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	private int getMaxAppointmentItemId() {
		try {
			// update appointment
			PreparedStatement ps = connection.prepareStatement("select max(itemId) as itemId from appointmentItems");
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				return rs.getInt("itemId");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int closeAppointment(int appointmentId, String by) {
		try {
			// update appointment
			PreparedStatement ps = connection.prepareStatement(
					"update appointment set isClosed=1 where appointmentId=?");
			ps.setInt(1, appointmentId);
			if(ps.executeUpdate()>0)
			{
				return addItemInAppointment(appointmentId, 6, "Closed " + by);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
