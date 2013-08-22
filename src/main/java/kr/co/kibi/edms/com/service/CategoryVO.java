package kr.co.kibi.edms.com.service;

public class CategoryVO {
	private int cat_seq;
	private String cat_nm;
	private int parcat_seq;
	private String cat_dc;
	private int depth;
	private int cnt;
	private int autsort_sor;
	private int aut_seq;
	private int group1;
	private int group2;
	private int group3;
	private int group_seq;
	private int[] group_seq_arr;
	private String strgrp;
	private String isAdmin;
	private String pwd;
	
	
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getStrgrp() {
		return strgrp;
	}
	public void setStrgrp(String strgrp) {
		this.strgrp = strgrp;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public int[] getGroup_seq_arr() {
		return group_seq_arr;
	}
	public void setGroup_seq_arr(int[] group_seq_arr) {
		this.group_seq_arr = group_seq_arr;
	}
	public int getGroup1() {
		return group1;
	}
	public void setGroup1(int group1) {
		this.group1 = group1;
	}
	public int getGroup2() {
		return group2;
	}
	public void setGroup2(int group2) {
		this.group2 = group2;
	}
	public int getGroup3() {
		return group3;
	}
	public void setGroup3(int group3) {
		this.group3 = group3;
	}
	public int getAut_seq() {
		return aut_seq;
	}
	public void setAut_seq(int aut_seq) {
		this.aut_seq = aut_seq;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getCat_dc() {
		return cat_dc;
	}
	public void setCat_dc(String cat_dc) {
		this.cat_dc = cat_dc;
	}
	public int getCat_seq() {
		return cat_seq;
	}
	public void setCat_seq(int cat_seq) {
		this.cat_seq = cat_seq;
	}
	public String getCat_nm() {
		return cat_nm;
	}
	public void setCat_nm(String cat_nm) {
		this.cat_nm = cat_nm;
	}
	public int getParcat_seq() {
		return parcat_seq;
	}
	public void setParcat_seq(int parcat_seq) {
		this.parcat_seq = parcat_seq;
	}
	public int getAutsort_sor() {
		return autsort_sor;
	}
	public void setAutsort_sor(int autsort_sor) {
		this.autsort_sor = autsort_sor;
	}
	
}
