/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.dto;

import meta.dbms.*;
import meta.vo.*;

public class nutritionDTO extends DBManager {

		//메뉴에 대한 영양정보를 조회한다
		public nutriVO Read(int pro_no)
		{
			nutriVO vo = null;
			String sql = "";

			//데이터베이스에 연결한다.
			if(this.DBOpen() == false) return vo;


			//메뉴의 정보를 얻는다.
			sql  = " select ";
			sql += " nutri_no, ";
			sql += " def_no, ";
			sql += " cat_no, ";
			sql += " nutri_name, ";
			sql += " nutri_quan, ";
			sql += " nutri_unit ";
			sql += " from nutrition ";
			sql += "where def_no = '" + pro_no + "' ";
			
			System.out.println("nutritionDTO= " + sql);
			this.OpenQuery(sql);
			while(this.GetNext() == true)
			{
				vo = new nutriVO();

				vo.pro_no(pro_no);
				vo.nutri_name(this.GetValue("nutri_name"));
				vo.nutri_quan(this.GetInt("nutri_quan"));
				vo.nutri_unit(this.GetValue("nutri_unit"));
			}
			this.CloseQuery();


			//데이터베이스 연결을 종료한다.
			this.DBClose();
			return vo;
		}

		
		//메뉴 리스트에서 선택된 메뉴를 한글 이름으로 조회한다.
		public nutriVO ProRead(String hname)
		{
			nutriVO vo = null;
			String sql = "";

			//데이터베이스에 연결한다.
			if(this.DBOpen() == false) return vo;

			//메뉴의 정보를 얻는다.
			sql  = " select ";
			sql += " pro_no, ";
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
			sql += " flag_rec ";
			sql += " from pro_list ";
			sql += "where hname = '" + hname + "' ";
			System.out.println("menuDTO ProRead make SQL : "+sql);
			this.OpenQuery(sql);
			if(this.GetNext() == true)
			{
				vo = new nutriVO();

			}
			this.CloseQuery();

			//데이터베이스 연결을 종료한다.
			this.DBClose();
			return vo;
		}
	}
