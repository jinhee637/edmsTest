package kr.co.kibi.edms.user.service;

import java.util.List;

import kr.co.kibi.edms.admin.service.CodeVO;
import kr.co.kibi.edms.com.service.UserVO;

public interface UserComService {
	public UserVO selectUserDetail(UserVO vo) throws Exception;
	public List<CodeVO> getCode(CodeVO vo) throws Exception;
	public int updateUser(UserVO vo) throws Exception;
	
}
