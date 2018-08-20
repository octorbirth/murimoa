package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.murimoa.dto.AttendDTO;
import org.murimoa.dto.GroupDTO;

public interface AttendMapper {

	
    @Insert("insert into tbl_lecture (gno) values (#{gno})")
	public void registerLecture(AttendDTO dto);

    @Insert("insert into tbl_attend (lno, mid, attend) values (LAST_INSERT_ID(),  #{mid}, #{attend})")
	public void registerAttend(@Param("mid") String groupMember, @Param("attend") String attend);

    @Select("select * from tbl_lecture where gno = #{gno}")
	public List<AttendDTO> getAttendList(GroupDTO dto);

    @Select("select * from tbl_attend where lno = #{lno}")
	public List<AttendDTO> getAttendMemberList(AttendDTO dto);

    @Delete("delete from tbl_attend where lno = #{lno}")
	public void deleteAttend(AttendDTO dto);
    
    @Delete("delete from tbl_lecture where lno = #{lno}")
	public void deleteLecture(AttendDTO dto);

    @Update("update tbl_attend set attend=#{attend} where mid = #{mid} and lno = #{lno}")
	public void updateAttend(@Param("attend") String attend, @Param("mid")String mid, @Param("lno") Long lno);

	public List<AttendDTO> countAttend(AttendDTO dto);

}
