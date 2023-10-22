package com.bsbmanagement.snsautobot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable() // CSRF 보호를 비활성화 (필요에 따라 활성화하실 수 있습니다.)
                .authorizeRequests()
                .antMatchers("/public/**").permitAll()  // '/public/' 경로의 모든 요청은 인증 없이 허용
                .anyRequest().authenticated() // 그 외 모든 요청은 인증 필요
                .and()
                .formLogin() // 폼 기반 로그인 활성화
                .loginPage("/login-wallet") // 로그인 페이지 경로
                .permitAll()
                .and()
                .logout() // 로그아웃 설정
                .permitAll();
    }
}