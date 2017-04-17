package modal;

import java.util.ArrayList;

public class Appointment {
	private int id;
	private int doctorId;
	private int isClosed;
	private long dateCreated;
	private ArrayList<AppointmentItems> items;
	
	public Appointment(int id, int doctorId, int isClosed, long dateCreated, ArrayList<AppointmentItems> items) {
		super();
		this.id = id;
		this.doctorId = doctorId;
		this.isClosed = isClosed;
		this.dateCreated = dateCreated;
		this.items = items;
	}
}
