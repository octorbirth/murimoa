package org.murimoa.service;

import java.util.List;

import javax.inject.Inject;

import org.murimoa.dto.GroupDTO;
import org.murimoa.mapper.GroupMapper;
import org.springframework.stereotype.Service;

import lombok.extern.java.Log;

@Service
@Log
public class AttendServiceImpl implements AttendService{
	
	
    @Inject
    private GroupMapper groupMapper;
	
    @Override
	public List<GroupDTO> getMemberList(GroupDTO dto) {
		
		return groupMapper.getMemberList(dto);
	}

}
