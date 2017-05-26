package com.java.kosta.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.java.kosta.dao.board.BoardDAO;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.board.CategoryDTO;

@Service
public class BoardServiceImpl implements BoardService{

	
	@Inject
	BoardDAO bDAO;
	
	
	@Override
	public BoardDTO selectBoardOne(String bNo) throws Exception {
		return bDAO.selectBoardOne(bNo);
	}

	@Override
	public int selectBoardListTotalCount(BoardPagingDTO pagingDTO, int cateId) throws Exception{
		return bDAO.selectBoardListTotalCount(pagingDTO, cateId);
	}

	@Override
	public List<BoardDTO> selectBoardList(BoardPagingDTO pagingDTO, int cateId) throws Exception{
		return bDAO.selectBoardList(pagingDTO, cateId);
	}

	@Override
	public void insertBoard(BoardDTO boardDTO) throws Exception{
		bDAO.insertBoard(boardDTO);
	}

	@Override
	public void updateBoard(BoardDTO boardDTO) throws Exception{
		bDAO.updateBoard(boardDTO);
	}

	@Override
	public void deleteBoard(String bNo) throws Exception{
		bDAO.deleteBoard(bNo);
	}

	@Override
	public void updateViewCnt(String bNo) throws Exception{
		bDAO.updateViewCnt(bNo);
	}

/////////////////////////////////////////// 카테고리 ////////////////////////////////////////////////	
	
	@Override
	public CategoryDTO selectCategory(int cateId) throws Exception{
		return bDAO.selectCategory(cateId);
	}

	@Override
	public void deleteBoardReplyAll(String bNo) throws Exception{
		bDAO.deleteBoardReplyAll(bNo);
	}
	
	/////////////////////////////////// 좋아요////////////////////////////////////////////
	@Override
	public int searchFavorite(String userId, String bNo) {
		return bDAO.searchFavorite(userId, bNo);
	}

	@Override
	public void favoriteBoard(String userId, String bNo) {
		bDAO.favoriteBoard(userId, bNo);
	}

	@Override
	public void unfavoriteBoard(String userId, String bNo) {
		bDAO.unfavoriteBoard(userId, bNo);
	}

	@Override
	public void deleteFavorite(String bNo) throws Exception {
		bDAO.deleteFavorite(bNo);
	}

	@Override
	public int countFavorite(String bNo) {
		return bDAO.countFavorite(bNo);
	}

}
