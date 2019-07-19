package com.web.icook.dao;

import java.util.List;


import com.web.icook.model.MsgBoardBean;

public interface IcookMsgDao {
	List<MsgBoardBean> getAllMsgBoards(Integer article_num);

	public void insertIcookMsgBoard(MsgBoardBean msgBoardbean);// 新增一筆資料

	public void updateIcookMsgBoard(MsgBoardBean msgBoardbean);// 修改一筆資料

	public void deleteIcookMsgBoard(MsgBoardBean msgBoardbean);// 刪除一筆資料

	public MsgBoardBean getIcookMsgBoard(int msgboard_num);// 查詢單筆資料
}
