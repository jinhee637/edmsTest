package kr.co.kibi.edms.com.web;


import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.KibiMessageSource;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;

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


@Controller
public class ComIndexController implements ApplicationContextAware ,InitializingBean {

	private ApplicationContext applicationContext;

	protected static final Log LOG = LogFactory.getLog(ComIndexController.class);

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
		LOG.info("ComIndexController setApplicationContext method has called!");
	}
	@RequestMapping("/com/onlyAdmin.do")
	public String onlyAdmin(HttpServletRequest request,ModelMap model){
		return "com/onlyAdmin";
	}
	@RequestMapping("/EdmsMain.do")
	public String index(HttpServletRequest request,ModelMap model){
		return "com/EdmsMain";
	}

	@RequestMapping("/EdmsTop.do")
	public String top(){
		return "com/top";
	}

	@RequestMapping("/EdmsBottom.do")
	public String bottom(){
		return "com/footer";
	}

	@RequestMapping("/EdmsContent.do")
	public String setContent(ModelMap model){

//		LoginVO loginVO = (LoginVO)EgovUserDetailsHelper.getAuthenticatedUser();
//		model.addAttribute("loginVO", loginVO);

		return "com/testLoginSuccess";
	}


	@RequestMapping("/EdmsLeft.do")
	public String setLeftMenu(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo){
    	try {       
    		LoginVO user = (LoginVO)UserDetailHelper.getAuthenticatedUser();
    		vo.setGroup_seq(user.getGroup_seq());
    		if(user.getBizrole_cd().equals("ADMIN")){
    			vo.setIsAdmin("Y");
    		}
    		List<CategoryVO> clist =comService.selectLeftCate(vo);
    		model.addAttribute("cvo", vo);
    		model.addAttribute("treeList", clist);
    		if(user.getBizrole_cd().equals("ADMIN")){
    			return "com/left_admin";		
    		}else{
    			return "com/left_user";
    		}
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
		}
		return "com/left_user";
	}
	/**
	 * 로그인 화면으로 들어간다
	 * @param vo - 로그인후 이동할 URL이 담긴 LoginVO
	 * @return 로그인 페이지
	 * @exception Exception
	 */
    @RequestMapping(value="/com/LoginUsr.do")
	public String loginUsrView(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	loginVO = (LoginVO) UserDetailHelper.getAuthenticatedUser();
    	System.out.println("!!!loginusr");
    	if(loginVO != null){
    		return "com/EdmsMain";
    	}else{
    		return "com/LoginUsr";	
    	}
    	
	}
    /**
	 * 일반(세션) 로그인을 처리한다
	 * @param vo - 아이디, 비밀번호가 담긴 LoginVO
	 * @param request - 세션처리를 위한 HttpServletRequest
	 * @return result - 로그인결과(세션정보)
	 * @exception Exception
	 */
    @RequestMapping(value="/com/actionLogin.do")
    public String actionLogin(@ModelAttribute("loginVO") LoginVO loginVO, 
    		                   HttpServletRequest request,
    		                   ModelMap model)
            throws Exception {
    	
    	if(loginVO.getId_if().length()==6){
    		loginVO.setId_if("19"+loginVO.getId_if());
    	}
    	// 1. 일반 로그인 처리
        LoginVO resultVO = comService.actionLogin(loginVO);
    
        if (resultVO != null && resultVO.getId_if() != null && !resultVO.getId_if().equals("")) {
        	if(resultVO.getPartystt_cd().equals("W")){
        		model.addAttribute("message", kibiMessageSource.getMessage("fail.common.wait"));
        		return "com/LoginUsr";
        	}else if(resultVO.getPartystt_cd().equals("N")){
        		model.addAttribute("message", kibiMessageSource.getMessage("fail.common.no"));
        		return "com/LoginUsr";
        	}else if(resultVO.getPartystt_cd().equals("D")){
        		model.addAttribute("message", kibiMessageSource.getMessage("fail.common.delete"));
        		return "com/LoginUsr";
        	}
        	// 2-1. 로그인 정보를 세션에 저장
        	request.getSession().setAttribute("loginVO", resultVO);
//    		return "redirect:/uat/uia/actionMain.do";
        	return "com/EdmsMain";
      
        } else {
    		model.addAttribute("message", kibiMessageSource.getMessage("fail.common.login"));
        	
        	return "com/LoginUsr";
        }
    } 
    /**
	 * 로그아웃한다.
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/com/actionLogout.do")
	public String actionLogout(HttpServletRequest request, ModelMap model) 
			throws Exception {
    	request.getSession().setAttribute("loginVO", null);
    	return "redirect:/index.jsp";
    }
    @RequestMapping(value="/com/userJoin.do")
    public String uerJoin(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws Exception {
    	try { 
    		List<GroupVO> grouplist = comService.selectGroup();
    		model.addAttribute("groupList", grouplist);
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "/com/joinUser"; 
	}
    @RequestMapping(value="/com/regUser.do")
    public String regUser(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
    	try { 
    		System.out.println("reguser--Com");
    		int result=0;
    		result =  comService.checkUser(vo);
    		if(result > 0){
    			model.addAttribute("message", kibiMessageSource.getMessage("fail.common.join"));
    	    	return "/com/joinUser";
    		}else{
    			result = comService.insertUser(vo);
    			model.addAttribute("message", kibiMessageSource.getMessage("success.common.join"));
    			return "forward:/com/LoginUsr.do";
    		}
    	}catch(Exception e){      
    		e.printStackTrace();
		}    
    	return "/com/joinUser"; 
	}
    /**
	 * 테스트 로그아웃한다.
	 * @return void
	 * @exception Exception
	 */
    @RequestMapping(value="/com/testLogout.do")
	public void testLogout(HttpServletRequest request, ModelMap model) 
			throws Exception {
    	request.getSession().setAttribute("loginVO", null);
    	
    }
    /**
	 * 세션아웃 페이지 이동.
	 * @return void
	 * @exception Exception
	 */
    @RequestMapping(value="/com/sessionOut.do")
	public String sessionOut(HttpServletRequest request, ModelMap model)throws Exception {
    	System.out.println("sessionout!!!");
    	return "/com/forwardLogout";
    	
    }
    /**
	 * 파일 업로드 테스트
	 * @return void
	 * @exception Exception
	 */
    @RequestMapping(value="/com/testFile.do")
	public String testFile(HttpServletRequest request, ModelMap model)throws Exception {
    	System.out.println("sessionout!!!");
    	return "/com/forwardLogout";
    	
    }
}
