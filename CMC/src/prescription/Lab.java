package prescription;

import staff.modal.Doctor;

public class Lab {

	private int labId;
	private String labName;
	private String testFor;
	private String labResult;
	private String reportFile;
	private int itemId;
	private Doctor doctor;
	
	public Lab(int labId, String labName, String testFor, String labResult, String reportFile, int itemId, Doctor doctor) {
		this.labId = labId;
		this.labName = labName;
		this.testFor = testFor;
		this.labResult = labResult;
		this.reportFile = reportFile;
		this.itemId = itemId;
		this.doctor = doctor;
	}
	
	
	
	public Lab(String labName, String testFor, String labResult, String reportFile, int itemId, Doctor doctor) {
		this.labName = labName;
		this.testFor = testFor;
		this.labResult = labResult;
		this.reportFile = reportFile;
		this.itemId = itemId;
		this.doctor = doctor;
	}



	public int getLabId() {
		return labId;
	}
	public String getLabName() {
		return labName;
	}
	public void setLabName(String labName) {
		this.labName = labName;
	}
	public String getTestFor() {
		return testFor;
	}
	public void setTestFor(String testFor) {
		this.testFor = testFor;
	}
	public String getLabResult() {
		return labResult;
	}
	public void setLabResult(String labResult) {
		this.labResult = labResult;
	}
	public String getReportFile() {
		return reportFile;
	}
	public void setReportFile(String reportFile) {
		this.reportFile = reportFile;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}



	public Doctor getDoctor() {
		return doctor;
	}



	public void setDoctorId(Doctor doctor) {
		this.doctor = doctor;
	}
	
}
