package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.murimoa.dto.MemberDTO;

public interface MemberMapper {
	
    @Insert("insert into tbl_member (mid, mpw, name) values (#{mid}, #{mpw}, #{name})")
    public void register(MemberDTO dto);
}
