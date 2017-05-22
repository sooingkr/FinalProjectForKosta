package com.java.kosta.service.board.notice;

import java.util.List;

import com.java.kosta.dto.board.PagingDTO;
// ReplyService 인터페이스
import com.java.kosta.dto.board.ReplyVO;

public interface ReplyService {
	// 페이징이 적용된 댓글 리스트 가져오기
	public List<ReplyVO> listPage(String bno, String bcategory,PagingDTO page) throws Exception;

	// 해당 게시글에 해당하는 댓글 전체 개수 가져오기
	public int count(String bno,String bcategory) throws Exception;

	// 댓글 리스트 가져오기
	public List<ReplyVO> list(String bno) throws Exception;

	// 댓글 작성하기
	public void create(ReplyVO vo) throws Exception;

	// 댓글 수정하기
	public void update(ReplyVO vo) throws Exception;

	// 댓글 삭제하기
	public void delete(String rno) throws Exception;
}
