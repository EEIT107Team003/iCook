package com.web.icook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.icook.dao.MemberDAO;
import com.web.icook.dao.impl.MyTrackDAO;
import com.web.icook.model.MyTrackBean;
import com.web.icook.service.MyTrackService;

@Service
@Transactional
public class MyTrackServiceImpl implements MyTrackService {
	@Autowired
	MyTrackDAO dao;
	
	// 追蹤會員
	@Override
	public void trackById(MyTrackBean bean) {
		dao.trackById(bean);
	}

	// 查詢 我追蹤了誰
	@Override
	public List<MyTrackBean> selectTrackerById(int member_Id) {
		return dao.selectTrackerById(member_Id);
	}

	// 查詢 我被誰追蹤
	@Override
	public List<MyTrackBean> selectTrackedById(int tracked_Id) {
		return dao.selectTrackedById(tracked_Id);
	}

	// 查詢特定追蹤者
	@Override
	public List<MyTrackBean> selectOneTrackerById(int member_Id, int tracked_id) {
		return dao.selectOneTrackerById(member_Id, tracked_id);
	}

	@Override
	public Integer trackCancel(int member_id, int tracked_id) {
		return dao.trackCancel(member_id, tracked_id);
	}

}
