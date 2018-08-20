package org.murimoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AttendDTO {
	private String[] attendMemberList;
	private String[] groupMemberList;
	private String[] attendList;
    private Long gno, lno;
    private String mid;
    private String attend;
	private Date regdate;
}
