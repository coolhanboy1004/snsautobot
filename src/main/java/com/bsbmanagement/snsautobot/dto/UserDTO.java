package com.bsbmanagement.snsautobot.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Builder
public class UserDTO {
    private Long id;
    private String email;
    private String name;
    private String picture;
    private String provider;
    private String providerId;
}
