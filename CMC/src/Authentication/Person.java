package authentication;

import java.sql.Date;

public class Person {

	private String firstName;
	private String lastName;
	private Date dob;
	private String gender;
	private String address;
	private int contactNumber;
	private int userId;
	private String userName;
	private String password;
	private String userType;
	
	public Person(String firstName, String lastName, Date dob, String gender, String address, int contactNumber,
			int userId, String userName, String password, String userType) {
	 
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.gender = gender;
		this.address = address;
		this.contactNumber = contactNumber;
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.userType = userType;
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

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
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

	public int getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(int contactNumber) {
		this.contactNumber = contactNumber;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	 

	 
}
