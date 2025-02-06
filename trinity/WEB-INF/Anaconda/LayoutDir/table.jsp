<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.net.*"%><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%>
<%
	DefaultXmlResource res = DefaultXmlResource.getInstance();
	String strLayoutName = request.getParameter(BlankField.ANACONDA_AREA_NAME);
	String strBody = request.getParameter(BlankField.ANACONDA_AREA_BODY);
	// Anaconda UI is Panel
	String strIsPanel = request.getParameter(BlankField.ANACONDA_AREA_ISPANEL); 
	
	DefaultXmlDataCollection col_area = res.getDefaultXmlDataCollection(BlankField.ANACONDA_AREA);
	DefaultXmlDataCollection col_ui = res.getDefaultXmlDataCollection(BlankField.ANACONDA_UI);
	DefaultXmlDataCollection col_layout = res.getDefaultXmlDataCollection(BlankField.ANACONDA_LAYOUT);
	
	DefaultXmlData dxd = null;
	String strContainerStyle = null;
	String strContainerClass = null;
	int row = 0;
	int col = 0;
	
	if("true".equals(strIsPanel))
	{
		// AnacondaUI
		dxd = col_ui.getDefaultXmlData(strLayoutName);	
		strContainerStyle = dxd.getData("ui_style");
		strContainerClass = dxd.getData("ui_class");
		row = Integer.parseInt(dxd.getData("panel_row"));
		col = Integer.parseInt(dxd.getData("panel_col"));
	}
	else
	{
		// Anaconda Layout
		dxd = col_layout.getDefaultXmlData(strLayoutName);	
		strContainerStyle = dxd.getData("style");
		strContainerClass = dxd.getData("class");
		row = Integer.parseInt(dxd.getData("row"));
		col = Integer.parseInt(dxd.getData("col"));
	}
	
	String strTitle = dxd.getData("title");
	String strJs = dxd.getData("js");
	String strCss = dxd.getData("css");

	strContainerStyle = BusinessHelper.checkBusinessNull(strContainerStyle) == false ? "" : strContainerStyle;
	strContainerClass = BusinessHelper.checkBusinessNull(strContainerClass) == false ? "" : strContainerClass;
	
	DefaultXmlDataCollection col_result = col_area.getDefaultXmlData("layout_name", dxd.getNAME());
	
	//out.println(col_result.toString());
	String	strAreaNameHeader = dxd.getNAME();
%>
<!--  ########################################################################################## -->
<!--  아나콘다 레이아웃 시작  -->
<!--  ########################################################################################## -->

<table id="<%=strAreaNameHeader%>_container" style="<%=strContainerStyle%>" class="<%=strContainerClass %>">
<%
	String strAreaKey  =  "";
	String strAreaName = "";
	String strPath = "";
	String strName = "";
	String strUIName = "";
	String strX = "";
	String strY = "";
	String strStyle = "";
	String strClass = "";
	String strColSpan = "";
	String strID = "";
	int intX = -1;
	int intY = -1;
	DefaultXmlData defaultXmlData = null;
	DefaultXmlData uiXmlData = null;
	for(int i = 0; i < row; i++)
	{
		int rowspan = row;
%>
<tr id="<%=strAreaNameHeader%>_row_<%=i %>" >
<%
		for(int j = 0; j < col ;j++)
		{
			int colspan = col;		
			strAreaKey = "";
			strAreaName = "";
			strPath = "";
			strName = "";
			strUIName = "";
			strColSpan = "";
			strID = "";
			uiXmlData = null;
			
			intX = -1;
			intY = -1;
			
			strX = "";
			strY = "";
			
			if(col_result != null && col_result.size() > 0)
			{
				DefaultXmlDataCollection searchCollection = col_result.getDefaultXmlData("x",""+i);
				if( searchCollection != null && searchCollection.size() > 0)
				{
					searchCollection = searchCollection.getDefaultXmlData("y",""+j);
					if(searchCollection != null && searchCollection.size() > 0)
					{
						defaultXmlData = (DefaultXmlData)searchCollection.get(0);
						strAreaKey = defaultXmlData.getNAME();
						strAreaName = defaultXmlData.getData("area_name");
						strUIName = defaultXmlData.getData("ui_name");
						strStyle = defaultXmlData.getData("area_style");
						strClass = defaultXmlData.getData("area_class");
						strColSpan = defaultXmlData.getData("area_colspan");
						strID = defaultXmlData.getData("area_id");
						if(!BusinessHelper.checkBusinessNull(strStyle)) strStyle = "";
						if(!BusinessHelper.checkBusinessNull(strClass)) strClass = "";
						
						if(defaultXmlData.getData("isbody") != null && defaultXmlData.getData("isbody").equals("true"))
						{
							strPath = strBody;
						}
						else
						{
							String use_anaconda_ui_yn = defaultXmlData.getData("use_anaconda_ui_yn");
							if("Y".equals(use_anaconda_ui_yn))
							{
								uiXmlData = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI).getDefaultXmlData(strUIName);
								if(uiXmlData != null)
								{
									strName = uiXmlData.getData("name");
									strPath = uiXmlData.getData("value");
								}
							}
							else
							{
								strPath = defaultXmlData.getData("value");
							}
						}			
						strX = defaultXmlData.getData("x");
						strY = defaultXmlData.getData("y");
						intX = Integer.parseInt(strX.trim());
						intY = Integer.parseInt(strY.trim());
					}
				}
			}
			//System.out.println("strX="+strX + "/" + i + "," + "strY=" + strY + "/" + j + ":" + strPath + " body is " + strBody);
			//System.out.println(intX + "/" + intY);
			
%>
				
				<% if(strX.equals(""+i) && strY.equals(""+j)) { %>
				<%
							String strAreaLayoutName = strLayoutName;
							String isPanel = "false";
							String strUiXmlName = "";
							if(uiXmlData != null)
							{
								if(uiXmlData.getData("value_type").equals("panel"))
								{
									strAreaLayoutName = uiXmlData.getNAME();
									isPanel = "true";
								}
								request.setAttribute(uiXmlData.getNAME(),uiXmlData);
								strUiXmlName = uiXmlData.getNAME();
							}
							
							if(BusinessHelper.checkBusinessNull(strPath))
							{
								if(BusinessHelper.checkBusinessNull(strColSpan))
								{
									strColSpan = "colspan='"+strColSpan+"'";
								}
								else
								{
									strColSpan = "";
								}
				%>
				<!--  ########################################################################################## -->
				<!--  아나콘다 레이아웃 영역 시작 -->
				<!--  ########################################################################################## -->
				<td  id="<%=strAreaNameHeader%>_section_<%=i %>_<%=j %>" style="<%=strStyle%>" class="<%=strClass %>"  <%=strColSpan %>>
					<div id="<%=strID %>" style="<%=strStyle%>" class="<%=strClass %>"  >
							<jsp:include page="<%=strPath%>" flush="true" >
								<jsp:param value="<%=strAreaLayoutName %>" name="anaconda.area.name"/>
								<jsp:param value="<%=strBody %>" name="anaconda.area.body"/>	
								<jsp:param value="<%=isPanel %>" name="anaconda.area.ispanel"/>	
								<jsp:param value="<%=strUiXmlName %>" name="anaconda.area.ui"/>	
							</jsp:include>
					</div>
				</td>
				<!--  ########################################################################################## -->
				<!--  아나콘다 레이아웃 영역 끝 -->
				<!--  ########################################################################################## -->
				<%
							}
				} 
				%>
			<%
		}
	%>
</tr>
<%
		
	}
%>
</table>
<!--  ########################################################################################## -->
<!--  아나콘다 레이아웃 끝  -->
<!--  ########################################################################################## -->
