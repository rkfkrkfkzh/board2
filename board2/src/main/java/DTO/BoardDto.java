package DTO;

public class BoardDto {
	
	
	private int ID;			// �Խù� ��ȣ 
	private String Title; 	// �Խù� ����
	private String Contents; // �Խù� ���� 
	private String userID; 	// ���� = �ۼ��� 
	private String Date; 	// �Խù� �ۼ��� 
	private int Available; 	// �Խù� ǥ�ÿ��� 
	private String File;		// �Խù� ÷�� ����
	private int count;		// �Խù� ��ȸ�� 
	
	// get , set �޼ҵ� 
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getContents() {
		return Contents;
	}
	public void setContents(String contents) {
		Contents = contents;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getDate() {
		return Date;
	}
	public void setDate(String date) {
		Date = date;
	}
	public int getAvailable() {
		return Available;
	}
	public void setAvailable(int available) {
		Available = available;
	}
	public String getFile() {
		return File;
	}
	public void setFile(String file) {
		File = file;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	

	
	
	


}
