package meta.vo;

public class productVO {

	//기본 정보
	private	int		div_no;			//세부상품번호(PK)
	private	String	cat_no;			//카테고리번호(PK)
	private String 	cat_name;		//카테고리명
	private	int		def_no;			//기본상품번호(PK)
	private	String	def_hname;		//상품명(한글)
	private	String	def_ename;		//상품명(영문)
	private	String	div_name;		//세부상품명

	//상품 설명
	private	String	def_info;		//상품설명

	//영양 정보
	private	int		nutri_no;		//영양정보번호(PK)
	private	String	nutri_name;		//영양성분명
	private	int		nutri_quan;		//영양성분수량
	private	String	nutri_unit;		//단위

	//상품 이미지
	private	imageVO[]	images;		//상품 이미지 객체 배열
/*
	private	int		pro_imgno;		//상품이미지번호(PK)
	private	String	pro_lname;		//논리파일명
	private	String	pro_pname;		//물리파일명
*/

	//상품 판매 정보
	private	int		volume;			//용량
	private	String	unit;			//단위
	private	int		uprice;			//단가
	private	int		pro_price;		//판매가
	private int 	pro_no;			//매장상품번호
	private String	pro_sell;		//판매여부
	private String	pro_recom;		//추천여부

	private	int		def_rcpv;		//레시피개수

	private	recipeVO[]	recipes;	//레시피들
/*
	private	int		rec_no;		//기본레시피번호(PK)
	private	int		def_no;		//기본상품번호(FK)
	private	String	cat_no;		//카테고리번호(FK)
	private	int		div_no;		//세부상품번호(FK)
	private	rawVO	raw;		//기본본재료객체

	private	int		raw_no;		//기본재료번호(PK)
	private	String	raw_name;	//재료이름
	private	String	unit;		//단위

	private	int		rcp_quan;	//수량
*/
	//변경된 pro_product table vo 
	/*=============================================*/
	private String name;
	private String hname;
	private String ename;
	private String cat;
	private String info;
	private String price;
	private String acc;
	private String flag_recom;
	private String flag_sell;
	private String flag_rec;

	public void setName(	String	 name		) { this.name		= name; 	 }
	public void setHname(	String	 hname		) { this.hname		= hname; 	 }
	public void setEname(	String	 ename		) { this.ename		= ename; 	 }
	public void setCat(		String	 cat		) { this.cat		= cat; 		 }
	public void setInfo(	String	 info		) { this.info		= info; 	 }
	public void setPrice(	String	 price		) { this.price		= price; 	 }
	public void setAcc(		String	 acc		) { this.acc		= acc; 		 }
	public void setFlag_recom(String flag_recom	) { this.flag_recom	= flag_recom;}
	public void setFlag_sell(String	 flag_sell	) { this.flag_sell	= flag_sell; }
	public void setFlag_rec(String	 flag_rec	) { this.flag_rec	= flag_rec;  }
	public String getName()		 { return name; 		}
	public String getHname()	 { return hname;		}
	public String getEname()	 { return ename;		}
	public String getCat()		 { return cat;			}
	public String getInfo()		 { return info;			}
	public String getPrice()	 { return price;		}
	public String getAcc()		 { return acc;			}
	public String getFlag_recom(){ return flag_recom;	}
	public String getFlag_sell() { return flag_sell;	}
	public String getFlag_rec()	 { return flag_rec;		}
	

	public	int		getDiv_no()		{ return div_no;	}
	public	String	getCat_no()		{ return cat_no;	}
	public	String	getCat_name()	{ return cat_name;	}
	public	int		getDef_no()		{ return def_no;	}
	public	String	getDef_hname()	{ return def_hname;	}
	public	String	getDef_ename()	{ return def_ename;	}
	public	String	getDiv_name()	{ return div_name;	}
	public	String	getDef_info()	{ return def_info;	}
	public	int		getNutri_no()	{ return nutri_no;	}
	public	String	getNutri_name()	{ return nutri_name;}
	public	int		getNutri_quan()	{ return nutri_quan;}
	public	String	getNutri_unit()	{ return nutri_unit;}
	public	int		getVolume()		{ return volume;	}
	public	String	getUnit()		{ return unit;		}
	public	int		getUprice()		{ return uprice;	}
	public	int		getPro_price()	{ return pro_price;	}
	public	int		getDef_rcpv()	{ return def_rcpv;	}
	public	int		getPro_no()		{ return pro_no;	}
	public	String	getPro_sell()	{ return pro_sell;	}
	public	String	getPro_recom()	{ return pro_recom;	}

	public	void	setDiv_no(		int		div_no		) { this.div_no 	= div_no;		}
	public	void	setCat_no(		String	cat_no		) { this.cat_no 	= cat_no;		}
	public	void	setCat_name(	String	cat_name	) { this.cat_name 	= cat_name;		}
	public	void	setDef_no(		int		def_no		) { this.def_no 	= def_no;		}
	public	void	setDef_hname(	String	def_hname	) { this.def_hname 	= def_hname;	}
	public	void	setDef_ename(	String	def_ename	) { this.def_ename 	= def_ename;	}
	public	void	setDiv_name(	String	div_name	) { this.div_name 	= div_name;		}
	public	void	setDef_info(	String	def_info	) { this.def_info 	= def_info;		}
	public	void	setNutri_no(	int		nutri_no	) { this.nutri_no 	= nutri_no;		}
	public	void	setNutri_name(	String	nutri_name	) { this.nutri_name = nutri_name;	}
	public	void	setNutri_quan(	int		nutri_quan	) { this.nutri_quan = nutri_quan;	}
	public	void	setNutri_unit(	String	nutri_unit	) { this.nutri_unit = nutri_unit;	}
	public	void	setVolume(		int		volume		) { this.volume 	= volume;		}
	public	void	setUnit(		String	unit		) { this.unit 		= unit;			}
	public	void	setUprice(		int		uprice		) { this.uprice 	= uprice;		}
	public	void	setPro_price(	int		pro_price	) { this.pro_price  = pro_price;	}
	public	void	setDef_rcpv(	int		def_rcpv	) { this.def_rcpv 	= def_rcpv;		}
	public	void	setPro_no(		int		pro_no		) { this.pro_no 	= pro_no;		}
	public	void	setPro_sell(	String	pro_sell	) { this.pro_sell 	= pro_sell;		}
	public	void	setPro_recom(	String	pro_recom	) { this.pro_recom 	= pro_recom;	}

	public	imageVO[]  getImages()	{ return images;	}
	public	recipeVO[] getRecipes() { return recipes;	}

	public	void	setImages(		imageVO[] images	) {	this.images 	= images;		}
	public	void	setRecipes(		recipeVO[] recipes	) {	this.recipes 	= recipes;		}
}
