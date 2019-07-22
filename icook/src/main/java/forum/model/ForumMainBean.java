package forum.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.web.icook.model.MemberBean;

//注意，使用Hibernate生成SQL Table 時 ，要將text、signature 設定成varchar(max)
@Entity
@Table(name = "forum_article")
public class ForumMainBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private String username; 			// 作者帳號
	private String nickname; 			// 作者暱稱
	private String board; 				// 討論板名稱
	private String category; 			// 分類
	private String title; 				// 標題
	@Lob
	@Basic(fetch = FetchType.EAGER)
	private String text; 				// 內文
	private String signature; 			// 簽名
	private Integer clicks; 			// 點擊數
	private Integer likes; 				// 喜歡數
	private Timestamp postTime; 		// 發表時間
	private Timestamp editTime; 		// 編輯時間
	private Integer replies; 			// 回應數
	private Integer harticle_id; 		// 首篇文章編號
	private Integer article_id; 		// 文章編號
	private MemberBean memberBean;		// 關聯會員物件

	public ForumMainBean() {

	}

	public ForumMainBean(String username, String nickname, String board, String category, String title, String text,
			String signature, Integer clicks, Integer likes, Timestamp postTime, Timestamp editTime, Integer replies,
			Integer harticle_id, Integer article_id, MemberBean memberBean) {
		this.username = username;
		this.nickname = nickname;
		this.board = board;
		this.category = category;
		this.title = title;
		this.text = text;
		this.signature = signature;
		this.clicks = clicks;
		this.likes = likes;
		this.postTime = postTime;
		this.editTime = editTime;
		this.replies = replies;
		this.harticle_id = harticle_id;
		this.article_id = article_id;
		this.memberBean = memberBean;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public Integer getClicks() {
		return clicks;
	}

	public void setClicks(Integer clicks) {
		this.clicks = clicks;
	}

	public Integer getLikes() {
		return likes;
	}

	public void setLikes(Integer likes) {
		this.likes = likes;
	}

	public Timestamp getPostTime() {
		return postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public Timestamp getEditTime() {
		return editTime;
	}

	public void setEditTime(Timestamp editTime) {
		this.editTime = editTime;
	}

	public Integer getReplies() {
		return replies;
	}

	public void setReplies(Integer replies) {
		this.replies = replies;
	}


	public Integer getHarticle_id() {
		return harticle_id;
	}

	public void setHarticle_id(Integer harticle_id) {
		this.harticle_id = harticle_id;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public Integer getArticle_id() {
		return article_id;
	}

	public void setArticle_id(Integer article_id) {
		this.article_id = article_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@ManyToOne
	@JoinColumn(name = "member_id")
	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Override
	public String toString() {
		return "ForumMainBean [memberBean=" + memberBean + "]";
	}



}
