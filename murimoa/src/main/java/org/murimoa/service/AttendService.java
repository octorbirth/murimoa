package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.AttendDTO;
import org.murimoa.dto.GroupDTO;

public interface AttendService {

	public List<GroupDTO> getMemberList(GroupDTO dto);

	public void registerAttend(AttendDTO dto);

	public List<AttendDTO> getAttendList(GroupDTO dto);

	public List<AttendDTO> getAttendMemberList(AttendDTO dto);

	public void remove(AttendDTO dto);

}
