package kr.co.kibi.edms.com.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.LoginVO;
import kr.co.kibi.edms.com.service.UserVO;

import org.springframework.stereotype.Repository;

@Repository("ComIndexDAO")
public class ComIndexDAO extends ComAbstractDAO{
	/**
	 * 일반 로그인을 처리한다
	 * @param vo LoginVO
	 * @return LoginVO
	 * @exception Exception
	 */
    public LoginVO actionLogin(LoginVO vo) throws Exception {
    	return (LoginVO)selectByPk("indexDao.actionLogin", vo);
    }
    public int checkUser(UserVO vo) throws Exception{
    	return (Integer)selectByPk("indexDao.checkUser", vo);
    }
    public int insertUser(UserVO vo) throws Exception{
    	return (Integer)insert("indexDao.insertUser",vo);
    }
    public List<GroupVO> selectGroup() throws Exception{
    	GroupVO vo = new GroupVO();
    	return list("indexDao.selectGroup",vo);
    }
    public List<CategoryVO> selectLeftCate(CategoryVO vo) throws Exception{
    	return list("indexDao.selectLeftCate",vo);
    }
}
