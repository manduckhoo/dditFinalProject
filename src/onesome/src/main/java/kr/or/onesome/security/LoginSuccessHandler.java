package kr.or.onesome.security;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws ServletException, IOException {

        User customUser = (User) auth.getPrincipal();
        log.warn("username : " + customUser.getUsername());
        
        request.getSession().setAttribute("userId", customUser.getUsername());

        //id가 갖고있는 권한(role) 목록
        List<String> roleNames = new ArrayList<>();
        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        log.warn("roleNames : " + roleNames);

        if (roleNames.contains("ROLE_MEMBER")) {
            response.sendRedirect("/mem/main");
            return;
        } else if (roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect("/admin/main");
            return;
        } else if (roleNames.contains("ROLE_OWNER")) {
            response.sendRedirect("/frcs/main");
            return;
        }

        super.onAuthenticationSuccess(request, response, auth);
    }
}
