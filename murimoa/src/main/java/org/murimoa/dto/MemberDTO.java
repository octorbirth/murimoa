package org.murimoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class MemberDTO {
    private String mid, mpw, name;
    private Date regdate;
}
