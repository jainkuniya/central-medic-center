package patient.modal;

public class DashBoard {
	
	private int noOfAppointment;
	private double bmi;
	private int noOfMedicines;
	private int percentProfile;
	private int patientCount;
	private int totalAppointment;
	private int unapproveAppointment;
	
	public DashBoard(int noOfAppointment, double bmi, int noOfMedicines, int percentProfile) {
		this.noOfAppointment = noOfAppointment;
		this.bmi = bmi;
		this.noOfMedicines = noOfMedicines;
		this.percentProfile = percentProfile;
	}

	
	public DashBoard(int noOfAppointment, int patientCount, int percentProfile) {
		this.noOfAppointment = noOfAppointment;
		this.patientCount = patientCount;
		this.percentProfile = percentProfile;
	}


	public int getPatientCount() {
		return patientCount;
	}

	public int getNoOfAppointment() {
		return noOfAppointment;
	}

	public double getBmi() {
		return bmi;
	}

	public int getNoOfMedicines() {
		return noOfMedicines;
	}

	public int getPercentProfile() {
		return percentProfile;
	}


	public int getTotalAppointment() {
		return totalAppointment;
	}


	public int getUnapproveAppointment() {
		return unapproveAppointment;
	}


}
