package org.murimoa.service;

import org.murimoa.dto.MemberDTO;
import org.murimoa.vo.MemberVO;

public interface MemberService {
	public void register(MemberDTO dto);

	public MemberVO login(MemberDTO dto);
	
	public MemberVO autoLogin(MemberDTO dto);
	
    public MemberVO updateName(MemberDTO dto);
}
