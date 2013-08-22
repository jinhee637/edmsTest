package kr.co.kibi.edms.com.service;

public class UserVO {
	private int party_seq;
	private String id_if;
	private String pw_if;
	private String docregaut_yn;
	private String dept_cd;
	private String partystt_cd;
	private String dept_nm;
	private String duty_if;
	private String tel_no_no;
	private String email_if;
	private String user_nm;
	private int group_seq;
	private int totalcnt;
	private String partystt_nm;
	
	
	private String searchSel;
	private String searchWord;
	 /** 현재페이지 */
    private int pageIndex = 1;
    /** 페이지갯수 */
    private int pageUnit = 20;

    /** 페이지사이즈 */
    private int pageSize = 10;

    /** firstIndex */
    private int firstIndex = 1;

    /** lastIndex */
    private int lastIndex = 1;
    /** recordCountPerPage */
    private int recordCountPerPage = 20;
    
    public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getLastIndex() {
		return lastIndex;
	}
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getSearchSel() {
		return searchSel;
	}
	public void setSearchSel(String searchSel) {
		this.searchSel = searchSel;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
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
	public String getDocregaut_yn() {
		return docregaut_yn;
	}
	public void setDocregaut_yn(String docregaut_yn) {
		this.docregaut_yn = docregaut_yn;
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
	public String getUser_nm() {
		return user_nm;
	}
	public void setUser_nm(String user_nm) {
		this.user_nm = user_nm;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public int getTotalcnt() {
		return totalcnt;
	}
	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}
	public String getPartystt_nm() {
		return partystt_nm;
	}
	public void setPartystt_nm(String partystt_nm) {
		this.partystt_nm = partystt_nm;
	}

	
}
