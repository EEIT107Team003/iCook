package com.web.icook.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "articles")
public class ArticleBean implements Serializable {
	private static final long serialVersionUID = 1L;

	// 文章號碼
//	@OneToMany(mappedBy="artuclenum_in_msg")//mappedBy防止自動生成中間表 	
//	@JoinColumn(name="artuclenum_in_msg")//對應到msgboardbean
	private Integer article_num;
	// 文章標頭
	private String article_title;
	// 作者
	private MemberBean article_member;
	// 時間
	private Timestamp article_date =new Timestamp(System.currentTimeMillis());

	// 狀態
	private String article_status;

	// 內文
	@Lob
	private String article_content;
	// 文章類別
	private String article_catergoary;
	// 文章封面圖
	private Blob coverImage = null;
	// 封面圖檔案名稱
	private String fileName = "";

//	@OneToMany(mappedBy="artuclenum_in_msg")//mappedBy防止自動生成中間表 	
//	@JoinColumn(name="artuclenum_in_msg")//對應到msgboardbean
//	private ArrayList<MsgBoardBean> msg = new ArrayList<MsgBoardBean>();

	// --------------------------------------------------------------------------
	// --------------------------------------------------------------------------
	private Set<MsgBoardBean> msg_art_num = new LinkedHashSet<>();

	@OneToMany(mappedBy = "artuclenum_in_msg")
	public Set<MsgBoardBean> getMsg_art_num() {
		return msg_art_num;
	}

	public void setMsg_art_num(Set<MsgBoardBean> msg_art_num) {
		this.msg_art_num = msg_art_num;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getArticle_num() {
		return article_num;
	}

	public void setArticle_num(Integer article_num) {
		this.article_num = article_num;
	}

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public Timestamp getArticle_date() {
		return article_date;
	}

	public void setArticle_date(Timestamp article_date) {
		this.article_date = article_date;
	}

	public String getArticle_status() {
		return article_status;
	}

	public void setArticle_status(String article_status) {
		this.article_status = article_status;
	}
	@Column(columnDefinition = "nvarchar(max) not null")
	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public String getArticle_catergoary() {
		return article_catergoary;
	}

	public void setArticle_catergoary(String article_catergoary) {
		this.article_catergoary = article_catergoary;
	}

	private MultipartFile ArticleImage;

	@Transient
	public MultipartFile getArticleImage() {
		return ArticleImage;
	}

	public void setArticleImage(MultipartFile articleImage) {
		ArticleImage = articleImage;
	}

	public Blob getCoverImage() {
		return coverImage;
	}

	public void setCoverImage(Blob coverImage) {
		this.coverImage = coverImage;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

//	public ArrayList<MsgBoardBean> getMsg() {
//		return msg;
//	}
//
//	public void setMsg(ArrayList<MsgBoardBean> msg) {
//		this.msg = msg;
//	}

	@Override
	public String toString() {
		return "ArticleBean [article_num=" + article_num + ", article_title=" + article_title + ", article_date="
				+ article_date + ", article_status=" + article_status + ", article_content=" + article_content
				+ ", article_catergoary=" + article_catergoary + ", coverImage=" + coverImage + ", fileName=" + fileName
				+ ", ArticleImage=" + ArticleImage + "]";
	}

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberBean getArticle_member() {
		return article_member;
	}

	public void setArticle_member(MemberBean article_member) {
		this.article_member = article_member;
	}

}
