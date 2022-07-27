<%@ page import="com.stuko.anaconda.value.BlankField" %>
<%@ page import="com.stuko.anaconda.front.*" %>
<%@ page import="com.stuko.anaconda.value.*" %>
<%@ page import="com.stuko.anaconda.action.*" %>
<%@ page import="com.stuko.anaconda.view.*" %>
<%@ page import="com.stuko.anaconda.XmlConfig.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.stuko.anaconda.business.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%!
public String getBusinessTree(BusinessTree bt)
{
	StringBuffer sb = new StringBuffer();
	Iterator it = bt.iterator();
	sb.append("<table cellspacing='0' cellpadding='0' style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");

	for(int i = 0;it.hasNext();i++)
	{
		BusinessTree businessTree = (BusinessTree)it.next();
		String strKey = BusinessHelper.getKey("DIV_");
		sb.append("<tr  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
		
		if(bt.getDepth() == 1)
		{
			sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
		}
		else
		{
			if(i == 0)
			{
				// 처음
				if(bt.size() == 1)
				{
					sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
					sb.append("<img src='/jsp/anaconda/img/tree-leaf-start-no.gif'>");
				}
				else
				{
					sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;background: url(/jsp/anaconda/img/tree-branch.gif) repeat-y;' align='left' valign='top'>");
					sb.append("<img src='/jsp/anaconda/img/tree-leaf-start.gif'>");
				}
			}
			else if(i == (bt.size()-1))
			{
				// 마지막
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;' align='left' valign='top'>");
				sb.append("<img src='/jsp/anaconda/img/tree-leaf-end.gif'>");
			}
			else
			{
				// 중간
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;width:18px;background: url(/jsp/anaconda/img/tree-branch.gif) repeat-y;' align='left' valign='top'>");
				sb.append("<img src='/jsp/anaconda/img/tree-leaf.gif'>");
			}
		}
		sb.append("</td>");
		sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
		sb.append("<div style='background:#FFFFCC;width:280px;font:none 12px 돋움체,Arial , Sanserif;color:#333333;margin:2px 0 2px 0;padding:6px 6px 6px 6px;border: 1px double #BF95FF;' align='left'>");
		String img_head = "word.png";
		if(bt.getDepth() == 1) img_head = "home.png";
		sb.append("<a style='text-decoration:none;' href='javascript:fnNull();' onClick='javascript:fnShowMenu(\""+businessTree.getNode().getFieldValue("seq")+"\");'><img src='/jsp/anaconda/img/"+img_head+"' width='20px' height='20px' border='0' align='absmiddle'>&nbsp;");
		sb.append(businessTree.getNode().getFieldValue("cate_name"));
		sb.append("</a></div>");
		sb.append("</td>");
		if(businessTree.hasChild())
		{
			if(bt.getDepth() <= 4)
			{
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='top'>");
				sb.append(this.getBusinessTree(businessTree));
				sb.append("</td>");
			}
			else
			{
				sb.append("<td  style='border:0px;margin:0px 0px 0px 0px;' align='left' valign='center'>");
				sb.append("<a style='text-decoration:none;' href='javascript:fnNull();' onClick='javascript:fnShowMenu(\""+businessTree.getNode().getFieldValue("seq")+"\");'>&nbsp;");
				sb.append("<img src='/jsp/anaconda/img/more.png' width='20px' height='20px' border='0' align='absmiddle'>");
				sb.append("</a>");
				sb.append("</td>");
			}
		}
		sb.append("</tr>");
	}
	sb.append("</table>");
	return sb.toString();
}
%>



<script language="javascript">
function fnShowMenu(seq)
{
	  var pos = getCurrentPosition();
	  var div = _('div_storyboard_menu');
	  div.style.left = pos.x +'px';
	  div.style.top = pos.y +'px';
	  fnShowOrHide("div_storyboard_menu");
}
</script>
<div id="table-content">
	<div class="side-content">
		<div class="content-module">
			<div class="content-module-heading cf">
			<h3 class="fl">Action Diagram</h3>
			</div>
		</div>
	</div>
</div>


<div id="div_storyboard_menu" style="width:200px;position:absolute;display:none;background-color:white;border: 2px double #BF95FF;padding: 10px 10px;">
	<ul>
		<a style="text-decoration:none;" href='javascript:fnShowOrHide("div_storyboard_menu");'><img src='/jsp/anaconda/img/close.png' width='20px' height='20px' border='0' align='absmiddle' />&nbsp;close</a>
		<p></p>
		<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:goDetail();'><img src="/jsp/anaconda/img/shortcut.png" border="0" align="absmiddle" width="10px" height="10px"></img>&nbsp;메뉴 추가 하기</a></li>
		<li><a style="text-decoration:none;" href='javascript:fnNull();' onClick='javascript:getKeywordReport();'><img src="/jsp/anaconda/img/shortcut.png" border="0" align="absmiddle" width="10px" height="10px"></img>&nbsp;스토리 보드 만들기</a></li>
	</ul>
</div>
<div>
<%
if(BusinessHelper.checkBusinessNull(request.getParameter("command")))
{
	WebActionXmlResource waxr = WebActionXmlResource.getInstance();
	WebAction action = waxr.searchWebAction(request.getParameter("command"));
	if(action != null 
	  && !BusinessHelper.checkBusinessNull(action.getBIZ_SERVICE())
	  && !BusinessHelper.checkBusinessNull(action.getFORWARD()))
	{
		out.println("Error, Does not complete the anaconda MVC configuration...");
	}
	else
	{
		String strService = action.getBIZ_SERVICE();
		String strView = action.getFORWARD();
		BizLogicXmlResource bxr = BizLogicXmlResource.getInstance();
		BusinessCollection bc = bxr.getBusinessCollection(strService);
		ViewXmlResource vxr = ViewXmlResource.getInstance();
		View view = vxr.searchView(strView);
		
		
		BusinessTree root = new BusinessTree();
		BusinessData businessData = new BusinessData();
		businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
		businessData.setFieldValue("cate_name","ROOT");
		root.setDepth(1);
		root.setNode(businessData);
		
		BusinessTree actionTree = new BusinessTree();
		businessData = new BusinessData();
		businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
		businessData.setFieldValue("cate_name",action.getKOR_NAME());
		actionTree.setNode(businessData);
		actionTree.setDepth(2);
		root.addChild(actionTree);
	
		
		BusinessTree serviceTree = new BusinessTree();
		businessData = new BusinessData();
		businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
		businessData.setFieldValue("cate_name",bc.getBIZ_COLLECTION_KOR_NAME());
		serviceTree.setNode(businessData);
		serviceTree.setDepth(3);
		actionTree.addChild(serviceTree);
		
		Iterator it = bc.iterator();
		for(;it.hasNext();)
		{
			BusinessData process = (BusinessData)it.next();
			BusinessTree processTree = new BusinessTree();
			businessData = new BusinessData();
			businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
			businessData.setFieldValue("cate_name","{"+process.getTYPE()+"} "+process.getSERVICE_NAME() );
			processTree.setNode(businessData);
			processTree.setDepth(4);
			serviceTree.addChild(processTree);
		}
		
		BusinessTree viewTree = new BusinessTree();
		businessData = new BusinessData();
		businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
		businessData.setFieldValue("cate_name",view.getFORWARD_KOR_NAME() + "{"+view.getVIEW_TYPE()+"}");
		viewTree.setNode(businessData);
		viewTree.setDepth(3);
		actionTree.addChild(viewTree);
		
		Set set = view.keySet();
		it = set.iterator();
		for(;it.hasNext();)
		{
			String strUI = (String)it.next();
			
			if(!strUI.equals(BlankField.VIEW_TYPE)
			&& !strUI.equals(BlankField.VIEW_FORWARD)
			&& !strUI.equals(BlankField.VIEW_REDIRECT)
			&& !strUI.equals(BlankField.VIEW_DESC)
			&& !strUI.equals(BlankField.VIEW_FORWARD_NAME)
			&& !strUI.equals(BlankField.VIEW_COLLECTION_NAME)
			&& !strUI.equals(BlankField.VIEW_FORWARD_KOR_NAME))
			{
				String ui = (String)view.get(strUI);
				BusinessTree uiTree = new BusinessTree();
				businessData = new BusinessData();
				businessData.setFieldValue("seq",BusinessHelper.getKey("Tree_"));
				businessData.setFieldValue("cate_name",strUI + "=" + ui);
				uiTree.setNode(businessData);
				uiTree.setDepth(4);
				viewTree.addChild(uiTree);
			}
		}
		out.println(getBusinessTree(root));
	}	
}
%>	
</div>


