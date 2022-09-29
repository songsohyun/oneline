package com.min.edu.vo;


public class BoardVo {
	private String seq;
	private String mem_name;
	private String mem_id;
	private String board_subject;
	private String board_content;
	private String reg_date;
	private String upt_date;
	private String view_cnt;
	private String useyn;

	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getUpt_date() {
		return upt_date;
	}
	public void setUpt_date(String upt_date) {
		this.upt_date = upt_date;
	}
	public String getView_cnt() {
		return view_cnt;
	}
	public void setView_cnt(String view_cnt) {
		this.view_cnt = view_cnt;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "BoardVo [seq=" + seq + ", mem_name=" + mem_name + ", mem_id=" + mem_id + ", board_subject="
				+ board_subject + ", board_content=" + board_content + ", reg_date=" + reg_date + ", upt_date="
				+ upt_date + ", view_cnt=" + view_cnt + ", useyn=" + useyn + "]";
	}
	public BoardVo(String seq, String mem_name, String mem_id, String board_subject, String board_content,
			String reg_date, String upt_date, String view_cnt, String useyn) {
		this.seq = seq;
		this.mem_name = mem_name;
		this.mem_id = mem_id;
		this.board_subject = board_subject;
		this.board_content = board_content;
		this.reg_date = reg_date;
		this.upt_date = upt_date;
		this.view_cnt = view_cnt;
		this.useyn = useyn;
	}
	public BoardVo() {
	}
	
	

	
	
}
