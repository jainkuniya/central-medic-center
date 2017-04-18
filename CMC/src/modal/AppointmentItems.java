package modal;

import utils.DateUtils;

public class AppointmentItems {
	private long date;
	private int type;
	private String description;
	private int appointmentId;
	
	public AppointmentItems(long date, int type, String description) {
		 
		this.setDate(date);
		this.setType(type);
		this.setDescription(description);
	}

	public long getDate() {
		return date;
	}
	
	public String getStringDate() {
		return DateUtils.getStringFromDate(date);
	}

	public void setDate(long date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
	
	
}
