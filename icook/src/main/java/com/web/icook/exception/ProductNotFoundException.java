package com.web.icook.exception;

public class ProductNotFoundException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	Integer bookId;
	public ProductNotFoundException() { }
//所有自訂例外都是RuntimeException的子類別，發生例外是DAO 如果要交到View上 要透過ProductNotFoounException的建構子
	public ProductNotFoundException(String message,Integer bookId) {
		this.bookId = bookId;
	}
	public Integer getBookId() {
		return bookId;
	}
	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}
	public ProductNotFoundException(String message) {
		super(message);
	}
	public ProductNotFoundException(Throwable cause) {
		super(cause);
	}
	public ProductNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}
	public ProductNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
