package kr.co.kibi.edms.com.service;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.util.EgovProperties;
import kr.co.kibi.edms.util.EgovWebUtil;

import org.apache.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("KibiFileMngUtil")
public class KibiFileMngUtil {
	public static final int BUFF_SIZE = 2048;

    private static final Logger LOG = Logger.getLogger(KibiFileMngUtil.class.getName());

    /**
     * 첨부파일에 대한 목록 정보를 취득+업로드.
     *
     * @param files
     * @return
     * @throws Exception
     */
    public List<FileVO> parseFileInf(Map<String, MultipartFile> files, String KeyStr, int fileKeyParam, String articleId, String storePath, String id) throws Exception {
	int fileKey = fileKeyParam;
	
	// 실 저장할 파일 Path
	String storePathString = "";
	
	String articleIdString = "";
	
	// temp 파일 Path
	String tempStorePathString = "";
	
	// Globals.properties에서 Path 가져 오기 
	if ("".equals(storePath) || storePath == null) {
	    storePathString = EgovProperties.getProperty("Globals.fileStorePath");
	    tempStorePathString = EgovProperties.getProperty("Globals.tempFileStorePath")+id+"/";
	} else {
	    storePathString = EgovProperties.getProperty(storePath);
	}

	if ("".equals(articleId) || articleId == null) {

	} else {
	    articleIdString = articleId;
	}

	File saveFolder = new File(EgovWebUtil.filePathBlackList(storePathString));
	File tempFolder = new File(EgovWebUtil.filePathBlackList(tempStorePathString));
	
	if (!saveFolder.exists() || saveFolder.isFile()) {
	    saveFolder.mkdirs();
	}
	
	if(!tempFolder.exists() || tempFolder.isFile()) {
		tempFolder.mkdirs();
	}

	Iterator<Entry<String, MultipartFile>> itr = files.entrySet().iterator();
	MultipartFile file;
	String filePath = "";
	List<FileVO> result  = new ArrayList<FileVO>();
	FileVO fvo;
	DocVO dvo;

	while (itr.hasNext()) {
	    Entry<String, MultipartFile> entry = itr.next();

	    file = entry.getValue();
	    String orginFileName = file.getOriginalFilename();

	    //--------------------------------------
	    // 원 파일명이 없는 경우 처리
	    // (첨부가 되지 않은 input file type)
	    //--------------------------------------
	    if ("".equals(orginFileName)) {
		continue;
	    }
	    ////------------------------------------

	    int index = orginFileName.lastIndexOf(".");
	    
	    String fileExt = orginFileName.substring(index + 1);
	    
	    long _size = file.getSize();

	    if (!"".equals(orginFileName)) {
	    	
    	filePath = tempStorePathString + File.separator + orginFileName;
    	
    	/* 파일 생성 */
		file.transferTo(new File(EgovWebUtil.filePathBlackList(filePath)));
	    }
	    
	    /* PDF 라이브러리 Meta GET START */
	    String pdf = tempStorePathString + File.separator + orginFileName;
	    PDDocument document = PDDocument.load(pdf);
	    PDDocumentInformation info = document.getDocumentInformation(); 
        System.out.println( "Title=" + info.getTitle() );
        System.out.println( "Author=" + info.getAuthor() );
        System.out.println( "Subject=" + info.getSubject() );
        System.out.println( "Keywords=" + info.getKeywords() );
        System.out.println( "Creator=" + info.getCreator() );
        System.out.println( "Creation Date=" + info.getCreationDate() );
        
        DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        String tempDate = "";
        
        if(info.getCreationDate() == null){
        	 
        }else{
        	tempDate = sdFormat.format(info.getCreationDate().getTime());
        }
        /* PDF 라이브러리 Meta GET END */
        
        /* 모델에 필요한 값 넣어 주기 START */
       	fvo = new FileVO();
	    fvo.setExtNm(fileExt);
	    fvo.setSavepathIf(storePathString);
	    fvo.setTemppathIf(tempStorePathString);
	    fvo.setFileSizeNum(Long.toString(_size));
	    fvo.setOrgfileNm(orginFileName);
	    fvo.setSavefileNm(orginFileName);
	    fvo.setArticleId(articleIdString);
	    fvo.setFileSeq(String.valueOf(fileKey));
	    fvo.setTitIf(info.getTitle());
	    fvo.setWritmanNm(info.getAuthor());
	    fvo.setSbjNt(info.getSubject());
	    fvo.setKeywordIf(info.getKeywords());
	    fvo.setMetafregDt(tempDate);
       
	    result.add(fvo);
	    /* 모델에 필요한 값 넣어 주기 END */
	    
	    fileKey++;
	}

	return result;
    }

}
