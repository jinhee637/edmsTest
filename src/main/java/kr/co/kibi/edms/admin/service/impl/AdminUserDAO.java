package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.com.service.UserVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("AdminUserDAO")
public class AdminUserDAO extends ComAbstractDAO {
	
	/**
	 * 사용자 목록
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<UserVO> selectUserList(UserVO vo) throws Exception{
		return list("AdminUserDAO.selectUserList", vo);
	}
	public int selectUserCount(UserVO vo) throws Exception{
		return (Integer)selectByPk("AdminUserDAO.selectUserCount", vo);
	}
	public int updateUserStatus(UserVO vo) throws Exception{
		return update("AdminUserDAO.updateUserStatus", vo);
				
	}
	public int updateUserDocAuth(UserVO vo) throws Exception{
		return update("AdminUserDAO.updateUserDocAuth",vo);
	}
	public UserVO selectUserDetail(UserVO vo) throws Exception{
		return (UserVO)selectByPk("AdminUserDAO.selectUserDetail", vo);
	}
	public int updateUser(UserVO vo) throws Exception{
		return update("AdminUserDAO.updateUser",vo);
	}
	@SuppressWarnings("unchecked")
	public List<CodeVO> getCode(CodeVO vo) throws Exception{
		return list("AdminUserDAO.getCode",vo);
	}
	public int changePassword(UserVO vo) throws Exception{
		return update("AdminUserDAO.changePassword",vo);
	}
}
