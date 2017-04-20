package modal;

public class PersonType {

	private int typeId;
	private String description;
	private String type;
	
	public PersonType(int typeId, String description, String type) {
		this.typeId = typeId;
		this.description = description;
		this.type = type;
	}
	
	
	public PersonType(String description, String type) {
		this.description = description;
		this.type = type;
	}


	public int getTypeId() {
		return typeId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
