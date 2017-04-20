package modal;

import utils.DateUtils;

public class Person {

	private int id;
	private String firstName;
	private String lastName;
	private String userName;
	private long dob;
	private int type;
	private String gender;
	private String address;
	private String contactNumber;
	
	

	public Person(int id, String firstName, String lastName, String userName, long dob, int type, String gender,
			String address, String contactNumber) {
	 
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.dob = dob;
		this.type = type;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
	}
	
	

	public Person(String firstName, String lastName, String userName, long dob, int type, String gender, String address,
			String contactNumber) {
		
		this.firstName = firstName;
		this.lastName = lastName;
		this.userName = userName;
		this.dob = dob;
		this.type = type;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setDob(long dob) {
		this.dob=dob;
	}
	
	public String getStringDob() {
		return DateUtils.getStringFromDate(dob);
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getId() {
		return id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserType() {
		return type;
	}

	public void setUserType(int userType) {
		this.type = userType;
	}

	public String getAge(){
		return String.valueOf(DateUtils.getYearsFromLong(dob)) + " years";
	}

	 
}
