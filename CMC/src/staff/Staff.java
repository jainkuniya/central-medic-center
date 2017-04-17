package staff;

import java.sql.Date;

import authentication.Person;

public class Staff extends Person {

	public Staff(String firstName, String lastName, Date dob, String gender, String address, int contactNumber,
			int userId, String userName, String password, String userType) {
		super(firstName, lastName, dob, gender, address, contactNumber, userId, userName, password, userType);
		// TODO Auto-generated constructor stub
	}

}
