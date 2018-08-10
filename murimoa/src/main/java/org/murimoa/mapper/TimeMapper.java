package org.murimoa.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
	
    // 현재 시간 출력
    @Select("select now()")
    public String getTime();
}
