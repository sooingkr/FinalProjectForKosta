package com.java.kosta.controller.board.notice;

import java.util.ArrayList;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.dto.board.BoardVO;
import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.board.SearchDTO;
import com.java.kosta.service.board.notice.BoardService;

@Controller
@RequestMapping("/board/notice/*")
public class BoardController {
	Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	// 페이징을 적용한 전체 게시글 목록 보여주는 부분
	@RequestMapping("/listPaging")
	public String listAdjustPaging(SearchDTO searchDTO, Model model) throws Exception{
		logger.info("페이징적용한 게시글 목록 컨트롤러 page와 perPageNum,searchType,keyword : " + searchDTO.getPage()
			+ ": " + searchDTO.getPerPageNum() + " : " + searchDTO.getSearchType() + " : " + searchDTO.getKeyword()
				);
		// 게시글 목록 가져오기(현재 페이지 기준으로)
		// 게시글 목록 db에서 불러오기 전에 page에 대한 세팅을 해줘야함 : totalCount 세팅
		// 여기서 페이징 변수들에 필요한 모든 세팅이 완료됨(검색된 게시글과 관련된)
		searchDTO.setTotalCount(service.listSearchCount(searchDTO));
		ArrayList<BoardVO> list = (ArrayList<BoardVO>) service.listSearchPaing(searchDTO); // 그 페이징 객체를 던져서 현재 페이지 기준 게시글 목록 가져옴
		model.addAttribute("list", list); // 화면으로 던질 게시글 목록 저장
		logger.info("startPage : " + searchDTO.getStartPage() + "endPage : " + searchDTO.getEndPage());
		
		model.addAttribute("SearchDTO", searchDTO); // 실시간 검색용
		
		// 목록 화면으로 이동
		return "board/notice/list";
	}
	
	// 게시글 등록 폼으로 이동(/board/notice/register)
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String registerForm(){
		return "/board/notice/registerForm";
	} // end of registerForm
	
	// 게시글 등록 처리
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public String registerProcess(BoardVO vo, RedirectAttributes rttr) throws Exception{
		service.create(vo); // 게시글 추가 작업 수행
		// 게시글 목록보기(list) 페이지에서 msg를 키워드로해서 삭제가 완료되었는지 수정이 완료되었는지를 구분짓기 위함.
		rttr.addFlashAttribute("msg", "게시글이 성공적으로 등록되었습니다."); // 리다이렉트시 화면으로 넘길 값 저장
		return "redirect:/board/notice/listPaging"; // 처리 후 게시글 목록으로 리다이렉트
	} // end of registerProcess
	
	
	// 글읽기 폼으로 이동
	@RequestMapping(value="/read",method=RequestMethod.GET)
	public String read(@RequestParam("bno") String bno, SearchDTO searchDTO, Model model) throws Exception{
		// 한 게시글에 대한 정보 가져오기
		BoardVO vo = service.read(bno);
		// 게시글을 읽으면 조회수를 하나 증가하도록 db에 업데이트 함.
		// service.read()내부에서 dao.read()메서드도 수행하고 이 메서드에서 조회수 update도 같이 수행하도록하고 트랜잭션 처리 해뒀음
		// read.jsp 페이지에서 사용할 데이터 저장
		model.addAttribute("boardVO",vo);
		// 읽기,수정 등을 하고 다시 게시글 목록으로 돌아갔을 때, 사용자가 그때까지 보고 있었던 페이지 정보를 유지하기 위해 전달하고 있음.
		model.addAttribute("SearchDTO", searchDTO);
		// /views/board/notice/read.jsp로 이동
		return "board/notice/read";
	} // end of read
	
	// 글삭제 작업
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("bno") String bno, SearchDTO searchDTO, RedirectAttributes rttr) throws Exception{
		// 삭제 db 작업 수행
		service.delete(bno);
		rttr.addFlashAttribute("msg", "게시글 삭제를 완료했습니다.");
		rttr.addFlashAttribute("SearchDTO", searchDTO);
		return "redirect:/board/notice/listPaging"; // 삭제 완료된 후 리스트 페이지로 리다이렉트
	} // end of delete
	
	// 글 수정 폼으로 이동
	@RequestMapping(value="/modify",method=RequestMethod.GET)
	public String modify(@RequestParam("bno") String bno, SearchDTO searchDTO, Model model) throws Exception{
		// read.jsp 페이지에서 게시글을 읽다가 수정을 눌렀을 때 이동한 수정폼 페이지에서는 기존에 읽고 있었던 정보가
		// 미리 기록되어 있어야한다. 따라서, 넘어온 bno를 이용해서 read를 호출해 해당 게시글 정보를 model에 담아놓고
		// 수정 페이지로 전달시켜야함
		BoardVO vo = service.read(bno);
		model.addAttribute("boardVO",vo); // 수정 폼에서 쓸 데이터 저장
		model.addAttribute("SearchDTO", searchDTO);
		return "board/notice/modifyForm"; // modifyForm.jsp 로 이동
	} // end of modify(get)
	
	// 글 수정 처리
	@RequestMapping(value="/modify",method=RequestMethod.POST)
	public String modify(BoardVO vo, SearchDTO searchDTO, RedirectAttributes rttr) throws Exception{
		// 게시글 업데이트 수행
		service.update(vo);
		// 완료처리 메시지는 msg로 통일해서 제어하도록...
		rttr.addFlashAttribute("msg", "글 수정이 완료되었습니다.");
		rttr.addFlashAttribute("SearchDTO", searchDTO);
		logger.info("수정처리로 넘어온 값 : " + searchDTO.getPage() + ": " + searchDTO.getPerPageNum() + " : " + searchDTO.getKeyword());
		return "redirect:/board/notice/listPaging"; // 글 수정처리 완료하면 다시 게시글 목록으로 이동
	} // end of modify(post)
	
}
