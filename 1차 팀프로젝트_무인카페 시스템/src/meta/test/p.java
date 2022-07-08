/******************************************************************************
* 수정자 : 함경환
* 수정일 : 2022-05-25 오후 03:56
******************************************************************************/
package meta.test;

import javax.servlet.http.HttpServletRequest;

public class p
{
	public static String _P(HttpServletRequest request, String group, String ID)
	{
		String result = request.getParameter(group + "_" + ID);
		return  result;
	}
}
