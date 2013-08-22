package kr.co.kibi.edms.admin.web;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.kibi.edms.admin.service.AdminCategoryService;
import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.KibiMessageSource;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.util.EgovFileScrty;
import kr.co.kibi.edms.util.EgovProperties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.simple.JSONObject;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminCategoryController implements ApplicationContextAware, InitializingBean {
	
	private ApplicationContext applicationContext;

	protected static final Log LOG = LogFactory.getLog(AdminCategoryController.class);

	@Resource(name = "AdminCategoryService")
  	private AdminCategoryService adminCategoryService;
    @Resource(name="kibiMessageSource")
    KibiMessageSource kibiMessageSource;
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub

	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
		this.applicationContext = applicationContext;
		LOG.info("AdminCategoryController setApplicationContext method has called!");
	}
   /**
	 * 관리자 카테고리관리
	 * @param vo -CategoryVO
	 * @param request - 
	 * @return result - 
	 * @exception Exception
	 */
    @RequestMapping(value="/admin/ManageCategory.do")
    public String ManageCategory(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo,GroupVO gvo) throws Exception {
    	try {       
    		List<CategoryVO> clist =adminCategoryService.selectCate(vo);
//    		List<GroupVO> glist =adminCategoryService.selectGroup(gvo);
    		model.addAttribute("treeList", clist);
//    		model.addAttribute("groupList", glist);
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
    		}       
    	return "/admin/category/ad_category";  
	}
    @RequestMapping(value="/admin/saveCatDesc.do")
    public void saveCatDesc(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo) throws Exception {
    	try { 
    		int result=0;
    		result = adminCategoryService.updateCateDesc(vo);
    		int[] group_arr=vo.getGroup_seq_arr();
    		vo.setStrgrp(String.valueOf(group_arr[0])+","+String.valueOf(group_arr[1])+","+String.valueOf(group_arr[2]));
    		for(int i=1;i<4;i++){
    			vo.setGroup_seq(group_arr[i-1]);
    			vo.setAutsort_sor(i);
    			adminCategoryService.updateAuthority(vo);
    		}
    		adminCategoryService.updateAuthorityChild(vo);
    		response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			JSONObject jso = new JSONObject();
			if(result > 0){
				jso.put("result",true);	
			}else{
				jso.put("result",false);    				
			}
			out.print(jso);
			jso=null;
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
		}    
    	//return "forward:/admin/selectDesc.do";
	}
    @RequestMapping(value="/admin/saveTree.do")
    public void saveTree(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo) throws Exception {
    	try {       
    		String operation = request.getParameter("operation");
    		String id = request.getParameter("id");
    		String title = request.getParameter("title");
    		String ref = request.getParameter("ref");//move 시 pid
    		String position = request.getParameter("position");
    		String copy = request.getParameter("copy");
    		int result=0;
    		if(operation.equals("rename_node")){
    			vo.setCat_seq(Integer.parseInt(id));
        		vo.setCat_nm(title);
    			result = adminCategoryService.updateCategory(vo);
    			response.setCharacterEncoding("UTF-8");
    			PrintWriter out = response.getWriter();
    			JSONObject jso = new JSONObject();
    			if(result > 0){
    				jso.put("result",true);	
    			}else{
    				jso.put("result",false);    				
    			}
    			out.print(jso);
    			jso=null;
    		}
    		if(operation.equals("create_node")){
    			vo.setParcat_seq(Integer.parseInt(id));
        		vo.setCat_nm(title);
        		
    			result = adminCategoryService.insertCategory(vo);
    			vo.setCat_seq(result);
    			//그룹 3개 빈 값 insert
        		for(int i=1;i<4;i++){
        			System.out.println(i+">>>>>>");
        			vo.setAutsort_sor(i);
        			adminCategoryService.insertTempAuth(vo);
        		}
        		response.setCharacterEncoding("UTF-8");
    			PrintWriter out = response.getWriter();
    			JSONObject jso = new JSONObject();
    			if(result > 0){
    				jso.put("status",true);	
    			}else{
    				jso.put("status",false);    				
    			}
    			jso.put("id", result);
    			out.print(jso);
    			jso=null;
    		}
    		if(operation.equals("move_node")){
    			System.out.println(ref);
    			vo.setCat_seq(Integer.parseInt(id));
    			vo.setParcat_seq(Integer.parseInt(ref));
    			result = adminCategoryService.moveCategory(vo);
    			response.setCharacterEncoding("UTF-8");
    			PrintWriter out = response.getWriter();
    			JSONObject jso = new JSONObject();
    			if(result > 0){
    				jso.put("result",true);	
    			}else{
    				jso.put("result",false);    				
    			}
    			out.print(jso);
    			jso=null;
    		}
    		if(operation.equals("remove_node")){
    			vo.setCat_seq(Integer.parseInt(id));
    			CategoryVO resultvo = adminCategoryService.checkCategory(vo);
    			System.out.println(resultvo.getCnt()+">>>하위문서 수");
    			response.setCharacterEncoding("UTF-8");
    			PrintWriter out = response.getWriter();
    			JSONObject jso = new JSONObject();
    			if(resultvo.getCnt()>0){
    				jso.put("result", "exist");
    			}else{
    				String enpassword = "";
    		    	// 1. 입력한 비밀번호를 암호화한다.
    		    	if("sha".equals(EgovProperties.getProperty("Globals.loginEncrypt"))){
    		    		enpassword = EgovFileScrty.encryptPassword(request.getParameter("pwd"));	
    		    	}else{
    		    		enpassword = EgovFileScrty.encodeBinary(request.getParameter("pwd").getBytes());
    		    	}
    				jso.put("result", true);
    				vo.setPwd(enpassword);
    				adminCategoryService.deleteAuthority(vo);
    				result = adminCategoryService.deleteCategory(vo);
    				System.out.println(result+">>>>deleteresult");
    				if(result > 0){
    					jso.put("result", "ok");
    				}else{
    					jso.put("result", "fail");
    				}
    			}
    			out.print(jso);
    			jso=null;
    			
    		}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
    @RequestMapping(value="/admin/selectDesc.do")
    public String selectDesc(HttpServletRequest request,HttpServletResponse response,ModelMap model,CategoryVO vo) throws Exception {
    	try { 
    		CategoryVO rvo = adminCategoryService.selectDesc(vo);
    		response.setCharacterEncoding("UTF-8");
    		int result=0;
    		vo.setParcat_seq(rvo.getParcat_seq());
    		result = adminCategoryService.checkParGroup(vo);
    		List<GroupVO> glist = null;
    		GroupVO gvo = new GroupVO();
    		if(result >0){
    			gvo.setGroup_seq(vo.getCat_seq());
        		glist =adminCategoryService.selectGroup(gvo);	
    		}else{
    			glist =adminCategoryService.selectGroupAll(gvo);
    		}
    		
    		model.addAttribute("groupList", glist);
    		model.addAttribute("vo", rvo);
    		
    	}catch(Exception e){      
    		System.out.println(e);
    		e.printStackTrace();
		}    
    	return "/admin/category/ad_category_div"; 
	}
}
