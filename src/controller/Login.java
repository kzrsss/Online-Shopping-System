package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.UserDao;
import model.entity.User;

/**
 * Servlet implementation class LoginPost
 */
@WebServlet("/LoginPost")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Login() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		UserDao dao = new UserDao();
		User user = dao.Get_User(name);
		if (user != null && user.getPwd().equals(pwd)) {
			response.sendRedirect("goods2.jsp?loginSuccess=true");
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			//session.setAttribute("sort", "1");
		} else {
			response.sendRedirect("index.jsp?loginSuccess=false");
		}
	}
}