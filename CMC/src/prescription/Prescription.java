package prescription;

public class Prescription {

	private int medicineId;
	private String medicineName;
	private double quantity;
	private int times;
	private int itemId;
	
	public Prescription(int medicineId, String medicineName, double quantity, int times, int itemId) {
		this.medicineId = medicineId;
		this.medicineName = medicineName;
		this.quantity = quantity;
		this.times = times;
		this.itemId = itemId;
	}
	
	
	
	public Prescription(String medicineName, double quantity, int times, int itemId) {
		this.medicineName = medicineName;
		this.quantity = quantity;
		this.times = times;
		this.itemId = itemId;
	}



	public int getMedicineId() {
		return medicineId;
	}
	public String getMedicineName() {
		return medicineName;
	}
	public void setMedicineName(String medicineName) {
		this.medicineName = medicineName;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
}
