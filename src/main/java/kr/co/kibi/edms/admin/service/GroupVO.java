package kr.co.kibi.edms.admin.service;

import java.io.Serializable;

import kr.co.kibi.edms.com.service.PagingVO;


@SuppressWarnings("serial")
public class GroupVO implements Serializable {
	private int group_seq;
	private String group_nm;
	private int pargroup_seq;
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public String getGroup_nm() {
		return group_nm;
	}
	public void setGroup_nm(String group_nm) {
		this.group_nm = group_nm;
	}
	public int getPargroup_seq() {
		return pargroup_seq;
	}
	public void setPargroup_seq(int pargroup_seq) {
		this.pargroup_seq = pargroup_seq;
	}
	
}
