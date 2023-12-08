package example.servlet;

import example.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/add")
public class AddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String name = req.getParameter("username");
        String password = req.getParameter("password");
        Integer age = Integer.valueOf(req.getParameter("age"));
        String favorites = req.getParameter("favorites");
        String phone = req.getParameter("phone");
        String gender = req.getParameter("gender");
        String role = req.getParameter("role");

        System.out.println("请求参数name:" + name + "------password:" + password + "------age:" + age +
                "------favorites:" + favorites + "------phone:" + phone +
                "------gender:" + gender + "------role:" + role);

        // 处理数据
        try {
            // 据用户名查询用户
            QueryRunner runner = new QueryRunner(DbUtils.getSource());
            int res = runner.execute("insert into user(name,password,age,favorites,phone,gender,role) values(?,?,?,?,?,?,?)"
                    , name, password, age, favorites, phone, gender, role);
            if (res > 0) {
                System.out.println("插入成功!");
                resp.sendRedirect("home");
            } else {
                System.out.println("插入失败，返回登录页面!");
                resp.sendRedirect("add.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
