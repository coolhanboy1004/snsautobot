package com.bsbmanagement.snsautobot.controller;

import com.bsbmanagement.snsautobot.dto.UserDTO;
import com.bsbmanagement.snsautobot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.Collections;
import java.util.Map;
import java.util.HashMap;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/user")
    public Map<String, Object> user(HttpSession session) {
        String email = (String) session.getAttribute("userEmail");
        if (email == null) {
            return Collections.singletonMap("error", "Not authenticated");
        }
        
        // 데이터베이스에서 사용자 정보 조회
        UserDTO user = userService.findByEmail(email);
        
        if (user == null) {
            // 세션에 있는 정보로 응답
            Map<String, Object> userDetails = new HashMap<>();
            userDetails.put("name", session.getAttribute("loggedInUser"));
            userDetails.put("email", email);
            userDetails.put("picture", session.getAttribute("userPicture"));
            return userDetails;
        }
        
        // 데이터베이스에서 조회한 정보로 응답
        Map<String, Object> userDetails = new HashMap<>();
        userDetails.put("id", user.getId());
        userDetails.put("name", user.getName());
        userDetails.put("email", user.getEmail());
        userDetails.put("picture", user.getPicture());
        userDetails.put("provider", user.getProvider());
        
        return userDetails;
    }
    
    @GetMapping("/api/user/check")
    public Map<String, Object> checkLoginStatus(HttpSession session) {
        String email = (String) session.getAttribute("userEmail");
        Map<String, Object> response = new HashMap<>();
        
        if (email != null) {
            response.put("loggedIn", true);
            response.put("name", session.getAttribute("loggedInUser"));
            response.put("email", email);
            response.put("picture", session.getAttribute("userPicture"));
        } else {
            response.put("loggedIn", false);
        }
        
        return response;
    }
}