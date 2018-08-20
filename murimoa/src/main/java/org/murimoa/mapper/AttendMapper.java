package org.murimoa.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.murimoa.dto.AttendDTO;

public interface AttendMapper {

	
    @Insert("insert into tbl_lecture (gno) values (#{gno})")
	public void registerLecture(AttendDTO dto);

    @Insert("insert into tbl_attend (lno, mid, attend) values (LAST_INSERT_ID(),  #{mid}, #{attend})")
	public void registerAttend(@Param("mid") String groupMember, @Param("attend") String attend);

}
