package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.GroupDTO;

public interface GroupService {
	public void register(GroupDTO dto);

	public List<GroupDTO> getMyGroup(GroupDTO dto);

	public GroupDTO getinfo(GroupDTO dto);

	public List<GroupDTO> getAllGroups();

	public void signup(GroupDTO dto);

	public List<GroupDTO> getSignupMember(GroupDTO dto);

	public void signupDelete(GroupDTO dto);

	public List<GroupDTO> getGroupMember(GroupDTO dto);

	public void groupMemberDelete(GroupDTO dto);

	public void newMember(GroupDTO dto);
}
