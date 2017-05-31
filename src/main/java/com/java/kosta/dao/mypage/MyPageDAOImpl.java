package com.java.kosta.dao.mypage;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;

@Repository
public class MyPageDAOImpl implements MyPageDAO{
	
	@Inject
	SqlSession sqlSession;
	
	private final static String NameSpace ="com.java.kosta.dao.mypage.MyPageDAO";

	@Override
	public int selectMyFavoriteListTotalCount(BoardPagingDTO pagingDTO, String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pagingDTO", pagingDTO);
		map.put("userId", userId);
		return sqlSession.selectOne(NameSpace + ".selectMyFavoriteListTotalCount",map);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(BoardPagingDTO pagingDTO, String userId) {
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("pagingDTO", pagingDTO);
//		map.put("userId", userId);
//		return sqlSession.selectList(NameSpace+".selectMyFavoriteList", map);
//	}

	@Override
	public int searchFavorite(String userId, String bNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("userId", userId);
		return sqlSession.selectOne(NameSpace + ".searchFavorite", map);
	}

	@Override
	public void unfavoriteBoard(String userId, String bNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("bNo", bNo);
		map.put("userId", userId);
		sqlSession.delete(NameSpace + ".unfavoriteBoard", map);
	}

	@Override
	public int countMyFavorite(String bNo) {
		return sqlSession.selectOne(NameSpace + ".countFavorite",bNo);
	}

	@Override
	public List<BoardDTO> searchFavoriteList(String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("userId", userId);
		return sqlSession.selectList(NameSpace +".searchFavoriteList",map);
	}

	@Override
	public List<BoardDTO> selectMyFavoriteList(String bno, String userId) {
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("bNo", bno);
		map.put("userId", userId);
		return sqlSession.selectList(NameSpace+".selectMyFavoriteList", map);
	}

//	@Override
//	public List<BoardDTO> selectMyFavoriteList(BoardDTO boardDTO, String userId) {
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("boardDTO", boardDTO);
//		map.put("userId", userId);
//		return sqlSession.selectList(NameSpace+".selectMyFavoriteList", map);
//	}
	





}