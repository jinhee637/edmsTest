package kr.co.kibi.edms.user.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.KibiFileMngService;
import kr.co.kibi.edms.com.service.KibiFileMngUtil;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.PagingVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;
import kr.co.kibi.edms.user.service.UserDocService;
import kr.co.kibi.edms.util.CalcPaging;
import kr.co.kibi.edms.util.EgovProperties;

import org.apache.jempbox.xmp.XMPMetadata;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentCatalog;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.pdmodel.common.PDMetadata;
import org.json.simple.JSONObject;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class UserDocController implements ApplicationContextAware, InitializingBean {
	
	/**
	 * 서비스 불러오기 start
	 */
	@Resource(name = "UserDocService")
	private UserDocService userDocService;
	
	@Resource(name = "KibiFileMngService")
	private KibiFileMngService fileMngService;
	
	@Resource(name = "KibiFileMngUtil")
    private KibiFileMngUtil fileUtil;
	/**
	 * 서비스 불러오기 end
	 */
	
	/**
	 * 카테고리별 문서 목록
	 * @Author 이진희
	 */
	@RequestMapping("/user/categoryDocList.do")
	public String categoryDocList(HttpServletRequest request, Model model, PagingVO pvo, DocVO dvo) throws Exception{
		try {
			
			dvo.setPagingVO(pvo);
			dvo.setDocSeq(0);
			if(dvo.getOrderDt() == null || dvo.getOrderDt().equalsIgnoreCase("")){
				dvo.setOrderDt("on");
				dvo.setOrderDownCnt("off");
				dvo.setOrderViewCnt("off");
			}
			LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
			dvo.setDeptSeq(user.getGroup_seq());
			
			List<DocVO> categoryDocList = userDocService.selectCategoryDocList(dvo);
			
			if(categoryDocList.size() > 0)
				pvo.setAllCount(categoryDocList.get(0).getPagingVO().getAllCount());
			
			CalcPaging.calcPageNavigation(pvo);
			
			model.addAttribute("categoryDocList", categoryDocList);
			model.addAttribute("dvo", dvo);
			model.addAttribute("pvo", pvo);
			model.addAttribute("lvo", request.getSession().getAttribute("loginVO"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/doc/CategoryDocList";
	}
	
	/**
	 * 문서 목록 Meta 검색
	 * @Author 이진희
	 */
	@RequestMapping("/user/metaDocList.do")
	public String metaDocList(HttpServletRequest request, Model model, PagingVO pvo, DocVO dvo) throws Exception{
		try {
			
			LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
			dvo.setBizroleCd(user.getBizrole_cd());
			
			dvo.setPagingVO(pvo);
			dvo.setDocSeq(0);
			if(dvo.getOrderDt() == null || dvo.getOrderDt().equalsIgnoreCase("")){
				dvo.setOrderDt("on");
				dvo.setOrderDownCnt("off");
				dvo.setOrderViewCnt("off");
			}
			
			if(dvo.getTitSearch() == null || dvo.getTitSearch().equalsIgnoreCase("")){
				dvo.setTitSearch("N");
			}
			
			if(dvo.getWritmanSearch() == null || dvo.getWritmanSearch().equalsIgnoreCase("")){
				dvo.setWritmanSearch("N");
			}
			
			if(dvo.getSbjSearch() == null || dvo.getSbjSearch().equalsIgnoreCase("")){
				dvo.setSbjSearch("N");
			}
			
			if(dvo.getKeywordSearch() == null || dvo.getKeywordSearch().equalsIgnoreCase("")){
				dvo.setKeywordSearch("N");
			}
			
			if(dvo.getAllSearch() == null || dvo.getAllSearch().equalsIgnoreCase("")){
				dvo.setAllSearch("N");
			}
			
			dvo.setDeptSeq(user.getGroup_seq());
			
			List<DocVO> metaDocList = userDocService.selectMetaDocList(dvo);
			
			if(metaDocList.size() > 0){
				pvo.setAllCount(metaDocList.get(0).getPagingVO().getAllCount());
			}
			
			CalcPaging.calcPageNavigation(pvo);
			
			model.addAttribute("metaDocList", metaDocList);
			model.addAttribute("dvo", dvo);
			model.addAttribute("pvo", pvo);
			model.addAttribute("lvo", request.getSession().getAttribute("loginVO"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/doc/MetaDocList";
	}
	
	/**
	 * 문서 상세 보기
	 * @Author 이진희
	 */
	@RequestMapping("/user/docView.do")
	public String docView(HttpServletRequest request, HttpServletResponse response, Model model, DocVO dvo, LoginVO lvo) throws Exception{
		
		LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
		
		try {
			if(lvo.getBizrole_cd().equalsIgnoreCase("ADMIN")){
			}else{
				if(dvo.getSug().equalsIgnoreCase("N")){
					userDocService.updateViewCnt(dvo);
				}else{
				}
			}
			
			DocVO rvo = userDocService.selectDocView(dvo);
			
			FileVO fvo = new FileVO();
			fvo.setArticleId(Integer.toString(rvo.getArticleId()));
			
			FileVO rfvo = new FileVO();
			rfvo = fileMngService.selectFileInf(fvo);
			
			String org = rfvo.savepathIf + File.separator + rfvo.savefileNm;
			
			System.out.println("pdfview == " + org);
			
			List<DocVO> suggestList = userDocService.selectSuggestList(dvo);
			
			if(suggestList.get(0).getSgtDc() == null){
				model.addAttribute("suggestList");
			}else{
				model.addAttribute("suggestList", suggestList);
			}
			
			model.addAttribute("rvo", rvo);
			model.addAttribute("dvo", dvo);
			model.addAttribute("lvo", request.getSession().getAttribute("loginVO"));
			model.addAttribute("rfvo", rfvo);
			model.addAttribute("pdfView", org);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/doc/DocView";
	}
	
	/**
	 * 의견 등록
	 * @Author 이진희
	 */
	@RequestMapping("/user/suggestInsert.do")
	public String suggestInsert(HttpServletRequest request, Model model, DocVO dvo) throws Exception{
		try {
			userDocService.insertSuggest(dvo);
			
			System.out.println(dvo.getAll());
			model.addAttribute("dvo", dvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "forward:/user/docView.do";
	}
	
	/**
	 * 문서 등록
	 * @Author 이진희
	 */
	@RequestMapping("/user/docInsert.do")
	public String docInsert(HttpServletRequest request, Model model, DocVO dvo) throws Exception{
		try {
			System.out.println("cat_seq ========= " + dvo.getCatSeq());
			model.addAttribute("lvo", request.getSession().getAttribute("loginVO"));
			model.addAttribute("dvo", dvo); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "user/doc/DocInsert";
	}
	
	/**
	 * 문서 등록 처리
	 * @Author 이진희
	 */
	@RequestMapping("/user/docInsertOk.do")
	public String docInsertOk(Model model, DocVO dvo, FileVO fvo) throws Exception{
		try {
			
			String articleId = "";
			
			String inFolder = fvo.getTemppathIf();
			
			String outFolder = fvo.getSavepathIf();
			System.out.println("tempPath === " + inFolder + fvo.getSavefileNm());
			System.out.println("savePath === " + outFolder + fvo.getSavefileNm());
			//fileMove(inFolder+fvo.getSavefileNm(), outFolder+fvo.getSavefileNm(), inFolder);
			
			userDocService.insertDoc(dvo);
			
			articleId = fileMngService.insertFileInf(fvo);
			
			String pdf = inFolder + fvo.getOrgfileNm();
			System.out.println("경로 = " + pdf);
		    PDDocument document = PDDocument.load(pdf);
		    PDDocumentInformation info = document.getDocumentInformation();
		    
		    // 메타데이타 항목 중 변경되지 않는 PDF문서를 위한 구문 Start
		    PDDocumentCatalog catalog = document.getDocumentCatalog();
            XMPMetadata metadata = new XMPMetadata();
            
            PDMetadata metadataStream = new PDMetadata(document);
            metadataStream.importXMPMetadata(metadata);
            catalog.setMetadata(metadataStream);
            // END
            
		    info.setAuthor(dvo.getWritmanNm());
		    info.setKeywords(dvo.getKeywordIf());
		    info.setTitle(dvo.getTitIf());
		    System.out.println("작성자 = " + dvo.getWritmanNm());
		    System.out.println("작성자 info = " + info.getAuthor());
		    info.setSubject(dvo.getSbjNt());
		    
		    if(dvo.getMetafregDt() != null && dvo.getMetafregDt() != ""){
			    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			    Date date = formatter.parse(dvo.getMetafregDt());
			    Calendar c = Calendar.getInstance();
			    c.setTime(date);
			    info.setCreationDate(c);
		    }
		    document.save(outFolder+fvo.getOrgfileNm());
		    document.close();
		    deleteFolder(inFolder);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/user/metaDocList.do";
	}
	
	
	/**
	 * 문서 등록 취소
	 * @Author 이진희
	 */
	@RequestMapping("/user/docInsertCancel.do")
	public String docInsertCancel(Model model, FileVO fvo, DocVO dvo){
			if(fvo.getArticleId() != null && fvo.getArticleId() != ""){
				String file = fvo.getTemppathIf();
				deleteFolder(file);
			}

		return "forward:/user/categoryDocList.do";
	}
	
	
	/**
	 * 파일 업로드 처리
	 * @Author 이진희
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/user/docUploadOk.do")
	public ResponseEntity<String> docUploadOk(final MultipartHttpServletRequest multiRequest,  HttpServletResponse response, /*@RequestParam(value="files[]", required=false) MultipartFile[] files,*/ Model model, FileVO fvo) throws Exception{
		
			List<FileVO> fileList = new ArrayList<FileVO>();
			FileVO fileResult = new FileVO();
			String message = "";
			LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
			JSONObject rst = new JSONObject();
			try {
				
				final Map<String, MultipartFile> file = multiRequest.getFileMap();
				Iterator<Entry<String, MultipartFile>> itr = file.entrySet().iterator();
				MultipartFile mfile;
						
				while(itr.hasNext()){
					Entry<String, MultipartFile> entry = itr.next();
					
					mfile = entry.getValue();
					
					fvo.setOrgfileNm(mfile.getOriginalFilename());
				}
				
				if(!file.isEmpty()){
					System.out.println("FILE ============= " + file);
					
					int count = fileMngService.selectOrgfileNm(fvo);
					
					if(count > 0){
						message = "동일한 파일명이 존재합니다.";
						
						rst.put("articleId", "");
						rst.put("extNm", "");
						rst.put("fileSizeNum", "");
						rst.put("savepathIf", "");
						rst.put("orgfileNm", "");
						rst.put("savefileNm", "");
						rst.put("temppathIf", EgovProperties.getProperty("Globals.tempFileStorePath")+"/"+user.getId_if()+"/");
						rst.put("titIf", "");
						rst.put("writmanNm", "");
						rst.put("sbjNt", "");
						rst.put("keywordIf", "");
						rst.put("metafregDt", "");
						rst.put("message", message);
					}else{
						System.out.println(fvo.getOrgfileNm().substring(fvo.getOrgfileNm().length()-3, fvo.getOrgfileNm().length()));
						
						if (fvo.getOrgfileNm().substring(fvo.getOrgfileNm().length()-3, fvo.getOrgfileNm().length()).equalsIgnoreCase("pdf")) {
						
							fileList = fileUtil.parseFileInf(file, "TEST_", 0, "", "", user.getId_if());
						}
						
						FileVO rvo = fileMngService.selectArticleId();
						rst.put("articleId", rvo.getArticleId());
						rst.put("extNm", fileList.get(0).getExtNm());
						rst.put("fileSizeNum", fileList.get(0).getFileSizeNum());
						rst.put("savepathIf", fileList.get(0).getSavepathIf());
						rst.put("temppathIf", fileList.get(0).getTemppathIf());
						rst.put("orgfileNm", fileList.get(0).getOrgfileNm());
						rst.put("savefileNm", fileList.get(0).getSavefileNm());
						rst.put("titIf", fileList.get(0).getTitIf());
						rst.put("writmanNm", fileList.get(0).getWritmanNm());
						rst.put("sbjNt", fileList.get(0).getSbjNt());
						rst.put("keywordIf", fileList.get(0).getKeywordIf());
						rst.put("metafregDt", fileList.get(0).getMetafregDt());
						rst.put("message", message);
					}
					
					
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			JSONObject result = new JSONObject();
			result.put("files", rst);
			
			String strArr = result.toJSONString();
			System.out.println("result = " + strArr);
			
			HttpHeaders responseHeaders = new HttpHeaders();
	        responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
			
			return new ResponseEntity<String>(strArr, responseHeaders, HttpStatus.CREATED);
	}
	
	//파일을 이동하는 메소드
	public static void fileMove(String inFileName, String outFileName, String inFolder) {
		try {
			FileInputStream fis = new FileInputStream(inFileName);
			FileOutputStream fos = new FileOutputStream(outFileName);
			   
			int data = 0;
			while((data=fis.read())!=-1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			   
			//복사한뒤 원본파일을 삭제함
			deleteFolder(inFolder);
		   
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//폴더를 지우는 메소드
	public static boolean deleteFolder(String delTarget) {
		  File delDir = new File(delTarget);
		  
		  if(delDir.isDirectory()) {
		   File[] allFiles = delDir.listFiles();
		   
		   for(File delAllDir : allFiles) {
		    deleteFolder(delAllDir.getAbsolutePath());
		   }
		  }
		  
		  return delDir.delete();
		 }
	 
	 
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
	}
}
