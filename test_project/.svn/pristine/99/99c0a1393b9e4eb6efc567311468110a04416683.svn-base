package com.study.start.project.paging;

public class Pagination {
	
	private int totalRecodes;
	public static final int PAGE_SCALE = 5;
	public static final int BLOCK_SCALE = 3;
	private int currentPage;
	private int currentBlock;
	private int totalPages;
	private int beginPage;
	private int endPage;
	private int beginBlock;
	private int endBlock;
	
	public Pagination(int totalRecodes, int currentPage){
		
		//총 페이지 수 얻기
		setTotalRecodes(totalRecodes);
		int totalPages = totalRecodes / PAGE_SCALE;
		if(totalRecodes % PAGE_SCALE > 1){
			totalPages++;
		}
		setTotalPages(totalPages);
		
		//현재 페이지
		setCurrentPage(currentPage);
		
	}
	
	public int getTotalRecodes() {
		return totalRecodes;
	}
	public void setTotalRecodes(int totalRecodes) {
		this.totalRecodes = totalRecodes;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if(currentPage < 1){
			currentPage = 1;
		} else if(currentPage > getTotalPages()){
			currentPage = getTotalPages();
		}
		this.currentPage = currentPage;
	}
	public int getCurrentBlock() {
		return currentBlock;
	}
	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		if(endPage > getTotalRecodes()){
			endPage = getTotalRecodes();
		}
		this.endPage = endPage;
	}
	public int getBeginBlock() {
		return beginBlock;
	}
	public void setBeginBlock(int beginBlock) {
		if(beginBlock < 0){
			beginBlock = 1;
		}
		this.beginBlock = beginBlock;
	}
	public int getEndBlock() {
		return endBlock;
	}
	public void setEndBlock(int endBlock) {
		if(endBlock > getTotalPages()){
			endBlock = getTotalPages();
		}
		this.endBlock = endBlock;
	}
	
	public void initValues(){
		
		//현재 페이지의 블록 구하기
		int currentPage = getCurrentPage();
		int currentBlock = ((int)(currentPage - 1)/BLOCK_SCALE) + 1;
		setCurrentBlock(currentBlock);
		
		//현재 페이지의 시작, 끝 번호 구하기
		int BeginBlock = (getCurrentBlock()-1) * BLOCK_SCALE - 1;
		setBeginBlock(BeginBlock);
		
		int endBlock = getBeginBlock() + BLOCK_SCALE - 1;
		setEndBlock(endBlock);
		
		//페이지에 보여줄 게시물 시작, 끝 번호
		int beginPage = (getCurrentPage() - 1) * PAGE_SCALE + 1;
		setBeginPage(beginPage);
		
		int endPage = getBeginPage() + PAGE_SCALE - 1;
		setEndPage(endPage);
		
		
	}
	
}
