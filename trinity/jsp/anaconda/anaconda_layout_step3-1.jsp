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
<script language="javascript">
var is2Click = false;
var row_start = 0;
var row_end = 0;
var col_start = 0;
var col_end = 0;
function fnDragStart(row,col)
{
	if(is2Click == false)
	{
		
		var object = document.getElementById('div_col_'+row+'_'+col);
		object.style.background = 'yellow';
		row_start = parseInt(row);
		col_start = parseInt(col);
		alert('병합할 다음 셀을 선택해 주세요');
		is2Click = true;
	}
	else
	{
		row_end = parseInt(row);
		col_end = parseInt(col);
		var div_row_start = Math.min(row_start,row_end);
		var div_row_end = Math.max(row_start,row_end);
		var div_col_start = Math.min(col_start,col_end);
		var div_col_end = Math.max(col_start,col_end);
		
		is2Click =  false;
		for(var i = 0; i <= div_row_end-div_row_start ; i++)
		{
			for(var j = 0; j <= div_col_end - div_col_start; j++)
			{
				var iRow = div_row_start+i;
				var iCol = div_col_start + j;
				// alert('div_col_'+(iRow)+'_'+(iCol));
				var object = document.getElementById('div_col_'+(iRow)+'_'+(iCol));
				object.style.background = 'blue';
			}
		}

		var objform = document.getElementById("frmLayout");
		var elm_row_start = createElement("input","row_start","hidden");
		var elm_row_span = createElement("input","row_span","hidden");
		var elm_col_start = createElement("input","col_start","hidden");
		var elm_col_span = createElement("input","col_span","hidden");
		objform.appendChild(elm_row_start);
		objform.appendChild(elm_row_span);
		objform.appendChild(elm_col_start);
		objform.appendChild(elm_col_span);
		
		with(frmLayout)
		{
			row_start.value = div_row_start;
			row_span.value = div_row_end - div_row_start + 1;
			col_start.value = div_col_start;
			col_span.value = div_col_end - div_col_start + 1;
		}
		//alert(frmLayout.col_span.value);
	}
}
function createElement (tagName, name, type)
{
	  var newEle;
	  try {
	    if (type) newEle = document.createElement("<" + tagName + " name='" + name + "' type='" + type + "'>");
	    else newEle = document.createElement("<" + tagName + " name='" + name + "'>");
	  } 
	  catch (e) {
	    newEle = document.createElement("<" + tagName + ">");
	    newEle.setAttribute("name", name);
	    if (type) newEle.setAttribute("type", type);
	  }
	  return newEle;
}
function fnSaveStep2()
{
	with(frmLayout)
	{
		AnacondaSubmit(document.frmLayout);
	}
}
</script>
<p>
		<h1><img src="/jsp/anaconda/img/layout.png" ></img> &nbsp;&nbsp;레이아웃 생성 Step 3(Div 기반)</h1>
</p>
<div id ="div_layout">
	<%
		int intRow = Integer.parseInt(strRow);
		int intCol = Integer.parseInt(strCol);
		for(int i  = 0; i < intRow ; i++)
		{
			if(intLayoutSpanCount != 0)
			{
				if(intLayoutSpanCount == 1)
				{
					if(isDivRowStartTag(i,intRowStart,intRowSpan))
					{
	%>

						<div id="div_row_<%=i %>">
	<%
					}
				}
				else
				{
					for(int k=0; k < arrRowStart.length; k++)
					{
						if(isDivRowStartTag(i,Integer.parseInt(arrRowStart[k]),Integer.parseInt(arrRowSpan[k])))
						{
	%>
							<div id="div_row_<%=i %>">
	<%
						}					
					}				
				}
			}
			else
			{
	%>
				<div id="div_row_<%=i %>">
	<%
			}
			int intWidth = 0;  
			for(int j = 0 ; j < intCol ; j++)
			{
				intWidth = 95/intCol;
				int Color = j % 10;
				String strColor = "0" + Color;
				if(intLayoutSpanCount != 0 && isDivRowSpanning(i,intRowStart,intRowSpan))
				{
					if(intLayoutSpanCount == 1)
					{
						if((i == intRowStart ) && isDivRowStartTag(j,intColStart,intColSpan))
						{
							intWidth = intWidth * intColSpan;
		%>
							<div id="div_col_<%=i%>_<%=j %>" style="border: 3px double #E5E5E5;background:FF00<%=strColor %>;float: left;width:<%=intWidth%>%;" onclick="javascript:fnDragStart('<%=i%>','<%=j %>');">
								(<%=i %>,<%=j %>)
		<%
						}
						if((i == (intRowStart + intRowSpan -1) ) && isDivRowEndTag(j, intColStart,intColSpan))
						{
							out.println("</div>");
						}
					}
					else
					{
						for(int kk=0; kk < arrColStart.length; kk++)
						{
							if((i == intRowStart ) && isDivRowStartTag(j,Integer.parseInt(arrColStart[kk]),Integer.parseInt(arrColSpan[kk])))
							{
								intWidth = intWidth * intColSpan;
		%>
							<div id="div_col_<%=i%>_<%=j %>" style="border: 3px double #E5E5E5;background:FF00<%=strColor %>;float: left;width:<%=intWidth%>%;" onclick="javascript:fnDragStart('<%=i%>','<%=j %>');">
								(<%=i %>,<%=j %>)
		<%
							}
							if((i == (intRowStart + intRowSpan -1) ) && isDivRowEndTag(j, Integer.parseInt(arrColStart[kk]),Integer.parseInt(arrColSpan[kk])))
							{
								out.println("</div>");
							}	
						}				
					}
				}
				else
				{
		%>
					<div id="div_col_<%=i%>_<%=j %>" style="border: 3px double #E5E5E5;background:FF00<%=strColor %>;float: left;width:<%=intWidth%>%;" onclick="javascript:fnDragStart('<%=i%>','<%=j %>');">
						(<%=i %>,<%=j %>)
		<%
					out.println("</div>");
				}
			}
			%>
			<%
			if(intLayoutSpanCount != 0)
			{
				if(intLayoutSpanCount == 1)
				{
					if(isDivRowEndTag(i, intRowStart,intRowSpan))
					{
						out.println("</div>");
					}
				}
				else
				{
					for(int k=0; k < arrRowStart.length; k++)
					{
						if(isDivRowEndTag(i, Integer.parseInt(arrRowStart[k]),Integer.parseInt(arrRowSpan[k])))
						{
							out.println("</div>");
						}					
					}				
				}
			}
			else
			{
				out.println("</div>");
			}		
			%>
	<%
		}
	%>
</div>
<p></p>
<p></p>
<p></p>
<form name="frmLayout" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_104529980561288665280982"></input>
<input type="hidden" name="layout_name" value="<%=strLayoutName %>"></input>
<input type="hidden" name="layout_row" value="<%=strRow %>"></input>
<input type="hidden" name="layout_col" value="<%=strCol %>"></input>
<table class="table_hydra" cellspacing="1" cellpadding="1">
		<caption>등록</caption>
		<colgroup>
		<col width="30%">
		<col>
		</colgroup>
		<thead>
		<tr>
		<th scope="col">이름</th>
		<th scope="col">값</th>
		</tr>
		</thead>
		<tbody>
		<tr>
			<td>레이아웃 이름</td>
			<td><%=strLayoutName %></input></td>
		</tr>
		<tr>
			<td>레이아웃 행 갯수</td>
			<td><%=strRow %></input></td>
		</tr>
		<tr>
			<td>레이아웃 열 갯수</td>
			<td><%=strCol %></input></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" class="button white" value="저장" onClick="javascript:fnSaveStep2();"></input></td>
		</tr>
		</tbody>
</table>
</form>
<!----------------------------------------- 리스트 보여주는 테이블 끝----------------------------------------->
<p></p>

