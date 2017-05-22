package com.java.kosta.dao.board.notice;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.java.kosta.dto.board.BoardVO;
import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.SearchDTO;
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSessionTemplate sqlSession;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert("BoardMapper.insert", vo);
	}

	@Override
	@Transactional // 두개의 db 작업을 하게 됨으로 트랜잭션 처리를 하자.
	public BoardVO read(String bno) throws Exception {
		// 글을 읽기 전 조회수 하나 증가시키고...
		sqlSession.update("BoardMapper.cntUpdate", bno);
		return sqlSession.selectOne("BoardMapper.read",bno);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update("BoardMapper.update", vo);
	}

	@Override
	public void delete(String bno) throws Exception {
		sqlSession.delete("BoardMapper.delete", bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		return sqlSession.selectList("BoardMapper.list");
	}

	@Override
	public String getTime() {
		return sqlSession.selectOne("BoardMapper.getTime");
	}

	@Override
	public void cntUpdate(String bno) throws Exception {
		sqlSession.update("BoardMapper.cntUpdate", bno);
	}

	@Override
	public List<BoardVO> listPaging(PagingDTO page) throws Exception {
		return sqlSession.selectList("BoardMapper.listPaging",page);
	}

	@Override
	public int totalBoardCnt() throws Exception {
		return sqlSession.selectOne("BoardMapper.totalBoardCnt");
	}

	@Override
	public List<BoardVO> listSearchPaing(SearchDTO search) {
		return sqlSession.selectList("BoardMapper.listSearch", search);
	}

	@Override
	public int listSearchCount(SearchDTO search) {
		return sqlSession.selectOne("BoardMapper.listSearchCount", search);
	}

}
