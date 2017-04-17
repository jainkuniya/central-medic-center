package prescription;

public class Medicine {

	private int medicineId;
	private String medicineString;
	public Medicine(int medicineId, String medicineString) {
		 
		this.medicineId = medicineId;
		this.medicineString = medicineString;
	}
	public int getMedicineId() {
		return medicineId;
	}
	public void setMedicineId(int medicineId) {
		this.medicineId = medicineId;
	}
	public String getMedicineString() {
		return medicineString;
	}
	public void setMedicineString(String medicineString) {
		this.medicineString = medicineString;
	}
}
