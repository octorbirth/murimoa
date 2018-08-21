package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.murimoa.dto.MemberDTO;
import org.murimoa.vo.MemberVO;

public interface MemberMapper {
	
    @Insert("insert into tbl_member (mid, mpw, name) values (#{mid}, #{mpw}, #{name})")
    public void register(MemberDTO dto);
    
    @Select("select * from tbl_member where mid = #{mid} and mpw = #{mpw}")
    public MemberVO login(MemberDTO dto);
    
    @Select("select * from tbl_member where mid = #{mid}")
    public MemberVO autoLogin(MemberDTO dto);
}
