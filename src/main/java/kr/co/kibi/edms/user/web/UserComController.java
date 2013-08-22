package kr.co.kibi.edms.user.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.KibiMessageSource;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.com.util.UserDetailHelper;
import kr.co.kibi.edms.user.service.UserComService;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserComController implements ApplicationContextAware, InitializingBean {
	
	@Resource(name = "UserComService")
	private UserComService userComService;
	@Resource(name = "ComIndexService")
  	private ComIndexService comService;
	@Resource(name="kibiMessageSource")
    KibiMessageSource kibiMessageSource;
	 @RequestMapping(value="/user/forUpdateUser.do")
	    public String forUpdateUser(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
	    	try { 
	    		LoginVO loginVO = (LoginVO)UserDetailHelper.getAuthenticatedUser();
	    		vo.setParty_seq(loginVO.getParty_seq());
	    		UserVO uvo = userComService.selectUserDetail(vo);
	    		List<GroupVO> grouplist = comService.selectGroup();
	    		
	    		CodeVO cvo = new CodeVO();
	        	cvo.setMcode("ED0001");
	        	List<CodeVO> codeList = userComService.getCode(cvo);
	        	
	        	model.addAttribute("codeList", codeList);
	    		model.addAttribute("groupList", grouplist);
	    		model.addAttribute("vo",uvo);
	    	}catch(Exception e){      
	    		e.printStackTrace();
			}    
	    	return "/com/ed_usermodify"; 
		}
		 @RequestMapping(value="/user/UpdateUserProc.do")
	    public String UpdateUserProc(HttpServletRequest request,HttpServletResponse response,ModelMap model,UserVO vo) throws Exception {
	    	try { 
	    		int result=0;
	    		result = userComService.updateUser(vo);
	    		if(result > 0)
	    			model.addAttribute("message", kibiMessageSource.getMessage("success.admin.change"));
	    		else
	    			model.addAttribute("message", kibiMessageSource.getMessage("fail.common.msg"));
	    	}catch(Exception e){      
	    		e.printStackTrace();
			}    
	    	return "forward:/user/forUpdateUser.do"; 
		}
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
	}
}
