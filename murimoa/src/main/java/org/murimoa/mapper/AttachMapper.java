package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;

public interface AttachMapper {
	
    @Insert("insert into tbl_attach (name, bno) values (#{name}, LAST_INSERT_ID() )")
    public void insert(String name);
}
