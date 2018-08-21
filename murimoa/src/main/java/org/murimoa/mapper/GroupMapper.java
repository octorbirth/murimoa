package org.murimoa.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.murimoa.dto.GroupDTO;

public interface GroupMapper {

    @Insert("insert into tbl_group (name) values (#{name})")
    public void insert(GroupDTO dto);
    
    @Select("select * from tbl_group")
    public List<GroupDTO> getMyGroup();
    
    @Select("select * from tbl_group where gno = #{gno}")
    public GroupDTO getGroupInfo(GroupDTO dto);
    
    @Select("select count(*) memberCount from tbl_group_member where gno = #{gno}")
    public Integer getGroupMemberCount(GroupDTO dto);

    @Select("select * from tbl_group_member where gno = #{gno}")
	public List<GroupDTO> getMemberList(GroupDTO dto);

	public List<GroupDTO> getAllGroups();

	@Insert("insert into tbl_group_signup (gno, mid) values (#{gno}, #{mid})")
	public void signup(GroupDTO dto);

	@Select("select * from tbl_group_signup where gno = #{gno}")
	public List<GroupDTO> getSignupMember(GroupDTO dto);

	@Delete("delete from tbl_group_signup where gno = #{gno} and mid = #{mid}")
	public void signupDelete(GroupDTO dto);
 
}
