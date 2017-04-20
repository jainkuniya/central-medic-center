package staff.modal;

import modal.Person;

 

public class Doctor extends Person{
	
	private String degree;
	private String specialization;
	
	public Doctor(int id, String firstName, String lastName, String userName, long dob, int type, String gender,
			String address, String contactNumber, String degree, String specialization) {
		super(id, firstName, lastName, userName, dob, type, gender, address, contactNumber);
		this.degree = degree;
		this.specialization = specialization;
	}
	
	
	
	public Doctor(String firstName, String lastName, String userName, long dob, int type, String gender, String address,
			String contactNumber, String degree, String specialization) {
		super(firstName, lastName, userName, dob, type, gender, address, contactNumber);
		this.degree = degree;
		this.specialization = specialization;
	}



	public String getDegree() {
		return (degree==null) ? "" : degree;
	}
	/**
	 * @param degree the degree to set
	 */
	public void setDegree(String degree) {
		this.degree = degree;
	}
	/**
	 * @return the specialization
	 */
	public String getSpecialization() {
		return (specialization==null) ? "" : specialization;
	}
	/**
	 * @param specialization the specialization to set
	 */
	public void setSpecialization(String specialization) {
		this.specialization = specialization;
	}

	 

	 

	
}
