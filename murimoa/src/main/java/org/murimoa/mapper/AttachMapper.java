package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;

public interface AttachMapper {
	
    public void insert(String[] ufiles);
}
