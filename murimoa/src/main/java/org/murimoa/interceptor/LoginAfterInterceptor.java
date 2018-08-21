package org.murimoa.interceptor;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.murimoa.vo.MemberVO;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.java.Log;

@Log
public class LoginAfterInterceptor extends HandlerInterceptorAdapter{
	
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if(request.getMethod().equals("GET")) { // GET 방식의 접근은 무시
            return;
        }
        
        Map<String, Object> map = modelAndView.getModel();  
        
        if(map.get("memberDTO") != null) { // 로그인 성공했다면 not null
            
            request.getSession().setAttribute("memberDTO", map.get("memberDTO")); // session발급
            
            String auto = request.getParameter("auto");
            if (auto != null) { // 자동 로그인 유무 (쿠키 발급 유무)
                MemberVO vo = (MemberVO)map.get("memberDTO");
                Cookie loginCookie = new Cookie("login", vo.getMid());
                loginCookie.setMaxAge(12*60*60); // 12시간 지속
                response.addCookie(loginCookie);
            }
            response.sendRedirect("/murimoa/main");
            return;
        }
    }
}
