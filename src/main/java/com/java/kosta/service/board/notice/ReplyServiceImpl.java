package com.java.kosta.service.board.notice;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.board.notice.ReplyDAO;
import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list(String bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		dao.update(vo);
	}

	@Override
	public void delete(String rno) throws Exception {
		dao.delete(rno);
	}

	@Override
	public List<ReplyVO> listPage(String bno, String bcategory, PagingDTO page) throws Exception {
		return dao.listPage(bno, bcategory, page);
	}

	@Override
	public int count(String bno,String bcategory) throws Exception {
		return dao.count(bno,bcategory);
	}
}
