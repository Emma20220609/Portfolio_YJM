/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.dto;


import java.util.ArrayList;

import meta.dbms.*;
import meta.vo.*;

public class storeDTO extends DBManager {
	
	private ArrayList<storeVO>   storeList = null;
	
	//매장 정보를 조회한다.
	public void StoreRead()
	{
		storeVO vo = null;
		String sql = "";
		
		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return;
		
		//메뉴의 정보를 얻는다.
		sql  = " select * ";
		sql += " from store ";
		
		this.OpenQuery(sql);
		while(this.GetNext() == true)
		{
			if(storeList == null) storeList = new ArrayList<storeVO>();

			vo = new storeVO();

			vo.setSt_no		(this.GetInt	("st_no"));
			vo.setSt_name	(this.GetValue	("st_name"));
			vo.setSt_adr	(this.GetValue	("st_adr"));
			vo.setSt_state	(this.GetValue	("st_state"));
			vo.setSt_city	(this.GetValue	("st_city"));
			vo.setSt_open	(this.GetDate	("st_open"));
			vo.setSt_close	(this.GetDate	("st_close"));
			vo.setSt_off	(this.GetValue	("st_off"));
			vo.setSt_holy	(this.GetValue	("st_holy"));
			
			storeList.add(vo);
		}
		this.CloseQuery();
		
		//데이터베이스 연결을 종료한다.
		this.DBClose();
		return;
	}
	
	//전체 매장을 카운트 한다.
	public int GetStoreTotal()
	{
		if(this.storeList == null) this.StoreRead();
		int stTotal = storeList.size();

/*		//데이터베이스에 연결한다.
		if(this.DBOpen() == false) return 0;

		//전체 갯수를 얻는다.
		String sql;
		sql  = "select count(*) as count ";
		sql += "from store ";
		System.out.println("StoreDTO GetStoreTotal= "+sql);
		this.OpenQuery(sql);
		this.GetNext();
		stTotal = this.GetInt("count");
		this.CloseQuery();

		//데이터베이스 연결을 종료한다.
		this.DBClose(); */

		return stTotal;
	}
	
	public storeVO GetStore(int index)
	{
		if(this.storeList == null) this.StoreRead();
		return storeList.get(index);
	}
}