package com.java.kosta.controller.board.note;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.kosta.dto.board.PagingDTO;
import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.service.note.NoteService;
import com.java.kosta.validation.ValidationForNote;

@Controller
@RequestMapping("/note/*")
public class NoteController {
	//	황영롱 커밋
	// Logger
	Logger logger = LoggerFactory.getLogger(NoteController.class);
	//추가
	// service
	@Inject
	NoteService service;
	
	// 쪽지 보내기 폼으로 이동
	@RequestMapping(value="/noteForm")
	public String noteForm(String userId, Model model){
		model.addAttribute("sendTo",userId); // 게시판에서 글쓴 사람 id 클릭시 쪽지 보낼 수 있도록...
		
		return "note/noteForm2";
	} // end of noteForm
	
	
	// 쪽지 보내기(삽입) 처리
	@RequestMapping(value="/insertNote",method=RequestMethod.POST)
	public String insertNote(NoteVO vo,RedirectAttributes rttr,BindingResult errors){
		//^0^ 쪽지쪽지
		logger.info("확인 : " + vo);
		String destination = "";
		HashMap<String,String> error = new HashMap<String,String>();
		ValidationForNote validation = new ValidationForNote(error);
		validation.validate(vo, errors);
		HashMap<String,String> errorMessage = validation.result();
		
		rttr.addFlashAttribute("NoteVO", vo);
		
		if ( errors.hasErrors() ){
			destination = "redirect:/note/noteForm#login_form";
			rttr.addFlashAttribute("errors",errorMessage);
		}else{
			// 쪽지 table에 추가!
			service.sendInsert(vo);
			if(vo.getRecvId().equals("sooingkr")){
				destination = "note/noteNoti";				
			}
			destination = "redirect:/";
		}
		return destination;
	} // end of insertNote
	
	
	// 받은쪽지 보관함 목록 
	@RequestMapping(value="listReceive")
	public String listForReceive(NoteVO vo,PagingDTO page,Model model,HttpSession session) throws Exception{
		//session.getAttribute("loginSession");
		// 일단,세션에서 사용자 로그인 id 꺼내와서 vo.setRecvId() 로 세팅해줘야하지만
		// 아직, 로그인이 구현된 상태가 아님으로 임의로 값을 집어 넣겠다. (나중에 수정 필요)
		vo.setRecvId("dudfhd13"); 
		page.setTotalCount(service.totalCntRecv(vo));
		List<NoteVO> list = service.listForReceiver(vo, page);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", page);
		logger.info("확인 : " + list);
		return "note/listForReceive";
	} // end of listForReceive
	
	// 안 읽은 쪽지함 목록
	@RequestMapping(value="listNotOpen")
	public String listNotOpened(NoteVO vo,PagingDTO page, Model model, HttpServletRequest req) throws Exception{
		vo.setRecvId("dudfhd13");
		page.setTotalCount(service.totalCntNotOpen(vo));
		List<NoteVO> list = service.listNotOpen(vo,page);
		req.getSession().setAttribute("notOpen", list.size()+"");
		logger.info("확인 : "+ list);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", page);
		return "note/listNotOpen";
	}
	
	
	// 보낸쪽지 보관함 목록 
	@RequestMapping(value="listSend")
	public String listForSend(NoteVO vo,PagingDTO page, Model model) throws Exception{
		vo.setUserId("sooingkr");
		page.setTotalCount(service.totalCntSend(vo));
		List<NoteVO> list = service.listForSend(vo, page);
		logger.info("확인 : " + list);
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", page);
		return "note/listForSend";
	} // end of listForReceive
	
	// 쪽지 상세 읽기(read)
	@RequestMapping(value="readDetail")
	public String readDetail(String mno,Model model){
		// 뿌려줄 데이터를 뿌려주는 것도 중요하지만,
		// 읽는 순간 읽은걸 뿌려주기 전에 읽은 유무, 읽은 시간 업데이트가 선행되어야한다.
		service.readUpdate(mno); // 읽은유무를 Y로 읽은 시간을 now()로 갱신한다.
		// 상세읽기 페이지에 뿌려줄 쪽지 정보 객체 가져오기
		NoteVO vo = service.readNote(mno);
		model.addAttribute("NoteVO", vo);
		return "note/readDetail"; // 읽기 상세 페이지로 이동
	}; // end of readDetail
	
	// 받은 쪽지 보관함에서 삭제하는 경우
	@RequestMapping(value="delFromReceiver")
	public String delFromReceiver(String mno){
		// 받은 쪽지 보관함에서 삭제한 경우 업데이트해주기
		service.deliteFromReceiverUpdate(mno);
		// 실재 삭제작업 수행할 수 있는지 해보기
		service.deleteBoth(mno);
		return "note/listReceive";
	}; // end of delFromReceiver

	// 보낸 쪽지 보관함에서 삭제하는 경우
	@RequestMapping(value="delFromSender")
	public String delFromSender(String mno){
		// 받은 쪽지 보관함에서 삭제한 경우 업데이트해주기
		service.deliteFromSenderUpdate(mno);
		// 실재 삭제작업 수행할 수 있는지 해보기
		service.deleteBoth(mno);
		return "redirect:/";
	}; // end of delFromReceiver
	
	// 쪽지 답장하기
	@RequestMapping(value="replyNote")
	public String replyNoteForm(NoteVO vo,Model model){
		// vo에 userId와 recvId가 넘어옴
		service.sendInsert(vo);
		return "redirect:/note/listReceive";
	}
	
	// 노티 테스트
	@RequestMapping(value="noti")
	public String notenoti(){
		return "note/noteNoti";
	}
}
