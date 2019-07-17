package forum;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import forum.dao.IFMDao;
import forum.model.ForumMainBean;
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
	public void insertArticle(ForumMainBean fmb) {
		dao.insertArticle(fmb);
	}

	@Override
	public void insertReply(ForumMainBean replyFmb, Integer harticle_id) {
		dao.insertReply(replyFmb, harticle_id);
	}

	@Override
	public void update(ForumMainBean newFmb, Integer article_id) {
		dao.update(newFmb, article_id);
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
	public Integer like(Integer article_id) {
		return dao.like(article_id);
		
	}
	
	

}
