package student.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import student.model.dao.StudentDao;
import student.model.vo.Student;

public class StudentService {
	
	private StudentDao stdDao;
	
	public StudentService() {
		stdDao = new StudentDao();
	}

	/**
	 * 학생 로그인
	 * @param student
	 * @return sOne
	 */
	public Student selectCheckLogin(Student student) {
		Connection conn = JDBCTemplate.getConnection();
		Student sOne = stdDao.selectCheckLogin(conn, student);
		return sOne;
	}
	
	/**
	 * 아이디로 조회
	 * @param studentId
	 * @return student
	 */
	public Student printOneById(String studentId) {
		Student student = null;
		Connection conn = JDBCTemplate.getConnection();
		student = stdDao.selectOneById(conn, studentId);
		return student;
	}
	
	public int registerStudent(Student student) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		result = stdDao.insertStudent(conn, student);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

}
