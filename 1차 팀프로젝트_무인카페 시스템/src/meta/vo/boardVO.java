package meta.vo;

import java.util.ArrayList;

public class boardVO
{
	private	int		board_no;		//게시글번호(PK)
	private	int		no;				//일련번호
	private	String	board_date;		//작성일
	private	String	board_kind;		//게시글구분
	private	String	board_title;	//제목
	private	String	board_note;		//내용
	private	int		board_hit;		//조회수

	private	surveyVO[]	surveys;	//설문 객체 배열
	/*
	private int		sur_no;			//설문번호(PK)
	private String	sur_question;	//질문
	private int		board_no;		//게시글번호(FK)
	private int		ad_no;			//직원번호(FK)
	*/

	private replyVO[] replys;		//응답 배열
	/*
	private int		re_no;			//응답번호(PK)
	private int		sur_no;			//설문번호(PK)
	private int		u_no;			//회원번호(PK)
	private String	re_note;		//응답내용(FK)
	*/

	private	ArrayList<attachVO> attachs;		//첨부파일 리스트
/*	attach
	private	int		file_no;		//첨부파일번호
	private	int		board_no;		//게시글번호
	private	int		ad_no;			//직원번호
	
	private	String	pro_lname;		//논리파일명
	private	String	pro_pnameL;		//물리파일명 */


	public	int		getBoard_no()	 { return board_no;		}

	public	int		getno()			 { return no;		}
	public	String	getBoard_date()	 { return board_date;	}
	public	String	getBoard_kind()	 { return board_kind;	}
	public	String	getBoard_title() { return board_title;	}
	public	String	getBoard_note()	 { return board_note;	}
	public	int		getBoard_hit()	 { return board_hit;	}

	public	void	setBoard_no(	int		board_no	) { this.board_no	 = board_no;	}
	public	void	setno(			int		no			) { this.no			 = no;			}
	public	void	setBoard_date(	String	board_date	) { this.board_date	 = board_date;	}
	public	void	setBoard_kind(	String	board_kind	) { this.board_kind	 = board_kind;	}
	public	void	setBoard_title(	String	board_title	) { this.board_title = board_title;	}
	public	void	setBoard_note(	String	board_note	) { this.board_note	 = board_note;	}
	public	void	setBoard_hit(	int		board_hit	) { this.board_hit	 = board_hit;	}

	public	surveyVO[]			getSurveys() { return surveys;	}
	public	replyVO[]			getReplys()	 { return replys;	}
	public	ArrayList<attachVO>	getAttachs() { return attachs;	}

	public	void	setSurveys(	surveyVO[]			surveys) { this.surveys	= surveys;	}
	public	void	setReplys(	replyVO[]			replys)	 { this.replys	= replys;	}
	public	void	setAttachs(	ArrayList<attachVO>	attachs) { this.attachs	= attachs;	}

	public	String	checkForSql(String str) { return str.replace("'","''"); }
}
