package DTO;

public class BoardDto {
	
	
	private int ID;			// 게시물 번호 
	private String Title; 	// 게시물 제목
	private String Contents; // 게시물 내용 
	private String userID; 	// 세션 = 작성자 
	private String Date; 	// 게시물 작성일 
	private int Available; 	// 게시물 표시여부 
	private String File;		// 게시물 첨부 파일
	private int count;		// 게시물 조회수 
	
	// get , set 메소드 
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
