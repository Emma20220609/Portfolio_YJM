/******************************************************************************
작성일 : 2022-05-19 오후 4:09
작성자 : 함경환
 ******************************************************************************/
package meta.dto;

import java.util.ArrayList;
import meta.dbms.*;
import meta.vo.*;

public class orderDTO extends DBManager
{
	private	String					sql			= "";
	private	String					where		= "";
	private	String					tableName	= "orderlist";
	private	String					className	= "orderDTO";
	private	ArrayList<orderinfoVO>	itemList	= null;

	public int GetItemTotal()
	{
		if(this.itemList == null) return 0;
		int Total = itemList.size();
		return Total;
	}

	public boolean insertOrder(orderVO vo) {
		
		System.out.println(className + " insertOrder [DB open]");							//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " insertOrder [DB open] fail"); return false; }
		
		sql	 ="";
		sql += "insert into " + tableName + " (";
		sql += " od_kind,";															// 주문구분 0:비회원주문 1:회원주문
		sql += " od_member,";														// 주문주체 비회원:키오스크번호 회원:회원번호
		sql += " od_time,";															// 주문시간
		sql += " od_price,";														// 총금액
		sql += " od_point,";														// 발생적립금계산액
		sql += " od_get";															// 수령시간
		sql += ") \n";
		sql += "values ( ";
		sql += " '"		+	vo.getOd_kind()		+	"', 	\n";						// 주문구분 0:비회원주문 1:회원주문
		sql += " '"		+	vo.getOd_member()	+	"', 	\n";						// 주문주체 비회원:키오스크번호 회원:회원번호
		sql += " now()"	+							", 		\n";						// 주문시간
		sql += " '"		+	vo.getOd_price()	+	"',  	\n";						// 총금액
		sql += " '"		+	vo.getOd_point()	+	"',  	\n";						// 발생적립금계산액
		sql += " '"		+	vo.getOd_get()		+	"'  	\n";						// 수령시간
		sql += ")";
		System.out.println(className + " insertOrder [make SQL] :\n" + sql);
		System.out.println(className + " insertOrder [run SQL]");
		this.RunSQL(sql);
		
		//등록된 주문의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		System.out.println(className + " insertOrder [make SQL] :\n" + sql);
		System.out.println(className + " insertOrder [run SQL]");
		this.OpenQuery(sql);
		this.GetNext();
		
		//주문번호를 저장한다
		int od_no = this.GetInt("no");
		vo.setOd_no(od_no);
		// 선택 상품 리스트를 테이블에 작성한다.
		for(orderinfoVO item : vo.getItemlist()) {
			sql	 ="";
			sql += "insert into orderinfo (";
			sql += " od_no,";															// 주문번호
			sql += " od_kind,";															// 주문구분 0:비회원주문 1:회원주문
			sql += " od_member,";														// 주문주체 비회원:키오스크번호 회원:회원번호
			sql += " pro_no,";															// 매장상품번호
			sql += " od_quan,";															// 수량
			sql += " option";															// 옵션선택유무 0:기본레시피 1:옵션레시피
			sql += ") \n";
			sql += "values ( ";
			sql += " "		+	vo.getOd_no()			+	",	 	\n";							// 주문번호
			sql += " '"		+	vo.getOd_kind()			+	"', 	\n";							// 주문구분 0:비회원주문 1:회원주문
			sql += " "		+	vo.getOd_member()		+	", 		\n";						// 주문주체 비회원:키오스크번호 회원:회원번호
			sql += " "		+	item.getPro_no()		+	",	  	\n";						// 매장상품번호
			sql += " "		+	item.getOd_quan()		+	", 		\n";						// 수량
			sql += " '"		+	item.getOption()		+	"'  	\n";						// 옵션선택유무 0:기본레시피 1:옵션레시피
			sql += ")";
			System.out.println(className + " insertOrder [make SQL] :\n" + sql);
			System.out.println(className + " insertOrder [run SQL]");
			this.RunSQL(sql);
			
			// 선택옵션이 있는 경우
			if(item.getOptionlist().size()!=0)
			{
				// 등록된 주문상세의 번호를 얻는다.
				sql = "select last_insert_id() as no ";
				this.OpenQuery(sql);
				this.GetNext();
				
				// 주문상세번호를 저장한다.
				int odif_no = this.GetInt("no");
				item.setOdif_no(odif_no);
				
				// 선택옵션을 테이블에 작성한다
				for(myfavinfoVO option : item.getOptionlist())
				{
					sql	 ="";
					sql += "insert into myfavinfo (";
					sql += " raw_no,";															// 기본재료번호
					sql += " myf_quan,";														// 수량
					sql += " tbl_name,";														// 테이블이름
					sql += " dbr_sno";															// 레코드일련번호
					sql += ") \n";
					sql += "values ( ";
					sql += " '"		+	option.Raw_no()			+	"', 	\n";						// 주문번호
					sql += " '"		+	option.Myf_quan()		+	"', 	\n";						// 주문번호
					sql += " '3', \n";																	// 테이블이름   / 3 : 주문 상세 옵션
					sql += " '"		+	item.getOdif_no()		+	"' 	\n";						// 레코드일련번호 / : 주문 상세 번호
					sql += ")";
					System.out.println(className + " insertOrder [make SQL] :\n" + sql);
					System.out.println(className + " insertOrder [run SQL]");
					this.RunSQL(sql);
				}
			}
			
		}
		
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " insertOrder [DB close]");
		this.DBClose();
		return true;
	}
}