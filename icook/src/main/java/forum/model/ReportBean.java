package forum.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name = "report_FArticle")
public class ReportBean implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	private		Integer			report_id;
	private		String			reason;
	private		String			reportCategory;
	private		Timestamp		reportTime;
	private		ForumMainBean	fmb;
	private		Boolean			isCheck;	
	
	
	
	public ReportBean() {
		
	}
	
	
	
	public ReportBean(Integer report_id, String reason, String reportCategory, Timestamp reportTime,
			ForumMainBean fmb) {
		this.report_id = report_id;
		this.reason = reason;
		this.reportCategory = reportCategory;
		this.reportTime = reportTime;
		this.fmb = fmb;
	}



	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getReport_id() {
		return report_id;
	}
	public void setReport_id(Integer report_id) {
		this.report_id = report_id;
	}
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	
	public String getReportCategory() {
		return reportCategory;
	}
	public void setReportCategory(String reportCategory) {
		this.reportCategory = reportCategory;
	}
	
	public Timestamp getReportTime() {
		return reportTime;
	}
	public void setReportTime(Timestamp reportTime) {
		this.reportTime = reportTime;
	}
	
	
	@ManyToOne
	@JoinColumn(name = "article_id")
	public ForumMainBean getFmb() {
		return fmb;
	}
	public void setFmb(ForumMainBean fmb) {
		this.fmb = fmb;
	}



	@Override
	public String toString() {
		return "ReportBean [fmb=" + fmb + "]";
	}



	public Boolean getIsCheck() {
		return isCheck;
	}



	public void setIsCheck(Boolean isCheck) {
		this.isCheck = isCheck;
	}
	
	

}
