package com.java.kosta.service.board.notice;

import java.util.List;

import com.java.kosta.dto.board.BoardVO;
import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.SearchDTO;

public interface BoardService {

	public String getTime();

	// 페이징 적용된 게시글 목록 불러오기
	// 검색+페이징이 적용된 게시글 목록 불러오기
	public List<BoardVO> listSearchPaing(SearchDTO search);

	// 검색어에 해당하는 전체 게시글 수 가져오기
	public int listSearchCount(SearchDTO search);

	public List<BoardVO> listPaging(PagingDTO page) throws Exception;

	// 전체 게시글 수 불러오기
	public int totalBoardCnt() throws Exception;

	// 글 추가
	public void create(BoardVO vo) throws Exception;

	// 읽기
	public BoardVO read(String bno) throws Exception;

	// 조회수 증가
	public void cntUpdate(String bno) throws Exception;

	// 수정
	public void update(BoardVO vo) throws Exception;

	// 삭제
	public void delete(String bno) throws Exception;

	// 게시글 목록 조회
	public List<BoardVO> list() throws Exception;

}
