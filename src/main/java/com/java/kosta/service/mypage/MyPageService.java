package com.java.kosta.service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.transaction.TransactionDTO;

public interface MyPageService {
	
	public void insertTransaction(TransactionDTO dto);
	
	// 구매결정 모달창 존재하는 아이디인지 검색
	public int existIdCheck(TransactionDTO dto);
	
	/** 전체 레코드 갯수 가져옴 */
	public int selectMyFavoriteListTotalCount(BoardPagingDTO pagingDTO, String userId);	
	
	/** 나의좋아요 정보를 조회해서 List로 가져온다  */
//	public List<BoardDTO> selectMyFavoriteList(BoardPagingDTO pagingDTO, String userId);
//	public List<BoardDTO> selectMyFavoriteList(BoardDTO boardDTO, String userId);
	public List<BoardDTO> selectMyFavoriteList(String bno, String userId);

	/** 좋아요 조회 */
	public int searchFavorite( String userId,  String bNo);
	
	/** 좋아요 취소 */
	public void unfavoriteBoard(String userId, String bNo);

	/**좋아요 개수 조회 */
	public int countMyFavorite(String bNo);
	
	public List<BoardDTO> searchFavoriteList(String userId);

	/**내가 쓴 목록  조회*/
	public List<BoardDTO> selectWritedList(String userId) throws Exception;

	/**내가 쓴 목록 갯수 조회*/
	public int selectMyBoardListCount(BoardPagingDTO pagingDTO, String userId);
}
