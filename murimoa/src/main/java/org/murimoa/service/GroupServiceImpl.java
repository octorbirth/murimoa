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

}
