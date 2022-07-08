package meta.vo;

public class store {

	private	int		st_no;		//매장번호(PK)
	private	String	st_name;	//매장이름
	private	String	st_adr;		//매장주소
	private	String	st_state;	//주소-도
	private	String	st_city;	//주소-시/군
	private	String	st_open;	//오픈타임
	private	String	st_close;	//폐점타임
	private	String	st_off;		//쉬는요일
	private	String	st_holy;	//정기휴일

	public	int		getSt_no()		{ return st_no;		}
	public	String	getSt_name()	{ return st_name;	}
	public	String	getSt_adr()		{ return st_adr;	}
	public	String	getSt_state()	{ return st_state;	}
	public	String	getSt_city()	{ return st_city;	}
	public	String	getSt_open()	{ return st_open;	}
	public	String	getSt_close()	{ return st_close;	}
	public	String	getSt_off()		{ return st_off;	}
	public	String	getSt_holy()	{ return st_holy;	}

	public	void	setSt_no(	int		st_no	) { this.st_no	  = st_no;		}
	public	void	setSt_name(	String	st_name	) { this.st_name  = st_name;	}
	public	void	setSt_adr(	String	st_adr	) { this.st_adr	  = st_adr;		}
	public	void	setSt_state(String	st_state) { this.st_state = st_state;	}
	public	void	setSt_city(	String	st_city	) { this.st_city  = st_city;	}
	public	void	setSt_open(	String	st_open	) { this.st_open  = st_open;	}
	public	void	setSt_close(String	st_close) { this.st_close = st_close;	}
	public	void	setSt_off(	String	st_off	) { this.st_off	  = st_off;		}
	public	void	setSt_holy(	String	st_holy	) { this.st_holy  = st_holy;	}
}
