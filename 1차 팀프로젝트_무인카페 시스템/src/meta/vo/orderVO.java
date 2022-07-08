/******************************************************************************
작성일 : 2022-05-23 오전 9:30
작성자 : 함경환
 ******************************************************************************/
package meta.vo;

import java.sql.Date;
import java.util.ArrayList;

public class orderVO {

	// order 테이블
	private int		od_no;										// 주문번호
	private String	od_kind;									// 주문구분 0:비회원주문 1:회원주문
	private int		od_member;									// 주문주체 비회원:키오스크번호 회원:회원번호
	private Date	od_time;									// 주문시간
	private int		od_price;									// 총금액
	private int		od_point;									// 발생적립금계산액
	private String	od_get;										// 수령시간
	
	private ArrayList<orderinfoVO>	itemlist;					// 선택 상품 리스트
/*	// orderinfo 테이블
	private int		odif_no										// 주문상세번호
	private int		od_no										// 주문번호
	private String	od_kind										// 주문구분
	private int		od_member									// 주문주체
	private int		pro_no										// 매장상품번호
	private int		od_quan										// 수량
	private String	option										// 옵션선택유무 0:기본레시피 1:옵션레시피 */
	
	public orderVO() {}

	//주문 생성할때 사용하는 생성자
	public orderVO(
			String od_kind,										// 주문구분 0:비회원주문 1:회원주문
			int od_member, 										// 주문주체 비회원:키오스크번호 회원:회원번호
			String od_get,										// 수령시간
			ArrayList<orderinfoVO> itemlist
			)
	{
		this.od_kind = od_kind;
		this.od_member = od_member;
		this.od_get = od_get;
		this.itemlist = itemlist;
		this.sumOption();
	}

	//DB에서 읽어올때 사용하는 생성자
	public orderVO(
			int od_no,								// 주문번호
			String od_kind,							// 주문구분 0:비회원주문 1:회원주문
			int od_member,							// 주문주체 비회원:키오스크번호 회원:회원번호
			Date od_time,							// 주문시간
			int od_price,							// 총금액
			int od_point,							// 발생적립금계산액
			String od_get,							// 수령시간
			ArrayList<orderinfoVO> itemlist
			
/*			,		
			int odif_no,							// 주문상세번호
			int od_no,								// 주문번호
			String od_kind,							// 주문구분
			int od_member,							// 주문주체
			int pro_no,								// 매장상품번호
			int od_quan,							// 수량
			String option,							// 옵션선택유무 0:기본레시피 1:옵션레시피
			ArrayList<myfavinfoVO> optionlist,		
			int no,									// 옵션선택번호
			int raw_no,								// 기본재료번호
			int myf_quan,							// 수량
			String tbl_name,						// 테이블이름
			int dbr_sno								// 레코드일련번호 */
			)
	{
		this.od_no = od_no;
		this.od_kind = od_kind;
		this.od_member = od_member;
		this.od_time = od_time;
		this.od_price = od_price;
		this.od_point = od_point;
		this.od_get = od_get;
		this.itemlist = itemlist;
	}

	public	int		getOd_no()		{ return od_no;		}
	public	String	getOd_kind()	{ return od_kind;	}
	public	int		getOd_member()	{ return od_member;	}
	public	Date	getOd_time()	{ return od_time;	}
	public	int		getOd_price()	{ return od_price;	}
	public	int		getOd_point()	{ return od_point;	}
	public	String	getOd_get()		{ return od_get;	}
	public	ArrayList<orderinfoVO> getItemlist() {		return itemlist;	}

	public void		setOd_no(		int		 od_no)		 { this.od_no		 = od_no;		}
	public void		setOd_kind(		String	 od_kind)	 { this.od_kind		 = od_kind;		}
	public void		setOd_member(	int		 od_member)	 { this.od_member	 = od_member;	}
	public void		setOd_time(		Date	 od_time)	 { this.od_time		 = od_time;		}
	public void		setOd_price(	int		 od_price)	 { this.od_price	 = od_price;	}
	public void		setOd_point(	int		 od_point)	 { this.od_point	 = od_point;	}
	public void		setOd_get(		String	 od_get)	 { this.od_get		 = od_get;		}
	public void		setItemlist(	ArrayList<orderinfoVO> itemlist) { this.itemlist = itemlist;	}
	
	public void sumOption() {
		if(this.itemlist==null) return;
		int sum = 0;
		int point = 0;
		for(orderinfoVO item : this.itemlist )
		{
			sum += item.sumPrice();
			point += item.getPoint();
		}
		this.od_price = sum;
		this.od_point = point;
		return;
	}
}