package kr.co.kibi.edms.admin.web;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.DeptService;
import kr.co.kibi.edms.admin.service.DeptVO;
import kr.co.kibi.edms.com.service.PagingVO;
import kr.co.kibi.edms.util.CalcPaging;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeptController implements ApplicationContextAware, InitializingBean {
	
	/**
	 * 서비스 불러오기 start
	 */
	@Resource(name = "DeptService")
	private DeptService deptService;
	/**
	 * 서비스 불러오기 end
	 */
	
	/**
	 * 그룹 목록
	 * @author 이진희
	 */
	@RequestMapping("/admin/deptList.do")
	public String deptList(Model model, PagingVO pvo, DeptVO dvo) throws Exception{
		try {
			dvo.setPagingVO(pvo);
			List<DeptVO> deptList = deptService.selectDeptList(dvo);
			
			if(deptList.size() > 0)
				pvo.setAllCount(deptList.get(0).getPagingVO().getAllCount());
			
			CalcPaging.calcPageNavigation(pvo);
			
			model.addAttribute("deptList", deptList);
			model.addAttribute("dvo", dvo);
			model.addAttribute("pvo", pvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/dept/DeptList";
	}
	
	/**
	 * 그룹 생성
	 * @author 이진희
	 */
	@RequestMapping("/admin/deptInsert.do")
	public String deptInsert(Model model, DeptVO dvo) throws Exception{
		try {
			
			String deptSq = deptService.selectDeptSq();
			
			int deptSeq = Integer.parseInt(deptSq);
			
			dvo.setDeptSeq(deptSeq);
			
			deptService.insertDept(dvo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "forward:/admin/deptList.do";
	}
	
	/**
	 * 그룹 삭제
	 * @author 이진희
	 */
	@RequestMapping("/admin/deptDelete.do")
	public String deptDelete(Model model, DeptVO dvo) throws Exception{
		try {
			deptService.deleteDept(dvo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "forward:/admin/deptList.do";
	}
	
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
	}

	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		// TODO Auto-generated method stub
	}

}
