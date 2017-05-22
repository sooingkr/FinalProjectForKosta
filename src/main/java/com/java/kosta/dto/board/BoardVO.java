package com.java.kosta.dto.board;

import java.sql.Date;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
// 게시글 관련 dto
public class BoardVO {
	private String bno; // 게시글 고유 번호(primary key,auto_increment)
	private String title; // 제목
	private String content; // 내용
	private String writer; // 저자
	private String viewcnt; // 조회수
	private Date bregdate; // 게시글 등록일 default now()
	private Date bmodifydate; // 게시글 수정일
	private String bcategory; // 카테고리 분류
	
	
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(String viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getBregdate() {
		return bregdate;
	}
	public void setBregdate(Date bregdate) {
		this.bregdate = bregdate;
	}
	public Date getBmodifydate() {
		return bmodifydate;
	}
	public void setBmodifydate(Date bmodifydate) {
		this.bmodifydate = bmodifydate;
	}
	public String getBcategory() {
		return bcategory;
	}
	public void setBcategory(String bcategory) {
		this.bcategory = bcategory;
	}
	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer + ", viewcnt="
				+ viewcnt + ", bregdate=" + bregdate + ", bmodifydate=" + bmodifydate + ", bcategory=" + bcategory
				+ "]";
	}
}
