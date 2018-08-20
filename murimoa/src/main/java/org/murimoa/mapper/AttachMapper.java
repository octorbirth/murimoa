package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface AttachMapper {
	
    public void insert(String[] ufiles);
    
    @Select("select * from tbl_attach where bno = #{bno}")
    public List<String> getfiles(Long bno);
}
