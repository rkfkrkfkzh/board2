package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;

public class BoardDao {
	
	private Connection conn;
	private ResultSet rs; 
	
	public BoardDao() {
		
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
	private static BoardDao instance = new BoardDao();
	
	// dao 객체 반환 메소드 
	public static BoardDao getinstance() {
		return instance;
	}
	
	// 게시물 등록날짜 메소드
	public String getDate() {
		String SQL = "SELECT NOW()"; // DB함수 = NOW() : 현재날짜 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // select 결과 
			
			// 결과물 <------------------> PreparedStatement ---> SQL -> conn 인터페이스 -----> DriverManager 클래스 ----> 드라이버 ------>   SQL DB
			//	ResultSet 인터페이스		    SQL 조작 인터페이스 				연결 인터페이스
	
			if( rs.next() ) {
				return rs.getString(1); // 성공하면 날짜 반환 
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
			return ""; // db 오류
	}
	
	// 게시물 번호 메소드 ?????  오토키 X  => 수동 넣기 
		// 마지막 게시물 번호 가져오기 +1
			// 삭제시 : 삭제 게시물 번호 뒤로 한칸씩 -1
	public int getnext() {
		String SQL = "SELECT MAX(board_id) from Board"; // DB함수 = MAX(필드명) : 해당 필드의 최대값
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getInt(1) + 1 ;		// 마지막 게시물 번호 + 1 
			}
			return 1; // 첫 게시물
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db 오류 
	}
	
	// 게시물 등록 메소드
	public int write( BoardDto dto ) {
		
		String SQL = "insert into Board values(?,?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 , getnext() ); // 게시물번호 메소드 호출
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents() );
			pstmt.setString(4, dto.getUserID() );
			pstmt.setString(5, getDate() );	// 게시물 등록 메소드 호출 
			pstmt.setInt(6, dto.getAvailable() ) ;
			pstmt.setString(7, dto.getFile() );
			pstmt.setInt(8, 0 );

			pstmt.executeUpdate();
			return 1 ;
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}
	
	// 게시물 모든 조회 메소드 
	public ArrayList<BoardDto> getboardlist( int pagenumber ) {
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		try {
			String SQL = "select * from board where board_id< ? ORDER BY board_id DESC LIMIT 10";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getnext() - (pagenumber-1)*10 );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) { // 결과 갯수만큼 반복
				BoardDto dto = new BoardDto();
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
				
				list.add(dto);
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}
	// 다음 페이지 여부 확인 메소드 
	public boolean nextpage( int pagenumber) {
		String SQL = "SELECT * FROM board where board_id < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 ,  getnext() - (pagenumber-1) * 10   );
								// 게시물 마지막번호 = 21
								// 예) 21  -	(   1-1 ) * 10 = 21
								// 예) 21  -	(   2-1 ) * 10 = 11
								// 예) 21  - (   3-1 ) * 10 = 1
								// 마지막번호 - ( 현재페이지-1 ) * 페이지당 게시물수 
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				return true;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return false;
	}
	

	// 게시물 개별 조회 메소드 
	public BoardDto getboard( int id) {
		
		try {
			String SQL = "select * from board where board_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			BoardDto dto = new BoardDto();
			
			if( rs.next() ) { // 결과 갯수만큼 반복
				
				int count = rs.getInt(8) + 1 ; 
		
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
				dto.setCount( count );
				
				//////////////////////// 조회수 +1 씩 증가 /////////////////////////////		
				SQL = "update board set board_count = ? where board_id = ?";
				pstmt = conn.prepareStatement(SQL);
				pstmt.setInt(1, count);
				pstmt.setInt(2, id);
				
				pstmt.executeUpdate();
				
				return dto;
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}
	
	
	
//	// 게시물 삭제 메소드 ?? 일반사용자 -> 삭제[ 비활성화 = 0  ] 
//	public int deleteboard( int id) { 
//		
//		try {
//			String SQL = "update board set board_available = 0 where board_id = ? ";
//			PreparedStatement pstmt = conn.prepareStatement(SQL);
//			pstmt.setInt(1, id);
//			
//			pstmt.executeUpdate();
//		
//			return 1;
//		}
//		catch (Exception e) {
//			// TODO: handle exception
//		}	
//		return -1;
//	}
	
	
	// 게시물 삭제 메소드 ?? 일반사용자 -> 삭제 했을때 => 삭제된 번호 부터 뒤로 -1 차감
	public int deleteboard( int id) { 
		
		try {
			String SQL = "delete from board where board_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);	
			pstmt.executeUpdate();
			////////////////////// 삭제후 //////////////////////////////
			
			SQL = "UPDATE board set board_id = board_id-1 where board_id > ?";
					// 삭제되는 게시물번호 보다 큰 번호는 -1씩 감소
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
			
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return -1;
	}
	
	//게시물 수정 메소드 
	public int updateboard( String title , String contents , String file ,  int id) { 
		
		try {
			String SQL = "update board set board_title = ? , board_contents=? , board_file=? where board_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, title );
			pstmt.setString(2, contents);
			pstmt.setString(3, file);
			pstmt.setInt(4, id);
			
			pstmt.executeUpdate();
		
			return 1;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return -1;
	}
	
	// 게시물 검색 조회 메소드 
	public ArrayList<BoardDto> getboardsearch( String key , String keyword) {
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		try {
			
//			String SQL = "select * from board where key = keyword";
			String SQL = "select * from board where "+key+" like '%"+keyword+"%'";
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
	
			rs = pstmt.executeQuery();
			
			while( rs.next() ) { // 결과 갯수만큼 반복
			
				BoardDto dto = new BoardDto();
				
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
				
				list.add(dto);
			}
			return list;
		}
		catch (Exception e) {
			// TODO: handle exception
		}	
		return null;
	}


	
	
	




	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
