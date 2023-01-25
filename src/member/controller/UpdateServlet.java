package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/member/update.kh")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//비번 이메일 주소 번호 취미 수정 / 아이디로 조회
		
		request.setCharacterEncoding("UTF-8");
		String memberId = request.getParameter("member-id");
		String memberPw = request.getParameter("member-pw");
		String memberEmail = request.getParameter("member-email");
		String memberAddress = request.getParameter("member-address");
		String memberPhone = request.getParameter("member-phone");
		String memberHobby = request.getParameter("member-hobby");
		Member member = new Member(memberId, memberPw, memberEmail, memberPhone, memberAddress, memberHobby);
		MemberService mService = new MemberService();
		int result = mService.updateMember(member);
		if(result > 0) {
			response.sendRedirect("/index.jsp");
		} else {
			request.setAttribute("title", "정보수정 실패");
			request.setAttribute("msg", "회원정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("\"/WEB-INF/views/common/error.jsp\"").forward(request, response);
		}
	}

}
