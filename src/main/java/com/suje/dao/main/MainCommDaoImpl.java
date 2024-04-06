package com.suje.dao.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suje.domain.main.MainCommVO;

@Repository("MainCommDao")
public class MainCommDaoImpl implements MainCommDao {
	
	private static final Logger logger = LoggerFactory.getLogger(MainCommDaoImpl.class);
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public int getTotalAllCountPage() {
		logger.info("커뮤니티 전체 행수 마이바티스");
		return mybatis.selectOne("MainCommDao.getTotalAllCountPage");
	}
	
	@Override
	public int getLimitTotalCountPage(MainCommVO vo) {
		logger.info("커뮤니티 조건 포함 행수 마이바티스");
		return mybatis.selectOne("MainCommDao.getLimitTotalCountPage", vo);
	}
	
	@Override
	public List<MainCommVO> getCommList(MainCommVO vo) {
		logger.info("커뮤니티 전체 게시글 마이바티스");
		return mybatis.selectList("MainCommDao.getCommList", vo);
	}
	
	@Override
	public void updateContentView(MainCommVO vo) {
		logger.info("커뮤니티 조회수 업데이트 마이바티스"+vo.comup_code);
		mybatis.update("MainCommDao.updateContentView", vo);
	}
	
	@Override
	public MainCommVO getCommContent(MainCommVO vo) {
		logger.info("커뮤니티 상세 게시글 내용 마이바티스");
		return mybatis.selectOne("MainCommDao.getCommContent", vo);
	}
	
	@Override
	public List<MainCommVO> getCommContentImg(MainCommVO vo) {
		logger.info("커뮤니티 상세 이미지 마이바티스");
		return mybatis.selectList("MainCommDao.getCommContentImg", vo);
	}
	
	@Override
	public void updateLike(MainCommVO vo) {
		logger.info("좋아요 마이바티스 "+vo.getComup_code());
		mybatis.update("MainCommDao.updateLike", vo);
	}
	
	@Override
	public String likeReView(MainCommVO vo) {
		logger.info("좋아요수 불러오기 마이바티스 "+vo.getComup_code());
		return mybatis.selectOne("MainCommDao.likeReView", vo);
	}
	
	@Override
	public void replyWrite(MainCommVO vo) {
		logger.info("댓글 작성 마이바티스");
		mybatis.insert("MainCommDao.replyWrite", vo);
	}
	
	@Override
	public List<MainCommVO> getReplyList(MainCommVO vo) {
		logger.info("커뮤니티 댓글 리스트 호출 마이바티스");
		return mybatis.selectList("MainCommDao.getReplyList", vo);
	}
	
	@Override
	public void replyDelete(MainCommVO vo) {
		logger.info("댓글 삭제 마이바티스");
		mybatis.delete("MainCommDao.replyDelete", vo);
	}
	
	@Override
	public void postDelete(MainCommVO vo) {
		logger.info("포스트 삭제 마이바티스");
		mybatis.delete("MainCommDao.postDelete", vo);
	}
	
	@Override
	public void postModify(MainCommVO vo) {
		logger.info("포스트 수정 마이바티스");
		mybatis.update("MainCommDao.postModify", vo);
	}
	
	@Override
	public String getComuPostSeq() {
		logger.info("포스트 테이블 시퀀스 호출 마이바티스");
		return mybatis.selectOne("MainCommDao.getComuPostSeq");
	}
	
	@Override
	public void postInsert(MainCommVO vo) {
		logger.info("포스트 작성 마이바티스"+vo.comup_code+vo.m_id+vo.comuc_code+vo.comup_title+vo.comup_content);
		mybatis.insert("MainCommDao.postInsert", vo);
	}
	
	@Override
	public void postImgInsert(MainCommVO vo) {
		logger.info("포스트 이미지 삽입 서비스");
		mybatis.insert("MainCommDao.postImgInsert", vo);
	}
}
