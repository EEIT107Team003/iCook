package com.web.icook.dao.impl;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.sql.rowset.serial.SerialBlob;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

import com.web.icook.dao.MemberDAO;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MyTrackBean;
import com.web.icook.model.ProductBean;

@Repository
public class MemberDAOimpl implements MemberDAO {
	@Autowired
	SessionFactory factory;

	// 新增會員
	@Override
	public int insertMember(MemberBean bean) {
		Session session = factory.getCurrentSession();
		int n = (int) session.save(bean);
		return n;
	}

	// 修改基本資料
	@Override
	public void updateMember(MemberBean bean) {
		MemberBean oldBean = selectByUsername(getPrincipal());
		oldBean.setNickname(bean.getNickname());// 暱稱
	}
	
	// 修改大頭貼
	@Override
	public void updateMember_photo(MemberBean bean) {
		MemberBean oldBean = selectByUsername(getPrincipal());
		oldBean.setMember_photo(bean.getMember_photo());
		oldBean.setFileName_member(bean.getFileName_member());
	}

	// 修改封面圖片
	@Override
	public void updateCover_photo(MemberBean bean) {
		MemberBean oldBean = selectByUsername(getPrincipal());
		oldBean.setCover_photo(bean.getCover_photo());
		oldBean.setFileName_cover(bean.getFileName_cover());
	}

	// 查詢全部資料
	@Override
	public List<MemberBean> selectAll() {
		String hql = "from MemberBean";
		Session session = null;
		List<MemberBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}
	
	// 查詢全部(權限)
	@Override
	public List<MemberBean> selectAllMember(String role) {
		String hql = "from MemberBean where role=:role";
		Session session = null;
		List<MemberBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("role", role).getResultList();
		return list;
	}

	// 尋找單筆資料(member_id)
	@Override
	public MemberBean selectById(int memberId) {
		Session session = factory.getCurrentSession();
		MemberBean bb = session.get(MemberBean.class, memberId);

		return bb;
	}

	// 尋找單筆資料(username)
	@Override
	public MemberBean selectByUsername(String username) {
		if(!getPrincipal().equals("anonymousUser")) {
			String hql = "FROM MemberBean where username=:username";
			Session session = factory.getCurrentSession();
			MemberBean bean = (MemberBean) session.createQuery(hql).setParameter("username", username).getSingleResult();
			return bean;
		}else {
			return null;
		}
	}

	// 尋找單筆資料(nickname)
	@Override
	public MemberBean selectByNickname(String nickname) {
		String hql = "FROM MemberBean where nickname=:nickname";
		Session session = factory.getCurrentSession();
		MemberBean bean = (MemberBean) session.createQuery(hql).setParameter("nickname", nickname).getSingleResult();

		return bean;
	}
	
	// 更新會員資料(2)
	@Override
	public void updateMemberInfo(MemberBean bean, int member_id) {
		Session session = factory.getCurrentSession();
		bean.setMember_id(member_id);
		session.update(bean);
	}
	
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
}
