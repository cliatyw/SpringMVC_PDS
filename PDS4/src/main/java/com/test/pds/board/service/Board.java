package com.test.pds.board.service;

public class Board {
	private int boardId;
	private String boardTitle;
	private String boardContent;
	private BoardFile boardFile;
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public BoardFile getBoardFile() {
		return boardFile;
	}
	public void setBoardFile(BoardFile boardFile) {
		this.boardFile = boardFile;
	}
	@Override
	public String toString() {
		return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardFile=" + boardFile + "]";
	}
}