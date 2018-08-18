package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.murimoa.dto.BoardDTO;

public interface BoardMapper {
	
    @Insert("insert into tbl_board (title, contents, writer, gno) values (#{title}, #{contents}, #{writer}, #{gno})")
    public void insert(BoardDTO dto);
}
