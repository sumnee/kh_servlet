package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/member/login.kh")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

    //경로 오타 잘 확인하기
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("member-id"); //form태그-input-name
		String memberPw = request.getParameter("member-pw");
		
		MemberService mService = new MemberService();
		int result = mService.selectCheckLogin(memberId, memberPw);
		System.out.println(result);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberId);
			response.sendRedirect("/index.jsp");
			//작업 종료까지 세션 유지, 앞으로가기 해도 로그인 유지됨
			
//			request는 /member/login.kh 에서만 아이디 저장됨
//			request.setAttribute("memberId", memberId);
//			RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
//			view.forward(request, response);
		} else {
			request.setAttribute("title", "로그인 실패");
			request.setAttribute("msg", "아이디와 비밀번호를 다시 확인해주세요.");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/error.jsp");
			view.forward(request, response);
		}
	}

}

