/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import meta.dto.*;
import meta.vo.*;

public class storeTest
{
	public static void main(String[] args)
	{
		storeDTO dto = new storeDTO();
		storeVO vo = new storeVO();
		dto.StoreRead();
		System.out.println(dto.GetStoreTotal());
		vo = dto.GetStore(0);
		vo.info();
	}
}
