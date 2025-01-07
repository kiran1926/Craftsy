package com.craftsy.webapp.security;

import com.craftsy.webapp.database.dao.UserDAO;
import com.craftsy.webapp.database.entity.User;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class AuthenticatedUserService {

    private final UserDAO userDAO;

    public AuthenticatedUserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public String getCurrentUsername() {
        SecurityContext context = SecurityContextHolder.getContext();

        if (context != null && context.getAuthentication() != null) {
            if (context.getAuthentication() instanceof AnonymousAuthenticationToken) {
                //not logged in so return null
                return null;
            } else {
                final org.springframework.security.core.userdetails.User principal =
                        (org.springframework.security.core.userdetails.User) context.getAuthentication().getPrincipal();
                return principal.getUsername();
            }
        } else {
            return null;
        }
    }

    public User loadCurrentUser(){
        String username = getCurrentUsername();
        if( username != null){
            return userDAO.findUserByEmailIgnoreCase(username);
        }
        return null;
    }
}
