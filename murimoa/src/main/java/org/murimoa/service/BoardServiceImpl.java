package org.murimoa.service;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.Criteria;
import org.murimoa.dto.GroupDTO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.murimoa.mapper.AttachMapper;
import org.murimoa.mapper.BoardMapper;

import lombok.extern.java.Log;

@Service
@Log
public class BoardServiceImpl implements BoardService{
	
	@Inject
    private BoardMapper boardMapper;
	
    @Inject
    private AttachMapper attachMapper;
	
    @Transactional
	@Override
	public void register(BoardDTO dto) {
		boardMapper.insert(dto);
        String[] ufiles = dto.getUfile();
        if(ufiles != null) {
            attachMapper.insert(ufiles);
        }
	}

	@Override
	public List<BoardDTO> list(Criteria cri) {
		cri.setTotal(boardMapper.getTotal(cri));
		return boardMapper.getList(cri);
	}

	@Override
	public BoardDTO get(BoardDTO dto) {
		 return boardMapper.getBoard(dto);
	}
	
    @Transactional
    @Override
    public void delete(BoardDTO dto) {
    	boardMapper.remove(dto);
        attachMapper.delete(dto);
        return;
    }
    
    @Transactional
    @Override
    public void modify(BoardDTO dto) {
    	
    	boardMapper.update(dto);
    	
        attachMapper.delete(dto); 
        
        Long bno = dto.getBno();
        String[] ufiles = dto.getUfile();
        if(ufiles != null) {
            Arrays.stream(ufiles).forEach((name)->{ 
                attachMapper.modInsert(name, bno); 
            });
        }
        return;
    }
    
    @Override
    public List<String> getFileList(Long bno) {
        return attachMapper.getfiles(bno);
    }

}
