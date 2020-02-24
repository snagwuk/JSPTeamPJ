package util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.User;

public class AdminCheckFilter implements Filter
{
    
    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
            FilterChain chain) throws IOException, ServletException
    {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpSession session = request.getSession(false);
        User user = (User)session.getAttribute("authUser");
        if (session == null || session.getAttribute("authUser") == null || user.getAdmin() == 0 )
        {
            HttpServletResponse response = (HttpServletResponse) res;
            response.sendRedirect(request.getContextPath() + "/member/main");
        }
        else
        {
            chain.doFilter(req, res);
        }
    }
    
    @Override
    public void init(FilterConfig config) throws ServletException
    {
        
    }
    
    @Override
    public void destroy()
    {
        
    }
    
}