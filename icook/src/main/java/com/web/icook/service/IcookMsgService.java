package com.web.icook.service;

import java.util.List;

import com.web.icook.model.MsgBoardBean;

public interface IcookMsgService {
	List<MsgBoardBean> getAllMsgBoards();

	public void insertIcookMsgBoard(MsgBoardBean msgBoardbean);// 新增一筆資料

	public void updateIcookMsgBoard(MsgBoardBean msgBoardbean);// 修改一筆資料

	public void deleteIcookMsgBoard(MsgBoardBean msgBoardbean);// 刪除一筆資料

	public MsgBoardBean getIcookMsgBoard(int msgboard_num);// 查詢單筆資料
}
