package member.model.service;

import java.sql.Connection;

import common.JDBCTemplate;
import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	private MemberDao mDao;
	
	public MemberService() {
		mDao = new MemberDao();
	}
	
//	service에서는 리턴값, 커밋롤백 확인해서 오류 줄이기
	
	/**
	 * 회원 로그인
	 * @param memberId
	 * @param memberPw
	 * @return result
	 */
	public int selectCheckLogin(String memberId, String memberPw) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		result = mDao.selectCheckLogin(conn, memberId, memberPw);
		return result;
	}

	/**
	 * 아이디로 조회
	 * @param memberId
	 * @return member
	 */
	public Member printOneById(String memberId) {
		Member member = null;
		Connection conn = JDBCTemplate.getConnection();
		member = mDao.selecOneById(conn, memberId);
		return member;
	}

	/**
	 * 회원 가입
	 * @param member
	 * @return result
	 */
	public int registerMember(Member member) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		result = mDao.insertMember(conn, member);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}	
		return result;
	}

	/**
	 * 회원정보 수정
	 * @param member
	 * @return result
	 */
	public int updateMember(Member member) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		result = mDao.updateMember(conn, member);
		if(result >0 ) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	/**
	 * 회원 탈퇴
	 * @param memberId
	 * @return result
	 */
	public int deleteMember(String memberId) {
		int result = 0;
		Connection conn = JDBCTemplate.getConnection();
		result = mDao.deleteMember(conn, memberId);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	
}
