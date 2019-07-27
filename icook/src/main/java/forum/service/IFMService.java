package forum.service;

import java.util.List;

import com.web.icook.model.MemberBean;

import forum.model.ForumMainBean;
import forum.model.ReportBean;

public interface IFMService {
	
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
	
	public List<ForumMainBean> getByMember_id(Integer member_id);
	
	public List<ForumMainBean> getPopularArticle();
	
	public void report(ReportBean rtb, ForumMainBean fmb);
	
	public List<ReportBean> getAllReport();
	
	public void checked(Integer report_id);
}
