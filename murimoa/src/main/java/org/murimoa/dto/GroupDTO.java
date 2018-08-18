package org.murimoa.dto;

import java.util.Date;

import lombok.Data;

@Data
public class GroupDTO {
    private Long gno;
    private String name;
    private Date regdate;
    private Integer memberCount;
}