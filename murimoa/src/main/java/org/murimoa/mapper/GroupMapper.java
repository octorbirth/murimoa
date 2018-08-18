package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.murimoa.dto.GroupDTO;

public interface GroupMapper {

    @Insert("insert into tbl_group (name) values (#{name})")
    public void insert(GroupDTO dto);
    
    @Select("select * from tbl_group")
    public List<GroupDTO> getMyGroup();
}
