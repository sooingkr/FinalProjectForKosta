package com.java.kosta.controller.board.notice;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.ReplyVO;
import com.java.kosta.service.board.notice.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	Logger logger = LoggerFactory.getLogger(ReplyController.class);
	@Inject
	private ReplyService service;
	
	// 댓글 등록
	@RequestMapping(value="/{sort}",method=RequestMethod.POST)
	public String register(@RequestBody ReplyVO vo,@PathVariable("sort") String bcategory) throws Exception{
		vo.setBcategory(bcategory);
		service.create(vo);
		return "SUCCESS";
	}
	
	// 페이징이 적용된 게시글에 대한 전체 "댓글" "조회"
	// restful : replies/{bno}/{page} + GET 방식
	@RequestMapping(value="/{bno}/{bcategory}/{page}",method=RequestMethod.GET)
	public Map<String,Object> listPage(@PathVariable("bno") String bno,@PathVariable("bcategory") String bcategory,@PathVariable("page") int page) throws Exception{
		logger.info("전체목록조회 확인용");
		PagingDTO pageDTO = new PagingDTO();
		if ( page != 0 ){
			pageDTO.setPage(page);
		}
		//pageDTO.setPage(page);
		// 반드시 해당 게시글에 대한 전체 댓글 개수를 페이징 객체에 넣어주어야 페이징에 필요한 나머지 변수들이 계산될 수 있다.
		// 댓글의 경우 페이지당 보여지는 댓글 수를 변경할 일이 많진 않기 때문에 고정10개로 제한하자. 아니면
		// setPerPageNum()으로 세팅해주자(사용자에게 입력받지 않겠다.)
		pageDTO.setTotalCount(service.count(bno,bcategory));
		logger.info("몇개? : " + service.count(bno,bcategory));
		ArrayList<ReplyVO> list = (ArrayList<ReplyVO>) service.listPage(bno, bcategory, pageDTO);
		HashMap<String,Object> map = new HashMap<String,Object>();
		// AJAX요청시 JSON으로 두 객체를 한번에 반환하기 위해 map에 넣어서 전달한다.
		// @RestController이기 때문에 @ResponseBody를 작성하지 않아도 객체 반환시 JSON으로 변환해 반환하게 된다.
		map.put("list", list);
		map.put("pageMaker", pageDTO);
		return map;
	}// end of listPage()
	
	// 댓글 전체 조회 : restful : replies/all/{bno} + GET 방식
	@RequestMapping(value="/all/{bno}",method=RequestMethod.GET)
	public List<ReplyVO> list(@PathVariable("bno") String bno) throws Exception{
		
		ArrayList<ReplyVO> entity = null;
		entity = (ArrayList<ReplyVO>) service.list(bno);
		
		// @RestController임으로 객체 반환시 자동으로 JSON형태로 반환된다.(@ResponseBody를 생략해도 된다.)
		return entity;
	}// end of list()
	
	// 댓글 수정 처리 : restful : replies/{rno} + PUT/PATCH 방식
	@RequestMapping(value="/{rno}",method={RequestMethod.PUT,RequestMethod.PATCH})
	public String update(@PathVariable("rno") String rno,@RequestBody ReplyVO vo) throws Exception{
		// @RequestBody : JSON객체를 일반 객체로 변환한다.
		// ajax로 JSON으로 던진 객체를 일반 객체로 변환시켜 가져오는 역활을 한다.
		vo.setRno(rno);
		service.update(vo);
		return "SUCCESS";
	}// end of update()
	
	// 삭제처리 : restful : replies/{rno} + DELETE 방식
	@RequestMapping(value="/{rno}",method=RequestMethod.DELETE)
	public String delete(@PathVariable("rno") String rno) throws Exception{
		service.delete(rno);
		return "SUCCESS";
	}// end of delete()
	
	
}
