/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import meta.dto.productsDTO;
import meta.vo.productsVO;

public class testMenuList
{
	public static void main(String[] args)
	{
		productsDTO	dto = new productsDTO();
		productsVO	pro = null;
		
		//메뉴 리스트 생성 / 예) 판매중인 상품의 중분류
		dto.GetMenuList();
		//상품 리스트 생성 / 예) 판매중인 상품 전체 리스트
		dto.GetProList();
		
		//메뉴 리스트 갯수 산출
		int MAX = dto.GetTotal("menu");
		System.out.println("메뉴 리스트 갯수 : " + MAX);
		//메뉴 리스트 출력
		for(int i = 0 ; i < MAX ; i++ )
		{
			pro = dto.GetMenuItem(i);
			pro.getInfo("menu");
			System.out.println("==========================================================");
		}

		//상품 리스트 갯수 산출
		MAX = dto.GetTotal("pro");
		System.out.println("상품 리스트 갯수 : " + MAX);
		//상품 리스트 출력
		for(int i = 0 ; i < MAX ; i++ )
		{
			pro = dto.GetProItem(i);
			pro.getInfo("pro");
			System.out.println("==========================================================");
		}
	}

}
