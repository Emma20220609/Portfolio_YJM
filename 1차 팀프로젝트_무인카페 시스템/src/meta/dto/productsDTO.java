/******************************************************************************
작성일 : 2022-05-19 오후 4:09
작성자 : 함경환
******************************************************************************/
/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/

package meta.dto;

import java.util.ArrayList;
import meta.dbms.*;
import meta.vo.*;

public class productsDTO extends DBManager
{
	private	String					sql			= "";
	private	String					where		= "";
	private	String					tableName	= "";
//	private	ArrayList<productsVO>	List		= null;
	private	ArrayList<productsVO>	MenuList	= null;
	private	ArrayList<productsVO>	ProList		= null;
	
	// 리스트의 아이템 갯수를 산출한다 type : "menu" / 
	public int GetTotal(String type)
	{
		if(type.equals("menu")) return MenuList.size();
		if(type.equals("pro")) return ProList.size();
		return 0;
	}
	
	// 메뉴 리스트의 아이템을 index로 가져온다
	public productsVO GetMenuItem(int index)
	{
		if(this.MenuList == null) this.GetMenuList();
		return MenuList.get(index);
	}
	
	// 상품 리스트의 아이템을 index로 가져온다
	public productsVO GetProItem(int index)
	{
		if(this.ProList == null) this.GetProList();
		return ProList.get(index);
	}
	
	// 메뉴 리스트를 생성한다
	public void GetMenuList()	{ this.GetList("menu_list", "");}
	// 상품 리스트를 생성한다
	public void GetProList()	{ this.GetList("pro_list", "");	}
	// 선택된 메뉴의 상품 리스트를 생성한다.
	public void GetProList(String menu) { this.GetList("pro_list", menu); }
	
	// 리스트 생성용 공통 코드
	public void GetList(String type, String menu)
	{
		ArrayList<productsVO> list = null;
		tableName = type;
		where	= (!menu.equals("")) ? " where hname = '" + menu + "'" : "";
		
		System.out.println("productsDTO getList [DB open]");
		if(this.DBOpen() == false) { System.out.println("productsDTO getList [DB open] fail"); return; }
		
		sql		= "select * from " + tableName + where;
		System.out.println("productsDTO getList [make SQL] :\n" + sql);
		System.out.println("productsDTO getList [Open Query]");
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			if(list == null) list = new ArrayList<productsVO>();

			productsVO item = new productsVO( this, type );
			list.add(item);
		}
		
		for(productsVO item : list)
		{
			//상품이미지를 읽어온다.
			sql  = "select * from product_image ";
			sql += " where pro_no = '" + item.pro_no() + "' ";
			//임시 리스트를 생성
			ArrayList<imageVO> imgs = new ArrayList<imageVO>(); 
			this.OpenQuery(sql);
			while(this.GetNext() == true)
			{
				//첨부파일 객체를 생성하고, DB에서 읽어온 정보를 저장한다.
				imageVO img = new imageVO();
				img.img_imgno(this.GetInt("pro_imgno"));
				img.pro_no(this.GetInt("pro_no"));
				img.img_lname(this.GetValue("pro_lname"));
				img.img_pname(this.GetValue("pro_pname"));
				//리스트에 image객체를 add한다
				imgs.add(img);
			}
			//item의 이미지 리스에 임시 리스트를 넣는다
			item.images(imgs);
		}
		
		//데이터베이스 연결을 종료한다.
		System.out.println("productsDTO getMenuList [close Query]");
		this.CloseQuery();
		System.out.println("productsDTO getMenuList [DB close]");
		this.DBClose();
		
		if(type.equals("menu_list")) { this.MenuList = list; }
		else { this.ProList = list; }
	}
	
	public void UpdateIMG(productsVO vo)
	{
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return;

		String sql = "";

		//첨부파일을 업데이트 한다.
		if(vo.images().size() != 0)
		{
			for(imageVO img : vo.images())
			{
				sql = "delete from product_image where pro_no = " + vo.pro_no() + " ";
				this.RunSQL(sql);
				
				sql  = "insert into product_image (pro_no, pro_pname, pro_lname) ";
				sql += "values (";
				sql += " " + vo.pro_no() + ",";
				sql += "'" + img.img_pname() + "',";
				sql += "'" + img.img_lname() + "')";
				this.RunSQL(sql);
			}
		}
	}
	
	// 리스트 생성용 공통 코드
	public productsVO GetItem(int pro_no)
	{

		productsVO item = null;

		System.out.println("productsDTO getList [DB open]");
		if(this.DBOpen() == false) { System.out.println("productsDTO getList [DB open] fail"); return null; }
		
		sql		= "select * from pro_list where pro_no = " + pro_no ;
		System.out.println("productsDTO getList [make SQL] :\n" + sql);
		System.out.println("productsDTO getList [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() != true) { return null; }

		//상품을 읽어온다
		item = new productsVO( this, "pro_list" );

		//상품이미지를 읽어온다.
		sql  = "select * from product_image ";
		sql += " where pro_no = '" + item.pro_no() + "' ";
		//임시 리스트를 생성
		ArrayList<imageVO> imgs = new ArrayList<imageVO>(); 
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			//첨부파일 객체를 생성하고, DB에서 읽어온 정보를 저장한다.
			imageVO img = new imageVO();
			img.img_imgno(this.GetInt("pro_imgno"));
			img.pro_no(this.GetInt("pro_no"));
			img.img_lname(this.GetValue("pro_lname"));
			img.img_pname(this.GetValue("pro_pname"));
			//리스트에 image객체를 add한다
			imgs.add(img);
		}
		//item의 이미지 리스에 임시 리스트를 넣는다
		item.images(imgs);
		
		//데이터베이스 연결을 종료한다.
		System.out.println("productsDTO getMenuList [close Query]");
		this.CloseQuery();
		System.out.println("productsDTO getMenuList [DB close]");
		this.DBClose();

		return item;
	}
	
	public ArrayList<productsVO> GgetNutri()
	{
		return null;
	}
	
	public ArrayList<productsVO> GgetRecipe()
	{
		return null;
	}
}
