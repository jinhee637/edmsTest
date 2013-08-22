package kr.co.kibi.edms.admin.web;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.AdminCategoryService;
import kr.co.kibi.edms.admin.service.DocService;
import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.KibiFileMngService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.PagingVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;
import kr.co.kibi.edms.util.CalcPaging;

import org.apache.jempbox.xmp.XMPMetadata;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentCatalog;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.apache.pdfbox.pdmodel.common.PDMetadata;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DocController implements ApplicationContextAware, InitializingBean {
	
	/**
	 * 서비스 불러오기 start
	 */
	@Resource(name = "DocService")
	private DocService docService;
	
	@Resource(name = "AdminCategoryService")
	private AdminCategoryService adminCategoryService;
	
	@Resource(name = "KibiFileMngService")
	private KibiFileMngService fileMngService;
	
	@Resource(name = "ComIndexService")
  	private ComIndexService comService;
	/**
	 * 서비스 불러오기 end
	 */
	
	/**
	 * 문서 목록(Meta 검색)
	 * @author 이진희
	 */
	@RequestMapping("/admin/docList.do")
	public String docList(Model model, PagingVO pvo, DocVO dvo) throws Exception{
		try {
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
			
			List<DocVO> docList = docService.selectDocList(dvo);
			
			if(docList.size() > 0){
				pvo.setAllCount(docList.get(0).getPagingVO().getAllCount());
			}
			
			CalcPaging.calcPageNavigation(pvo);
			
			model.addAttribute("docList", docList);
			model.addAttribute("dvo", dvo);
			model.addAttribute("pvo", pvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/doc/DocList";
	}
	
	/**
	 * 문서 상세 보기
	 * @author 이진희
	 */
	@RequestMapping("/admin/docView.do")
	public String docView(Model model, DocVO dvo) throws Exception{
		try {
			DocVO rvo = docService.selectDocView(dvo);
			System.out.println("TEST");
			
			FileVO fvo = new FileVO();
			fvo.setArticleId(Integer.toString(rvo.getArticleId()));
			
			FileVO rfvo = new FileVO();
			rfvo = fileMngService.selectFileInf(fvo);
			
			List<DocVO> suggestList = docService.selectSuggestList(dvo);
			
			if(suggestList.get(0).getSgtDc() == null){
				model.addAttribute("suggestList");
			}else{
				model.addAttribute("suggestList", suggestList);
			}
			
			model.addAttribute("rvo", rvo);
			model.addAttribute("dvo", dvo);
			model.addAttribute("rfvo", rfvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/doc/DocView";
	}
	
	/**
	 * 문서 수정
	 * @author 이진희
	 */
	@RequestMapping("/admin/docUpt.do")
	public String docUpt(Model model, DocVO dvo) throws Exception{
		try {
			DocVO rvo = docService.selectDocView(dvo);
			
			FileVO fvo = new FileVO();
			
			fvo.setArticleId(Integer.toString(rvo.getArticleId()));
			
			FileVO rfvo = new FileVO();
			
			rfvo = fileMngService.selectFileInf(fvo);
			
			model.addAttribute("rvo", rvo);
			model.addAttribute("rfvo", rfvo);
			model.addAttribute("dvo", dvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/doc/DocUpt";
	}
	
	/**
	 * 문서 수정 처리
	 * @author 이진희
	 */
	@RequestMapping("/admin/docUptOk.do")
	public String docUptOk(Model model, DocVO dvo, FileVO fvo) throws Exception{
		try {
			
			dvo.setMetafregDt(dvo.getMetafregDt().replace(".", "-"));
			
			docService.updateDoc(dvo);
			
			String pdf = fvo.getSavepathIf() + fvo.getSavefileNm();
			
			System.out.println(pdf);
			PDDocument document = PDDocument.load(pdf);
			PDDocumentInformation info = document.getDocumentInformation();
			
			// 메타데이타 항목 중 변경되지 않는 PDF문서를 위한 구문 Start
			PDDocumentCatalog catalog = document.getDocumentCatalog();
            XMPMetadata metadata = new XMPMetadata();
            
            PDMetadata metadataStream = new PDMetadata(document);
            metadataStream.importXMPMetadata(metadata);
            catalog.setMetadata(metadataStream);
            // END
            
			info.setAuthor(dvo.getUptWritmanNm());
			info.setKeywords(dvo.getUptKeywordIf());
			info.setTitle(dvo.getUptTitIf());
		    info.setSubject(dvo.getUptSbjNt());
		    if(dvo.getMetafregDt() != null || dvo.getMetafregDt() != ""){
			    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			    Date date = formatter.parse(dvo.getMetafregDt());
			    Calendar c = Calendar.getInstance();
			    c.setTime(date);
			    info.setCreationDate(c);
		    }
		    document.save(pdf);
		    
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "forward:/admin/docList.do";
	}
	
	/**
	 * 문서 삭제
	 * @author 이진희
	 */
	@RequestMapping("/admin/docDel.do")
	public String docDel(DocVO dvo, FileVO fvo) throws Exception{
		try {	
			
			String file = fvo.getSavepathIf() + File.separator + fvo.getSavefileNm();
			File f = new File(file);
			f.delete();

			docService.deleteDoc(dvo);
			fileMngService.deleteFileInf(fvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/admin/docList.do";
	}
	
	/**
	 * 문서에 들어갈 카테고리 수정을 위한 팝업 조회
	 * @author 이진희
	 */
	@RequestMapping("/admin/docCatUpt.do")
	public String docCatUpt(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo) throws Exception{
		try {
			LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
			vo.setGroup_seq(user.getGroup_seq());
			if(user.getBizrole_cd().equals("ADMIN")){
    			vo.setIsAdmin("Y");
    		}
			List<CategoryVO> clist =comService.selectLeftCate(vo);
    		model.addAttribute("cvo", vo);
    		model.addAttribute("treeList", clist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "admin/doc/DocCatUpt";
	}
	
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
	}
}
