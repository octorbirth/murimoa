package org.murimoa.service;

import java.util.List;

import org.murimoa.dto.BoardDTO;
import org.murimoa.dto.Criteria;
import org.murimoa.dto.GroupDTO;

public interface BoardService {

	public void register(BoardDTO dto);

	public List<BoardDTO> list(Criteria dto);
	
	public BoardDTO get(BoardDTO dto);
	
    public void delete(BoardDTO dto);
    
    public void modify(BoardDTO dto);
    
    public List<String> getFileList(Long bno);

}
