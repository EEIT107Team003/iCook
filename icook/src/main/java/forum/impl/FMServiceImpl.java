package forum.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.web.icook.model.MemberBean;

import forum.dao.IFMDao;
import forum.model.ForumMainBean;
import forum.model.ReportBean;
import forum.service.IFMService;

@Service
@Transactional
@EnableTransactionManagement
public class FMServiceImpl implements IFMService {
	
	private IFMDao dao;

	@Autowired
	public FMServiceImpl(IFMDao dao) {
		this.dao = dao;
	}

	@Override
	public void insertArticle(ForumMainBean fmb, MemberBean memberBean) {
		System.out.println(memberBean.toString());
		dao.insertArticle(fmb, memberBean);
	}

	@Override
	public void insertReply(ForumMainBean replyFmb, Integer harticle_id, MemberBean memberBean) {
		dao.insertReply(replyFmb, harticle_id, memberBean);
	}

	@Override
	public void update(ForumMainBean newFmb, Integer article_id, MemberBean memberBean) {
		dao.update(newFmb, article_id, memberBean);
	}

	@Override
	public void delete(Integer article_id) {
		dao.delete(article_id);
	}

	@Override
	public List<ForumMainBean> getAllTopic() {		
		return dao.getAllTopic();
	}

	@Override
	public List<ForumMainBean> getThread(Integer harticle_id) {
		return dao.getThread(harticle_id);
	}

	@Override
	public List<ForumMainBean> getByTitle(String title) {
		return dao.getByTitle(title);
	}

	@Override
	public List<ForumMainBean> getByNickname(String nickname) {
		return dao.getByNickname(nickname);
	}

	@Override
	public List<ForumMainBean> getByCategory(String category) {
		return dao.getByCategory(category);
	}

	@Override
	public List<ForumMainBean> getByPK(Integer article_id) {	
		return dao.getByPK(article_id);
	}

	@Override
	public Integer like(Integer article_id, MemberBean memberBean) {
		return dao.like(article_id, memberBean);
		
	}

	//07.22 江慶庭 -查詢member_id
	@Override
	public List<ForumMainBean> getByMember_id(Integer member_id) {
		return dao.getByMember_id(member_id);
	}
	
	@Override
	public List<ForumMainBean> getPopularArticle() {
		return dao.getPopularArticle();
	}

	@Override
	public void report(ReportBean rtb, ForumMainBean fmb) {		
		dao.report(rtb, fmb);
	}

	@Override
	public List<ReportBean> getAllReport() {
		return dao.getAllReport();
	}
	
	

}
