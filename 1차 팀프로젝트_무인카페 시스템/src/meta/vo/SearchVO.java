package meta.vo;

import javax.servlet.http.HttpServletRequest;

//검색조건을 관리하기 위한 클래스
public class SearchVO
{
	private String kind;			//게시물 구분
	private String type;			//검색타입
	private String id_search_type;	//id검색조건
	private String pw_search_type;	//pw검색조건
	private String keyword;			//검색어
//	private String sortcol;			//정렬 컬럼
//	private String sortorder;		//오름/내림차순
	private int    curpage;			//현재 페이지

	public SearchVO()
	{
		kind			= "01";
		type			= "T";
		id_search_type	= "";
		pw_search_type	= "";
		keyword			= "";
		curpage			= 1;
	}

	public SearchVO(HttpServletRequest request)
	{
		type	= request.getParameter("search_type");
		kind	= request.getParameter("search_kind");
		keyword	= request.getParameter("search_key");
		id_search_type = request.getParameter("id_search_type");
		pw_search_type = request.getParameter("pw_search_type");

		if(kind == null)			kind = "";
		if(type == null)			type = "T";
		if(id_search_type == null)	id_search_type = "";
		if(pw_search_type == null)	pw_search_type = "";
		if(keyword  == null)		keyword  = "";

		if( request.getParameter("page") != null)
		{
			//넘어온 page 값을 정수형 curpage 로 변환한다.
			curpage = Integer.parseInt(request.getParameter("page"));
		}else
		{
			//넘어온 page 값이 없으므로 현재 페이지 번호를 1로 설정한다.
			curpage = 1;
		}
		System.out.println("search_kind:" + kind);
		System.out.println("search_type:" + type);
		System.out.println("search_key:" + keyword);
		System.out.println("id_search_type:" + id_search_type);
		System.out.println("pw_search_type:" + pw_search_type);
	}

	public void setSearchVO(HttpServletRequest request)
	{
		type	= request.getParameter("search_type");
		kind	= request.getParameter("search_kind");
		keyword	= request.getParameter("search_key");

		if(kind == null) kind = "";
		if(type == null) type = "T";
		if(keyword  == null) keyword  = "";

		if( request.getParameter("page") != null)
		{
			//넘어온 page 값을 정수형 curpage 로 변환한다.
			curpage = Integer.parseInt(request.getParameter("page"));
		}else
		{
			//넘어온 page 값이 없으므로 현재 페이지 번호를 1로 설정한다.
			curpage = 1;
		}
		System.out.println("search_kind:" + kind);
		System.out.println("search_type:" + type);
		System.out.println("search_key:" + keyword);
	}

	public String getKind() {	return kind;	}

	public String getKindName()
	{
		if(kind.equals("01"))
		{
			return "공지사항";
		}else if(kind.equals("02"))
		{
			return "이벤트";
		}else
		{
			return "설문";
		}
	}
	
	public String getId_search_type_Name()
	{
		if(id_search_type.equals("name"))
		{
			return "이름";
		}else if(id_search_type.equals("hp"))
		{
			return "핸드폰번호";
		}else
		{
			return "이메일";
		}
	}
	
	public	String	getType()						{ return type;				}
	public	String	getId_search_type()				{ return id_search_type;	}
	public	String	getPw_search_type()				{ return pw_search_type;	}
	public	String	getKeyword()					{ return keyword;			}
	public	int		getCurpage()					{ return curpage;			}
		
	public	void	setKind(	String	kind	)					{ if(kind == null)					this.kind	 ="";				else	this.kind	 		= kind;				}
	public	void	setType(	String	type	)					{ if(type == null)					this.type	 ="T";				else	this.type			= type;				}
	public	void	setId_search_type(	String	id_search_type	)	{ if(id_search_type == null)		this.id_search_type	 ="name";	else	this.id_search_type	= id_search_type;	}
	public	void	setPw_search_type(	String	pw_search_type	)	{ if(pw_search_type == null)		this.pw_search_type	 ="T";		else	this.pw_search_type	= pw_search_type;	}
	public	void	setKeyword(	String	keyword	)					{ if(keyword == null)				this.keyword ="";				else	this.keyword 		= keyword;			}
	public	void	setCurpage(	int		curpage	)					{									this.curpage = curpage;															}
	public	void	setCurpage(	String	curpage	)
	{
		try
		{
			this.curpage = Integer.parseInt(curpage);
		}catch(Exception e)
		{
			this.curpage = 1;
		}
	}
	//게시물 번호만 넘겨주는 링크
	public String GetViewLink(int no)
	{
		String link = "";
		link  = "search_type=" + type;
		link +=	"&search_kind="+ kind;
		link += "&search_key="+ keyword;
		link += "&page=" + curpage;
		link += "&no=" + no;
		return link;
	}

	
	//게시물 번호, 구분을 넘기는 링크
	public String GetViewLink(int no, String kind)
	{
		String link = "";
		link  = "search_type=" + type;
		link +=	"&search_kind="+ kind;
		link += "&search_key="+ keyword;
		link += "&page=" + curpage;
		link += "&no=" + no;
		return link;
	}
	
	//상품정보를 넘겨주는 링크
	public String GetProLink(String def_hname)
	{
		String link = "";
		link  = "def_hname=" + def_hname;
		return link;
	}
	
	public String GetPageLink(int pageno)
	{
		String link = "";
		link  = "search_type=" + type;
		link += "&search_kind="+ kind;
		link += "&search_key="+ keyword;
		link += "&page=" + pageno;
		return link;
	}
}
