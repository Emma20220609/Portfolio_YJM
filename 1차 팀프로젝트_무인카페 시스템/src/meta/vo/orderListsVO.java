package meta.vo;

import java.sql.Date;

public class orderListsVO {
	private int		od_no;						//주문번호
	private int		st_no;						//매장번호
	private int		no;							//주문주체
	private Date	date;						//주문일시
	private String	kind;						//주문구분
	private int		total_price;				//총금액
	private int		total_point;				//발생포인트
	private Date	get_time;					//수령시간
	private String	pay_flag;					//결제완료여부

	public orderListsVO() {}
	public orderListsVO(
		int od_no,
		int st_no,
		int no,
		Date date,
		String kind,
		int total_price,
		int total_point,
		Date get_time,
		String pay_flag
		)
	{
		this.od_no		 = od_no;
		this.st_no		 = st_no;
		this.no			 = no;
		this.date		 = date;
		this.kind		 = kind;
		this.total_price = total_price;
		this.total_point = total_point;
		this.get_time	 = get_time;
		this.pay_flag	 = pay_flag;
	}

	public	int		 getOd_no()			{ return od_no;			}
	public	int		 getSt_no()			{ return st_no;			}
	public	int		 getNo()			{ return no;			}
	public	Date	 getDate()			{ return date;			}
	public	String	 getKind()			{ return kind;			}
	public	int		 getTotal_price()	{ return total_price;	}
	public	int		 getTotal_point()	{ return total_point;	}
	public	Date	 getGet_time()		{ return get_time;		}
	public	String	 getPay_flag()		{ return pay_flag;		}

	public	void	 setOd_no(		int		od_no		) { this.od_no		 = od_no;		}
	public	void	 setSt_no(		int		st_no		) { this.st_no		 = st_no;		}
	public	void	 setNo(			int		no			) { this.no			 = no;			}
	public	void	 setDate(		Date	date		) { this.date		 = date;		}
	public	void	 setKind(		String	kind		) { this.kind		 = kind;		}
	public	void	 setTotal_price(int		total_price	) { this.total_price = total_price;	}
	public	void	 setTotal_point(int		total_point	) { this.total_point = total_point;	}
	public	void	 setGet_time(	Date	get_time	) { this.get_time	 = get_time;	}
	public	void	 setPay_flag(	String	pay_flag	) { this.pay_flag	 = pay_flag;	}
}
