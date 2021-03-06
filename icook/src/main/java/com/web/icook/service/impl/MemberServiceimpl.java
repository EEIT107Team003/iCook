package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.MemberDAO;
import com.web.icook.model.MemberBean;
import com.web.icook.model.MyTrackBean;
import com.web.icook.service.MemberService;



@Service
@Transactional
public class MemberServiceimpl implements MemberService {
	@Autowired
	MemberDAO dao;

	// 新增會員
	@Override
	public int insertMember(MemberBean bean) {
		return dao.insertMember(bean);
	}

	// 尋找單筆資料(member_id)
	@Override
	public MemberBean selectById(int memberId) {
		return dao.selectById(memberId);
	}

	// 查詢全部資料
	@Override
	public List<MemberBean> selectAll() {
		return dao.selectAll();
	}

	// 尋找單筆資料(username)
	@Override
	public MemberBean selectByUsername(String username) {
		return dao.selectByUsername(username);
	}

	// 修改基本資料
	@Override
	public void updateMember(MemberBean bean) {
		dao.updateMember(bean);
	}

	// 修改大頭貼
	@Override
	public void updateMember_photo(MemberBean bean) {
		dao.updateMember_photo(bean);
	}

	// 修改封面圖片
	@Override
	public void updateCover_photo(MemberBean bean) {
		dao.updateCover_photo(bean);
	}

	//尋找單筆資料(nickname)
	@Override
	public MemberBean selectByNickname(String nickname) {
		return dao.selectByNickname(nickname);
	}
	
	// 更新會員資料(2)
	@Override
	public void updateMemberInfo(MemberBean bean, int member_id) {
		dao.updateMemberInfo(bean, member_id);
	}

	//查詢會員
	@Override
	public List<MemberBean> selectAllMember(String role) {
		return dao.selectAllMember(role);
	}
}
