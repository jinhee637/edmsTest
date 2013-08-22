package kr.co.kibi.edms.admin.service;

public class AuthorityVO {
	private int aut_seq;
	private int cat_seq;
	private int	doc_seq;
	private int group_seq;
	private int party_seq;
	private String usesrt_dt;
	private String useend_dt;
	private String readaut_yn;
	private String writeaut_yn;
	private String downaut_yn;
	private int authsort_sor;
	private int[] grouparr;
	
	
	public int getAuthsort_sor() {
		return authsort_sor;
	}
	public void setAuthsort_sor(int authsort_sor) {
		this.authsort_sor = authsort_sor;
	}
	public int getAut_seq() {
		return aut_seq;
	}
	public void setAut_seq(int aut_seq) {
		this.aut_seq = aut_seq;
	}
	public int getCat_seq() {
		return cat_seq;
	}
	public void setCat_seq(int cat_seq) {
		this.cat_seq = cat_seq;
	}
	public int getDoc_seq() {
		return doc_seq;
	}
	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}
	public int getGroup_seq() {
		return group_seq;
	}
	public void setGroup_seq(int group_seq) {
		this.group_seq = group_seq;
	}
	public int getParty_seq() {
		return party_seq;
	}
	public void setParty_seq(int party_seq) {
		this.party_seq = party_seq;
	}
	public String getUsesrt_dt() {
		return usesrt_dt;
	}
	public void setUsesrt_dt(String usesrt_dt) {
		this.usesrt_dt = usesrt_dt;
	}
	public String getUseend_dt() {
		return useend_dt;
	}
	public void setUseend_dt(String useend_dt) {
		this.useend_dt = useend_dt;
	}
	public String getReadaut_yn() {
		return readaut_yn;
	}
	public void setReadaut_yn(String readaut_yn) {
		this.readaut_yn = readaut_yn;
	}
	public String getWriteaut_yn() {
		return writeaut_yn;
	}
	public void setWriteaut_yn(String writeaut_yn) {
		this.writeaut_yn = writeaut_yn;
	}
	public String getDownaut_yn() {
		return downaut_yn;
	}
	public void setDownaut_yn(String downaut_yn) {
		this.downaut_yn = downaut_yn;
	}
	public int[] getGrouparr() {
		return grouparr;
	}
	public void setGrouparr(int[] grouparr) {
		this.grouparr = grouparr;
	}
	
	
}
