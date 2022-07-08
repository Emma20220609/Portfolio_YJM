/******************************************************************************
작성일 : 2022-05-23 오전 9:30
작성자 : 함경환
 ******************************************************************************/
package meta.vo;
import java.util.ArrayList;

public class orderinfoVO {
	// orderinfo 테이블
	private int		odif_no;										// 주문상세번호
	private int		od_no;											// 주문번호
	private String	od_kind;										// 주문구분
	private int		od_member;										// 주문주체
	private int		pro_no;											// 매장상품번호
	private int		od_quan;										// 수량
	private String	option;											// 옵션선택유무 0:기본레시피 1:옵션레시피
	private int		optionPrice;									// 옵션 가격
	private int		Price;											// 매장상품가격
	private int		Point;											// 발생포인트

	private ArrayList<myfavinfoVO>	optionlist;						// 선택 상품 리스트
/*	// myfavinfo 테이블
	private int		no												// 옵션선택번호
	private int		raw_no											// 기본재료번호
	private int		myf_quan										// 수량
	private String	tbl_name										// 테이블이름
	private int		dbr_sno											// 레코드일련번호 */

	public orderinfoVO() {}

	//주문 생성할때 사용하는 생성자
	public orderinfoVO( int pro_no, int od_quan, String option, ArrayList<myfavinfoVO> optionlist, int price, int acc)
	{
		this.pro_no		 = pro_no;									// 매장상품번호
		this.od_quan	 = od_quan;									// 수량
		this.option		 = option;									// 옵션선택유무 0:기본레시피 1:옵션레시피
		this.optionlist	 = optionlist;								// 선택 상품 리스트
		this.Price		 = price;									// 선택 상품 리스트
		this.Point		 = (int)(this.sumPrice() *  acc / 100);		// 발생 포인트
	}
	
	//DB에서 읽어올때 사용하는 생성자
	public orderinfoVO(int odif_no, int od_no, String od_kind, int od_member, int pro_no, int od_quan, String option, ArrayList<myfavinfoVO> optionlist)
	{
		this.odif_no	 = odif_no;									// 주문상세번호
		this.od_no		 = od_no;									// 주문번호
		this.od_kind	 = od_kind;									// 주문구분
		this.od_member	 = od_member;								// 주문주체
		this.pro_no		 = pro_no;									// 매장상품번호
		this.od_quan	 = od_quan;									// 수량
		this.option		 = option;									// 옵션선택유무 0:기본레시피 1:옵션레시피
		this.optionlist	 = optionlist;								// 선택 상품 리스트
	}
	public int		 getOdif_no()	 { return odif_no;	}
	public int		 getOd_no()		 { return od_no;	}
	public String	 getOd_kind()	 { return od_kind;	}
	public int		 getOd_member()	 { return od_member;}
	public int		 getPro_no()	 { return pro_no;	}
	public int		 getOd_quan()	 { return od_quan;	}
	public String	 getOption()	 { return option;	}
	public int		 getPoint()		 { return Point;	}
	public ArrayList<myfavinfoVO> getOptionlist() {		return optionlist;	}
	
	public void		 setOdif_no(	int		odif_no		) { this.odif_no	 = odif_no;		}
	public void		 setOd_no(		int		od_no		) { this.od_no		 = od_no;		}
	public void		 setOd_kind(	String	od_kind		) { this.od_kind	 = od_kind;		}
	public void		 setOd_member(	int		od_member	) { this.od_member	 = od_member;	}
	public void		 setPro_no(		int		pro_no		) { this.pro_no		 = pro_no;		}
	public void		 setOd_quan(	int		od_quan		) { this.od_quan	 = od_quan;		}
	public void		 setOption(		String	option		) { this.option		 = option;		}
	public void		 setOptionlist(	ArrayList<myfavinfoVO> optionlist) { this.optionlist = optionlist;	}
	
	public int sumPrice() {
		if(this.optionlist==null) return 0;
		
		int sum = this.Price;
		for(myfavinfoVO option : this.optionlist)
		{	
			sum += option.sumPrice();
		}
		return sum;
	}
	
}