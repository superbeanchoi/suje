package com.suje.dao.main;

import java.util.List;

import com.suje.domain.main.MainCommVO;

public interface MainCommDao {
	public int getTotalAllCountPage();
	public int getLimitTotalCountPage(MainCommVO vo);
	public List<MainCommVO> getCommList(MainCommVO vo);
	public void updateContentView(MainCommVO vo);
	public MainCommVO getCommContent(MainCommVO vo);
	public List<MainCommVO> getCommContentImg(MainCommVO vo);
	public void updateLike(MainCommVO vo);
	public String likeReView(MainCommVO vo);
	public void replyWrite(MainCommVO vo);
	public List<MainCommVO> getReplyList(MainCommVO vo);
	public void replyDelete(MainCommVO vo);
	public void postDelete(MainCommVO vo);
	public String getComuPostSeq();
	public void postInsert(MainCommVO vo);
	public void postImgInsert(MainCommVO vo);
	public void postModify(MainCommVO vo);
}
