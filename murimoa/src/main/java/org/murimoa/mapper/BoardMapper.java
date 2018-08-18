package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.GroupDTO;

public interface BoardMapper {
	
    @Insert("insert into tbl_board (title, contents, writer, gno) values (#{title}, #{contents}, #{writer}, #{gno})")
    public void insert(BoardDTO dto);
    
    @Select("select * from tbl_board where gno = #{gno}")
    public List<BoardDTO> getList(GroupDTO dto);
    
    @Select("select * from tbl_board where bno = #{bno} and gno = #{gno}")
    public BoardDTO getBoard(BoardDTO dto);
    
    @Delete("delete from tbl_board where bno = #{bno}")
    public void remove(BoardDTO dto);
    
    @Update("update tbl_board set title = #{title}, contents = #{contents} where bno = #{bno}")
    void update(BoardDTO dto);
}
