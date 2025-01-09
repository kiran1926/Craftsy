package com.craftsy.webapp.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{

        http.csrf(csrf -> csrf.disable());

        http.authorizeHttpRequests((authorize) -> authorize
                // Require authentication for /customer/** endpoints
                .requestMatchers("/artisan/**").authenticated()
                .requestMatchers("/checkout/**").authenticated()
                // Allow all other requests without authentication
                .anyRequest().permitAll()
        );

        //login
        http.formLogin(formLogin -> formLogin
                .loginPage("/login/login")
                //this is for after login redirect to homepage
//                .successForwardUrl("/homepage")
                .loginProcessingUrl("/login/loginSubmit"));

        //logout
        http.logout(formLogout -> formLogout
                .invalidateHttpSession(true)
                .logoutUrl("/login/logout")
                .logoutSuccessUrl("/")
                .deleteCookies("username", "JSESSIONID"));

        http.exceptionHandling(exception -> exception
                .accessDeniedPage("/error/404"));

        return http.build();
    }

    // password encoder dependency injection
    @Bean(name = "passwordEncoder")
    public PasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    //adding authentication dependency injection
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}
