package example.servlet;

import example.entity.User;
import example.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 设置字符集防止乱码
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        // 获取表单参数
        String name = req.getParameter("username");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        System.out.println("请求参数name:" + name + "------password:" + password);

        // 根据用户名查询用户
        QueryRunner runner = new QueryRunner(DbUtils.getSource());

        // 查询
        List<User> users = null;
        try {
            users = runner.query("select * from user where name = ? and password = ? and role = ?",
                    new BeanListHandler<>(User.class), name, password, role);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // 判断用户密码是否正确
        boolean isSuccess = false;
        if (users != null && users.size() > 0) {
            User user = users.get(0);
            if (user.getPassword().equals(password) && user.getRole().equals(role)) {
                isSuccess = true;
            }
        }

        // 根据登陆结果决定显示的内容
        if (isSuccess) {
            req.getSession().setAttribute("user", name);
            req.getSession().setAttribute("role", role);
            req.getRequestDispatcher("home").forward(req, resp);
        } else {
            req.getSession().setAttribute("Error", "❗ Please select the correct role!");
            resp.sendRedirect("login.jsp");
        }
    }
}
