package forum.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.icook.model.MemberBean;
import com.web.icook.service.MemberService;

import forum.dao.IFMDao;
import forum.model.ForumMainBean;
import forum.model.ReportBean;

@Repository
public class FMDaoImpl implements IFMDao {

	SessionFactory factory;

	@Autowired
	public FMDaoImpl(SessionFactory factory) {
		this.factory = factory;
	}

	@Override
	public void insertArticle(ForumMainBean fmb, MemberBean memberBean) { 
		fmb.setMemberBean(memberBean);
		fmb.setUsername(memberBean.getUsername());
		fmb.setNickname(memberBean.getNickname());
		fmb.setClicks(0);
		fmb.setLikes(0);
		fmb.setReplies(0);
		fmb.setPostTime(new Timestamp(System.currentTimeMillis()));
		fmb.setEditTime(new Timestamp(System.currentTimeMillis()));
		Session session = factory.getCurrentSession();
		session.save(fmb);
		fmb.setHarticle_id(fmb.getArticle_id());
		session.save(fmb);
	}

	@Override
	public void insertReply(ForumMainBean replyFmb, Integer harticle_id, MemberBean memberBean) { // harticle_id用來找Head 文章 ，增加回覆數
		replyFmb.setMemberBean(memberBean);
		replyFmb.setUsername(memberBean.getUsername());
		replyFmb.setNickname(memberBean.getNickname());
		replyFmb.setClicks(0);
		replyFmb.setLikes(0);
		replyFmb.setReplies(0);
		replyFmb.setPostTime(new Timestamp(System.currentTimeMillis()));
		replyFmb.setEditTime(new Timestamp(System.currentTimeMillis()));
		Session session = factory.getCurrentSession();
		session.save(replyFmb);
		String hql = "select count (harticle_id) from ForumMainBean where harticle_id = :harticle_id";
		Integer replies = ((Number) session.createQuery(hql).setParameter("harticle_id", harticle_id).uniqueResult())
				.intValue();
		;
		ForumMainBean headFmb = session.get(ForumMainBean.class, harticle_id);
		headFmb.setReplies(replies - 1);
		session.save(headFmb);
	}

	@Override
	public void update(ForumMainBean newFmb, Integer article_id, MemberBean memberBean) {
		Session session = factory.getCurrentSession();
		ForumMainBean oldFmb = session.get(ForumMainBean.class, article_id);
		oldFmb.setCategory(newFmb.getCategory());
		oldFmb.setTitle(newFmb.getTitle());
		oldFmb.setText(newFmb.getText());
		oldFmb.setSignature(newFmb.getSignature());
		oldFmb.setEditTime(new Timestamp(System.currentTimeMillis()));
		session.save(oldFmb);
	}

	@Override
	public void delete(Integer article_id) {
		Session session = factory.getCurrentSession();
		ForumMainBean fmb = session.get(ForumMainBean.class, article_id);
		Integer harticle_id = fmb.getHarticle_id();
		String hql = "select count (harticle_id) from ForumMainBean where harticle_id = :harticle_id";
		Integer replies = ((Number) session.createQuery(hql).setParameter("harticle_id", harticle_id).uniqueResult())
				.intValue();

		ForumMainBean headFmb = session.get(ForumMainBean.class, harticle_id);
		if (headFmb.getArticle_id() != headFmb.getHarticle_id()) {
			headFmb.setReplies(replies - 1);
			session.save(headFmb);
		} 
		session.delete(fmb);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getAllTopic() {
		String hql = "from ForumMainBean as fmb where fmb.article_id = fmb.harticle_id order by fmb.postTime desc";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).getResultList();
		return fmbList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getByTitle(String title) {
		String hql = "from ForumMainBean as fmb where (fmb.title like :title) and (fmb.article_id = fmb.harticle_id)";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("title", "%" + title + "%").getResultList();
		return fmbList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getByNickname(String nickname) {
		String hql = "from ForumMainBean as fmb where fmb.nickname like :nickname";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("nickname", "%" + nickname + "%").getResultList();
		return fmbList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getByCategory(String category) {
		String hql = "from ForumMainBean as fmb where (fmb.category like :category) and (fmb.article_id = fmb.harticle_id)";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("category", "%" + category + "%").getResultList();
		return fmbList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getThread(Integer harticle_id) {
		String hql = "from ForumMainBean as fmb where fmb.harticle_id = :harticle_id";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("harticle_id", harticle_id).getResultList();
		ForumMainBean headFmb = session.get(ForumMainBean.class, harticle_id);
		if (headFmb != null) {
			headFmb.setClicks(headFmb.getClicks() + 1);
			session.save(headFmb);
		}		
		return fmbList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getByPK(Integer article_id) {
		String hql = "from ForumMainBean as fmb where fmb.article_id = :article_id";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("article_id", article_id).getResultList();
		return fmbList;
	}
	
	//07.22 江慶庭 -查詢member_id
	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getByMember_id(Integer member_id) {
		String hql = "from ForumMainBean where member_id = :member_id order by editTime desc";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setParameter("member_id", member_id).getResultList();
		return fmbList;
	}

	@Override
	public Integer like(Integer article_id, MemberBean memberBean) {
		Session session = factory.getCurrentSession();
		String hql = "select likes from ForumMainBean where article_id = :article_id";
		Integer likes = ((Number) session.createQuery(hql).setParameter("article_id", article_id).uniqueResult())
				.intValue();
		ForumMainBean fmb = session.get(ForumMainBean.class, article_id);
		fmb.setLikes(likes + 1);
		session.save(fmb);
		System.out.println(fmb.getLikes());
		return fmb.getLikes();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ForumMainBean> getPopularArticle() {
		String hql = "from ForumMainBean as fmb where fmb.article_id = fmb.harticle_id order by fmb.clicks desc";
		Session session = factory.getCurrentSession();
		List<ForumMainBean> fmbList = new ArrayList<>();
		fmbList = session.createQuery(hql).setMaxResults(3).list();
		return fmbList;
	}

	
	@Override
	public void report(ReportBean rtb, ForumMainBean fmb) {
		rtb.setFmb(fmb);
		rtb.setReportTime(new Timestamp(System.currentTimeMillis()));
		Session session = factory.getCurrentSession();
		session.save(rtb);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ReportBean> getAllReport() {
		String hql = "from ReportBean";
		Session session = factory.getCurrentSession();
		List<ReportBean> rtbList = new ArrayList<>();
		rtbList = session.createQuery(hql).getResultList();
		return rtbList;
	}

}
