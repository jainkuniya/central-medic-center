package database;

import java.sql.*;
import java.util.ArrayList;

import modal.Appointment;
import modal.AppointmentItems;
import modal.Person;
import patient.modal.Patient;

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
				result[0] = rs.getInt("type");
				result[1] = rs.getInt("id");
			} else {
				result[0] = 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public Patient getPatient(int id) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement("select * from person where id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				// get patient from database
				ps = connection.prepareStatement("select * from patient where id=?");
				ps.setInt(1, id);
				ResultSet rsPatient = ps.executeQuery();
				if (rsPatient.next()) {
					System.out.println(id);
					return new Patient(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"),
							rs.getString("userName"), rs.getLong("dob"), rs.getInt("type"), rs.getString("gender"),
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

	public int createAppointment(Appointment appointment) {
		try {
			// get person from database
			PreparedStatement ps = connection.prepareStatement(
					"insert into appointment (patientId, dateCreated, symptons, disease, preferredDate) values(?,?,?,?,?)");
			ps.setInt(1, appointment.getPatientId());
			ps.setLong(2, System.currentTimeMillis());
			ps.setString(3, appointment.getSymptons());
			ps.setString(4, appointment.getDisease());
			ps.setLong(5, System.currentTimeMillis());

			int status = ps.executeUpdate();
			// create an item
			if (status > 0) {
				return addItemInAppointment(status, 1, "Created");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int addItemInAppointment(int id, int type, String description) {
		try {
			PreparedStatement ps = connection.prepareStatement(
					"insert into appointmentItems (appointmentId,type, date, description) values(?,?,?,?)");
			ps.setInt(1, id);
			ps.setInt(2, 1);
			ps.setLong(3, System.currentTimeMillis());
			ps.setString(4, description);

			return ps.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}

	public ArrayList<Appointment> getAppointments(int patientId) {
		ArrayList<Appointment> arrayList = new ArrayList<Appointment>();
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointment where patientId=?");
			ps.setInt(1, patientId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");

				Appointment appointment = new Appointment(id, rs.getString("symptons"));
				arrayList.add(appointment);
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
			PreparedStatement ps = connection.prepareStatement("select * from appointmentItems where id=?");
			ps.setInt(1, id);
			ResultSet itemSet = ps.executeQuery();
			while (itemSet.next()) {
				AppointmentItems item = new AppointmentItems(itemSet.getLong("date"), itemSet.getInt("type"),
						itemSet.getString("dexcription"));
				items.add(item);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public Appointment getDetailedAppointment(int appointmentId) {
		try {
			PreparedStatement ps = connection.prepareStatement("select * from appointment where id=?");
			ps.setInt(1, appointmentId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				int id = rs.getInt("id");

				Appointment appointment = new Appointment(id, rs.getString("symptons"));
				appointment.setItems(getAppointmentsItems(id));
				return appointment;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
