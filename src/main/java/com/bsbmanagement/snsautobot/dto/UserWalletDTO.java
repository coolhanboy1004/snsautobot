package com.bsbmanagement.snsautobot.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserWalletDTO {
    private int id;
    private String nickname;
    private String wallet_address;
    private java.sql.Timestamp created_at;
}