package org.murimoa.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.Criteria;
import org.murimoa.dto.GroupDTO;
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

	@Override
	public List<BoardDTO> list(Criteria cri) {
		cri.setTotal(BoardMapper.getTotal(cri));
		return BoardMapper.getList(cri);
	}

	@Override
	public BoardDTO get(BoardDTO dto) {
		 return BoardMapper.getBoard(dto);
	}
	
    @Override
    public void delete(BoardDTO dto) {
    	BoardMapper.remove(dto);
        return;
    }
    
    @Override
    public void modify(BoardDTO dto) {
    	
    	BoardMapper.update(dto);
        return;
    }

}
