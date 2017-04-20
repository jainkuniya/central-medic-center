package patient.modal;

public class DashBoard {
	public DashBoard(int noOfAppointment, double bmi, int noOfMedicines, int percentProfile) {
		super();
		this.noOfAppointment = noOfAppointment;
		this.bmi = bmi;
		this.noOfMedicines = noOfMedicines;
		this.percentProfile = percentProfile;
	}
	private int noOfAppointment;
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
	private double bmi;
	private int noOfMedicines;
	private int percentProfile;
	
}
