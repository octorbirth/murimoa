package org.murimoa.service;

import java.util.List;

import javax.inject.Inject;

import org.murimoa.dto.AttendDTO;
import org.murimoa.dto.GroupDTO;
import org.murimoa.mapper.AttendMapper;
import org.murimoa.mapper.GroupMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.java.Log;

@Service
@Log
public class AttendServiceImpl implements AttendService{
	
    @Inject
    private GroupMapper groupMapper;
    
    @Inject
    private AttendMapper attendMapper;
	
    @Override
	public List<GroupDTO> getMemberList(GroupDTO dto) {
		    	
		return groupMapper.getMemberList(dto);
	}

    @Transactional
	@Override
	public void registerAttend(AttendDTO dto) {
		
    	attendMapper.registerLecture(dto);
    	
    	String[] groupMemberList = dto.getGroupMemberList();
    	String[] attendList = dto.getAttendList();
    	
    	for(int i=0; i<groupMemberList.length;i++) {
    		attendMapper.registerAttend(groupMemberList[i], attendList[i]);
    	}
		
	}

}
