package com.java.kosta.dao.board.notice;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReplyVO> list(String bno) throws Exception {
		return sqlSession.selectList("ReplyMapper.list", bno);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		sqlSession.insert("ReplyMapper.create", vo);
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sqlSession.update("ReplyMapper.update", vo);
	}

	@Override
	public void delete(String rno) throws Exception {
		sqlSession.delete("ReplyMapper.delete",rno);
	}

	@Override
	public List<ReplyVO> listPage(String bno, String bcategory, PagingDTO page) throws Exception {
		// Mapper.xml로 값을 넘길 때 하나만 넘길 수 있는데 
		// ReplyVO와 페이징을 위한 PagingDTO 두개를 넘겨야한다.
		// 따라서, map으로 하나에 담아서 넘겨줘야한다.
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("bcategory", bcategory);
		map.put("page", page);
		
		return sqlSession.selectList("ReplyMapper.listPage", map);
	}

	@Override
	public int count(String bno, String bcategory) throws Exception {
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("bno", bno);
		map.put("bcategory", bcategory);
		return sqlSession.selectOne("ReplyMapper.count", map);
	}

}
