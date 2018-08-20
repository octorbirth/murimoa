package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.AttendDTO;
import org.murimoa.dto.GroupDTO;

public interface AttendService {

	public List<GroupDTO> getMemberList(GroupDTO dto);

	public void registerAttend(AttendDTO dto);

}
