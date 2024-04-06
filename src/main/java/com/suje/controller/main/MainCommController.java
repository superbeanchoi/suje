package com.suje.controller.main;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.suje.domain.main.MainCommVO;
import com.suje.service.main.MainCommService;

@Controller
public class MainCommController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainCommController.class);
	
	@Autowired
	private MainCommService mainCommService;
	
	int totalRowCount; // 전체 레코드 수
	int pageTotalCount; // 전체 페이지 수
	int countPerPage = 5; // 한페이지당 레코드 수
	int firstNum, endNum;
	
	//전체 커뮤니티 메인 페이지 불러오기
	@RequestMapping("communityMain.do")
	public String communityMain(@RequestParam("page") int page, @RequestParam("cCate") String cCate, Model model) {
		
		MainCommVO vo = new MainCommVO();
		
		if( cCate.equals("전체") ) {
			logger.info("커뮤니티 전체 행수 컨트롤러");
			// 전체 테이블 행 수
			totalRowCount = mainCommService.getTotalAllCountPage();
		} else {
			logger.info("커뮤니티 조건 포함 행수 컨트롤러");
			if(cCate.equals("궁금해요")) {vo.setComuc_code("88000");} 
			else if(cCate.equals("추천해요")) {vo.setComuc_code("88001");} 
			else if(cCate.equals("꿀팁공유")) {vo.setComuc_code("88002");} 
			else if(cCate.equals("비하인드")) {vo.setComuc_code("88003");} 
			else if(cCate.equals("일상")) {vo.setComuc_code("88004");}
			// 조건 포함 전체 테이블 행 수
			totalRowCount = mainCommService.getLimitTotalCountPage(vo);
		}
		
		//전체 페이지 수
		pageTotalCount = totalRowCount / countPerPage;
		if(totalRowCount == 0) pageTotalCount = 0;
		if(totalRowCount%countPerPage > 0) pageTotalCount++;
		
		// 부분 페이지 수 계산
		firstNum = (page - 1) * countPerPage + 1;
		endNum = page * countPerPage;
		
		vo.setFirstNum(firstNum);
		vo.setEndNum(endNum);
		
		model.addAttribute("cCate", cCate);
		model.addAttribute("pageTotalCount", pageTotalCount);
		
		logger.info("커뮤니티 전체 게시글 컨트롤러");
		model.addAttribute("commList", mainCommService.getCommList(vo));
		
		return "main/maincommu/mainComm";
	}
	
	//게시글 상세페이지 불러오기
	@RequestMapping("commuContent.do")
	public String commuContent(@RequestParam("comupCode") String comupCode, Model model) {

		MainCommVO vo = new MainCommVO();
		vo.setComup_code(comupCode);
		
		logger.info("커뮤니티 조회수 업데이트 컨트롤러"+vo.comup_code);
		mainCommService.updateContentView(vo);
		
		logger.info("커뮤니티 상세 게시글 내용 컨트롤러");
		model.addAttribute("commContent", mainCommService.getCommContent(vo));
		
		logger.info("커뮤니티 상세 이미지 컨트롤러");
		model.addAttribute("commContentImgList", mainCommService.getCommContentImg(vo));
		
		logger.info("커뮤니티 댓글 리스트 호출 컨트롤러");
		model.addAttribute("replyList", mainCommService.getReplyList(vo));
		
		return "main/maincommu/commuContent";
	}
	
	//좋아요 누르기
	@RequestMapping(value="likeClick", produces="application/json; charset=utf8")
	@ResponseBody
	public void updateLike(MainCommVO vo) {
		logger.info("좋아요 컨트롤러 "+vo.getComup_code());
		mainCommService.updateLike(vo);
	}
	
	//좋아요수 다시 불러오기
	@RequestMapping(value="likeReView", produces="application/json; charset=utf8")
	@ResponseBody
	public String likeReView(MainCommVO vo) {
		logger.info("좋아요수 불러오기 컨트롤러 "+vo.getComup_code());
		return mainCommService.likeReView(vo);
	}
	
	//댓글 작성
	@RequestMapping("replyWrite.do")
	public String replyWrite(MainCommVO vo, Model model) {
		logger.info("댓글 작성 컨트롤러");
		mainCommService.replyWrite(vo);
		model.addAttribute("replyComple", "댓글이 작성되었습니다.");
		return "forward:/commuContent.do?comupCode="+vo.getComup_code();
	}
	
	//댓글 삭제
	@RequestMapping("replyDelete.do")
	public String replyDelete(MainCommVO vo, Model model) {
		logger.info("댓글 삭제 컨트롤러");
		mainCommService.replyDelete(vo);
		model.addAttribute("replyComple", "댓글이 삭제되었습니다.");
		return "forward:commuContent.do?comupCode="+vo.getComup_code();
	}
	
	//포스트 삭제
	@RequestMapping("postDelete.do")
	public String postDelete(MainCommVO vo, Model model) {
		logger.info("포스트 삭제 컨트롤러"+vo.getComup_code());
		mainCommService.postDelete(vo);
		model.addAttribute("replyComple", "게시물이 삭제되었습니다.");
		return "forward:viewMainComm.do";
	}
	
	//포스트 수정 페이지
	@RequestMapping("postModifyPage.do")
	public String postModifyPage(MainCommVO vo, Model model) {
		logger.info("포스트 수정 내용 불러오기 페이지 컨트롤러"+vo.comup_code);

		logger.info("커뮤니티 상세 게시글 내용 컨트롤러");
		model.addAttribute("commContent", mainCommService.getCommContent(vo));
		
		logger.info("커뮤니티 상세 이미지 컨트롤러");
		model.addAttribute("commContentImgList", mainCommService.getCommContentImg(vo));
		
		return "main/maincommu/commuwrite";
	}
	
	//포스트 수정
	@RequestMapping("postModify.do")
	public String postModify(MainCommVO vo, Model model) {
		logger.info("포스트 수정 컨트롤러"+vo.getComup_code());
		
		mainCommService.postModify(vo);
		model.addAttribute("replyComple", "게시물이 수정되었습니다.");
		return "forward:commuContent.do?comupCode="+vo.getComup_code();
	}
	
	//포스트 작성 페이지
	@RequestMapping("postInsertPage.do")
	public String postInsertPage() {
		logger.info("포스트 작성 페이지 컨트롤러");
		return "main/maincommu/commuwrite";
	}
	
	//포스트 작성
	@RequestMapping("postInsert.do")
	public String postInsert(@ModelAttribute MainCommVO vo, Model model) throws Exception {
		logger.info("포스트 작성 컨트롤러"+vo.m_id+vo.comuc_code+vo.comup_title+vo.comup_content);
		
		String fileName = null;
		String originalFileName = null;
		List<MultipartFile> files = vo.getComup_img();
		
		vo.setComup_code(mainCommService.getComuPostSeq());
		mainCommService.postInsert(vo);
		
		if (vo.getComup_img() != null && !vo.getComup_img().isEmpty()) { //file객체가 비어있지 않다면
			for(MultipartFile file : files) {
				originalFileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf(".")); //파일의 실제 이름
				String ext = FilenameUtils.getExtension(file.getOriginalFilename()); //파일의 확장자
				UUID uuid = UUID.randomUUID(); //파일의 새로운 닉네임
				fileName = uuid+"."+ext; //파일의 실제 이름+랜덤값+파일의 확장자 >> 새로운 파일명 지정
				file.transferTo(new File("C:\\workspaces\\SujeWebProject\\src\\main\\webapp\\resources\\img\\DBServer\\"+fileName));
				
				vo.setCpp_pname(originalFileName);
				vo.setCpp_spname(fileName);
				
				mainCommService.postImgInsert(vo);
			}
		}
		model.addAttribute("replyComple", "게시물이 등록되었습니다.");
		
		return "forward:commuContent.do?comupCode="+vo.getComup_code();
	}
	
}
