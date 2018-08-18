package org.murimoa.service;

import javax.inject.Inject;
import org.murimoa.dto.BoardDTO;
import org.springframework.stereotype.Service;
import org.murimoa.mapper.BoardMapper;

import lombok.extern.java.Log;

@Service
@Log
public class BoardServiceImpl implements BoardService{
	
	@Inject
    private BoardMapper BoardMapper;
	
	@Override
	public void register(BoardDTO dto) {
		BoardMapper.insert(dto);
	}

}
