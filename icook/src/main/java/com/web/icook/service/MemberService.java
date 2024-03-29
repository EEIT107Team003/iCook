package com.web.icook.service;

import java.util.List;

import com.web.icook.model.MemberBean;
import com.web.icook.model.MyTrackBean;

public interface MemberService {

	int insertMember(MemberBean bean);

	MemberBean selectById(int memberId);

	List<MemberBean> selectAll();

	void updateMember(MemberBean bean);

	MemberBean selectByUsername(String username);  

	void updateMember_photo(MemberBean bean);

	void updateCover_photo(MemberBean bean);

	MemberBean selectByNickname(String nickname);

	void updateMemberInfo(MemberBean bean, int member_id);

	List<MemberBean> selectAllMember(String role);
}
