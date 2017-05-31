package com.java.kosta.dao.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

public interface MyPageDAO {
	

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

}
