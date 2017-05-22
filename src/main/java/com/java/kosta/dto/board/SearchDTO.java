package com.java.kosta.dto.board;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

// [ 검색 기능을 위한 DTO ]
public class SearchDTO extends PagingDTO {

	private String searchType; // 검색 유형(제목,내용,글쓴이,...)
	private String keyword; // 검색 키워드

	// page(현재페이지), perPageNum(페이지당 출력 게시글 수)를 이용해 쿼리문자열을 생성해주는 메서드입니다.
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", getPerPageNum()).queryParam("searchType", searchType).queryParam("keyword", keyword).build();
		// ?page=this.page&perPageNum=this.perPageNum 으로 문자열을 생성하게 됨 이 메서드를 실행하면
		// 페이징 객체를 넘겨받은 뷰단에서 페이지를 이용한 쿼리문자열을 쓸 때 좀 더 편리하게 사용하기 위해 만들어 놓았음.
		return uriComponents.toUriString();
	} // end of pageQuery()

	// getter/setter
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "SearchDTO [searchType=" + searchType + ", keyword=" + keyword + "]";
	}
}
