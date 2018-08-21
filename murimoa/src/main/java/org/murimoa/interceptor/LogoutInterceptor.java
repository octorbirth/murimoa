package org.murimoa.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;
import lombok.extern.java.Log;

@Log
public class LogoutInterceptor extends HandlerInterceptorAdapter{
    
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        
        HttpSession session = request.getSession();
        
        if(session.getAttribute("memberDTO") != null) {
            log.info("기존 세션 값 삭제");
            session.removeAttribute("memberDTO");
            session.invalidate();
        }
        
        Cookie loginCookie = WebUtils.getCookie(request, "login");
        
          if (loginCookie != null) {
            log.info("기존 쿠키값 삭제");
            loginCookie.setPath("/");
            loginCookie.setMaxAge(0);
            loginCookie =  new Cookie("login", null);
            response.addCookie(loginCookie);
          }
          
        return true;
    }
}
