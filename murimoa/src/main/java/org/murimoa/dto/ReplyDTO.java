package org.murimoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
    private Integer rno, bno;
    private String reply, replyer;
    private Date regdate;
}
