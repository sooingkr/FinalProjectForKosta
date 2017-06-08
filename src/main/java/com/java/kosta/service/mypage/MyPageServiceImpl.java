package com.java.kosta.service.mypage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.mypage.MyPageDAO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Inject
	MyPageDAO mDAO;

	@Override
	public int selectMyFavoriteListTotalCount(BoardPagingDTO pagingDTO, String userId) {
		return mDAO.selectMyFavoriteListTotalCount(pagingDTO, userId);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(String bno, String userId) {
//		return mDAO.selectMyFavoriteList(bno, userId);
//	}

	@Override
	public int searchFavorite(String userId, String bNo) {
		return mDAO.searchFavorite(userId, bNo);
	}

	@Override
	public void unfavoriteBoard(String userId, String bNo) {
		mDAO.unfavoriteBoard(userId, bNo);
	}

	@Override
	public int countMyFavorite(String bNo) {
		return mDAO.countMyFavorite(bNo);
	}

	@Override
	public List<BoardDTO> searchFavoriteList(String userId) {
		return mDAO.searchFavoriteList(userId);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(BoardDTO boardDTO, String userId) {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public List<BoardDTO> selectMyFavoriteList(String bno, String userId) {
		return mDAO.selectMyFavoriteList(bno, userId);
	}

	@Override
	public List<BoardDTO> selectWritedList(String userId) throws Exception {
		return mDAO.selectWritedList(userId);
	}


	@Override
	public int selectMyBoardListCount(BoardPagingDTO pagingDTO, String userId) {
		return mDAO.selectMyBoardListCount(pagingDTO, userId);
	}

}
