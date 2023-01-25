package student.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import student.model.vo.Student;

public class StudentDao {

	public Student selectCheckLogin(Connection conn, Student student) {
		String sql = "SELECT * FROM STUDENT_TBL WHERE STUDENT_ID= ? AND STUDENT_PW= ?";
		Student sOne = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getStudentId());
			pstmt.setString(2, student.getStudentPw());
			ResultSet rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sOne = new Student();
				sOne.setStudentId(rset.getString("STUDENT_ID"));
				sOne.setStudentPw(rset.getString("STUDENT_PW"));
				sOne.setStudentName(rset.getString("STUDENT_NAME"));
				sOne.setStudentEmail(rset.getString("STUDENT_EMAIL"));
				sOne.setStudentPhone(rset.getString("STUDENT_PHONE"));
				sOne.setStudentAddr(rset.getString("STUDENT_ADDR"));
				sOne.setStudentGender(rset.getString("STUDENT_GENDER"));
				sOne.setStudentDate(rset.getDate("STUDENT_DATE"));
			}
			rset.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return sOne;
	}
	
	/**
	 * 아이디로 조회 DAO
	 * @param conn
	 * @param studentId
	 * @return
	 */
	public Student selectOneById(Connection conn, String studentId) {
		String sql = "SELECT * FROM STUDENT_TBL WHERE STUDENT_ID= ?";
		Student student = null;
		
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, studentId);
			ResultSet rset = pstmt.executeQuery();
			
			if(rset.next()) {
				student = new Student();
				student.setStudentId(rset.getString("STUDENT_ID"));
				student.setStudentPw(rset.getString("STUDENT_PW"));
				student.setStudentName(rset.getString("STUDENT_NAME"));
				student.setStudentEmail(rset.getString("STUDENT_EMAIL"));
				student.setStudentPhone(rset.getString("STUDENT_PHONE"));
				student.setStudentAddr(rset.getString("STUDENT_ADDR"));
				student.setStudentGender(rset.getString("STUDENT_GENDER"));
				student.setStudentDate(rset.getDate("STUDENT_DATE"));
			}
			rset.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return student;
	}
	
	/**
	 * 학생 가입 DAO
	 * @param conn
	 * @param student
	 * @return
	 */
	public int insertStudent(Connection conn, Student student) {
		String sql = "INSERT INTO STUDENT_TBL VALUES(?,?,?,?,?,?,?,DEFAULT)";
		int result = 0;	
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student.getStudentId());
			pstmt.setString(2, student.getStudentPw());
			pstmt.setString(3, student.getStudentName());
			pstmt.setString(4, student.getStudentEmail());
			pstmt.setString(5, student.getStudentPhone());
			pstmt.setString(6, student.getStudentAddr());
			pstmt.setString(7, student.getStudentGender());
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}


}
