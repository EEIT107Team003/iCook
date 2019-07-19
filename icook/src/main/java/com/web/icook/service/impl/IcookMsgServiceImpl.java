package com.web.icook.service.impl;

import java.util.List;


import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.icook.dao.IcookMsgDao;
import com.web.icook.model.MsgBoardBean;
import com.web.icook.service.IcookMsgService;


@Service
public class IcookMsgServiceImpl implements IcookMsgService {
	@Autowired
	IcookMsgDao dao;

	@Transactional
	@Override
	public List<MsgBoardBean> getAllMsgBoards(Integer article_num) {
		// TODO Auto-generated method stub
		return dao.getAllMsgBoards(article_num);
	}

	@Transactional
	@Override
	public void insertIcookMsgBoard(MsgBoardBean msgBoardbean) {
		dao.insertIcookMsgBoard(msgBoardbean);

	}

	@Transactional
	@Override
	public void updateIcookMsgBoard(MsgBoardBean msgBoardbean) {
		dao.updateIcookMsgBoard(msgBoardbean);

	}

	@Transactional
	@Override
	public void deleteIcookMsgBoard(MsgBoardBean msgBoardbean) {
		dao.deleteIcookMsgBoard(msgBoardbean);
	}

	@Transactional
	@Override
	public MsgBoardBean getIcookMsgBoard(int msgboard_num) {
		// TODO Auto-generated method stub
		return dao.getIcookMsgBoard(msgboard_num);
	}

}
