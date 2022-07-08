/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import meta.dto.*;
import meta.vo.*;

public class cartTest
{
	public static void main(String[] args)
	{
		productsDTO	pDTO	= new productsDTO();
		productsVO	pVO		= null;

		String		sel		= null;
	
		//메뉴 리스트 생성
		pDTO.GetMenuList();
		//0번 메뉴 선택 (리스트의 index가 0인 상품) / 기본상품번호 1 = 아메리카노 
		pVO		= pDTO.GetMenuItem(0);

		//상품 리스트 생성
		sel		= pVO.hname();
		pDTO.GetProList(sel);
		//0번 상품 선택 (리스트의 index가 0인 상품) / 매장상품번호 2 = 아이스:톨
		pVO		= pDTO.GetProItem(0);

		//카트 DTO VO 생성
		cartVO		cVO		= new cartVO(pVO, 1, "샷", 1, 500, "시럽", 1, 0, "", 0 , 0);
		cartDTO		cDTO	= new cartDTO();
		cDTO.Insert(cVO);

//		cDTO.Delete("cartlist_no", 4);
	}

}
