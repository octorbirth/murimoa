package org.murimoa.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {
    private String mid, mpw, name;
    private Date regdate;
}
