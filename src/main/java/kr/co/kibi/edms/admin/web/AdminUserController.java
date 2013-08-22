package kr.co.kibi.edms.admin.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.AdminUserService;
import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.KibiMessageSource;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.PagingVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.com.web.ComIndexController;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class AdminUserController implements ApplicationContextAware, InitializingBean {
	
	private ApplicationContext applicationContext;

	protected static final Log LOG = LogFactory.getLog(AdminUserController.class);

	@Resource(name = "AdminUserService")
  	private AdminUserService adminUserService;
	@Resource(name = "ComIndexService")
  	private ComIndexService comService;
    @Resource(name="kibiMessageSource")
    KibiMessageSource kibiMessageSource;
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub

	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = applicationContext;
		LOG.info("AdminUserController setApplicationContext method has called!");
	}
   /**
	 * 관리자 사용자 조회 화면
	 * @param vo -UserVO
	 * @param request - 
	 * @return result - 
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/userList.do")
    public String userList(@RequestParam(value="pageNo",required=false) String pageNo,@ModelAttribute("searchVO") UserVO vo, HttpServletRequest request,ModelMap model) throws Exception {
    	try{
    		System.out.println(vo.getPageIndex()+">>>>>");
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(vo.getPageIndex()); //현재 페이지 번호
		paginationInfo.setRecordCountPerPage(vo.getRecordCountPerPage()); //한 페이지에 게시되는 게시물 건수
		paginationInfo.setPageSize(vo.getPageSize()); //페이징 리스트의 사이즈
		
		vo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
    	List<UserVO> userList = adminUserService.selectUserList(vo);
    	CodeVO cvo = new CodeVO();
    	cvo.setMcode("ED0001");
    	List<CodeVO> codeList = adminUserService.getCode(cvo);
    	
    	paginationInfo.setTotalRecordCount(adminUserService.selectUserCount(vo));
    	model.addAttribute("totalCnt", userList.size());
    	model.addAttribute("userList", userList);
    	model.addAttribute("codeList", codeList);
    	//페이징 관련 정보가 있는 PaginationInfo 객체를 모델에 반드시 넣어준다.
		model.addAttribute("paginationInfo", paginationInfo);
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return "/admin/user/ad_user_list";
    } 
   /**
	 * 관리자 사용자 상태 변경
	 * @param vo -UserVO
	 * @param request - 
	 * @return result - 
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/updateUserStatus.do")
    public String updateUserStatus(@RequestParam(value="pageNo", required=false) String pageNo,@ModelAttribute("searchVO") UserVO vo, HttpServletRequest request,ModelMap model) throws Exception {
    	try { 
    		System.out.println(vo.getPageIndex()+">>>>>update");
    		int result=0;
    		result =adminUserService.updateUserStatus(vo);
    		model.addAttribute("message", kibiMessageSource.getMessage("success.admin.change"));
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
		}  
    	return "forward:/admin/userList.do";
    }
   /**
	 * 관리자 사용자 문서등록권한
	 * @param vo -UserVO
	 * @param request - 
	 * @return result - 
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/updateUserDocAuth.do")
    public String updateUserDocAuth(@RequestParam(value="pageNo", required=false) String pageNo,@ModelAttribute("searchVO") UserVO vo, HttpServletRequest request,ModelMap model) throws Exception {
    	try { 
    		int result=0;
    		result =adminUserService.updateUserDocAuth(vo);
    		model.addAttribute("message", kibiMessageSource.getMessage("success.admin.change"));
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
		}  
    	return "forward:/admin/userList.do";
    }
    @RequestMapping(value="/admin/regUser.do")
    public String regUser(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws Exception {
    	try { 
    		List<GroupVO> grouplist = comService.selectGroup();
    		model.addAttribute("groupList", grouplist);
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "/admin/user/regUser"; 
	}
    @RequestMapping(value="/admin/regUserProc.do")
    public String regUserProc(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		int result=0;
    		result =  comService.checkUser(vo);
    		if(result > 0){
    			model.addAttribute("message", kibiMessageSource.getMessage("fail.common.join"));
    			return "forward:/admin/userList.do";
    		}else{
    			result = comService.insertUser(vo);
    			model.addAttribute("message", kibiMessageSource.getMessage("success.common.join"));
    			return "forward:/admin/userList.do";
    		}
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "forward:/admin/userList.do"; 
	}
    @RequestMapping(value="/admin/viewUser.do")
    public String viewUser(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		UserVO uvo = adminUserService.selectUserDetail(vo);
    		model.addAttribute("vo",uvo);
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "/admin/user/ad_user_detail"; 
	}
    @RequestMapping(value="/admin/forUpdateUser.do")
    public String forUpdateUser(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		UserVO uvo = adminUserService.selectUserDetail(vo);
    		List<GroupVO> grouplist = comService.selectGroup();
    		
    		CodeVO cvo = new CodeVO();
        	cvo.setMcode("ED0001");
        	List<CodeVO> codeList = adminUserService.getCode(cvo);
        	
        	model.addAttribute("codeList", codeList);
    		model.addAttribute("groupList", grouplist);
    		model.addAttribute("vo",uvo);
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "/admin/user/ad_user_update"; 
	}
	 @RequestMapping(value="/admin/UpdateUserProc.do")
    public String UpdateUserProc(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		int result=0;
    		result = adminUserService.updateUser(vo);
    		System.out.println(result+">>>>>>>>>>");
    		if(result > 0)
    			model.addAttribute("message", kibiMessageSource.getMessage("success.admin.change"));
    		else
    			model.addAttribute("message", kibiMessageSource.getMessage("fail.common.msg"));
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "forward:/admin/viewUser.do"; 
	}
	 @RequestMapping(value="/admin/ChangePassword.do")
    public String ChangePassword(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		int result=0;
    		result = adminUserService.changePassword(vo);
    		if(result > 0)
    			model.addAttribute("message", kibiMessageSource.getMessage("success.admin.change"));
    		else
    			model.addAttribute("message", kibiMessageSource.getMessage("fail.common.msg"));
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "forward:/admin/forUpdateUser.do"; 
	}
}
