package notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeRemoveServlet
 */
@WebServlet("/notice/remove")
public class NoticeRemoveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeRemoveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeNum = request.getParameter("notice-no") != null ? request.getParameter("notice-no") : "0";
		int noticeNo = Integer.parseInt(noticeNum);
		NoticeService nService = new NoticeService();
		int result = nService.deleteNotice(noticeNo);
		if(result > 0) {
			response.sendRedirect("/notice/list");
		} else {
			request.setAttribute("title", "공지사항 삭제 실패");
			request.setAttribute("msg", "공지사항이 삭제되지 않았습니다.");
			request.getRequestDispatcher("/WEB-INF/views/common/error.jsp").forward(request, response);
		}
	}

}
