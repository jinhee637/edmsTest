package kr.co.kibi.edms.com.service;

import java.io.Serializable;

public class LoginVO implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8274004534207618049L;
	/*		사용자 일련번호		*/
	private int party_seq;
	/*		아이디정보		*/
	private String id_if;
	/*		패스워드 정보		*/
	private String pw_if;
	/*		사용자명		*/
	private String user_nm;
	/*		부서코드		*/
	private String dept_cd;
	/*		사용자상태코드		*/
	private String partystt_cd;
	/*		부서이름		*/
	private String dept_nm;
	/*		직급정보		*/
	private String duty_if;
	/*		전화번호(내선)		*/
	private String tel_no_no;
	/*		이메일정보		*/
	private String email_if;
	/* 그룹 코드 */
	private int group_seq;
	/*권한코드*/
	private String bizrole_cd;
	/*문서등록권한 여부*/
	private String docregaut_yn;
	
	public String getBizrole_cd() {
		return bizrole_cd;
	}
	public void setBizrole_cd(String bizrole_cd) {
		this.bizrole_cd = bizrole_cd;
	}
	public int getParty_seq() {
		return party_seq;
	}
	public void setParty_seq(int party_seq) {
		this.party_seq = party_seq;
	}
	public String getId_if() {
		return id_if;
	}
	public void setId_if(String id_if) {
		this.id_if = id_if;
	}
	public String getPw_if() {
		return pw_if;
	}
	public void setPw_if(String pw_if) {
		this.pw_if = pw_if;
	}
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
	public String getPartystt_cd() {
		return partystt_cd;
	}
	public void setPartystt_cd(String partystt_cd) {
		this.partystt_cd = partystt_cd;
	}
	public String getDept_nm() {
		return dept_nm;
	}
	public void setDept_nm(String dept_nm) {
		this.dept_nm = dept_nm;
	}
	public String getDuty_if() {
		return duty_if;
	}
	public void setDuty_if(String duty_if) {
		this.duty_if = duty_if;
	}
	public String getTel_no_no() {
		return tel_no_no;
	}
	public void setTel_no_no(String tel_no_no) {
		this.tel_no_no = tel_no_no;
	}
	public String getEmail_if() {
		return email_if;
	}
	public void setEmail_if(String email_if) {
		this.email_if = email_if;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public String getDocregaut_yn() {
		return docregaut_yn;
	}
	public void setDocregaut_yn(String docregaut_yn) {
		this.docregaut_yn = docregaut_yn;
	}
	
}
