/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.dto;

import meta.dbms.DBManager;
import meta.vo.*;

public class cartDTO extends DBManager
{
	public cartDTO()
	{
		sql			= "";
		where		= "";
		className	= "cartDTO";
		tableName	= "cartlist";
		methodName	= "";
	}
	
	//DB에 장바구니를 기록한다
	public boolean Insert(cartVO vo)
	{
		methodName = "Insert";
		System.out.println(className + " " + methodName + " [DB open]");							//데이터베이스에 연결한다.
		if(this.DBOpen() == false) { System.out.println(className + " " + methodName + " [DB open] fail"); return false; }
		//테이블에 Insert하는 구문을 만든다.
		sql	 ="";
		sql += "insert into " + tableName + " (";
		sql += " pro_no, ";											//상품번호
		sql += " pro_price, ";										//상품가격
		sql += " pro_acc, ";										//적립률
		sql += " quan, ";											//선택수량
		sql += " op01_name, ";										//옵션1이름
		sql += " op01_quan, ";										//옵션1수량
		sql += " op01_price, ";										//옵션1가격
		sql += " op02_name, ";										//옵션2이름
		sql += " op02_quan, ";										//옵션2수량
		sql += " op02_price, ";										//옵션2가격
		sql += " op03_name, ";										//옵션3이름
		sql += " op03_quan, ";										//옵션3수량
		sql += " op03_price, ";										//옵션3가격
		sql += " sumPrice, ";										//총 가격
		sql += " sumPoint ";										//총 가격
		sql += ") \n";
		sql += "values ( ";
		sql += "  "	+ vo.Pro_no()			+ ", ";					//상품번호
		sql += "  "	+ vo.Pro_price()		+ ", ";					//상품가격
		sql += "  "	+ vo.Pro_acc()			+ ", ";					//적립률
		sql += "  "	+ vo.Quan()				+ ", ";					//선택수량
		sql += " '"	+ vo.Op01_name()		+ "',";					//옵션1이름
		sql += "  "	+ vo.Op01_quan()		+ ", ";					//옵션1수량
		sql += "  "	+ vo.Op01_price()		+ ", ";					//옵션1가격
		sql += " '"	+ vo.Op02_name()		+ "',";					//옵션2이름
		sql += "  "	+ vo.Op02_quan()		+ ", ";					//옵션2수량
		sql += "  "	+ vo.Op02_price()		+ ", ";					//옵션2가격
		sql += " '"	+ vo.Op03_name()		+ "',";					//옵션3이름
		sql += "  "	+ vo.Op03_quan()		+ ", ";					//옵션3수량
		sql += "  "	+ vo.Op03_price()		+ ", ";					//옵션3가격
		sql += "  "	+ vo.SumPrice()			+ ", ";					//총 가격
		sql += "  "	+ vo.SumPoint()			+ "  ";					//총 가격
		sql += ")";
		System.out.println(className + " " + methodName + " [make SQL] :\n" + sql);
		System.out.println(className + " " + methodName + " [run SQL]");
		this.RunSQL(sql);
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " " + methodName + " [DB close]");
		this.DBClose();
		return true;
	}

	//DB에서 장바구니를 읽어온다
	public cartVO Read(String cartlist_no)
	{
		methodName = "Read";
		where =	(cartlist_no==null)	?	"" : "where cartlist_no = " + cartlist_no ;
		sql  = "select * from " + tableName + " ";
		sql += where;
		System.out.println(className + " " + methodName + " [make SQL] : " + sql);
		System.out.println(className + " " + methodName + " [Open Query]");
		this.OpenQuery(sql);
		if(this.GetNext() == false)
		{
			//데이터베이스 연결을 종료한다.
			System.out.println(className + " " + methodName + " [Close Query]");
			this.CloseQuery();
			System.out.println(className + " " + methodName + " [DB Close]");
			this.DBClose();
			return null;
		}
		//VO를 생성한다.
		cartVO cVO = new cartVO(
			this.GetInt("cartlist_no"	),							//장바구니번호
			this.GetInt("pro_no"		),							//상품번호
			this.GetInt("pro_price"		),							//상품가격
			this.GetInt("pro_acc"		),							//적립률
			this.GetInt("quan"			),							//선택수량
			this.GetValue("op01_name"	),							//옵션1이름
			this.GetInt("op01_quan"		),							//옵션1수량
			this.GetInt("op01_price"	),							//옵션1가격
			this.GetValue("op02_name"	),							//옵션2이름
			this.GetInt("op02_quan"		),							//옵션2수량
			this.GetInt("op02_price"	),							//옵션2가격
			this.GetValue("op03_name"	),							//옵션3이름
			this.GetInt("op03_quan"		),							//옵션3수량
			this.GetInt("op03_price"	),							//옵션3가격
			this.GetInt("sumPrice"		),							//총 가격
			this.GetInt("sumPoint"		)							//총 포인트
		);
		System.out.println(className + " " + methodName + " [Close Query]");
		this.CloseQuery();
		//데이터베이스 연결을 종료한다.
		System.out.println(className + " " + methodName + " [DB Close]");
		this.DBClose();
		return cVO;
	}
}
