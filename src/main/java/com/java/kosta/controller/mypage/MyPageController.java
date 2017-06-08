package com.java.kosta.controller.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.kosta.common.Constants;
import com.java.kosta.dto.board.BoardDTO;
import com.java.kosta.dto.board.BoardFavoriteDTO;
import com.java.kosta.dto.board.BoardPagingDTO;
import com.java.kosta.dto.user.UserVO;
import com.java.kosta.service.board.BoardServiceImpl;
import com.java.kosta.service.mypage.MyPageServiceImpl;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	Logger logger = LoggerFactory.getLogger(MyPageController.class);
	@Inject
	MyPageServiceImpl service;

	@Inject
	BoardServiceImpl bservice;


	/** 마이페이지 좋아요 보기 */
	@RequestMapping(value="/myList")
	public  String boardList(BoardPagingDTO pagingDTO, Model model, HttpServletRequest req){
		try {

			UserVO loginSession = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
			model.addAttribute("loginSession", loginSession);

			String userId = loginSession.getUserId();
			System.out.println(loginSession.getUserId());
			// 전체 레코드 갯수 획득
			int totRecord = service.selectMyFavoriteListTotalCount(pagingDTO, userId);
			// 페이징 계산
			pagingDTO.calcPage(totRecord);

			//내가 누른 좋아요 리스트 가져오기
			List<BoardDTO> list1 = service.searchFavoriteList(userId);
			
//			for(BoardDTO dto : list1){
//				service.selectMyFavoriteList(dto.getbNo(),userId);
//			}
			
		
			List<BoardDTO> list= new ArrayList<BoardDTO>();
			for (int i = 0; i < list1.size(); i++) {

				String bno= list1.get(i).getbNo();
				logger.info("확인 : " + bno + "," + userId);
				logger.info("list확인:"+ service.selectMyFavoriteList(bno, userId));
				list.addAll(service.selectMyFavoriteList(bno, userId));
				// 내가 가져온 좋아요 리스트의 bno를 통해서 내가 누른 좋아요 게시판 가져오기(말이 이상한가?)
			}

			

			// 내가 좋아요 누른 게시글 리스트로 가져와서 전달하기
			//List<BoardDTO> list = service.selectMyFavoriteList(pagingDTO, userId);
			model.addAttribute("MyFavoriteList",list );
			model.addAttribute("pagingDTO", pagingDTO);
//			model.addAttribute("boardDTO",dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/mypage/myfavoritelist";
	}

	//좋아요 했는지 체크
	@RequestMapping(value="/checkFavorite")
	@ResponseBody
	public String checkFavorite(@RequestParam(value = "bno") String bNo,@RequestParam(value = "userId") String userId,Model model){
		logger.info("들어오는지 확인 : " + bNo+"," + userId);
		int fcnt = bservice.searchFavorite(userId, bNo);
		int count = bservice.countFavorite(bNo);
		String result = "";
		if (fcnt == 0) {
			result = "FAIL";
			model.addAttribute("likeCount",count);
			// model.addAttribute("favorite","none");
		} else {
			result = "SUCCESS";
			model.addAttribute("likeCount",count);
			// model.addAttribute("favorite", "exist");
		}

		return result;

	}

	// 좋아요 처리
	@RequestMapping(value = "/handlingFavorite")
	@ResponseBody
	public String handlingFavorite(@RequestParam(value = "bno") String bNo,
			@RequestParam(value = "userId") String userId) {
		logger.info("handlingFavorite" + bNo + userId);

		/*// 로그인 안되어있으면 좋아요 할 수 없음
		if (userId == null) {
			return "notLogin";
		}*/

		int fcnt = bservice.searchFavorite(userId, bNo);

		if (fcnt != 0) {// 좋아요 취소
			try {
				System.out.println(fcnt);
				bservice.unfavoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (fcnt == 0) {
			try {
				System.out.println(fcnt);
				bservice.favoriteBoard(userId, bNo);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end of if-else
		return "안뇽";
	}


	/**좋아요 삭제*/
	@RequestMapping(value="/deleteFavorite")
	@ResponseBody
	public String deleteFavorite(@RequestParam(value = "bno") String bNo,
			@RequestParam(value = "userId") String userId){

		try {
			bservice.unfavoriteBoard(userId, bNo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "삭제";
	}


	@RequestMapping(value="/myBoardList")
	@ResponseBody
	public Map<String,Object> myBoardList(Model model,HttpServletRequest req,BoardPagingDTO pagingDTO){
		HashMap<String,Object> res=new HashMap<String, Object>();
		
		logger.info("들어옴");
		UserVO loginSession = (UserVO)req.getSession().getAttribute(Constants.LOGINSESSION);
		
		res.put("loginSession", loginSession);
		String userId = loginSession.getUserId();
		
		int totRecord = service.selectMyBoardListCount(pagingDTO, userId);
		// 페이징 계산
		pagingDTO.calcPage(totRecord);

		try {
			List<BoardDTO> list = service.selectWritedList(userId);//내가 쓴 글 목록 조회
			res.put("success","success"); 
			res.put("MyBoardList",list);
			res.put("pagingDTO", pagingDTO);
			
			logger.info("asdasd"+list.get(0).getbRegDate());
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	
	
	
	




}
