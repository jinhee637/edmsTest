package kr.co.kibi.edms.admin.service.impl;

import java.util.List;

import kr.co.kibi.edms.admin.service.GroupVO;
import kr.co.kibi.edms.com.service.CategoryVO;
import kr.co.kibi.edms.com.service.impl.ComAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("AdminCategoryDAO")
public class AdminCategoryDAO extends ComAbstractDAO {
	
	/**
	 * 카테고리관리
	 * @param vo
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<CategoryVO> selectCate(CategoryVO vo) throws Exception{
    	return list("adminCategoryDao.selectCate", vo);
    }
    public int updateCategory(CategoryVO vo) throws Exception{
    	return update("adminCategoryDao.updateCategory", vo);
    }
    public int insertCategory(CategoryVO vo) throws Exception{
    	return (Integer)insert("adminCategoryDao.insertCategory", vo);
    }
    public int moveCategory(CategoryVO vo) throws Exception{
    	return update("adminCategoryDao.moveCategory", vo);
    }
    public int deleteCategory(CategoryVO vo) throws Exception{
    	 return delete("adminCategoryDao.deleteCategory", vo);
    }
    public int deleteAuthority(CategoryVO vo) throws Exception{
   	 return delete("adminCategoryDao.deleteAuthority", vo);
   }
    public int updateCateDesc(CategoryVO vo) throws Exception{
    	return update("adminCategoryDao.updateCateDesc", vo);
    }
    @SuppressWarnings("unchecked")
    public List<GroupVO> selectGroup(GroupVO vo) throws Exception{
    	return list("adminCategoryDao.selectGroupCate", vo);
    }
    @SuppressWarnings("unchecked")
    public List<GroupVO> selectGroupAll(GroupVO vo) throws Exception{
    	return list("adminCategoryDao.selectGroupAll", vo);
    }
    public void insertTempAuth(CategoryVO vo) throws Exception{
    	 insert("adminCategoryDao.insertTempAuth",vo);
    }
    public CategoryVO selectDesc(CategoryVO vo) throws Exception{
    	return (CategoryVO)selectByPk("adminCategoryDao.selectDesc",vo);
    }
    public int updateAuthority(CategoryVO vo) throws Exception{
    	return update("adminCategoryDao.updateAuthority",vo);
    }
    public int checkParGroup(CategoryVO vo) throws Exception{
    	return (Integer)getSqlMapClientTemplate().queryForObject("adminCategoryDao.checkParGroup",vo);
    }
    public int updateAuthorityChild(CategoryVO vo) throws Exception{
    	return update("adminCategoryDao.updateAuthorityChild",vo);
    }
    public CategoryVO checkCategory(CategoryVO vo) throws Exception{
    	return (CategoryVO) selectByPk("adminCategoryDao.checkDelCategory", vo);
    }
}
