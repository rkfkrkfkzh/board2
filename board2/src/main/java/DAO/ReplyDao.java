package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.ReplyDto;

public class ReplyDao {

	private Connection conn;
	private ResultSet rs; 
	
	public ReplyDao() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@db202110262237_high?TNS_ADMIN=/Users/imhyojin/Wallet_DB202110262237", "ADMIN",
					"Dkfdktek36270113");
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	//  dao 객체 생성 
	private static ReplyDao instance = new ReplyDao();
	
	// dao 객체 반환 메소드 
	public static ReplyDao getinstance() {
		return instance;
	}
	
	// 댓글 등록 메소드 
	public int re_write( ReplyDto replyDto ) {
		String SQL = "insert into reply ( reply_boardid , reply_userid , reply_contents ) " + "values(?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 , replyDto.getReply_boardid()  );
			pstmt.setString(2, replyDto.getReply_userid() );
			pstmt.setString(3, replyDto.getReply_contents() );
			pstmt.executeUpdate();
			return 1 ;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

	// 해당 게시물의 댓글 출력 메소드 
	public ArrayList<ReplyDto> getreplylist( int id ){
		
		
		String SQL = "select * from reply where reply_boardid = ? ORDER BY reply_num DESC ";
		
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt( 1 , id);
			
			rs = pstmt.executeQuery(); // select
			
			
			ArrayList<ReplyDto> list = new ArrayList<>();
			
			while( rs.next() ) {
				
				ReplyDto replyDto = new ReplyDto();
				replyDto.setReply_userid( rs.getString(3));
				replyDto.setReply_contents( rs.getString(4));
				
				list.add(replyDto);
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		} 
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 댓글 삭제 메소드 
	
	
	
}
