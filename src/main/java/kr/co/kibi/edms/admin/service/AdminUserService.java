package kr.co.kibi.edms.admin.service;

import java.util.List;

import kr.co.kibi.edms.com.service.UserVO;

public interface AdminUserService {
	/**
	 * 사용자 정보를 조회한다.
	 * @param vo
	 */
	public List<UserVO> selectUserList(UserVO vo) throws Exception;
	public int selectUserCount(UserVO vo) throws Exception;
	public int updateUserStatus(UserVO vo) throws Exception;
	public int updateUserDocAuth(UserVO vo) throws Exception;
	public UserVO selectUserDetail(UserVO vo) throws Exception;
	public int updateUser(UserVO vo) throws Exception;
	public List<CodeVO> getCode(CodeVO vo) throws Exception;
	public int changePassword(UserVO vo) throws Exception;
}
