package com.web.icook.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "Track")
public class MyTrackBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//追蹤者
	@JsonBackReference
	private MemberBean memberId;
	//被追蹤者
	@JsonBackReference
	private MemberBean trackedId;
	//追蹤時間
	private Timestamp trackTime;
	
	private Integer trackedBean_id;
	
	private String trackedBean_nickname;
	
	private String trackedBean_resume;

	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="member_Id")
	public MemberBean getMemberId() {
		return memberId;
	}

	public void setMemberId(MemberBean memberId) {
		this.memberId = memberId;
	}
	
	@Id
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="tracked_Id")
	public MemberBean getTrackedId() {
		return trackedId;
	}

	public void setTrackedId(MemberBean trackedId) {
		this.trackedId = trackedId;
	}

	public Timestamp getTrackTime() {
		return trackTime;
	}

	public void setTrackTime(Timestamp trackTime) {
		this.trackTime = trackTime;
	}

	public Integer getTrackedBean_id() {
		Integer trackedBean_id=trackedId.getMember_id();
		return trackedBean_id;
	}

	public void setTrackedBean_id(Integer trackedBean_id) {
		this.trackedBean_id = trackedBean_id;
	}

	public String getTrackedBean_nickname() {
		String trackedBean_nickname=trackedId.getNickname();
		return trackedBean_nickname;
	}

	public void setTrackedBean_nickname(String trackedBean_nickname) {
		this.trackedBean_nickname = trackedBean_nickname;
	}

	public String getTrackedBean_resume() {
		String trackedBean_resume =trackedId.getResume();
		return trackedBean_resume;
	}

	public void setTrackedBean_resume(String trackedBean_resume) {
		this.trackedBean_resume = trackedBean_resume;
	}
}
