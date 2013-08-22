package kr.co.kibi.edms.com.service;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

@SuppressWarnings("serial")
public class FileVO implements Serializable {

    /**
     * 첨부파일 아이디
     */
    public String articleId = "";
    /**
     * 생성일자
     */
    public String regTm = "";
    /**
     * 파일내용
     */
    public String fileNt = "";
    /**
     * 파일확장자
     */
    public String extNm = "";
    /**
     * 파일크기
     */
    public String fileSizeNum = "";
    /**
     * 파일연번
     */
    public String fileSeq = "";
    /**
     * 파일저장경로
     */
    public String savepathIf = "";
    /**
     * 파일 Temp 경로
     */
    public String temppathIf = "";
    /**
     * 원파일명
     */
    public String orgfileNm = "";
    /**
     * 저장파일명
     */
    public String savefileNm = "";
    /**
     * 작성자번호
     */
    public String regptSeq = "";
    /**
     * 메타데이터 추출할때 사용할 문서 제목
     */
    public String titIf = "";
    /**
     * 메타데이터 추출할때 사용할 작성자명
     */
    public String writmanNm = "";
    /**
     * 메타데이터 추출할때 사용할 문서 주제
     */
    public String sbjNt = "";
    /**
     * 메타데이터 추출할때 사용할 키워드
     */
    public String keywordIf = "";
    /**
     * 메타데이터 추출할때 사용할 작성 일자 
     */
    public String metafregDt = "";

	/**
	 * getter, setter start
	 * 
	 */
    public String getArticleId() {
    	return articleId;
    }

    public void setArticleId(String articleId) {
    	this.articleId = articleId;
    }

    public String getRegTm() {
    	return regTm;
    }

    public void setRegTm(String regTm) {
    	this.regTm = regTm;
    }

    public String getFileNt() {
    	return fileNt;
    }

    public void setFileNt(String fileNt) {
    	this.fileNt = fileNt;
    }

    public String getExtNm() {
    	return extNm;
    }

    public void setExtNm(String extNm) {
    	this.extNm = extNm;
    }

    public String getFileSizeNum() {
    	return fileSizeNum;
    }

    public void setFileSizeNum(String fileSizeNum) {
    	this.fileSizeNum = fileSizeNum;
    }

    public String getFileSeq() {
    	return fileSeq;
    }

    public void setFileSeq(String fileSeq) {
    	this.fileSeq = fileSeq;
    }

    public String getSavepathIf() {
    	return savepathIf;
    }

    public void setSavepathIf(String savepathIf) {
    	this.savepathIf = savepathIf;
    }

    public String getOrgfileNm() {
    	return orgfileNm;
    }

    public void setOrgfileNm(String orgfileNm) {
    	this.orgfileNm = orgfileNm;
    }

    public String getSavefileNm() {
    	return savefileNm;
    }

    public void setSavefileNm(String savefileNm) {
    	this.savefileNm = savefileNm;
    }

	public String getRegptSeq() {
		return regptSeq;
	}

	public void setRegptSeq(String regptSeq) {
		this.regptSeq = regptSeq;
	}

	/**
     * toString 메소드를 대치한다.
     */
    public String toString() {
    	return ToStringBuilder.reflectionToString(this);
    }

	public String getTitIf() {
		return titIf;
	}

	public void setTitIf(String titIf) {
		this.titIf = titIf;
	}

	public String getWritmanNm() {
		return writmanNm;
	}

	public void setWritmanNm(String writmanNm) {
		this.writmanNm = writmanNm;
	}

	public String getSbjNt() {
		return sbjNt;
	}

	public void setSbjNt(String sbjNt) {
		this.sbjNt = sbjNt;
	}

	public String getKeywordIf() {
		return keywordIf;
	}

	public void setKeywordIf(String keywordIf) {
		this.keywordIf = keywordIf;
	}

	public String getMetafregDt() {
		return metafregDt;
	}

	public void setMetafregDt(String metafregDt) {
		this.metafregDt = metafregDt;
	}

	public String getTemppathIf() {
		return temppathIf;
	}

	public void setTemppathIf(String temppathIf) {
		this.temppathIf = temppathIf;
	}
	/**
	 * getter, setter end
	 * 
	 */
}
