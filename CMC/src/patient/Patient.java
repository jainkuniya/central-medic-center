package patient;

import java.sql.Date;

import authentication.Person;

public class Patient extends Person {

	public Patient(String firstName, String lastName, Date dob, String gender, String address, int contactNumber,
			int userId, String userName, String password, String userType) {
		super(firstName, lastName, dob, gender, address, contactNumber, userId, userName, password, userType);
		// TODO Auto-generated constructor stub
	}
	private int height;
	private int weight;
	private String bloodGroup;
	
	
	
	
}
