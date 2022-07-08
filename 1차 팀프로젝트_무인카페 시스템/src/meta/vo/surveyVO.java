package meta.vo;

public class surveyVO
{
	private int		sur_no;			//설문번호(PK)
	private String	sur_question;	//질문
	private int		board_no;		//게시글번호(FK)
	private int		ad_no;			//직원번호(FK)

	private replyVO[] replys;		//응답 배열
	/*
	private int		re_no;		//응답번호(PK)
	private int		sur_no;		//설문번호(PK)
	private int		u_no;		//회원번호(PK)
	private String	re_note;	//응답내용(FK)
	*/

	public	int		getSur_no()			{ return sur_no;		}
	public	String	getSur_question()	{ return sur_question;	}
	public	int		getBoard_no()		{ return board_no;		}
	public	int		getAd_no()			{ return ad_no;			}

	public	void	setSur_no(		int		sur_no		) { this.sur_no			= sur_no;		}
	public	void	setSur_question(String	sur_question) { this.sur_question	= sur_question;	}
	public	void	setBoard_no(	int		board_no	) { this.board_no		= board_no;		}
	public	void	setAd_no(		int		ad_no		) { this.ad_no			= ad_no;		}

	public	replyVO[]	getReplys()			{ return replys;		}

	public	void	setReplys(		replyVO[]	replys		) { this.replys			= replys;		}
}
