package org.murimoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class BoardDTO {
	private Long bno;
	private String title;
    private String contents;
    private String writer;
    private Long gno;
    private Date regdate;
    private String[] ufile;
}
