package com.baizhi.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class IsLoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session=req.getSession();
        String flag = (String) session.getAttribute("loginSuccess");
        if("loginSuccess".equals(flag)){
            chain.doFilter(request, response);
        }else{
            HttpServletResponse hsr=(HttpServletResponse)response;
            hsr.sendRedirect("/cmfz_kjh/back/login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
