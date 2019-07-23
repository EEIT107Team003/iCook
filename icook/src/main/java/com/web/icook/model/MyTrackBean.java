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

@Entity
@Table(name = "Track")
public class MyTrackBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	//追蹤者
	private MemberBean memberId;
	//被追蹤者
	private MemberBean trackedId;
	//追蹤時間
	private Timestamp trackTime;
	
	public MyTrackBean() {
	}
	
	public MyTrackBean(MemberBean memberId, MemberBean trackedId) {
		this.memberId = memberId;
		this.trackedId = trackedId;
	}

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
}
