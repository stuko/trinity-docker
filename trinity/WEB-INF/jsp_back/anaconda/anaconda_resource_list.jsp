<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="com.stuko.anaconda.mediator.*"%><%

%>
<script language="javascript">
function saveRES()
{
   if(confirm("저장할까요?")){

	with(frmRES)
	{
		if(res_name.value == '' || res_value.value == '')
		{
			alert("리소스 이름을 입력해 주세요");
			return;
		}
		code.value = "create";
	}
        ajaxConda('frmRES',null,false,()=>{
            document.location.reload();
        });
    }
}
function updateRES()
{
   if(confirm("수정할까요?")){
	with(frmRES)
	{
		if(res_name.value == '' || res_value.value == '')
		{
			alert("리소스 이름을 입력해 주세요.");
			return;
		}
		code.value = "update";
		// callAjaxByForm("update", "frmRES");
	}
        ajaxConda('frmRES',null,false,()=>{
              document.location.reload();
        });
   }
}
function removeRES()
{
   if(confirm("삭제할까요?")){
	with(frmRES)
	{
		if(res_key.value == '' || res_value.value == '')
		{
			alert("리소스 이름을 입력해 주세요.");
			return;
		}
		code.value = "remove";
		// callAjaxByForm("remove", "frmRES");
	}
        ajaxConda('frmRES',null,false,()=>{
              document.location.reload();
        });
   }
}
function setData(key,type,nm,value)
{
	with(frmRES)
	{
		res_name.value = nm;
		res_value.value = value;
		res_key.value = key;
		setSelectBox("res_type", type)
	}
}
function doRuning(action)
{
}

function doRun(action,REQ)
{
        alert(REQ);
	var object = parseAnacondaAJAX(REQ.responseXML);
	if(action == "create")
	{
		alert("정상적으로 반영되었습닏.");
		document.location.reload();	
	}
	else if(action == "remove" || action == "res_extend_remove")
	{
		alert("삭제되었습니다.");
		document.location.reload();
	}
	else if(action == "update")
	{
		alert("정상적으로 반영되었습니다.");
		//document.location.reload();
		document.location.reload();
	}
	else if(action == "get_res_extend")
	{
		
		if(object == null)
		{
			alert("ERROR");
			return;
		}
		var tBody = _("tBodyRESExtendPlus");
		removeAllChildNodesById("tBodyRESExtendPlus");

		for(var i = 0; i < object.response.length; i++)
		{
			for(var j = 0; j < object.response_keys.length; j++)
			{
				var ui = object.response[i];
				var tr = createElement("tr","","");
				var id = _rand();
				tr.setAttribute("id",id);

				if(object.response_keys[j] == "res_style")
				{
					var objStyle = _("res_style");
					objStyle.value = object.response[i].res_style;
				}
				else if(object.response_keys[j] == "res_class")
				{
					var objClass = _("res_class");
					objClass.value = object.response[i].res_class;
				}
				else if(object.response_keys[j] == "type"
						|| object.response_keys[j] == "value_type"
						|| object.response_keys[j] == "name"
						|| object.response_keys[j] == "value"
						)
				{
				}
				else
				{
					var td1 = createElement("td","","");
					var td2 = createElement("td","","");
					tr.appendChild(td1);
					tr.appendChild(td2);
					var input1 = createElementWithStyle ("input","res_area_name_" + i + "_" + j,"text" ,"styled" , "");
					var input2 = createElementWithStyle ("input","res_area_value_" + i + "_" + j,"text" ,"styled" , "");
					td1.appendChild(input1);
					td2.appendChild(input2);
					input1.setAttribute("size","25");
					input2.setAttribute("size","30");
					input1.value = object.response_keys[j];
					input2.value = object.response[i][object.response_keys[j]];

					if(true)
					{
						var td3 = createElement("td","","");
						var input3 = createElementWithStyle ("input","save","button" ,"button" , "");
						var input4 = createElementWithStyle ("input","save","button" ,"button" , "");

						td3.appendChild(input3);
						td3.appendChild(input4);

						input3.setAttribute("value","Save");

						input3.onclick= function() {
							if(input1.value == '' || input2.value == '')
							{
								alert("Enter a area name");
								return;
							}
							var isOK = confirm("Really save?");
							if(isOK)
							{
								with(frmRES)
								{
									code.value = "res_extend_save";
									res_area_name.value = input1.value;
									res_area_value.value = input2.value;
									callAjaxByForm("res_extend_save", "frmRES");
								}
							}
						}
		
						input4.setAttribute("value","삭제하기");
						input4.onclick= function() {
			
							if(input1.value == '' || input2.value == '')
							{
								alert("Really delete a line? You have to enter a path");
								var objTr = _(id);
								tBody.removeChild(objTr);
								return;
							}			
							var isOK = confirm("Really delete?");
							if(isOK)
							{
								with(frmRES)
								{
									code.value = "res_extend_remove";
									res_area_name.value = input1.value; 
									res_area_value.value = input2.value;
									callAjaxByForm("res_extend_remove", "frmRES");
								}
							}
						}
					}
					tr.appendChild(td3);
					tBody.appendChild(tr);
				}
			}
		}

		var objDiv = _('div_res_extend');
		objDiv.style.display = 'block';
		objDiv = _('div_res_basic');
		objDiv.style.display = 'block';

	}
	else
	{
		alert("정상적으로 반영되었습니다.");
		//document.location.reload();	
	}
		
	

}

function fnAddRow()
{
	var tBody = _("tBodyRESExtendPlus");
	var tr = createElement("tr","","");
	var id = _rand();
	tr.setAttribute("id",id);
	var td1 = createElement("td","","");
	var td2 = createElement("td","","");
	tr.appendChild(td1);
	tr.appendChild(td2);
	var input1 = createElementWithStyle ("input","res_area_name_new_","text" ,"styled" , "");
	var input2 = createElementWithStyle ("input","res_area_value_new_","text" ,"styled" , "");
	td1.appendChild(input1);
	td2.appendChild(input2);
	input1.setAttribute("size","25");
	input2.setAttribute("size","30");
	var td3 = createElement("td","","");
	var input3 = createElementWithStyle ("input","save","button" ,"button" , "");
	var input4 = createElementWithStyle ("input","save","button" ,"button" , "");

	td3.appendChild(input3);
	td3.appendChild(input4);

	input3.setAttribute("value","저장하기");

	input3.onclick= function() {
		if(input1.value == '' || input2.value == '')
		{
			alert("Please enter a area name");
			return;
		}
		var isOK = confirm("Really save?");
		if(isOK)
		{
			with(frmRES)
			{
				code.value = "res_extend_save";
				res_area_name.value = input1.value;
				res_area_value.value = input2.value;
				callAjaxByForm("res_extend_save", "frmRES");
			}
		}
	}
		
	input4.setAttribute("value","삭제하기");
	input4.onclick= function() {
		if(input1.value == '' || input2.value == '')
		{
			alert("입력값을 확인해 주세요");
			var objTr = _(id);
			tBody.removeChild(objTr);
			return;
		}			
		var isOK = confirm("삭제할까요?");
		if(isOK)
		{
			with(frmRES)
			{
				code.value = "res_extend_remove";
				res_area_name.value = input1.value; 
				res_area_value.value = input2.value;
				callAjaxByForm("res_extend_remove", "frmRES");
			}
		}
	}
	tr.appendChild(td3);
	tBody.appendChild(tr);
}

function fnViewResource()
{
	if(frmRES.res_key.value == '') 
	{
		alert("리소스를 선택하시후 진행해 주세요.");
		return;
	}
	//window.open("/Anaconda.do?CMD=CMD_SEQ_101582176311304213846005&title=Resource&res_key=" + frmRES.res_key.value,"","height=500,width=900,left=200,top=20,status=no, location=no, toolbar=no,resizable=yes,scrollbars=yes");
	document.location.href = "/Anaconda.do?CMD=CMD_SEQ_101582176311304213846005&title=Resource&res_key=" + frmRES.res_key.value;
}
</script>
<script language="javascript">
function fn_select_jndi(select_object_index)
{
	with(frmRES)
	{
		if(res_value != null)  res_value.value=select_jndi[select_object_index].value;
	}
}
</script>
<form name="frmRES" id="frmRES" method="post" action="/Anaconda.do">
<input type="hidden" name="CMD" value="CMD_SEQ_100615207491289267339048"></input>
<input id="res_key" type="hidden" name="res_key"></input>
<input type="hidden" name="code"></input>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">데이터베이스 리소스 관리</h3>
			<span class="fr">( JNDI List : 
		<select name="select_jndi" id="select_jndi" onChange="javascript:fn_select_jndi(this.selectedIndex);">
        <%
			Object[] jndis = ServiceLocator.getInstance().getJndis("java:comp/env");
		    for(int idx_jndis = 0; idx_jndis < jndis.length; idx_jndis++)
		   {
		%>
		   <option name="<%=jndis[idx_jndis]+""%>" value="<%=jndis[idx_jndis]+""%>"><%=jndis[idx_jndis]+""%></option>
		<%
           }
		%>
		</select>)</span>
			</div>
		</div>
	</div>
</div>


		

		<table class="table_hydra" cellspacing="1" cellpadding="1">
		<colgroup>
		<col width="20%">
		<col width="20%">
		<col>
		</colgroup>
		<thead >
		<tr>
		<th scope="col">이름</th>
		<th scope="col">유형</th>
		<th scope="col">정보</th>
		</tr>
		</thead>
		<tbody id="tBodyRES">
		</tbody>
		<tr>
		<td><INPUT type="text" name="res_name" class="styled" size=20></input> </td>
		<td><select id="res_type" name="res_type" onChange="javascript:selectLayoutType('res_type',this.selectedIndex);"><option value="db">Database</option><option value="jndi">JNDI</option></select> </td>
		<td><INPUT type="text" name="res_value" class="styled" size=40></input>&nbsp;&nbsp;<button type="button" class="btn btn-primary" value="Got to the detail info." onClick="javascript:fnViewResource();">자세히보기</button></td>
		</tr>
		</table>


</form>

<div style="margin:10px">
<button type="button" class="btn btn-secondary" value="Create a resource" onClick="javascript:saveRES()">추가하기</button>&nbsp;
<button type="button" class="btn btn-info" value="Modify a resource" onClick="javascript:updateRES()">수정하기</button>&nbsp;
<button type="button" class="btn btn-danger" value="Delete a resource" onClick="javascript:removeRES()">삭제하기</button>&nbsp;
<button type="button" class="btn btn-warning" value="Back" onClick="javascript:history.back();">뒤로가기</button>
</div>

<div>
<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES); 
if(col != null)
{
	Iterator it = col.getDefaultXmlDatas();
	for(int i = 0;it.hasNext();i++)
	{
		DefaultXmlData dxd = (DefaultXmlData)it.next();
		String strDisp = dxd.getData("res_name");
		strDisp = strDisp.length() > 7 ? strDisp.substring(0,7) + "..." : strDisp;
		String img_name = "db";
		if(dxd.getData("res_type").equals("jndi")) img_name = "java";
%>
<div style="width:80px;float:left;margin:10px;"><a id="href_<%=dxd.getNAME()%>" href="javascript:fnNull();" onClick="javascript:setData('<%=dxd.getNAME() %>','<%=dxd.getData("res_type") %>','<%=dxd.getData("res_name") %>','<%=dxd.getData("res_value") %>');"><img src="/jsp/anaconda/img/<%=img_name %>.png" border="0" width="40px" ></img><%=strDisp %></a></div>
<%
	}
}
%>
<script language="javascript">
function selectLayoutType(objSelect, idx)
{
}
</script>
