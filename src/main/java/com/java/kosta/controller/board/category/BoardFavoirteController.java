package com.java.kosta.controller.board.category;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardServiceImpl;

@Controller
@RequestMapping("/category/*")
public class BoardFavoirteController {
   Logger logger = LoggerFactory.getLogger(BoardFavoirteController.class);
   
   @Inject
   BoardServiceImpl service;
   
   //좋아요했는지 체크
   @RequestMapping(value="/checkFavorite")
   @ResponseBody
   public String checkFavorite(@RequestParam(value="bno")String bNo, @RequestParam(value="userId")String userId){
      logger.info("들어오는지 확인" + bNo + userId);
      int fcnt = service.searchFavorite(userId, bNo);
      String result = "";
      if(fcnt==0){
         result = "FAIL";
//         model.addAttribute("favorite","none");
      }else{
         result = "SUCCESS";
//         model.addAttribute("favorite", "exist");
      }
      
      return result;
   }
   
   
   //좋아요 처리
   @RequestMapping(value="/handlingFavorite")
   @ResponseBody
   public String handlingFavorite(@RequestParam(value="bno")String bNo, @RequestParam(value="userId")String userId){
	   logger.info("handlingFavorite" + bNo + userId);
      int fcnt = service.searchFavorite(userId, bNo);
      
      if(fcnt!=0){//좋아요 취소
         try {
            System.out.println(fcnt);
            service.unfavoriteBoard(userId, bNo);
         } catch (Exception e) {
            e.printStackTrace();
         }
         
      }else if(fcnt == 0){
         try {
            System.out.println(fcnt);
            service.favoriteBoard(userId, bNo);
         } catch (Exception e) {
            e.printStackTrace();
         }
         
      }//end of if-else
      return "안뇽";
   }

}//end of main