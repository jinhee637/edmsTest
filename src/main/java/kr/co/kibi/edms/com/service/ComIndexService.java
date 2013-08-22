package kr.co.kibi.edms.com.service;

import java.util.List;

import kr.co.kibi.edms.admin.service.GroupVO;


public interface ComIndexService {
	public LoginVO actionLogin(LoginVO vo) throws Exception;
	public int checkUser(UserVO vo) throws Exception;
	public int insertUser(UserVO vo) throws Exception;
	public List<GroupVO> selectGroup() throws Exception;
	public List<CategoryVO> selectLeftCate(CategoryVO vo) throws Exception;
}
