package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.murimoa.dto.ReplyDTO;

public interface ReplyMapper {
    @Insert ("insert into tbl_reply (reply, replyer, bno) values (#{reply}, #{replyer}, #{bno})" )
    public void insert(ReplyDTO dto);
    
    @Select("select * from tbl_reply where bno = #{bno} order by regdate desc")
    public List<ReplyDTO> listReply(ReplyDTO dto);
    
    @Delete("delete from tbl_reply where rno = #{rno}")
    public void delete(Integer rno);
    
    @Update("update tbl_reply set reply=#{reply} where rno= #{rno}")
    public void update(ReplyDTO dto);
}
