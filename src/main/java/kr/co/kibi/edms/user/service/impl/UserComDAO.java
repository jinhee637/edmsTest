package kr.co.kibi.edms.user.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("UserComDAO")
public class UserComDAO extends ComAbstractDAO{
	public UserVO selectUserDetail(UserVO vo) throws Exception{
		return (UserVO)selectByPk("UserComDAO.selectUserDetail", vo);
	}
	public int updateUser(UserVO vo) throws Exception{
		return update("UserComDAO.updateUser",vo);
	}
	@SuppressWarnings("unchecked")
	public List<CodeVO> getCode(CodeVO vo) throws Exception{
		return list("UserComDAO.getCode",vo);
	}
 }
