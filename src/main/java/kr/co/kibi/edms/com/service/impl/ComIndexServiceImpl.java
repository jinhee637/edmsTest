package kr.co.kibi.edms.com.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.ComIndexService;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.util.EgovFileScrty;
import kr.co.kibi.edms.util.EgovProperties;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("ComIndexService")
public class ComIndexServiceImpl extends AbstractServiceImpl implements ComIndexService {
	
	@Resource(name = "ComIndexDAO")
	private ComIndexDAO comidxDAO;
	
    private static final Logger LOG = Logger.getLogger(ComIndexServiceImpl.class.getClass());
    
    /**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
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
    	
    	// 2. 아이디와 암호화된 비밀번호가 DB와 일치하는지 확인한다.
    	LoginVO loginVO = comidxDAO.actionLogin(vo);
    	// 3. 결과를 리턴한다.
    	if (loginVO != null && !loginVO.getId_if().equals("") && !loginVO.getPw_if().equals("")) {
    		return loginVO;
    	} else {
    		loginVO = new LoginVO();
    	}
    	
    	return loginVO;
    }
    public int checkUser(UserVO vo) throws Exception{
    	return comidxDAO.checkUser(vo);
    }
    public int insertUser(UserVO vo) throws Exception{
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
    	return comidxDAO.insertUser(vo);
    }
    public List<GroupVO> selectGroup() throws Exception{
    	List<GroupVO> dvo = comidxDAO.selectGroup();
    	return dvo;
    }
    public List<CategoryVO> selectLeftCate(CategoryVO vo) throws Exception{
    	List<CategoryVO> cvo = comidxDAO.selectLeftCate(vo);
    	return cvo;
    }
}
