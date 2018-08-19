package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.ReplyDTO;
import org.murimoa.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyServiceImpl implements ReplyService{

    @Autowired
    private ReplyMapper mapper;
   
    @Override
    public void register(ReplyDTO dto) {
        mapper.insert(dto);
    }
    
    @Override
    public List<ReplyDTO> getListReply(ReplyDTO dto) {        
        return mapper.listReply(dto);
    }
    
    @Override
    public void remove(Integer rno) {
        mapper.delete(rno);
    }
    
    @Override
    public void update(ReplyDTO dto) {
        mapper.update(dto);
    }
}
