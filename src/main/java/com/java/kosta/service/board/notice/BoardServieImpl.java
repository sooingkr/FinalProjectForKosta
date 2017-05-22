package com.java.kosta.service.board.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.board.notice.BoardDAO;
import com.java.kosta.dto.board.BoardVO;
import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.SearchDTO;

@Service
public class BoardServieImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public BoardVO read(String bno) throws Exception {
		return dao.read(bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(String bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public String getTime() {
		// TODO Auto-generated method stub
		return dao.getTime();
	}

	@Override
	public void cntUpdate(String bno) throws Exception {
		dao.cntUpdate(bno);
	}

	@Override
	public List<BoardVO> listPaging(PagingDTO page) throws Exception {
		return dao.listPaging(page);
	}

	@Override
	public int totalBoardCnt() throws Exception {
		return dao.totalBoardCnt();
	}

	@Override
	public List<BoardVO> listSearchPaing(SearchDTO search) {
		return dao.listSearchPaing(search);
	}

	@Override
	public int listSearchCount(SearchDTO search) {
		return dao.listSearchCount(search);
	}

}
