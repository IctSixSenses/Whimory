package notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable {
	private static final long serialVersionUID = 412L;
	
	private int notice_No;
	private String notice_Title;
	private Date notice_Date;
	private String notice_ID;
	private String notice_Content;
	private String noltice_org_File;
	private String notice_Re_File;
	
	public Notice() {}

	public Notice(int notice_No, String notice_Title, Date notice_Date, String notice_ID, String notice_Content,
			String noltice_org_File, String notice_Re_File) {
		super();
		this.notice_No = notice_No;
		this.notice_Title = notice_Title;
		this.notice_Date = notice_Date;
		this.notice_ID = notice_ID;
		this.notice_Content = notice_Content;
		this.noltice_org_File = noltice_org_File;
		this.notice_Re_File = notice_Re_File;
	}

	public Notice(int notice_No, String notice_Title, String notice_ID) {
		super();
		this.notice_No = notice_No;
		this.notice_Title = notice_Title;
		this.notice_ID = notice_ID;
	}

	public int getnotice_No() {
		return notice_No;
	}

	public void setNoticeNo(int notice_No) {
		this.notice_No = notice_No;
	}

	public String getnotice_Title() {
		return notice_Title;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.notice_Title = notice_Title;
	}

	public Date getnotice_Date() {
		return notice_Date;
	}

	public void setNoticeDate(Date notice_Date) {
		this.notice_Date = notice_Date;
	}

	public String getnotice_ID() {
		return notice_ID;
	}

	public void setNoticeWriter(String notice_ID) {
		this.notice_ID = notice_ID;
	}

	public String getNoticeContent() {
		return notice_Content;
	}

	public void setNoticeContent(String notice_Content) {
		this.notice_Content = notice_Content;
	}

	public String getnoltice_org_File() {
		return noltice_org_File;
	}

	public void setOriginalFilepath(String noltice_org_File) {
		this.noltice_org_File = noltice_org_File;
	}

	public String getnotice_Re_File() {
		return notice_Re_File;
	}

	public void setnotice_Re_File(String notice_Re_File) {
		this.notice_Re_File = notice_Re_File;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [notice_No=" + notice_No + ", notice_Title=" + notice_Title + ", notice_Date=" + notice_Date
				+ ", notice_ID=" + notice_ID + ", notice_Content=" + notice_Content + ", noltice_org_File="
				+ noltice_org_File + ", notice_Re_File=" + notice_Re_File + "]";
	}
	
	
	
	
}
