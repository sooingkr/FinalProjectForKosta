package com.java.kosta.service.board;

import java.util.List;
import java.util.Map;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardReplyDTO;
import com.java.kosta.dto.board.CategoryDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

public interface BoardService {
	
//////////////////////////////// 게시판 /////////////////////////////////////
	
	/** 게시글 정보 조회해서 가져온다  */
	public BoardDTO selectBoardOne(String bNo) throws Exception;

	/** 전체 레코드 갯수 가져옴 */
	public int selectBoardListTotalCount(BoardPagingDTO pagingDTO, int cateId) throws Exception;
	
	/** 게시판 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectBoardList(BoardPagingDTO pagingDTO, int cateId) throws Exception;
	
	/** 게시글 삽입한다 */
	public void insertBoard(BoardDTO boardDTO) throws Exception;	// 반환값 : insert된 row 갯수

	/** 게시글 수정 */
	public void updateBoard(BoardDTO boardDTO) throws Exception;
	
	/** 게시글 삭제 */
	public void deleteBoard(String bNo) throws Exception;
	
	/** 게시판 조회수 증가 */
	public void updateViewCnt(String bNo) throws Exception;
	
	//////////////////////////////// 카테고리 //////////////////////////////////////
	
	/** 카테고리명 조회 */
	public CategoryDTO selectCategory(int cateId) throws Exception;


	/** 게시글 삭제 시 해당 댓글 모두 삭제*/
	public void deleteBoardReplyAll(String bNo);
	
	//////////////////////////////// 좋아요////////////////////////////////////////////
	/** 좋아요 조회 */
	public int searchFavorite(String userId, String bNo);

	/** 좋아요 */
	public void favoriteBoard(String userId,String bNo);

	/** 좋아요 취소 */
	public void unfavoriteBoard(String userId, String bNo);
	
	/** 테이블 삭제시 좋아요 테이블 데이터 삭제 */
	public void deleteFavorite(String bNo);
}
