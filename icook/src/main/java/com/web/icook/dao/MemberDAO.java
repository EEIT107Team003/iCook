package com.web.icook.dao;

import java.util.List;

import com.web.icook.model.MemberBean;
import com.web.icook.model.MyTrackBean;



public interface MemberDAO {

	int insertMember(MemberBean bean);

	MemberBean selectById(int memberId);

	List<MemberBean> selectAll();

	void updateMember(MemberBean bean);

	MemberBean selectByUsername(String username);  

	void updateMember_photo(MemberBean bean);

	void updateCover_photo(MemberBean bean);

	void trackById(MyTrackBean bean);

	MemberBean selectByNickname(String nickname);

	List<MyTrackBean> selectTrackerById(int member_Id);

	void updateMemberInfo(MemberBean bean, int member_id);

	List<MyTrackBean> selectOneTrackerById(int member_Id, int tracked_id);

	List<MyTrackBean> selectTrackedById(int tracked_Id);

}
