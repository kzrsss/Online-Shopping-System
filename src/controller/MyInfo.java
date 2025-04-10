package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.UserDao;

@WebServlet("/MyInfoPost")
public class MyInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MyInfo() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("name");
        UserDao userDao = new UserDao();
        String[] userInfo = userDao.Get_CompleteUserInfo(name);
        request.setAttribute("userInfo", userInfo);

        // 转发请求到JSP页面
        request.getRequestDispatcher("myinfo.jsp").forward(request, response);
    }
}