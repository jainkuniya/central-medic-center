package patient.modal;

import java.sql.Date;

import authentication.Person;

public class Patient extends modal.Person {

	private int height;
	private int weight;
	private String bloodGroup;

	public Patient(int id, String firstName, String lastName, String userName, long dob, int type, String gender,
			String address, String contactNumber, int height, int weight, String bloodGroup) {
		super(id, firstName, lastName, userName, dob, type, gender, address, contactNumber);

		this.height = height;
		this.weight = weight;
		this.setBloodGroup(bloodGroup);
	}

	public String getBloodGroup() {
		return bloodGroup;
	}

	public void setBloodGroup(String bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

}
