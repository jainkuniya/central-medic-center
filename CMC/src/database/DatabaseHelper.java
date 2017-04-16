package database;
import java.sql.*;

import modal.Person;
import patient.modal.Patient;

public class DatabaseHelper {

	Connection connection;

	public DatabaseHelper(){
		connection = DatabaseConnector.getDatabase();
	}

	public int[] getPersonType(String userName, String password){
		int result[] = {-1, 0};
		
		if(connection==null) {
			return result;
		}

		try {
			PreparedStatement ps =connection.prepareStatement
					
					("select * from person where userName=? and password=?");

			ps.setString(1, userName);
			ps.setString(2, password);
			
			ResultSet rs =ps.executeQuery();
			if(rs.next()) {
				result[0] = rs.getInt("type");
				result[1] = rs.getInt("id");
			}else {
				result[0] = 0;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	public Patient getPatient(int id) {
		try{
			//get person from database
			PreparedStatement ps =connection.prepareStatement					
					("select * from person where id=?");
			ps.setInt(1, id);
			ResultSet rs =ps.executeQuery();
			if(rs.next())
			{				
				//get patient from database
				ps = connection.prepareStatement("select * from patient where id=?");
				ps.setInt(1, id);
				ResultSet rsPatient = ps.executeQuery();
				if(rsPatient.next())
				{System.out.println(id);
					return new Patient(rs.getInt("id"), rs.getString("firstName"), rs.getString("lastName"), rs.getString("userName"),
							rs.getString("dob"), rs.getInt("type"), rs.getString("gender"), rs.getString("address"), rs.getString("contactNumber"), 
							rsPatient.getInt("weight"), rsPatient.getInt("height"), rsPatient.getString("bloodGroup"));
				}
			}
			//get patient from database
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		return null;
	}
}
