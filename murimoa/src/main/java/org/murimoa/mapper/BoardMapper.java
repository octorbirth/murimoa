package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.GroupDTO;

public interface BoardMapper {
	
    @Insert("insert into tbl_board (title, contents, writer, gno) values (#{title}, #{contents}, #{writer}, #{gno})")
    public void insert(BoardDTO dto);
    
    @Select("select * from tbl_board where gno = #{gno}")
    List<BoardDTO> getList(GroupDTO dto);
}
