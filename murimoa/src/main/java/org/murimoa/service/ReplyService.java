package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.ReplyDTO;

public interface ReplyService {
	public void register(ReplyDTO dto);
    public List<ReplyDTO> getListReply(ReplyDTO dto);
    public void remove(Integer rno);
    public void update(ReplyDTO dto);
}
