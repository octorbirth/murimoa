package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.murimoa.dto.BoardDTO;

public interface AttachMapper {
	
    public void insert(String[] ufiles);
    
    @Select("select * from tbl_attach where bno = #{bno}")
    public List<String> getfiles(Long bno);
    
    @Delete("delete from tbl_attach where bno = #{bno}")
    public void delete(BoardDTO dto);
}
