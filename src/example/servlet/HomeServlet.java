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

@WebServlet(value = "/home")
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String userSearch = req.getParameter("userSearch");

        QueryRunner runner = new QueryRunner(DbUtils.getSource());

        try {
            String sql = "select * from user";
            String sqlSearch = "select * from user where name like ?";
            if (userSearch != null && !userSearch.equals("")) {
                List<User> users = runner.query(sqlSearch, new BeanListHandler<>(User.class), ("%" + userSearch + "%"));
                // 打印查询出的数据
                System.out.println(users);
                for (User user : users) {
                    System.out.println(user);
                }
                req.setAttribute("list", users);
            } else {
                List<User> users = runner.query(sql, new BeanListHandler<>(User.class));
                // 打印查询出的数据
                System.out.println(users);
                for (User user : users) {
                    System.out.println(user);
                }
                req.setAttribute("list", users);
            }
            req.getRequestDispatcher("home.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
