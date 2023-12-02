package example.servlet;

import example.utils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(value = "/delete")
public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        String id = req.getParameter("delete");

        // 处理数据
        try {
            QueryRunner runner = new QueryRunner(DbUtils.getSource());
            int res = runner.execute("delete from user where id = ?", id);
            if (res > 0) {
                System.out.println("删除成功!");
                resp.sendRedirect("home");
            } else {
                System.out.println("删除失败");
                resp.sendRedirect("delete.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
