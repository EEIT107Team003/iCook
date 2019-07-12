package forum.service;

import java.util.List;

import forum.model.ForumMainBean;

public interface IFMService {
	
	public void insertArticle(ForumMainBean fmb);

	public void insertReply(ForumMainBean replyFmb, Integer harticle_id);

	public void update(ForumMainBean newFmb, Integer article_id);

	public void delete(Integer article_id);
	
	public Integer like(Integer article_id);

	public List<ForumMainBean> getAllTopic();

	public List<ForumMainBean> getThread(Integer harticle_id);

	public List<ForumMainBean> getByTitle(String title);

	public List<ForumMainBean> getByNickname(String nickname);

	public List<ForumMainBean> getByCategory(String category);
	
	public List<ForumMainBean> getByPK(Integer article_id);
}
