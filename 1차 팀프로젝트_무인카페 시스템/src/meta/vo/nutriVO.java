package meta.vo;

public class nutriVO {
	private	int		pro_no;			//매장상품번호
	private	String	def_hname;		//상품명(한글)
	private	String	nutri_name;		//영양성분명
	private	int		nutri_quan;		//영양성분수량
	private	String	nutri_unit;		//단위

	public nutriVO(
		int pro_no,					//매장상품번호
		String def_hname,			//상품명(한글)
		String nutri_name,			//영양성분명
		int nutri_quan,				//영양성분수량
		String nutri_unit)			//단위
	{
		this.pro_no(		pro_no		);
		this.def_hname(		def_hname	);
		this.nutri_name(	nutri_name	);
		this.nutri_quan(	nutri_quan	);
		this.nutri_unit(	nutri_unit	);
	}

	public nutriVO() {
	}

/**	@return	the pro_no		*/	public	int		pro_no()		{ return pro_no;	}	//매장상품번호
/**	@return	the def_hname	*/	public	String	def_hname()		{ return def_hname;	}	//상품명(한글)
/**	@return	the nutri_name	*/	public	String	nutri_name()	{ return nutri_name;}	//영양성분명
/**	@return	the nutri_quan	*/	public	int		nutri_quan()	{ return nutri_quan;}	//영양성분수량
/**	@return	the nutri_unit	*/	public	String	nutri_unit()	{ return nutri_unit;}	//단위

/**	@param	pro_no		the pro_no		to set	*/	public void pro_no(		int		pro_no		) { this.pro_no		= pro_no;		}	//매장상품번호
/**	@param	def_hname	the def_hname	to set	*/	public void def_hname(	String	def_hname	) { this.def_hname	= def_hname;	}	//상품명(한글)
/**	@param	nutri_name	the nutri_name	to set	*/	public void nutri_name(	String	nutri_name	) { this.nutri_name	= nutri_name;	}	//영양성분명
/**	@param	nutri_quan	the nutri_quan	to set	*/	public void nutri_quan(	int		nutri_quan	) { this.nutri_quan	= nutri_quan;	}	//영양성분수량
/**	@param	nutri_unit	the nutri_unit	to set	*/	public void nutri_unit(	String	nutri_unit	) { this.nutri_unit	= nutri_unit;	}	//단위
}