package org.murimoa.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.murimoa.dto.MemberDTO;
import org.murimoa.service.MemberService;
import org.murimoa.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import lombok.extern.java.Log;

@Log
public class LoginBeforeInterceptor extends HandlerInterceptorAdapter{

    @Autowired
    private MemberService service;
	
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        HttpSession session = request.getSession();
        
        // 두가지 조건 : session이 있거나 cookie가 있거나 쿠키를 쓰는지 체크
        // 먼저 Session 확인
        boolean useSession = request.getSession().getAttribute("memberDTO") != null ? true : false;

        if (useSession) {
            return true;
        }

        Cookie loginCookie = WebUtils.getCookie(request, "login");
        
         // Cookie 확인
         boolean useCookie = loginCookie != null? true: false;
         if(useCookie) {
             log.info("current user uses cookie");
             MemberDTO dto = new MemberDTO();
             dto.setMid(loginCookie.getValue());
             MemberVO vo = service.autoLogin(dto);
              if(vo != null) {
                  session.setAttribute("memberDTO", vo);
                  return true;
              }
                            
         }
         response.sendRedirect("/murimoa/login");
         return false;
    }
}
