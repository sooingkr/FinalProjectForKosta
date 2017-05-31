package com.java.kosta.service.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

public interface MyPageService {
	
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


}
