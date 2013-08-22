package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.co.kibi.edms.admin.service.AdminCategoryService;
import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.service.CategoryVO;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("AdminCategoryService")
public class AdminCategoryServiceImpl extends AbstractServiceImpl implements AdminCategoryService {

	@Resource(name = "AdminCategoryDAO")
	private AdminCategoryDAO adminCategoryDAO;
	
	public static final Logger LOGGER = Logger.getLogger(AdminUserServiceImpl.class.getName());
	
	public List<CategoryVO> selectCate(CategoryVO vo) throws Exception{
    	List<CategoryVO> bvo = adminCategoryDAO.selectCate(vo);
    	return bvo;
    }
    public int updateCategory(CategoryVO vo) throws Exception{
    	return adminCategoryDAO.updateCategory(vo);
    }
    public int insertCategory(CategoryVO vo) throws Exception{
    	return adminCategoryDAO.insertCategory(vo);
    }
    public int moveCategory(CategoryVO vo) throws Exception{
    	return adminCategoryDAO.moveCategory(vo);
    }
    public int deleteCategory(CategoryVO vo) throws Exception{
    	return (Integer)adminCategoryDAO.deleteCategory(vo);
    }
    public int deleteAuthority(CategoryVO vo) throws Exception{
    	return (Integer)adminCategoryDAO.deleteAuthority(vo);
    }
    public int updateCateDesc(CategoryVO vo) throws Exception{
    	return adminCategoryDAO.updateCateDesc(vo);
    }
    public List<GroupVO> selectGroup(GroupVO vo) throws Exception{
    	List<GroupVO> gvo = adminCategoryDAO.selectGroup(vo);
    	return gvo;
    }
    public List<GroupVO> selectGroupAll(GroupVO vo) throws Exception{
    	List<GroupVO> gvo = adminCategoryDAO.selectGroupAll(vo);
    	return gvo;
    }
    public void insertTempAuth(CategoryVO vo) throws Exception{
    	adminCategoryDAO.insertTempAuth(vo);
    }
    public CategoryVO selectDesc(CategoryVO vo) throws Exception{
    	return adminCategoryDAO.selectDesc(vo);
    }
	public int updateAuthority(CategoryVO vo) throws Exception{
		return adminCategoryDAO.updateAuthority(vo);
	}
	public int checkParGroup(CategoryVO vo) throws Exception{
		return adminCategoryDAO.checkParGroup(vo);
	}
	public int updateAuthorityChild(CategoryVO vo) throws Exception{
		return adminCategoryDAO.updateAuthorityChild(vo);
	}
	public CategoryVO checkCategory(CategoryVO vo) throws Exception{
		return adminCategoryDAO.checkCategory(vo);
	}
}
