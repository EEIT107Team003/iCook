package forum.dao;

import java.util.List;

import com.web.icook.model.MemberBean;

import forum.model.ForumMainBean;

public interface IFMDao {
	
	public void insertArticle(ForumMainBean fmb, MemberBean memberBean);
	
	public void insertReply(ForumMainBean replyFmb, Integer harticle_id, MemberBean memberBean);
	
	public void update(ForumMainBean newFmb, Integer article_id, MemberBean memberBean);
	
	public void delete(Integer article_id);
	
	public Integer like(Integer article_id, MemberBean memberBean);
	
	public List<ForumMainBean> getAllTopic();
	
	public List<ForumMainBean> getThread(Integer harticle_id);
	
	public List<ForumMainBean> getByTitle(String title);
	
	public List<ForumMainBean> getByNickname(String nickname);
	
	public List<ForumMainBean> getByCategory(String category);
	
	public List<ForumMainBean> getByPK(Integer article_id);
	
}
