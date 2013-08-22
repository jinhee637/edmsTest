package kr.co.kibi.edms.user.web;

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
import kr.co.kibi.edms.admin.service.DocVO;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.FileVO;
import kr.co.kibi.edms.com.service.KibiFileMngService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.PagingVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;
import kr.co.kibi.edms.user.service.UserMyDocService;
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
public class UserMyDocController implements ApplicationContextAware, InitializingBean {
	
	/**
	 * 서비스 불러오기 start
	 */
	@Resource(name = "UserMyDocService")
	private UserMyDocService userMyDocService;
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
	 * 내문서 문서 목록
	 * @author 이진희
	 */
	@RequestMapping("/user/myDocList.do")
	public String myDocList(HttpServletRequest request,HttpServletResponse response,Model model, PagingVO pvo, DocVO dvo) throws Exception{
		try {
			LoginVO loginVO=null;
			loginVO = (LoginVO) UserDetailHelper.getAuthenticatedUser();
			
			dvo.setPagingVO(pvo);
			dvo.setDocSeq(0);
			if(dvo.getOrderDt() == null || dvo.getOrderDt().equalsIgnoreCase("")){
				dvo.setOrderDt("on");
				dvo.setOrderDownCnt("off");
				dvo.setOrderViewCnt("off");
			}
			
			dvo.setPartySeq(loginVO.getParty_seq());
			dvo.setDeptSeq(loginVO.getGroup_seq());
			dvo.setPagingVO(pvo);
			dvo.setDocSeq(0);
			List<DocVO> myDocList = userMyDocService.selectMyDocList(dvo);
			
			if(myDocList.size() > 0){
				pvo.setAllCount(myDocList.get(0).getPagingVO().getAllCount());
			}
			
			CalcPaging.calcPageNavigation(pvo);
			
			model.addAttribute("myDocList", myDocList);
			model.addAttribute("dvo", dvo);
			model.addAttribute("pvo", pvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/mydoc/ed_myList";
	}
	
	/**
	 * 내문서 문서 상세
	 * @author 이진희
	 */
	@RequestMapping("/user/myDocView.do")
	public String myDocView(HttpServletRequest request,Model model, DocVO dvo) throws Exception{
		try {
			DocVO rvo = userMyDocService.selectMyDocView(dvo);
			
			FileVO fvo = new FileVO();
			fvo.setArticleId(Integer.toString(rvo.getArticleId()));
			
			FileVO rfvo = new FileVO();
			rfvo = fileMngService.selectFileInf(fvo);
			
			List<DocVO> suggestList = userMyDocService.selectMySuggestList(dvo);
			
			if(suggestList.get(0).getSgtDc() == null){
				model.addAttribute("suggestList");
			}else{
				model.addAttribute("suggestList", suggestList);
			}
			
			model.addAttribute("rvo", rvo);
			model.addAttribute("dvo", dvo);
			model.addAttribute("rfvo", rfvo);
			model.addAttribute("lvo", request.getSession().getAttribute("loginVO"));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "user/mydoc/ed_myView";
	}
	
	/**
	 * 내문서 문서 수정
	 * @author 이진희
	 */
	@RequestMapping("/user/myDocUpt.do")
	public String docUpt(Model model, DocVO dvo) throws Exception{
		try {
			DocVO rvo = userMyDocService.selectMyDocView(dvo);
			
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
		return "user/mydoc/ed_myUpdate";
	}
	
	/**
	 * 내문서 문서 수정 처리
	 * @author 이진희
	 */
	@RequestMapping("/user/myDocUptOk.do")
	public String docUptOk(Model model, DocVO dvo, FileVO fvo) throws Exception{
		try {
			userMyDocService.updateMyDoc(dvo);
			
			String pdf = fvo.getSavepathIf() + fvo.getSavefileNm();
			
			PDDocument document = PDDocument.load(pdf);
			PDDocumentInformation info = document.getDocumentInformation();
			
			info.setAuthor(dvo.getUptWritmanNm());
			info.setKeywords(dvo.getUptKeywordIf());
			info.setTitle(dvo.getUptTitIf());
		    info.setSubject(dvo.getUptSbjNt());
		    if(dvo.getMetafregDt() != null && dvo.getMetafregDt() != ""){
			    DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			    String metaFregDt = dvo.getMetafregDt().replace(".", "-");
			    Date date = formatter.parse(metaFregDt);
			    Calendar c = Calendar.getInstance();
			    c.setTime(date);
			    info.setCreationDate(c);
		    }
		    
		 // 메타데이타 항목 중 변경되지 않는 PDF문서를 위한 구문 Start
	     PDDocumentCatalog catalog = document.getDocumentCatalog();
         XMPMetadata metadata = new XMPMetadata();
         
         PDMetadata metadataStream = new PDMetadata(document);
         metadataStream.importXMPMetadata(metadata);
         catalog.setMetadata(metadataStream);
         // END
		    
		    document.save(pdf);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "forward:/user/myDocList.do";
	}
	
	/**
	 * 내문서 문서 삭제
	 * @author 이진희
	 */
	@RequestMapping("/user/myDocDel.do")
	public String docDel(DocVO dvo, FileVO fvo) throws Exception{
		try {	
			String file = fvo.getSavepathIf() + File.separator + fvo.getSavefileNm();
			File f = new File(file);
			f.delete();
			
			userMyDocService.deleteMyDoc(dvo);
			fileMngService.deleteFileInf(fvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/user/myDocList.do";
	}
	
	/**
	 * 내문서 문서 수정에서 사용하는 카테고리 선택 팝업
	 * @author 이진희
	 */
	@RequestMapping("/user/docCatUpt.do")
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
