package modal;

import java.util.ArrayList;

public class Appointment {
	private int id;
	private int doctorId;
	private int patientId;
	private int isClosed;
	private long preferredDate;
	private long allocatedDate;
	private long dateCreated;
	private ArrayList<AppointmentItems> items;
	private String symptons;
	private String disease;

	public Appointment(int id, int doctorId, int isClosed, long dateCreated, ArrayList<AppointmentItems> items) {
		this.setId(id);
		this.setDoctorId(doctorId);
		this.setIsClosed(isClosed);
		this.setDateCreated(dateCreated);
		this.items = items;
	}

	public Appointment(int patientId, String symptons, String disease, long preferredDate) {
		this.setPatientId(patientId);
		this.setIsClosed(0);
		this.setDateCreated(System.currentTimeMillis());
		this.setSymptons(symptons);
		this.setDisease(disease);
		this.preferredDate = preferredDate;
	}

	public Appointment(int id, String symptons) {
		this.setId(id);
		this.setSymptons(symptons);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	public String getSymptons() {
		return symptons;
	}

	public void setSymptons(String symptons) {
		this.symptons = symptons;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public long getPreferredDate() {
		return preferredDate;
	}

	public void setPreferredDate(long preferredDate) {
		this.preferredDate = preferredDate;
	}

	public long getAllocatedDate() {
		return allocatedDate;
	}

	public void setAllocatedDate(long allocatedDate) {
		this.allocatedDate = allocatedDate;
	}

	public ArrayList<AppointmentItems> getItems() {
		return items;
	}

	public void setItems(ArrayList<AppointmentItems> items) {
		this.items = items;
	}

	public long getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(long dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getIsClosed() {
		return isClosed;
	}

	public void setIsClosed(int isClosed) {
		this.isClosed = isClosed;
	}

	public int getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
}
