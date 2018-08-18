package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.murimoa.dto.GroupDTO;

public interface GroupMapper {

    @Insert("insert into tbl_group (name) values (#{name})")
    public void insert(GroupDTO dto);
}
