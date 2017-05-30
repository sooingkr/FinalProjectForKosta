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
		// board 테이블 수정
		bDAO.updateBoard(boardDTO);
		
		// boardfile 테이블  해당 게시글의 파일 삭제
		bDAO.deleteAttach(boardDTO.getbNo());
		
		String[] files = boardDTO.getFiles();
		
		if(files == null){
			System.out.println("updateBoard : 파일이 존재하지 않음");
			return;
		}
		
		for (String fileName : files) {
			// 업로드 파일 다시 삽입
			bDAO.addAttach(boardDTO.getbNo(), fileName);
		}
		
		
	}

	@Override
	public void deleteBoard(String bNo) throws Exception{
		// 댓글 table의 bno에 해당하는 댓글들 모두 삭제
		bDAO.deleteBoardReplyAll(bNo);

		// 좋아요 테이블에 해당 게시글 데이터 삭제
		bDAO.deleteFavorite(bNo);
		
		// 업로드 파일 테이블 삭제
		bDAO.deleteAttach(bNo);
		
		// 게시글 삭제
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
	public void deleteFavorite(String bNo){
		bDAO.deleteFavorite(bNo);
	}

	@Override
	public int countFavorite(String bNo) {
		return bDAO.countFavorite(bNo);
	}

	// 게시글 + 파일업로드 삽입
	@Override
	public void insertBoardAttach(BoardDTO boardDTO) {
		bDAO.insertBoard(boardDTO);	// board 테이블에 게시글 삽입
		System.out.println("게시글 삽입 성공");
		
		String[] files = boardDTO.getFiles();
		
		if(files == null){
			System.out.println("insertBoardAttach : 파일이 존재하지 않음");
			return;
		}
		
		for (String fileName : files ) {
			System.out.println("DB 삽입 "+ boardDTO.getbNo() +", " + fileName);
			bDAO.addAttach(boardDTO.getbNo(), fileName);	// board_attach 테이블에 첨부파일 삽입
		}
		System.out.println("파일 테이블 삽입 성공");
	}

	@Override
	public List<String> selectAttach(String bNo) {
		return bDAO.selectAttach(bNo);
	}

	@Override
	public void deleteBoardAttach(String bNo) throws Exception {
		bDAO.deleteAttach(bNo);
	}


}
