package example.filter;

import example.entity.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(value = "/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        User username = (User) request.getSession().getAttribute("username");

        if (url.contains("login.jsp") || url.contains("login")
                || url.contains("register.jsp") || url.contains("register")
                || url.contains("update.jsp") || url.contains("update")
                || url.contains("delete.jsp") || url.contains("delete")
                || url.contains("home.jsp") || url.contains("home")) {
            filterChain.doFilter(request, response);
            return;
        } else if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        } else if (url.contains("login.css") || url.contains(".png")) {
            filterChain.doFilter(request, response);
            return;
        }
        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
