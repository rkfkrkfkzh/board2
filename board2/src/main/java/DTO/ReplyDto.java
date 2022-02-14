package DTO;

public class ReplyDto {
	
	int reply_num;
	int reply_boardid;
	String reply_userid;
	String reply_contents;
	
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public int getReply_boardid() {
		return reply_boardid;
	}
	public void setReply_boardid(int reply_boardid) {
		this.reply_boardid = reply_boardid;
	}
	public String getReply_userid() {
		return reply_userid;
	}
	public void setReply_userid(String reply_userid) {
		this.reply_userid = reply_userid;
	}
	public String getReply_contents() {
		return reply_contents;
	}
	public void setReply_contents(String reply_contents) {
		this.reply_contents = reply_contents;
	}
	

}
