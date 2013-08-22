package kr.co.kibi.edms.com.service;

public class BbsmasterVO {
	/** 게시판 id */
	private String bbs_id;
	/** 게시판 이름 */
	private String bbs_nm;
	
	//카테고리 테스트용
	private String seq;
	private String name;
	private String pseq;
	
	
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getPseq() {
		return pseq;
	}
	public void setPseq(String pseq) {
		this.pseq = pseq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_nm() {
		return bbs_nm;
	}
	public void setBbs_nm(String bbs_nm) {
		this.bbs_nm = bbs_nm;
	}
	
}
