package org.murimoa.service;

import javax.inject.Inject;

import org.murimoa.dto.MemberDTO;
import org.murimoa.mapper.MemberMapper;
import org.murimoa.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Service
@Log
public class MemberServiceImpl implements MemberService{
	
    @Inject
    private MemberMapper mapper;
    
    @Override
    public void register(MemberDTO dto) {
        mapper.register(dto);
    }
    
    @Override
    public MemberVO login(MemberDTO dto) {
        return mapper.login(dto);
    }
    
    @Override
    public MemberVO autoLogin(MemberDTO dto) {
        return mapper.autoLogin(dto);
    }
    
    @Transactional
    @Override
    public MemberVO updateName(MemberDTO dto) {
        mapper.updateName(dto);
        return mapper.updatedUser(dto);
    }
	
}
