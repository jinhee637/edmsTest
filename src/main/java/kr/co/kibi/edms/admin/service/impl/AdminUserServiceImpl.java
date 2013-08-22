package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.AdminUserService;
import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.util.EgovFileScrty;
import kr.co.kibi.edms.util.EgovProperties;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("AdminUserService")
public class AdminUserServiceImpl extends AbstractServiceImpl implements AdminUserService {

	@Resource(name = "AdminUserDAO")
	private AdminUserDAO adminUserDAO;
	
	public static final Logger LOGGER = Logger.getLogger(AdminUserServiceImpl.class.getName());
	
	public List<UserVO> selectUserList(UserVO vo) throws Exception {
		return adminUserDAO.selectUserList(vo);
	}
	public int selectUserCount(UserVO vo) throws Exception{
		return adminUserDAO.selectUserCount(vo);
	}
	public int updateUserStatus(UserVO vo) throws Exception{
		return adminUserDAO.updateUserStatus(vo);
	}
	public int updateUserDocAuth(UserVO vo) throws Exception{
		return adminUserDAO.updateUserDocAuth(vo);
	}
	public UserVO selectUserDetail(UserVO vo) throws Exception{
		return adminUserDAO.selectUserDetail(vo);
	}
	public int updateUser(UserVO vo) throws Exception{
		return adminUserDAO.updateUser(vo);
	}
	public List<CodeVO> getCode(CodeVO vo) throws Exception{
		return adminUserDAO.getCode(vo);
	}
	public int changePassword(UserVO vo) throws Exception{
		String enpassword = "";
		if("sha".equals(EgovProperties.getProperty("Globals.loginEncrypt"))){
    		enpassword = EgovFileScrty.encryptPassword(vo.getPw_if());	
    	}else{
    		enpassword = EgovFileScrty.encodeBinary(vo.getPw_if().getBytes());
    		//decode방식
//    		System.out.println(new String(EgovFileScrty.decodeBinary(enpassword)));
    	}
		vo.setPw_if(enpassword);
		
		return adminUserDAO.changePassword(vo);
	}
}
