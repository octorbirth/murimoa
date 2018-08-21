package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.GroupDTO;

public interface GroupService {
	public void register(GroupDTO dto);

	public List<GroupDTO> getMyGroup();

	public GroupDTO getinfo(GroupDTO dto);

	public List<GroupDTO> getAllGroups();

	public void signup(GroupDTO dto);

	public List<GroupDTO> getSignupMember(GroupDTO dto);

	public void signupDelete(GroupDTO dto);
}
