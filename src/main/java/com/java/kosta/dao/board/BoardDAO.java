package com.java.kosta.dao.board;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

public interface BoardDAO {
	
	/** 게시글 한건 조회해서 가져온다  */
	public BoardDTO selectBoardOne(String bNo);

	/** 전체 레코드 갯수 가져옴 */
	public int selectBoardListTotalCount(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("cateId")int cateId);	// 파라미터 두개 이상일 경우는 @Param 어노테이션 사용해야함!!!!
	
	/** 게시판 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectBoardList(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("cateId")int cateId);
	
	/** 게시글 삽입한다 */
	public void insertBoard(BoardDTO boardDTO);	

	/** 게시글 수정 */
	public void updateBoard(BoardDTO boardDTO);
	
	/** 게시판 조회수 증가 */
	public void updateViewCnt(String bNo);
	
	/** 게시글 삭제 */
	public void deleteBoard(String bNo);

	/** 카테고리명 조회 */
	public CategoryDTO selectCategory(int cateId);

	/** 게시글 삭제 시 해당 댓글 모두 삭제*/
	public void deleteBoardReplyAll(String bNo);
}
