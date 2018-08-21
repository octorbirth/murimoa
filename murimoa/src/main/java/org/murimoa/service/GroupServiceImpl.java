package org.murimoa.service;

import java.util.List;

import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.mapper.GroupMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class GroupServiceImpl implements GroupService{
	
    @Inject
    private GroupMapper mapper;
    
	@Override
	public void register(GroupDTO dto) {
		 mapper.insert(dto);
	}

	@Override
	public List<GroupDTO> getMyGroup() {
		return mapper.getMyGroup();
	}

	@Override
	public GroupDTO getinfo(GroupDTO dto) {
		GroupDTO info = mapper.getGroupInfo(dto);
		info.setMemberCount(mapper.getGroupMemberCount(dto));
		return info;
	}

	@Override
	public List<GroupDTO> getAllGroups() {
		return mapper.getAllGroups();
	}

	@Override
	public void signup(GroupDTO dto) {
		mapper.signup(dto);
		
	}

	@Override
	public List<GroupDTO> getSignupMember(GroupDTO dto) {
		return mapper.getSignupMember(dto);
	}

	@Override
	public void signupDelete(GroupDTO dto) {
		mapper.signupDelete(dto);
	}

	@Override
	public List<GroupDTO> getGroupMember(GroupDTO dto) {
		return mapper.getMemberList(dto);
	}

	@Override
	public void groupMemberDelete(GroupDTO dto) {
		mapper.groupMemberDelete(dto);
	}

	@Override
	public void newMember(GroupDTO dto) {
		mapper.signupDelete(dto);
		mapper.newMember(dto);
	}

}
