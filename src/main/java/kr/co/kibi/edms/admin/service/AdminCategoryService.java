package kr.co.kibi.edms.admin.service;

import java.util.List;

import kr.co.kibi.edms.com.service.CategoryVO;

public interface AdminCategoryService {
	public List<CategoryVO> selectCate(CategoryVO vo) throws Exception;
	public int updateCategory(CategoryVO vo) throws Exception;
	public int insertCategory(CategoryVO vo) throws Exception;
	public int moveCategory(CategoryVO vo) throws Exception;
	public int deleteCategory(CategoryVO vo) throws Exception;
	public int deleteAuthority(CategoryVO vo) throws Exception;
	public int updateCateDesc(CategoryVO vo) throws Exception;
	public List<GroupVO> selectGroup(GroupVO vo) throws Exception;
	public void insertTempAuth(CategoryVO vo) throws Exception;
	public CategoryVO selectDesc(CategoryVO vo) throws Exception;
	public int updateAuthority(CategoryVO vo) throws Exception;
	public int checkParGroup(CategoryVO vo) throws Exception;
	public List<GroupVO> selectGroupAll(GroupVO vo) throws Exception; 
	public int updateAuthorityChild(CategoryVO vo) throws Exception;
	public CategoryVO checkCategory(CategoryVO vo) throws Exception;
}
