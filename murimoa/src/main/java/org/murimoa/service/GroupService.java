package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.GroupDTO;

public interface GroupService {
	public void register(GroupDTO dto);

	public List<GroupDTO> getMyGroup();
}
