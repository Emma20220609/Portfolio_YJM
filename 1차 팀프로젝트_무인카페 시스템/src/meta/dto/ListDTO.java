package meta.dto;

import java.util.ArrayList;

import meta.dbms.*;
import meta.vo.*;

//게시물 목록 가져오기 클래스
public class ListDTO extends DBManager
{
	private SearchVO search = null;
	private String   where = "";
	/*
	private ArrayList<boardVO>   boardVOList;
	private ArrayList<productVO> homeMenuList;
	private ArrayList<productVO> productList;
	*/
	private ArrayList<boardVO>   list;
	private ArrayList<productVO> list2;	//메뉴 대분류 가져오기
	private ArrayList<productVO> list3; //홈페이지 전체메뉴 가져오기
	
	public ListDTO()
	{
		
	}
	
	public ListDTO(SearchVO search)
	{
		this.setSearch(search);
		if(search.getKind().equals("") != true)
		{
			where = "board_kind = '"+ search.getKind()+ "' ";
		}else
		{
			where = "";
		}
		if(search.getKeyword().equals("") != true)
		{
			switch(search.getType())
			{
			case "T":
				where += "and board_title like '%"+ search.getKeyword() + "%' ";
				break;
			case "C":
				where += "and board_note like '%"+ search.getKeyword() + "%' ";
				break;
			case "A":
				where += "and (board_title like '%"+ search.getKeyword() + "%' ";
				where += "or board_note like '%"+ search.getKeyword() + "%') ";
				break;
			}

		}
	}

	//전체 게시물 갯수를 얻는다.
	public int GetTotal()
	{
		int total = 0;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return 0;

		//전체 갯수를 얻는다.
		String sql;
		sql  = "select count(*) as count ";
		sql += "from board ";
		
		if(where.equals("") != true)
		{
			sql += "where " + where;
		}
		this.OpenQuery(sql);
		this.GetNext();
		total = this.GetInt("count");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();

		return total;
	}

	public int GetProTotal()
	{
		int mtotal = 0;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return 0;

		//전체 갯수를 얻는다.
		String sql;
		sql  = "select count(*) as count ";
		sql += "from pro_list ";

		this.OpenQuery(sql);
		this.GetNext();
		mtotal = this.GetInt("count");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();

		return mtotal;
	}
	
	public int GetProTotal(String hname)
	{
		int mtotal = 0;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return 0;

		//전체 갯수를 얻는다.
		String sql;
		sql  = "select count(*) as count ";
		sql += "from pro_list ";
		sql += "where hname ='" + hname + "'";
		this.OpenQuery(sql);
		this.GetNext();
		mtotal = this.GetInt("count");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();

		return mtotal;
	}

	public boolean GetHomeMenu(int curpage)
	{
		String sql = "";

		this.list3 = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
		int startno = (curpage - 1) * 10;

		//게시물 목록을 조회한다.

		sql  = "select * ";
		sql += "from pro_list ";
		if(where.equals("") != true)
		{
			sql += "where " + where + "\n";
		}
		sql += "order by pro_no desc \n";
		sql += "limit " + startno + ",10\n";
		System.out.println(sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			int  pro_no	= this.GetInt("pro_no");
			String	name	= this.GetValue("name");
			String	hname	= this.GetValue("hname");
			String	ename	= this.GetValue("ename");
			String	price	= this.GetValue("price");
			
			
			System.out.println(pro_no);
			System.out.println(hname);
			System.out.println(name);
			System.out.println(ename);
			System.out.println(price);
			
			if( this.list3 == null )
			{
				this.list3 = new ArrayList<productVO>();
			}
			
			
			productVO vo = new productVO();
			
			vo.setPro_no(pro_no);
			vo.setHname(hname);
			vo.setName(name);
			vo.setEname(ename);
			vo.setPrice(price);
			//vo.setName(this.GetValue(name));
			//vo.setEname(this.GetValue(ename));
			//vo.setPrice(this.GetValue(price));
			
			list3.add(vo);
			
		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}
	//전체 메뉴를 카운트 한다.
	public int GetMenuTotal()
	{
		int mtotal = 0;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return 0;

		//전체 갯수를 얻는다.
		String sql;
		sql  = "select count(*) as count ";
		sql += "from menu_list ";
		System.out.println("ListDTO GetMenuTotal= "+sql);
		this.OpenQuery(sql);
		this.GetNext();
		mtotal = this.GetInt("count");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();

		return mtotal;
	}

	// 리스트를 얻는다
	public boolean GetList(int curpage)
	{
		String sql = "";

		this.list = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
		int startno = (curpage - 1) * 10;

		//게시물을 조회한다
		/*
		sql  = "SELECT ";
		sql += "board.board_no, board.ad_no, admin.ad_po, admin.ad_name, ";
		sql += "board.board_date, board.board_kind, board.board_title, ";
		sql += "board.board_note, board.board_hit ";
		sql += "FROM board ";
		sql += "LEFT JOIN admin ON board.ad_no = admin.ad_no ";
		*/
		sql  = "select \n";
		sql += "board_no, no, \n";
		sql += "(select no from account where no = board.no) as no, \n";
		sql += "(select name from account where no = board.no) as name, \n";
		sql += "date(board_date) as board_date, board_kind, board_title, \n";
		sql += "board_note, board_hit \n";
		sql += "FROM board \n";
		//sql += "LEFT JOIN admin ON board.ad_no = admin.ad_no ";
		if(where.equals("") != true)
		{
			sql += "where " + where + "\n";
		}
		sql += "order by board_no desc \n";
		sql += "limit " + startno + ",10\n";
		System.out.println("ListDTO_GetList_sql= " + sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			int board_no		= this.GetInt("board_no");
			int no				= this.GetInt("no");
			String board_title	= this.GetValue("board_title");
			String board_kind	= this.GetValue("board_kind");
			String board_date	= this.GetValue("board_date");
			int board_hit		= this.GetInt("board_hit");
			String board_note	= this.GetValue("board_note");

			if( this.list == null )
			{
				this.list = new ArrayList<boardVO>();
			}
			boardVO vo = new boardVO();
			vo.setBoard_no(board_no);
			vo.setno(no);
			vo.setBoard_title(board_title);
			vo.setBoard_kind(board_kind);
			vo.setBoard_date(board_date);
			vo.setBoard_note(board_note);
			vo.setBoard_hit(board_hit);
			list.add(vo);
		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}
	
	//메타오더 게시글 리스트 얻기
	public boolean GetMoList(int curpage)
	{
		String sql = "";

		this.list = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
		int startno = (curpage - 1) * 8;

		//게시물을 조회한다
		/*
		sql  = "SELECT ";
		sql += "board.board_no, board.ad_no, admin.ad_po, admin.ad_name, ";
		sql += "board.board_date, board.board_kind, board.board_title, ";
		sql += "board.board_note, board.board_hit ";
		sql += "FROM board ";
		sql += "LEFT JOIN admin ON board.ad_no = admin.ad_no ";
		*/
		sql  = "select \n";
		sql += "board_no, no, \n";
		sql += "(select no from account where no = board.no) as no, \n";
		sql += "(select name from account where no = board.no) as name, \n";
		sql += "board_date, board_kind, board_title, \n";
		sql += "board_note, board_hit \n";
		sql += "FROM board \n";
		//sql += "LEFT JOIN admin ON board.ad_no = admin.ad_no ";
		if(where.equals("") != true)
		{
			sql += "where " + where + "\n";
		}
		sql += "order by board_no desc \n";
		sql += "limit " + startno + ",8\n";
		System.out.println("ListDTO_GetMoList_sql= " + sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			int board_no		= this.GetInt("board_no");
			int no				= this.GetInt("no");
			String board_title	= this.GetValue("board_title");
			String board_kind	= this.GetValue("board_kind");
			String board_date	= this.GetValue("board_date");
			int board_hit		= this.GetInt("board_hit");
			String board_note	= this.GetValue("board_note");

			if( this.list == null )
			{
				this.list = new ArrayList<boardVO>();
			}
			boardVO vo = new boardVO();
			vo.setBoard_no(board_no);
			vo.setno(no);
			vo.setBoard_title(board_title);
			vo.setBoard_kind(board_kind);
			vo.setBoard_date(board_date);
			vo.setBoard_note(board_note);
			vo.setBoard_hit(board_hit);
			list.add(vo);
		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}

	public boolean GetMenuList(int curpage)
	{
		String sql = "";

		this.list2 = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
		int startno = (curpage - 1) * 10;

		//게시물 목록을 조회한다.

		sql  = "select * ";
		sql += "from menu_list ";
		if(where.equals("") != true)
		{
			sql += "where " + where + "\n";
		}
		sql += "order by def_no desc \n";
		sql += "limit " + startno + ",10\n";
		System.out.println(sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
/*			int		def_no		= this.GetInt("def_no");
			String	def_hname	= this.GetValue("def_hname");
			String	def_ename	= this.GetValue("def_ename");
			String	pro_sell	= this.GetValue("pro_sell");
*/
			if( this.list2 == null )
			{
				this.list2 = new ArrayList<productVO>();
			}

			productVO vo = new productVO();
			vo.setDef_no(this.GetInt("def_no"));
			vo.setDef_hname(this.GetValue("def_hname"));
			vo.setDef_ename(this.GetValue("def_ename"));
			vo.setPro_sell(this.GetValue("pro_sell"));
			list2.add(vo);

		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}

	public boolean GetproList(int curpage, String def_hname)
	{
		String sql = "";

		this.list2 = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
//		int startno = (curpage - 1) * 10;

		//게시물 목록을 조회한다.

		sql  = "select * ";
		sql += "from pro_list ";
	
		System.out.println("ListDTO GetproList= "+sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
/*			int		pro_no		= this.GetInt("pro_no");
			String	name		= this.GetValue("name");
			String	hname		= this.GetValue("hname");
			String	ename		= this.GetValue("ename");
			String	cat			= this.GetValue("cat");
			String	info		= this.GetValue("info");
			String	pro_sell	= this.GetValue("pro_sell");
			int		volume		= this.GetInt("volume");
			String	unit		= this.GetValue("unit");
			int		price		= this.GetInt("price");
			int		acc			= this.GetInt("acc");
			String	flag_recom	= this.GetValue("flag_recom");
			String	flag_sell	= this.GetValue("flag_sell");
			String	flag_rec	= this.GetValue("flag_rec");
*/
			if( this.list2 == null )
			{
				this.list2 = new ArrayList<productVO>();
			}

			productVO vo = new productVO();

			vo.setCat_name(	this.GetValue("cat")	);
			vo.setDef_hname(this.GetValue("hname")	);
			vo.setDef_ename(this.GetValue("ename")	);
			vo.setDiv_name(	this.GetValue("name")	);
			vo.setDef_info(	this.GetValue("info")	);
			vo.setVolume(	this.GetInt("volume")	);
			vo.setUnit(		this.GetValue("unit")	);
			vo.setPro_price(this.GetInt("price")	);
			vo.setPro_no(	this.GetInt("pro_no")		);
			vo.setPro_sell(	this.GetValue("flag_sell")	);
			vo.setPro_recom(this.GetValue("flag_recom")	);

			list2.add(vo);

		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}
	
	public boolean GetproList(String hname)
	{
		String sql = "";

		this.list2 = null;

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return false;

		//SQL의  limit 시작 번호를 계산한다.
//		int startno = (curpage - 1) * 10;

		//게시물 목록을 조회한다.

		sql  = "select * ";
		sql += "from pro_list ";
		sql += "where hname= '"+ hname +"'";
	
		System.out.println("ListDTO GetproList= "+sql);
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
/*			int		pro_no		= this.GetInt("pro_no");
			String	name		= this.GetValue("name");
			String	hname		= this.GetValue("hname");
			String	ename		= this.GetValue("ename");
			String	cat			= this.GetValue("cat");
			String	info		= this.GetValue("info");
			String	pro_sell	= this.GetValue("pro_sell");
			int		volume		= this.GetInt("volume");
			String	unit		= this.GetValue("unit");
			int		price		= this.GetInt("price");
			int		acc			= this.GetInt("acc");
			String	flag_recom	= this.GetValue("flag_recom");
			String	flag_sell	= this.GetValue("flag_sell");
			String	flag_rec	= this.GetValue("flag_rec");
*/
			if( this.list2 == null )
			{
				this.list2 = new ArrayList<productVO>();
			}

			productVO vo = new productVO();

			vo.setCat_name(	this.GetValue("cat")	);
			vo.setDef_hname(this.GetValue("hname")	);
			vo.setDef_ename(this.GetValue("ename")	);
			vo.setDiv_name(	this.GetValue("name")	);
			vo.setDef_info(	this.GetValue("info")	);
			vo.setVolume(	this.GetInt("volume")	);
			vo.setUnit(		this.GetValue("unit")	);
			vo.setPro_price(this.GetInt("price")	);
			vo.setPro_no(	this.GetInt("pro_no")		);
			vo.setPro_sell(	this.GetValue("flag_sell")	);
			vo.setPro_recom(this.GetValue("flag_recom")	);

			list2.add(vo);

		}
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return true;
	}

	//조회된 목록의 갯수를 얻는다.
	public int GetListTotal()
	{
		if(this.list == null) return 0;
		else return list.size();
	}

	public int GetMenuListTotal()
	{
		if(this.list2 == null) return 0;
		else return list2.size();
	}

	//목록에서 게시물 정보를 얻는다.
	public boardVO GetItem(int index)
	{
		if(this.list == null) return null;
		else return list.get(index);
	}

	public productVO GetMenu(int index)
	{
		if(this.list2 == null) return null;
		else return list2.get(index);
	}
	
	public ArrayList<productVO> GetHomeMenulist()
	{
		if(this.list3 == null) return null;
		else return list3;
	}

	public ArrayList<boardVO> GetListArray()
	{
		return this.list;
	}
	public ArrayList<productVO> GetMenuListArray()
	{
		return this.list2;
	}
	public ArrayList<productVO> GetHomeMenuListArray()
	{
		return this.list3;
	}

	public SearchVO getSearch() {
		return search;
	}

	public void setSearch(SearchVO search) {
		this.search = search;
	}
	
}


