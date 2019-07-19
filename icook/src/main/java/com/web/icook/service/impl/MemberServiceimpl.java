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

	//追蹤會員
	@Override
	public void trackById(MyTrackBean bean) {
		 dao.trackById(bean);
	}

	//尋找單筆資料(nickname)
	@Override
	public MemberBean selectByNickname(String nickname) {
		return dao.selectByNickname(nickname);
	}

	// 查詢 我追蹤了誰
	@Override
	public List<MyTrackBean> selectTrackerById(int member_Id) {
		// TODO Auto-generated method stub
		return dao.selectTrackerById(member_Id);
	}
	
	// 更新會員資料(2)
	@Override
	public void updateMemberInfo(MemberBean bean, int member_id) {
		dao.updateMemberInfo(bean, member_id);
	}

	// 查詢特定追蹤者
	@Override
	public List<MyTrackBean> selectOneTrackerById(int member_Id, int tracked_id) {
		// TODO Auto-generated method stub
		return dao.selectOneTrackerById(member_Id, tracked_id);
	}

	// 查詢 我被誰追蹤
	@Override
	public List<MyTrackBean> selectTrackedById(int tracked_Id) {
		// TODO Auto-generated method stub
		return dao.selectTrackedById(tracked_Id);
	}
}
