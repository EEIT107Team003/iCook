package com.web.icook.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "msgboard")
public class MsgBoardBean implements Serializable {

	private static final long serialVersionUID = 1L;

	// 留言板號碼
	private Integer msgboard_num;
	// 留言板名稱
//	private String msgboard_title;
	// 留言時間
	private Date msgboard_date = new Date(System.currentTimeMillis());
	// 留言內容
	@Lob
	private String msgboard_content;
	// 留言圖片
//	private Blob msgboard_picture;
	// 留言狀態
	private String msgboard_status = "1";
	MemberBean mb = new MemberBean();

	private MemberBean memberid_in_msgs = mb;
	// 留言對應到的文章編號
	private ArticleBean artuclenum_in_msg;

	private Integer catchnum;

//	private Integer catchMemnum;
//	@Transient
//	public Integer getCatchMemnum() {
//		return catchMemnum;
//	}
//	
//	public void setCatchMemnum(Integer catchMemnum) {
//		this.catchMemnum = catchMemnum;
//	}

	@Transient
	public Integer getCatchnum() {
		return catchnum;
	}

	public void setCatchnum(Integer catchnum) {
		this.catchnum = catchnum;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getMsgboard_num() {
		return msgboard_num;
	}

	public void setMsgboard_num(Integer msgboard_num) {
		this.msgboard_num = msgboard_num;
	}

//	public String getMsgboard_name() {
//		return msgboard_name;
//	}
//
//	public void setMsgboard_name(String msgboard_name) {
//		this.msgboard_name = msgboard_name;
//	}

	public Date getMsgboard_date() {
		return msgboard_date;
	}

	public void setMsgboard_date(Date msgboard_date) {
		this.msgboard_date = msgboard_date;
	}

	public String getMsgboard_content() {
		return msgboard_content;
	}

	public void setMsgboard_content(String msgboard_content) {
		this.msgboard_content = msgboard_content;
	}

//	public Blob getMsgboard_picture() {
//		return msgboard_picture;
//	}
//
//	public void setMsgboard_picture(Blob msgboard_picture) {
//		this.msgboard_picture = msgboard_picture;
//	}

//	@ManyToOne(cascade=CascadeType.ALL)
//	@JoinColumn(name="memberid_in_msgs")
//	public MemberBean getMemberid_in_msg() {
//		return memberid_in_msg; 
//	}
//
//	public void setMemberid_in_msg(MemberBean memberid_in_msg) {
//		this.memberid_in_msg = memberid_in_msg;
//	}
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "artuclenum_in_msg")
	public ArticleBean getArtuclenum_in_msg() {

		return artuclenum_in_msg;
	}

	public void setArtuclenum_in_msg(ArticleBean artuclenum_in_msg) {

		this.artuclenum_in_msg = artuclenum_in_msg;
	}

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name = "memberid_in_msgs")
	public MemberBean getMemberid_in_msgs() {
		return memberid_in_msgs;
	}

	public void setMemberid_in_msgs(MemberBean memberid_in_msgs) {
		this.memberid_in_msgs = memberid_in_msgs;
	}

	public String getMsgboard_status() {
		return msgboard_status;
	}

	public void setMsgboard_status(String msgboard_status) {
		this.msgboard_status = msgboard_status;
	}

	@Override
	public String toString() {
		return "MsgBoardBean [msgboard_num=" + msgboard_num + ", msgboard_date=" + msgboard_date + ", msgboard_content="
				+ msgboard_content + ", msgboard_status=" + msgboard_status + ", memberid_in_msgs=" + memberid_in_msgs
				+ ", artuclenum_in_msg=" + artuclenum_in_msg + "]";
	}

}
