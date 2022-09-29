package com.study.start.model;

public class Paging {

	private int totalRecodes;
	public static final int RECOEDS_PER_PAGE = 5;
	public static final int BLOCK_SCALE = 3;
	private int totalPages;
	private int currentPage;
	private int currentBlock;
	private int blockBegin;
	private int blockEnd;
	private int pageBegin;
	private int pageEnd;
	
	public Paging(int totalRecodes, int currentPage){
		setTotalRecodes(totalRecodes);
		setCurrentPage(currentPage);
	}
	
	public int getTotalRecodes() {
		return totalRecodes;
	}
	public void setTotalRecodes(int totalRecodes) {
		this.totalRecodes = totalRecodes;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		if(currentPage < 1){
			currentPage = 1;
		} else if(currentPage > totalRecodes){
			currentPage = totalRecodes;
		}
		this.currentPage = currentPage;
	}
	public int getCurrentBlock() {
		return currentBlock;
	}
	public void setCurrentBlock(int currentBlock) {
		
		this.currentBlock = currentBlock;
	}
	public int getBlockBegin() {
		return blockBegin;
	}
	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
		if(blockBegin < 1){
			this.blockBegin = 1;
		}
	}
	public int getBlockEnd() {
		return blockEnd;
	}
	public void setBlockEnd(int blockEnd) {
		if(blockEnd > totalPages){
			blockEnd = totalPages;
		}
		this.blockEnd = blockEnd;
	}
	public int getPageBegin() {
		return pageBegin;
	}
	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}
	public int getPageEnd() {
		return pageEnd;
	}
	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}
	
	public void initValues(){
		totalPages = getTotalRecodes() / BLOCK_SCALE;
		if(getTotalRecodes() % BLOCK_SCALE > 0){
			totalPages++;
		}
		int i = (int)(currentPage - 1) / BLOCK_SCALE;
		int currentBlock = i + 1;
		setCurrentBlock(currentBlock);
		
		int blockBegin = (getCurrentBlock() - 1) * BLOCK_SCALE + 1;
		setBlockBegin(blockBegin);
		
		int blockEnd = getCurrentBlock() * BLOCK_SCALE;
		setBlockEnd(blockEnd);
		
		int pageEnd = getCurrentBlock() * BLOCK_SCALE;
		setPageEnd(pageEnd);
		
		int pageBegin = getPageEnd() - BLOCK_SCALE + 1;
		setPageBegin(pageBegin);
		
		
		
	}
	
}
