package modal;

public class AppointmentItemType {
	
	private int typeId;
	private String description;
	
	public AppointmentItemType(int typeId, String description) {
		this.typeId = typeId;
		this.description = description;
	}
	
	
	
	public AppointmentItemType(String description) {
		this.description = description;
	}



	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getTypeId() {
		return typeId;
	}
	
	
	
}
