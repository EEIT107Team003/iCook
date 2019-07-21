package com.web.icook.dao.impl;

import java.util.List;

import com.web.icook.model.MyTrackBean;

public interface MyTrackDAO {
	// 追蹤會員
	void trackById(MyTrackBean bean);

	// 查詢 我追蹤了誰
	List<MyTrackBean> selectTrackerById(int member_Id);

	// 查詢 我被誰追蹤
	List<MyTrackBean> selectTrackedById(int tracked_Id);

	// 查詢特定追蹤者
	List<MyTrackBean> selectOneTrackerById(int member_Id, int tracked_id);

	// 取消追蹤好友
	Integer trackCancel(int member_id, int tracked_id); 
}