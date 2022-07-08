package meta.vo;

public class replyVO
{
	private	int		re_no;		//응답번호(PK)
	private	int		sur_no;		//설문번호(PK)
	private	int		u_no;		//회원번호(PK)
	private	String	re_note;	//응답내용(FK)

	public	int		getRe_no()	 { return re_no;	}
	public	int		getSur_no()	 { return sur_no;	}
	public	int		getU_no()	 { return u_no;		}
	public	String	getRe_note() { return re_note;	}

	public	void	setRe_no(	int		re_no	) { this.re_no	 = re_no;	}
	public	void	setSur_no(	int		sur_no	) { this.sur_no	 = sur_no;	}
	public	void	setU_no(	int		u_no	) { this.u_no	 = u_no;	}
	public	void	setRe_note(	String	re_note	) { this.re_note = re_note;	}
}
