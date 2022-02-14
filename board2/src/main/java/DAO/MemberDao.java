package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.BoardDto;
import DTO.MemberDto;

public class MemberDao {

	private Connection conn;
	private ResultSet rs;

	public MemberDao() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@db202110262237_high?TNS_ADMIN=/Users/imhyojin/Wallet_DB202110262237", "ADMIN",
					"Dkfdktek36270113");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	// dao 객체 생성
	private static MemberDao instance = new MemberDao();

	// dao 객체 반환 메소드
	public static MemberDao getinstance() {
		return instance;
	}

	// 회원가입 메소드
	public int signup(MemberDto dto) {

		String SQL = "insert into member values(?,?,?,?,?,?)";
		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, dto.getMember_id());
			pstmt.setString(2, dto.getMember_password());
			pstmt.setString(3, dto.getMember_name());
			pstmt.setString(4, dto.getMember_phone());
			pstmt.setString(5, dto.getMember_email());
			pstmt.setString(6, dto.getMember_address());

			pstmt.executeUpdate();
			return 1; // 회원가입 성공
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1; // DB 오류 => 기본키 중복 => 존재하는 아이디
	}

	// 로그인 메소드
	public int login(String id, String password) {

		String SQL = "select * from member where member_id =? and member_password = ?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, password);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return 1;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return -1;
	}

}
