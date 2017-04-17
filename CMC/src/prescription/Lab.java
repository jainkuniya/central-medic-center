package prescription;

public class Lab {

	private int labId;
	private String labName;
	
	public Lab(int labId, String labName) {
		this.labId = labId;
		this.labName = labName;
	}
	public int getLabId() {
		return labId;
	}
	public void setLabId(int labId) {
		this.labId = labId;
	}
	public String getLabName() {
		return labName;
	}
	public void setLabName(String labName) {
		this.labName = labName;
	}
	
}
