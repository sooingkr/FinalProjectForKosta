package com.java.kosta.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.transaction.TransactionDTO;

public interface MyPageDAO {
	// 구매결정 삽입
	public void insertTransaction(TransactionDTO dto);
	
	/** 구매결정 모달창 존재하는 회원 아이디인지 체크 */
	public int existIdCheck(TransactionDTO dto);
	
	/** 전체 레코드 갯수 가져옴 */
	public int selectMyFavoriteListTotalCount(@Param("pagingDTO")BoardPagingDTO pagingDTO, @Param("userId")String userId);	
	
	/** 나의좋아요 정보를 조회해서 List로 가져온다  */
	public List<BoardDTO> selectMyFavoriteList(@RequestParam("bNo")String bno, @Param("userId")String userId);
	
	/** 좋아요 조회 */
	public int searchFavorite(@Param("userId") String userId, @Param("bNo") String bNo);
	
	/** 좋아요 취소 */
	public void unfavoriteBoard(@Param("userId") String userId, @Param("bNo") String bNo);

	/**좋아요 개수 조회 */
	public int countMyFavorite(String bNo);
	
	public List<BoardDTO> searchFavoriteList(@Param("userId")String userId);

	/**마이페이지 내가 쓴 목록 가져오기*/
	public List<BoardDTO> selectWritedList(String userId);
	
	/**마이페이지 내가 쓴 목록 갯수 가져오기*/
	public int selectMyBoardListCount(@Param("pagingDTO")BoardPagingDTO pagingDTO ,@Param("userId")String userId);
}
