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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.socket.TextMessage;

import com.java.kosta.dto.note.NoteVO;
import com.java.kosta.dto.note.PagingDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.handler.EchoHandler;
import com.java.kosta.service.note.NoteService;
import com.java.kosta.validation.ValidationForNote;

@Controller
@RequestMapping("/note/*")
public class NoteController {
   // Logger 
   Logger logger = LoggerFactory.getLogger(NoteController.class);
   //추가
   // service
   @Inject
   NoteService service;
   @Inject
   EchoHandler echo;
   
   // 쪽지 보내기 폼으로 이동
   @RequestMapping(value="/noteForm")
   public String noteForm(String userId, Model model){
      model.addAttribute("sendTo",userId); // 게시판에서 글쓴 사람 id 클릭시 쪽지 보낼 수 있도록...
      
      return "note/noteForm2";
   } // end of noteForm
   
   
   // 쪽지 보내기(삽입) 처리
   @RequestMapping(value="/insertNote",method=RequestMethod.POST)
   public String insertNote(NoteVO vo,RedirectAttributes rttr,BindingResult errors,HttpSession session){
      UserVO uvo = (UserVO) session.getAttribute("loginSession");
      vo.setUserId(uvo.getUserId());
//      logger.info("확인 : " + vo);
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
         logger.info("echo객체" + echo);
         // 쪽지 table에 추가!
         service.sendInsert(vo);
                  
         HashMap<String, Object> map = new HashMap<String, Object>();
         map.put("sendId", vo.getUserId());
         map.put("title", vo.getMtitle());
         map.put("content", vo.getMcontent());
         map.put("recvDate", vo.getDate_sender());
         echo.EchoNoti(map);
         try {
            echo.handleMessage(null, new TextMessage(""));
            logger.info("try문 들어왔음");
            session.setAttribute("NotiRecvId", vo.getRecvId());
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         destination = "note/listForReceive";            
         
      }
      return destination;

   } // end of insertNote
   
   
   // 받은쪽지 보관함 목록 
   @RequestMapping(value="listReceive")
   public String listForReceive(NoteVO vo,PagingDTO page,Model model,HttpSession session) throws Exception{
      UserVO uvo = (UserVO) session.getAttribute("loginSession");
      vo.setRecvId(uvo.getUserId());
      page.setTotalCount(service.totalCntRecv(vo));
      List<NoteVO> list = service.listForReceiver(vo, page);
      model.addAttribute("list", list);
      model.addAttribute("pageMaker", page);
      logger.info("확인 : " + list);
      return "note/listForReceive";
   } // end of listForReceive
   
   // 알림에 쪽지 띄우기
   @RequestMapping(value="alarmNote")
   public @ResponseBody String alarmNote(HttpServletRequest req , NoteVO vo) throws Exception{
      HttpSession session = req.getSession();
      //현재 로그인세션정보를 가지고와서 UserVO로 형변환을 해준다.
      UserVO uvo = (UserVO) session.getAttribute("loginSession");
      String totalCnt=0+"";
      if(uvo!=null){
         //로그인 정보가 있는 경우 내가 받은 쪽지임으로 setRecvId에 내 아이디를 넣어줌
         vo.setRecvId(uvo.getUserId());
         //안읽은쪽지 리스트의 정보를 가지고 와서 그 크기를 알림으로 넘겨준다.
         totalCnt = service.totalCntNotOpen(vo)+"";
         session.setAttribute("notOpen", totalCnt);
      }
      return totalCnt;
   }

   
   // 안 읽은 쪽지함 목록
   @RequestMapping(value="listNotOpen")
   public String listNotOpened(NoteVO vo,PagingDTO page, Model model,HttpSession session) throws Exception{
      UserVO uvo = (UserVO) session.getAttribute("loginSession");
      vo.setRecvId(uvo.getUserId());
      //페이징을 위해서 전체 쪽지 갯수정보를 가지고 온다.
      page.setTotalCount(service.totalCntNotOpen(vo));
      //listNotOpen 함수 실행
      List<NoteVO> list = service.listNotOpen(vo,page);
      //list와 page정보를 뷰단에서 컨트롤 할수 있게 넣어준다.
      model.addAttribute("list", list);
      model.addAttribute("pageMaker", page);
      return "note/listNotOpen";

   }
   
   
   // 보낸쪽지 보관함 목록 
   @RequestMapping(value="listSend")
   public String listForSend(NoteVO vo,PagingDTO page, Model model,HttpSession session) throws Exception{
      UserVO uvo = (UserVO) session.getAttribute("loginSession");
      vo.setUserId(uvo.getUserId());
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
      return "redirect:/note/listReceive";
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
   
   // 노티 테스트 : 모든화면에서 노티
   @RequestMapping(value="noti")
   public String notenoti(){
      return "note/noteNoti";
   }
}