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
	
	//  dao ��ü ���� 
	private static BoardDao instance = new BoardDao();
	
	// dao ��ü ��ȯ �޼ҵ� 
	public static BoardDao getinstance() {
		return instance;
	}
	
	// �Խù� ��ϳ�¥ �޼ҵ�
	public String getDate() {
		String SQL = "SELECT NOW()"; // DB�Լ� = NOW() : ���糯¥ 
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery(); // select ��� 
			
			// ����� <------------------> PreparedStatement ---> SQL -> conn �������̽� -----> DriverManager Ŭ���� ----> ����̹� ------>   SQL DB
			//	ResultSet �������̽�		    SQL ���� �������̽� 				���� �������̽�
	
			if( rs.next() ) {
				return rs.getString(1); // �����ϸ� ��¥ ��ȯ 
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
			return ""; // db ����
	}
	
	// �Խù� ��ȣ �޼ҵ� ?????  ����Ű X  => ���� �ֱ� 
		// ������ �Խù� ��ȣ �������� +1
			// ������ : ���� �Խù� ��ȣ �ڷ� ��ĭ�� -1
	public int getnext() {
		String SQL = "SELECT MAX(board_id) from Board"; // DB�Լ� = MAX(�ʵ��) : �ش� �ʵ��� �ִ밪
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				return rs.getInt(1) + 1 ;		// ������ �Խù� ��ȣ + 1 
			}
			return 1; // ù �Խù�
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // db ���� 
	}
	
	// �Խù� ��� �޼ҵ�
	public int write( BoardDto dto ) {
		
		String SQL = "insert into Board values(?,?,?,?,?,?,?,?)";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 , getnext() ); // �Խù���ȣ �޼ҵ� ȣ��
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContents() );
			pstmt.setString(4, dto.getUserID() );
			pstmt.setString(5, getDate() );	// �Խù� ��� �޼ҵ� ȣ�� 
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
	
	// �Խù� ��� ��ȸ �޼ҵ� 
	public ArrayList<BoardDto> getboardlist( int pagenumber ) {
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		try {
			String SQL = "select * from board where board_id< ? ORDER BY board_id DESC LIMIT 10";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  getnext() - (pagenumber-1)*10 );
			
			rs = pstmt.executeQuery();
			
			while( rs.next() ) { // ��� ������ŭ �ݺ�
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
	// ���� ������ ���� Ȯ�� �޼ҵ� 
	public boolean nextpage( int pagenumber) {
		String SQL = "SELECT * FROM board where board_id < ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt( 1 ,  getnext() - (pagenumber-1) * 10   );
								// �Խù� ��������ȣ = 21
								// ��) 21  -	(   1-1 ) * 10 = 21
								// ��) 21  -	(   2-1 ) * 10 = 11
								// ��) 21  - (   3-1 ) * 10 = 1
								// ��������ȣ - ( ����������-1 ) * �������� �Խù��� 
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
	

	// �Խù� ���� ��ȸ �޼ҵ� 
	public BoardDto getboard( int id) {
		
		try {
			String SQL = "select * from board where board_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			BoardDto dto = new BoardDto();
			
			if( rs.next() ) { // ��� ������ŭ �ݺ�
				
				int count = rs.getInt(8) + 1 ; 
		
				dto.setID( rs.getInt(1));
				dto.setTitle( rs.getString(2));
				dto.setContents( rs.getString(3));
				dto.setUserID( rs.getString(4));
				dto.setDate( rs.getString(5));
				dto.setAvailable( rs.getInt(6));
				dto.setFile( rs.getString(7));
				dto.setCount( count );
				
				//////////////////////// ��ȸ�� +1 �� ���� /////////////////////////////		
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
	
	
	
//	// �Խù� ���� �޼ҵ� ?? �Ϲݻ���� -> ����[ ��Ȱ��ȭ = 0  ] 
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
	
	
	// �Խù� ���� �޼ҵ� ?? �Ϲݻ���� -> ���� ������ => ������ ��ȣ ���� �ڷ� -1 ����
	public int deleteboard( int id) { 
		
		try {
			String SQL = "delete from board where board_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);	
			pstmt.executeUpdate();
			////////////////////// ������ //////////////////////////////
			
			SQL = "UPDATE board set board_id = board_id-1 where board_id > ?";
					// �����Ǵ� �Խù���ȣ ���� ū ��ȣ�� -1�� ����
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
	
	//�Խù� ���� �޼ҵ� 
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
	
	// �Խù� �˻� ��ȸ �޼ҵ� 
	public ArrayList<BoardDto> getboardsearch( String key , String keyword) {
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		try {
			
//			String SQL = "select * from board where key = keyword";
			String SQL = "select * from board where "+key+" like '%"+keyword+"%'";
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
	
			rs = pstmt.executeQuery();
			
			while( rs.next() ) { // ��� ������ŭ �ݺ�
			
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
