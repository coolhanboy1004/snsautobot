package com.bsbmanagement.snsautobot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // CSRF 보호를 비활성화 (필요에 따라 활성화하실 수 있습니다.)
                .authorizeRequests()
                .antMatchers("/public/**", "/resources/**", "/", "/oauth2/**", "/login/**").permitAll()  // 인증 없이 허용할 경로
                .anyRequest().authenticated() // 그 외 모든 요청은 인증 필요
                .and()
                .formLogin() // 폼 기반 로그인 활성화
                .loginPage("/login-wallet") // 로그인 페이지 경로
                .permitAll()
                .and()
                .logout() // 로그아웃 설정
                .logoutRequestMatcher(new AntPathRequestMatcher("/logout")) // 로그아웃 URL 설정
                .logoutSuccessUrl("/") // 로그아웃 성공 후 리다이렉트 경로
                .invalidateHttpSession(true) // 세션 무효화
                .deleteCookies("JSESSIONID") // 쿠키 삭제
                .permitAll();
    }
}