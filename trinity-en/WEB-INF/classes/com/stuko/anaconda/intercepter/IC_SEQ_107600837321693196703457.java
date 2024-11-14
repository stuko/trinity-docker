package com.stuko.anaconda.intercepter;

import com.stuko.anaconda.Exception.ExceptionCenter;
import com.stuko.anaconda.business.BusinessData;
import com.stuko.anaconda.business.BusinessHelper;
import com.stuko.anaconda.intercepter.BusinessIntercepter;
import com.stuko.anaconda.intercepter.BusinessCollectionIntercepter;
import com.stuko.anaconda.intercepter.ActionIntercepter;
import com.stuko.anaconda.value.BlankField;
import com.stuko.anaconda.value.ReturnValue;


public class IC_SEQ_107600837321693196703457 extends BusinessIntercepter
{
	public ReturnValue invokeAfterMethod(BusinessData process, BusinessData businessData, ReturnValue masterReturnValue) throws Exception
	{
		BusinessData request = businessData;
		String FORWARD_PAGE = new String();
		ExceptionCenter.debug(businessData.getBusinessName() + " ==> Simple BusinessIntercepter Call After!!!");
		ReturnValue returnValue = new ReturnValue();
		try
		{
			BusinessData BusinessDataParameter = businessData;
			ReturnValue MasterReturnValue = masterReturnValue;
			ReturnValue LocalReturnValue = returnValue;
			IC_SEQ_107600837321693196703457 This = this;

			

			returnValue.mBRtn = true;
			returnValue.mORtn = "AOP result is true and Continue process";
		}
		catch(Exception e)
		{
			returnValue.mBRtn = false;
			returnValue.mDesc = "AfterMethod Exception";
			ExceptionCenter.debug("AfterMethod Exception");
		    ExceptionCenter.catchException(e);
		    throw new Exception(e);
		}



		return returnValue;
	}

	public ReturnValue invokeBeforeMethod(BusinessData process, BusinessData businessData, ReturnValue masterReturnValue) throws Exception
	{
		BusinessData request = businessData;
		String FORWARD_PAGE = new String();
		ExceptionCenter.debug(businessData.getBusinessName() + " ==> Simple BusinessIntercepter Call Before!!!");
		ReturnValue returnValue = new ReturnValue();
		try
		{
			BusinessData BusinessDataParameter = businessData;
			ReturnValue MasterReturnValue = masterReturnValue;
			ReturnValue LocalReturnValue = returnValue;
			IC_SEQ_107600837321693196703457 This = this;

			System.out.println("######################################");
System.out.println(request.getFieldValue("memberJndi"));
System.out.println("######################################");


			returnValue.mBRtn = true;
			returnValue.mORtn = "AOP result is true and Continue process";
		}
		catch(Exception e)
		{
			returnValue.mBRtn = false;
			returnValue.mDesc = "BeforeMethod Exception";
			ExceptionCenter.debug("BeforeMethod Exception");
		    ExceptionCenter.catchException(e);
		    throw new Exception(e);
		}



		return returnValue;
	}

	public void doProcessSkip(boolean isProcessSkip)
	{
		this.setProcessSkip(isProcessSkip);
	}
	public void doProcessExit(boolean isProcessExit)
	{
		this.setProcessExit(isProcessExit);
	}

}
