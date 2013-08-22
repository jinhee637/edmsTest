package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.user.service.UserComService;
import kr.co.kibi.edms.util.EgovFileScrty;
import kr.co.kibi.edms.util.EgovProperties;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("UserComService")
public class UserComServiceImpl extends AbstractServiceImpl implements UserComService {
	
	@Resource(name = "UserComDAO")
	private UserComDAO userComDAO;
	public UserVO selectUserDetail(UserVO vo) throws Exception{
		return userComDAO.selectUserDetail(vo);
	}
	public int updateUser(UserVO vo) throws Exception{
		String enpassword = "";
    	// 1. 입력한 비밀번호를 암호화한다.
    	if("sha".equals(EgovProperties.getProperty("Globals.loginEncrypt"))){
    		enpassword = EgovFileScrty.encryptPassword(vo.getPw_if());	
    	}else{
    		enpassword = EgovFileScrty.encodeBinary(vo.getPw_if().getBytes());
    		//decode방식
//    		System.out.println(new String(EgovFileScrty.decodeBinary(enpassword)));
    	}
    	vo.setPw_if(enpassword);
		return userComDAO.updateUser(vo);
	}
	public List<CodeVO> getCode(CodeVO vo) throws Exception{
		return userComDAO.getCode(vo);
	}
}
