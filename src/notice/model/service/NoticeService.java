package notice.model.service;

import java.sql.Connection;
import java.util.List;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	
	private NoticeDao nDao;
	
	public NoticeService() {
		nDao = new NoticeDao();
	}

	public int registerNotice(Notice notice) {
		Connection conn = JDBCTemplate.getConnection();
		int result = nDao.insertNotice(conn, notice);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public List<Notice> selectAllNotice() {
		Connection conn = JDBCTemplate.getConnection();
		List<Notice> nList = nDao.selectAllNotice(conn);
		return nList;
	}

}
