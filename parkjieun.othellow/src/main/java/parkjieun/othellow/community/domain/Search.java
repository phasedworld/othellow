package parkjieun.othellow.community.domain;

public class Search {
	private String searchtype;
	private String keyword;
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "Search [searchtype=" + searchtype + ", keyword=" + keyword
				+ "]";
	}
	
}
