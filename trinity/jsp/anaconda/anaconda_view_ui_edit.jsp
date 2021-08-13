<%@ page contentType="text/xml; charset=UTF-8" %>
<%@page pageEncoding="UTF-8" %>
<%@ page import="java.util.*"%>
<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.util.InitClass"%>

<%
DefaultXmlResource res = DefaultXmlResource.getInstance();
DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_UI);
%>
<script language="javascript">
	function fnMoveIn(){
		with(frmUI){
			if(ui_source.options.selectedIndex < 0){
				alert("UI 컴포넌트를 선택해 주세요");
				return;
			}
			for(var i = 0; i < ui_source.options.length; i++){
				if(ui_source.options[i].selected == true){
					var opt = new Option(ui_source.options[i].value,ui_source.options[i].value);
					ui_destination.options.add(opt);
				}
			}
		}
	}

	function fnMoveOut(){
		with(frmUI){
			if(ui_destination.options.selectedIndex < 0){
				alert("UI 컴포넌트를 선택해 주세요");
				return;
			}
			ui_destination.options[ui_destination.options.selectedIndex] = null;
		}
	}

	function fnSave(){
		with(frmUI){
			for(var i = 0; i < ui_destination.options.length; i++){
				if(i == 0) filelist.value = filelist.value + ui_destination.options[i].value;
				else filelist.value = filelist.value + "," + ui_destination.options[i].value;
			}
			code.value = "save_page";
			callAjaxByForm("save_page", "frmUI");
		}
	}

	function doRuning(action){
	}

	function doRun(action,REQ){
		alert("요청하신 내용이 성공적으로 반영되었습니다.");
		document.location.reload();	
	}

</script>

<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h2 class="fl">UI 컴포넌트 생성</h2>
			</div>
		</div>
	</div>
</div>

<div>
	<ul>
		<li>UI 컴포넌트를 선택하신후 Plus 버튼을 눌러 주세요.</li>
		<li>경로를 입력하신 후, 저장 버튼을 눌러 주세요.</li>
	</ul>
</div>


<div>
	<form name="frmUI" method="post" action="/Anaconda.do">
		<input type="hidden" name="CMD" value="CMD_SEQ_107412743841288767936876" />
		<input type="hidden" name="filelist" />
		<input type="hidden" name="code" />
		<table class="table_hydra">
			<colgroup>
				<col width="45%">
				<col width="10%">
				<col width="45%">
			</colgroup>
			<thead >
				<tr>
					<th scope="col">UI 목록</th>
					<th scope="col">기능</th>
					<th scope="col">대상 페이지</th>
				</tr>
			</thead>

			<tbody id="tBodyUI">
				<tr>
					<td>
						<select id="ui_source" name="ui_source" multiple class="styled" style="width:100%;height:300px;background:none;">
						<%
						Iterator it = col.iterator();
						for(;it.hasNext();){
							DefaultXmlData dxd = (DefaultXmlData)it.next();
						%>
							<option value="<%=dxd.getData("value") %>" ><%=dxd.getData("name") %>(<%=dxd.getData("value") %>)</option>
						<%	} %>
						</select>
					</td>
					<td align="center">
						<button type="button" class="btn btn-primary" value="Add >>" onClick="javascript:fnMoveIn();">Add >></button>
						<br/>
						<br/>
						<button type="button" class="btn btn-info" value="<< Delete"  onClick="javascript:fnMoveOut();"><< Delete</button>
					</td>
					<td>
						<select id="ui_destination" name="ui_destination" multiple class="styled" style="width:100%;height:300px;background:none;"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">Path : <input type="text" name="path" class="styled" />
						<button type="button" class="btn btn-primary" value="저장" onClick="javascript:fnSave();">Save</button>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
