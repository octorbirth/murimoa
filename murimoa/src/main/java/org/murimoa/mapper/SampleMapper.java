package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.murimoa.dto.SampleDTO;

public interface SampleMapper {

    @Insert("insert into tbl_sample (test) values (#{test})")
    public void insert(SampleDTO dto);
    
}
