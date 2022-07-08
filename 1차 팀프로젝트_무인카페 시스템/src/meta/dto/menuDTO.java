/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.dto;

import meta.dbms.*;
import meta.vo.*;

public class menuDTO extends DBManager{

	//메뉴정보를 조회한다
	public productVO Read(int pro_no)
	{
		productVO vo = null;
		String sql = "";

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return vo;

		//메뉴의 정보를 얻는다.
		sql  = " select * ";
/*		sql += " pro_no, ";
		sql += " name, ";
		sql += " hname, ";
		sql += " ename, ";
		sql += " cat, ";
		sql += " info, ";
		sql += " volume, ";
		sql += " unit, ";
		sql += " price, ";
		sql += " acc, ";
		sql += " flag_recom, ";
		sql += " flag_sell, ";
		sql += " flag_rec "; */
		sql += " from pro_list ";
		sql += " where pro_no = '" + pro_no + "' ";
		
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			vo = new productVO();

			vo.setPro_no(pro_no);
			vo.setName(this.GetValue("name"));
			vo.setHname(this.GetValue("hname"));
			vo.setEname(this.GetValue("ename"));
			vo.setCat(this.GetValue("cat"));
			vo.setInfo(this.GetValue("info"));
			vo.setVolume(this.GetInt("volume"));
			vo.setUnit(this.GetValue("unit"));
			vo.setPrice(this.GetValue("price"));
			vo.setAcc(this.GetValue("acc"));
			vo.setFlag_recom(this.GetValue("flag_recom"));
			vo.setFlag_sell(this.GetValue("flag_sell"));
			vo.setFlag_rec(this.GetValue("flag_rec"));
		}
		this.CloseQuery();

		/*
		//이미지를 얻는다.
		sql  = "select pro_imgno,pro_lname,pro_pname ";
		sql += "from product_image ";
		sql += "where def_no = '" + def_no + "' ";
		this.OpenQuery(sql);
		String ano   = "";
		String fname = "";
		if(this.GetNext() == true)
		{
			vo.img_imgno(this.GetValue("pro_imgno"));
			vo.img_lname(this.GetValue("pro_lname"));
			vo.img_pname(this.GetValue("pro_pname"));
		}
		this.CloseQuery();
		*/

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return vo;
	}

	
	//메뉴 리스트에서 선택된 메뉴를 한글 이름으로 조회한다.
	public productVO ProRead(String hname)
	{
		productVO vo = null;
		String sql = "";

		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return vo;

		//메뉴의 정보를 얻는다.
		sql  = " select * ";
/*		sql += " pro_no, ";
		sql += " name, ";
		sql += " hname, ";
		sql += " ename, ";
		sql += " cat, ";
		sql += " info, ";
		sql += " volume, ";
		sql += " unit, ";
		sql += " price, ";
		sql += " acc, ";
		sql += " flag_recom, ";
		sql += " flag_sell, ";
		sql += " flag_rec "; */
		sql += " from pro_list ";
		sql += "where hname = '" + hname + "' ";
		System.out.println("menuDTO ProRead make SQL : "+sql);
		this.OpenQuery(sql);
		if(this.GetNext() == true)
		{
			vo = new productVO();

			vo.setPro_no(this.GetInt("pro_no"));
			vo.setName(this.GetValue("name"));
			vo.setHname(this.GetValue("hname"));
			vo.setEname(this.GetValue("ename"));
			vo.setCat(this.GetValue("cat"));
			vo.setInfo(this.GetValue("info"));
			vo.setVolume(this.GetInt("volume"));
			vo.setUnit(this.GetValue("unit"));
			vo.setPrice(this.GetValue("price"));
			vo.setAcc(this.GetValue("acc"));
			vo.setFlag_recom(this.GetValue("flag_recom"));
			vo.setFlag_sell(this.GetValue("flag_sell"));
			vo.setFlag_rec(this.GetValue("flag_rec"));
		}
		this.CloseQuery();

		/*
		//이미지를 얻는다.
		sql  = "select pro_imgno,pro_lname,pro_pname ";
		sql += "from product_image ";
		sql += "where def_no = '" + def_no + "' ";
		this.OpenQuery(sql);
		String ano   = "";
		String fname = "";
		if(this.GetNext() == true)
		{
			vo.img_imgno(this.GetValue("pro_imgno"));
			vo.img_lname(this.GetValue("pro_lname"));
			vo.img_pname(this.GetValue("pro_pname"));
		}
		this.CloseQuery();
		*/

		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return vo;
	}
}