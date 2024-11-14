<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="java.io.File"%>
<%@ page import="java.io.FileInputStream"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.Properties"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.Exception.XmlProcessingException"%>
<%@ page import="com.stuko.anaconda.action.WebAction"%>
<%@ page import="com.stuko.anaconda.action.WebActionCollection"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
private boolean isDivRowStartTag(int Row, int StartRow, int RowSpan)
{
	if(Row <= StartRow || Row > (StartRow + RowSpan -1))
		return true;
	else
		return false;
}

private boolean isDivRowEndTag(int Row, int StartRow, int RowSpan)
{
	if(Row < StartRow || Row >= (StartRow + RowSpan - 1))
		return true;
	else
		return false;
}

private boolean isDivRowSpanning(int i, int StartRow, int RowSpan)
{
	if(i >= StartRow && i <= (StartRow + RowSpan))
		return true;
	else
		return false;
}
%>

<%
	String strLayoutName = request.getParameter("layout_name");
	String strRow = request.getParameter("layout_row");
	String strCol = request.getParameter("layout_col");
	
	String strLayoutSpanCount = request.getParameter("layout_span_count");
	int intLayoutSpanCount = Integer.parseInt(strLayoutSpanCount);
	
	String[] arrRowStart = null;
	String[] arrRowSpan = null;
	String[] arrColStart = null;
	String[] arrColSpan = null;
	
	String strRowStart = "";
	String strRowSpan = "";
	String strColStart = "";
	String strColSpan = "";
	int intRowStart = 0;
	int intRowSpan = 0;
	int intColStart = 0;
	int intColSpan = 0;
	
	if(intLayoutSpanCount > 1)
	{
		arrRowStart = request.getParameterValues("row_start");
		arrRowSpan = request.getParameterValues("row_span");
		arrColStart = request.getParameterValues("col_start");
		arrColSpan = request.getParameterValues("col_span");
	}
	else
	{
		strRowStart = request.getParameter("row_start");
		strRowSpan = request.getParameter("row_span");
		strColStart = request.getParameter("col_start");
		strColSpan = request.getParameter("col_span");
		intRowStart = Integer.parseInt(strRowStart);
		intRowSpan = Integer.parseInt(strRowSpan);
		intColStart = Integer.parseInt(strColStart);
		intColSpan = Integer.parseInt(strColSpan);
	}
	
%>