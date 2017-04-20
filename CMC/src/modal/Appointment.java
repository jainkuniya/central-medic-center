package modal;

import java.util.ArrayList;

import patient.modal.Patient;
import staff.modal.Doctor;
import utils.DateUtils;

public class Appointment {
	private int id;
	private Doctor doctor;
	private Patient patient;
	private int isClosed;
	private long preferredDate;
	private long allocatedDate;
	private long dateCreated;
	private ArrayList<AppointmentItems> items;
	private String symptons;
	private String disease;
	private String title;
	
	public Appointment(int id, Doctor doctor, Patient patient, int isClosed, long preferredDate, long allocatedDate,
			long dateCreated, ArrayList<AppointmentItems> items, String symptons, String disease, String title) {
		this.id = id;
		this.doctor = doctor;
		this.patient = patient;
		this.isClosed = isClosed;
		this.preferredDate = preferredDate;
		this.allocatedDate = allocatedDate;
		this.dateCreated = dateCreated;
		this.items = items;
		this.symptons = symptons;
		this.disease = disease;
		this.title = title;
	}

	public Appointment(int id, Doctor doctor, int isClosed, long dateCreated, ArrayList<AppointmentItems> items) {
		this.id = id;
		this.doctor= doctor;
		this.isClosed = isClosed;
		this.dateCreated = dateCreated;
		this.items = items;
	}

	public Appointment(Patient patient, String symptons, String disease, long preferredDate, String title) {
		this.setPatient(patient);
		this.setIsClosed(0);
		this.setDateCreated(System.currentTimeMillis());
		this.setSymptons(symptons);
		this.setDisease(disease);
		this.preferredDate = preferredDate;
		this.title = title;
	}

	public Appointment(int id, String symptons) {
		this.setId(id);
		this.setSymptons(symptons);
	}

	public Appointment(int id, Doctor doctor, String title, long dateCreated, Patient patient) {
		this.id=id;
		this.doctor= doctor;
		this.title=title;
		this.dateCreated = dateCreated;
		this.patient=patient;
	}

	public Appointment(int id, Doctor doctor, String title, long dateCreated, String symptons, String disease, Patient patient) {
		this.id=id;
		this.doctor= doctor;
		this.title=title;
		this.dateCreated = dateCreated;
		this.symptons=symptons;
		this.disease =disease;
		this.patient = patient;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
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
	
	public String getStringDateCreated() {
		return DateUtils.getDateTtimeSringFromDate(dateCreated);
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

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
}
