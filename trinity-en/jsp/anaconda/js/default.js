/***********************************************************
  함수명    :newXMLHttpRequest()
  처리내용    :요청객체를 생성후 반환
***********************************************************/
function newXMLHttpRequest() {
  var xmlreq = false;
  if (window.XMLHttpRequest) {
    // Create XMLHttpRequest object in non-Microsoft browsers
    xmlreq = new XMLHttpRequest();
  } else if (window.ActiveXObject) {
    // Create XMLHttpRequest via MS ActiveX
    try {
      // Try to create XMLHttpRequest in later versions
      // of Internet Explorer
      xmlreq = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e1) {
      // Failed to create required ActiveXObject
      try {
        // Try version supported by older versions
        // of Internet Explorer
        xmlreq = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (e2) {
        // Unable to create an XMLHttpRequest with ActiveX
      }
    }
  }
  return xmlreq;
}


/***********************************************************
  함수명    :ajaxInteraction(액션명, 실행파일, post파라미터), (캡슐화)
  처리내용    :ajax상호작용 함수
***********************************************************/
function ajaxInteraction(action, url, postParam) {
  var REQ = newXMLHttpRequest();//req 객체반환
  var handlerFunction = processReqHandler;
  //응답이 완료되면 자동으로 실행되도록 JavaScript 콜백 함수를 정의
  REQ.onreadystatechange = handlerFunction;
  
  var modurl = "";
  //케쉬되어있는 파일로드 방지
  var myRand = parseInt(Math.random()*999999999999999); 
  
  if(url.indexOf("?") > -1) {
    modurl = url+"&rand="+myRand;
  } else {
    modurl = url+"?rand="+myRand;
  }

  //요청처리
  this.doGet = function() {
      REQ.open("GET", modurl, true);
      REQ.send(null);
    }
    
    this.doPost = function() {
      REQ.open("POST", url, true);
      REQ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      REQ.setRequestHeader("charset", "utf-8");
      REQ.send(postParam);
    }
  
  if(postParam == '')
  {
    this.doGet();
  }
  else
  {
    this.doPost();
  }
  /***********************************************************
    함수명    :processReqHandler()
    처리내용    :리스트 핸들러 함수
  ***********************************************************/
  // handle onreadystatechange event of req object
  function processReqHandler() {
    // only if req shows "loaded"
    if (REQ.readyState == 4) {
      // only if "OK"
      if (REQ.status == 200) {
        hideRunning(action);
        var xml = REQ.responseXML;
        if(!checkAJAX(xml)) return null;

        doRun(action, REQ);  //정상일경우 doRun()실행
      } else {
        alert("There was a problem retrieving the XML data:\n" +REQ.statusText);
      }
    } else {
      doRuning(action);//콜백 중에 보여지는 로직
    }
  }
}


/***********************************************************
함수명    :ajaxInteraction(액션명, 실행파일, post파라미터), (캡슐화)
처리내용    :ajax상호작용 함수
***********************************************************/
function ajaxInteractionWithCustomHandler(action, url, postParam, handler) {
var REQ = newXMLHttpRequest();//req 객체반환
var HANDLER = handler;
var handlerFunction = processReqHandler;
//응답이 완료되면 자동으로 실행되도록 JavaScript 콜백 함수를 정의
REQ.onreadystatechange = handlerFunction;

var modurl = "";
//케쉬되어있는 파일로드 방지
var myRand = parseInt(Math.random()*999999999999999); 

if(url.indexOf("?") > -1) {
  modurl = url+"&rand="+myRand;
} else {
  modurl = url+"?rand="+myRand;
}

//요청처리
this.doGet = function() {
  REQ.open("GET", modurl, true);
  REQ.setRequestHeader("charset", "utf-8");
  REQ.send(null);
}

this.doPost = function() {
  REQ.open("POST", url, true);
  REQ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  REQ.setRequestHeader("charset", "utf-8");
  REQ.send(postParam);
}

/***********************************************************
  함수명    :processReqHandler()
  처리내용    :리스트 핸들러 함수
***********************************************************/
// handle onreadystatechange event of req object
function processReqHandler() {
  // only if req shows "loaded"
  if (REQ.readyState == 4) {
    // only if "OK"
    if (REQ.status == 200) {
      hideRunning(action);
      HANDLER.doRun(action, REQ);  //정상일경우 doRun()실행
    } else {
      alert("There was a problem retrieving the XML data:\n" +REQ.statusText);
    }
  } else {
    HANDLER.doRuning(action);//콜백 중에 보여지는 로직
  }
}
}

String.prototype.trim = function() { return this.replace(/^\s+|\s+$/g,""); }

function ajaxInteractionWithFunction(url, json, fnHandler, fnErr) {
  var postParam = JSON.stringify(json);
  var REQ = newXMLHttpRequest();//req 객체반환
  var handlerFunction = processReqHandler;
  REQ.onreadystatechange = handlerFunction;
  var modurl = "";
  //케쉬되어있는 파일로드 방지
  var myRand = parseInt(Math.random()*999999999999999); 
  if(url.indexOf("?") > -1) {
    modurl = url+"&rand="+myRand;
  } else {
    modurl = url+"?rand="+myRand;
  }

  //요청처리
  this.doGet = function() {
    REQ.open("GET", modurl, true);
    REQ.setRequestHeader("charset", "utf-8");
    REQ.send(null);
  }

  this.doPost = function() {
    REQ.open("POST", url, true);
    REQ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    REQ.setRequestHeader("charset", "utf-8");
    REQ.send(postParam);
  }

  function processReqHandler() {
    if (REQ.readyState == 4) {
      if (REQ.status == 200) {
        fnHandler(REQ.responseText);  //정상일경우 doRun()실행
      } else {
        alert("There was a problem retrieving the XML data:\n" +REQ.statusText);
      }
    } else {
      fnErr(REQ);//콜백 중에 보여지는 로직
    }
  }
}


/***********************************************************
함수명    :ajaxInteraction(액션명, 실행파일, post파라미터), (캡슐화)
처리내용    :ajax상호작용 함수
***********************************************************/
function ajaxInteractionWithForm(action, frm) {
var REQ = newXMLHttpRequest();//req 객체반환
REQ.onreadystatechange = function() {
    // only if req shows "loaded"
    if (REQ.readyState == 4) {
      // only if "OK"
      if (REQ.status == 200) {
        hideRunning(action);
        var xml = REQ.responseXML;
        if(xml == null)  xml = REQ.responseText;
        console.log(xml);
        if(!checkAJAX(xml)) return null;
        doRun(action, REQ);  //정상일경우 doRun()실행
      } else {
        alert("There was a problem retrieving the XML data:\n" +REQ.statusText);
      }
    } else {
      doRuning(action);//콜백 중에 보여지는 로직
    }
  }
//케쉬되어있는 파일로드 방지
var myRand = parseInt(Math.random()*999999999999999); 

this.doPost = function() {
  var form = _(frm);
  if(form == null)
  {
    form = eval('document.' + frm);
  }
  
  if(form == null)
  {
    alert("No form !!!.");
    return;
  }
  var url = form.getAttribute("action");
  var param = "";
  var nodes = form.getElementsByTagName("input");
  var strName = "";
  var strValue = "";
  var tmpName = "";

  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    if(item.getAttribute("type") == "text" 
      || item.getAttribute("type") == "checkbox"
        || item.getAttribute("type") == "hidden"
        || item.getAttribute("type") == "radio" 
      || item.getAttribute("type") == "password" )
    {
      strName = item.getAttribute("name");
      /**
      if(tmpName.indexOf("|" + strName + "|") >= 0
          && item.getAttribute("type") != "checkbox")

      {
        alert("Duplicated name in form. Please check.(" + tmpName + "/" + strName + "/" +item.getAttribute("type")+ ")"  );
        return;
      }
      **/
      tmpName = tmpName + "|" + strName + "|";
      if(isHan(item.value)) {
        strValue = escape(encodeURIComponent(item.value));
      } else{
       strValue = encodeURIComponent(item.value);
      }
      if(strName != "")
      {
        if(param == "" )
          param = param + strName + "=" + strValue;
        else
          param = param + "&" + strName + "=" + strValue; 
      }
    }
  }
  
  //return;
  //alert(param);
  nodes = form.getElementsByTagName("textarea");
  strName = "";
  strValue = "";
  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    strName = item.getAttribute("name");
    /**
    if(tmpName.indexOf("|" + strName + "|") >= 0)
    {
      alert("Duplicated name in form. Please check." + strName);
      return;
    }
    **/
    tmpName = tmpName + "|" + strName + "|";
    if(isHan(item.value)){
      strValue = escape(encodeURIComponent(item.value));
    }else{
      strValue = escape(encodeURIComponent(item.value));
    }
    if(strName != "")
    {
      if(param == "" )
        param = param + strName + "=" + strValue;
      else
        param = param + "&" + strName + "=" + strValue; 
    }
  }
  nodes = form.getElementsByTagName("select");
  strName = "";
  strValue = "";
  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    strName = item.getAttribute("name");
    /**
    if(tmpName.indexOf("|" + strName + "|") >= 0)
    {
      alert("Duplicated name in form. Please check." + strName);
      return;
    }
    **/
    tmpName = tmpName + "|" + strName + "|";
    if(isHan(item.value)){
      strValue = escape(encodeURIComponent(item.value));
    }else{
      strValue = encodeURIComponent(item.value);
    }
    if(strName != "")
    {
      if(param == "" )
        param = param + strName + "=" + strValue;
      else
        param = param + "&" + strName + "=" + strValue; 
    }
  }  
  //alert(param);
  REQ.open("POST", url, true);
  REQ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
  REQ.setRequestHeader("charset", "utf-8");
  REQ.send(param);
  }
}



/***********************************************************
함수명    :ajaxInteraction(액션명, 실행파일, post파라미터), (캡슐화)
처리내용    :ajax상호작용 함수
***********************************************************/
function ajaxInteractionWithFormAndHandler(action, frm, handler) {
var REQ = newXMLHttpRequest();//req 객체반환
var handlerFunction = handler;
//응답이 완료되면 자동으로 실행되도록 JavaScript 콜백 함수를 정의
REQ.onreadystatechange = function(){
  if (REQ.readyState == 4) 
  {
    // only if "OK"
    if (REQ.status == 200) 
    {
      hideRunning(action);
      handler.object = REQ;
      handler.doRun();
    } else {
      alert("There was a problem retrieving the XML data:\n" +REQ.statusText);
    }
  } else {
  }
}

var modurl = "";
//케쉬되어있는 파일로드 방지
var myRand = parseInt(Math.random()*999999999999999); 

this.doPost = function() {
  var form = _(frm);
  if(form == null)
  {
    alert("No form!!!.");
    return;
  }
  var url = form.getAttribute("action");
  var param = "";
  var nodes = form.getElementsByTagName("input");
  var strName = "";
  var strValue = "";
  var tmpName = "";
  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    if(item.getAttribute("type") == "text" 
      || item.getAttribute("type") == "checkbox"
        || item.getAttribute("type") == "hidden"
        || item.getAttribute("type") == "radio"  
      || item.getAttribute("type") == "password" )
    {
      strName = item.getAttribute("name");
      if(tmpName.indexOf("|" + strName + "|") >= 0
          && item.getAttribute("type") != "checkbox")
      {
        alert("Duplicated name in form. Please check." + strName);
        return;
      }
      tmpName = tmpName + "|" + strName + "|";    
      if(isHan(item.value)){
        strValue = escape(encodeURIComponent(item.value));
      } else{
       strValue = encodeURIComponent(item.value);
      }
      if(strName != "")
      {
        if(param == "" )
          param = param + strName + "=" + strValue;
        else
          param = param + "&" + strName + "=" + strValue; 
      }
    }
  }
  
  //return;
  
  nodes = form.getElementsByTagName("textarea");
  strName = "";
  strValue = "";
  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    strName = item.getAttribute("name");
    if(tmpName.indexOf("|" + strName + "|") >= 0)
    {
      alert("Duplicated name in form. Please check." + strName);
      return;
    }
    tmpName = tmpName + "|" + strName + "|";    
    if(isHan(item.value)){
      strValue = escape(encodeURIComponent(item.value));
    }else{
      strValue = encodeURIComponent(item.value);
    }
    if(strName != "")
    {
      if(param == "" )
        param = param + strName + "=" + strValue;
      else
        param = param + "&" + strName + "=" + strValue; 
    }
  }
  nodes = form.getElementsByTagName("select");
  strName = "";
  strValue = "";
  for(var i = 0; i < nodes.length; i++)
  {
    var item = nodes.item(i);
    strName = item.getAttribute("name");
    if(tmpName.indexOf("|" + strName + "|") >= 0)
    {
      alert("Duplicated name in form. Please check." + strName);
      return;
    }
    tmpName = tmpName + "|" + strName + "|";    
    if(isHan(item.value)){
      strValue = escape(encodeURIComponent(item.value));
    }else{
      strValue = encodeURIComponent(item.value);
    }
    if(strName != "")
    {
      if(param == "" )
        param = param + strName + "=" + strValue;
      else
        param = param + "&" + strName + "=" + strValue; 
    }
  }  
  //alert(param);
  REQ.open("POST", url, true);
  REQ.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
  REQ.setRequestHeader("charset", "utf-8");
  REQ.send(param);
}
}

function callAjax(action, url)
{
   var ajax = new ajaxInteraction(action, url, '');
   ajax.doGet();
}
function callAjaxByForm(method, frmName)
{
  // ajaxConda(frmName,null,false,null);
    var ajax = new ajaxInteractionWithForm(method, frmName);
    ajax.doPost();
}

function callAjaxByFormAndHandler(method, frmName , handler)
{
  var ajax = new ajaxInteractionWithFormAndHandler(method, frmName, handler);
  ajax.doPost();
}

function setSelectBox(selectBox, value)
{
  var object = _(selectBox);
  if(object == null)
  {
    alert("No Object!!!!.");
    return;
    }
  for(var i = 0; i < object.options.length; i++)
  {
    if(object.options[i].value == value)
    {
      object.options[i].selected = true;
    }
  }
  if(object.onchange != null)
    object.onchange();
}

function getSelectValue(selectBox)
{
  var object = _(selectBox);
  if(object == null)
  {
    alert("No Object!!!.");
    return "";
    }
  for(var i = 0; i < object.options.length; i++)
  {
    if(object.options[i].selected == true)
    {
      return object.options[i].value;
    }
  }
  return "";
}


function toggleBox(checkBox)
{
  var object = _(checkBox);
  if(object == null)
  {
    alert("No Object!!!.");
    return;
    }
  if(checkBox.checked == true) checkBox.checked = false;
  else checkBox.checked = true;
}

function setCheckBox(checkBox,b)
{
  var object = _(checkBox);
  if(object == null)
  {
    alert("No Object!!!.");
    return;
    }
  if(b == 'true')checkBox.checked = true;
  else checkBox.checked = false;
}

function checkAJAX(xml)
{
  return true;
  if(xml != null)
  {
    var codes = xml.getElementsByTagName("code");
    if(codes != null && codes.length > 0)
    {
      var code = codes.item(0);
      if(code.text != '0000' && code.text != '000' && code.text != '00')
      {
        alert("AJAX Result is Error !!! [" +code.nodeValue+ "]");
        return false;
      }
    }  
  }
  return true;
}
//==============================================================
/**
<?xml>
  <xml id>
    <result>
      <Request>
        <BusinessData To String>
          ~~~~~~
        </BusinessData>
      </Request>
      <Response>
        <DefaultXmlDataCollection To String>
            ~~~~~
        </DefaultXmlDataCollection>
      </Response>
    </result>
  </xml>
**/
//==============================================================
function getAJAXResponse(xml)
{
  if(xml == null)
  {
    alert("xml is NULL");
    return null;
  }
  if(xml.documentElement == null)
  {
    alert("documentElement is NULL");
    return null;
  }
  var object = new Object();
  var objRequest = new Object();
  var objResponse = new Array();
  var objKeys = new Array();
  object["request"] = objRequest;
  object["response"] = objResponse;
  object["response_keys"] = objKeys;
  
  if(!checkAJAX(xml)) return null;
  
  var request = xml.getElementsByTagName("Request").item(0);
  var response = xml.getElementsByTagName("Response").item(0);
  return response.text;
}

function parseAnacondaAJAX(xml)
{
  if(xml == null)
  {
    alert("xml is NULL");
    return null;
  }

  if(xml.documentElement == null)
  {
    alert("documentElement is NULL");
    return null;
  }
  var object = new Object();
  var objRequest = new Object();
  var objResponse = new Array();
  var objKeys = new Array();
  object["request"] = objRequest;
  object["response"] = objResponse;
  object["response_keys"] = objKeys;
  
  if(!checkAJAX(xml)) return null;
  
  var request = xml.getElementsByTagName("Request").item(0);
  var response = xml.getElementsByTagName("Response").item(0);
    
  if(request != null && request.hasChildNodes && request.childNodes.item(0).hasChildNodes)
  {
    var reqNodes = request.childNodes.item(0).childNodes;
    for(var i = 0; i < reqNodes.length; i++)
    {
      var item = reqNodes.item(i);
                        if(item == null) continue;
      if(item["NAME"] && item["VALUE"]){
                            objRequest[item["NAME"]] = item["VALUE"];
                        }
    }
  }

  
  if(response != null && response.childNodes.item(0) != null)
  {
    if(response.hasChildNodes && response.childNodes.item(0).hasChildNodes)
    {
      object["length"] = response.childNodes.item(0).childNodes.length;
      var resNodes = response.childNodes.item(0).childNodes;
      for(var i = 0; i < resNodes.length; i++)
      {
        var item = resNodes.item(i);
        var objNode = new Object();
        objNode[item.nodeName] = item.nodeName;
        objNode["nodeName"] = item.nodeName;
        objResponse[i] = objNode;
        var namedNodeMap = item.attributes;
        for(var j = 0; j < namedNodeMap.length; j++)
        {
          var map = namedNodeMap.item(j);
          objNode[map.nodeName] = map.nodeValue;
          if(i == 0)
            objKeys[j] = map.nodeName;
          // alert(map.nodeName + '/' + map.nodeValue);
        }
      }
    }
    else
    {
      object["length"] = 0;
    }
  }
  return object;
}

//==============================================================
/**
<?xml>
  <xml id>
    <result>
      <Request>
        <BusinessData To String>
          ~~~~~~
        </BusinessData>
      </Request>
      <Response>
        <BusinessCollection To String>
            ~~~~~
        </BusinessCollection>
      </Response>
    </result>
  </xml>
**/
//==============================================================
function parseAnacondaAJAXFromBusinessCollection(xml)
{
  if(xml == null)
  {
    alert("xml is NULL");
    return null;
  }
  if(xml.documentElement == null)
  {
    alert("documentElement is NULL");
    return null;
  }
  var object = new Object();
  var objRequest = new Object();
  var objResponse = new Array();
  var objKeys = new Array();
  object["request"] = objRequest;
  object["response"] = objResponse;
  object["response_keys"] = objKeys;
  object["error"] = "";

  if(!checkAJAX(xml)) return null;


  var request = xml.getElementsByTagName("Request").item(0);
  var response = xml.getElementsByTagName("Response").item(0);
    
    if(request != null && request.hasChildNodes && request.childNodes.item(0).hasChildNodes)
  {
    var reqNodes = request.getElementsByTagName("FIELD");
    for(var i = 0; i < reqNodes.length; i++)
    {
      var item = reqNodes.item(i);
      objRequest[item.getAttribute("NAME")] = item.getAttribute("VALUE");
      //alert(objRequest.NAME + '/' + objRequest.VALUE);
    }
  }
  else
  {
    object.error = "REQUEST IS NULL";
    return object;
  }
  if(response != null &  response.childNodes.item(0) != null)
  {
    if(response.hasChildNodes && response.childNodes.item(0).hasChildNodes)
    {
      // alert(response.childNodes.item(0).nodeValue);
      object["length"] = response.childNodes.item(0).childNodes.length;
      var resNodes = response.childNodes.item(0).childNodes;
      
      if(resNodes.length == 0){
        object["response"]  = response.childNodes.item(0).nodeValue;
        // alert(object.response);
        return object;
      }

      for(var i = 0; i < resNodes.length; i++)
      {
        var item = resNodes.item(i);
        var fieldNodes = item.getElementsByTagName("FIELD");
        var objNode = new Object();
        objResponse[i] = objNode;
        for(var j= 0; j < fieldNodes.length; j++)
        {
          var field = fieldNodes.item(j);
          var namedNodeMap = field.attributes;
          var nodeName = '';
          var nodeValue = '';
          for(var k = 0; k < namedNodeMap.length; k++)
          {
            var map = namedNodeMap.item(k);
            if(map.nodeName == 'NAME') nodeName = map.nodeValue;
            else if(map.nodeName == 'VALUE') nodeValue = map.nodeValue;
          }
          objNode[nodeName] = field.textContent;
        }
      }
    }
    else
    {
      object["length"] = 0;
    }
  }
  else
  {
    object.error = "RESPONSE IS NULL";
    return object;
  }
  return object;
}
//==============================================================
/**
<?xml>
  <xml id>
    <BusinessCollection To String>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
    </BusinessCollection>
  </xml>
**/
//==============================================================
function parseBusinessCollection(xml)
{
  if(xml == null)
  {
    alert("xml is NULL");
    return null;
  }
  if(xml.documentElement == null)
  {
    alert("documentElement is NULL");
    return null;
  }
  var object = new Object();
  var objResponse = new Array();
  object["response"] = objResponse;
  var response = xml.documentElement;
  // var response = root.childNodes;
  if(response != null)
  {
    if(response.childNodes.item(0).hasChildNodes)
    {
      object["length"] = response.childNodes.item(0).childNodes.length;
      var resNodes = response.childNodes.item(0).childNodes;
      for(var i = 0; i < resNodes.length; i++)
      {
        var item = resNodes.item(i);
        var fieldNodes = item.getElementsByTagName("FIELD");
        var objNode = new Object();
        objResponse[i] = objNode;
        for(var j= 0; j < fieldNodes.length; j++)
        {
          var field = fieldNodes.item(j);
          var namedNodeMap = field.attributes;
          var nodeName = '';
          var nodeValue = '';
          for(var k = 0; k < namedNodeMap.length; k++)
          {
            var map = namedNodeMap.item(k);
            if(map.nodeName == 'NAME') nodeName = map.nodeValue;
            else if(map.nodeName == 'VALUE') nodeValue = map.nodeValue;
          }
          //alert(nodeName + '/' + nodeValue);
          objNode[nodeName] = nodeValue;
        }
      }
    }
    else
    {
      object["length"] = 0;
    }
  }
  else
  {
    object.error = "RESPONSE IS NULL";
  }
  return object;
}

//==============================================================
/**
<?xml>
  <xml id>
    <BusinessCollection To String>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
    </BusinessCollection>
    <BusinessCollection To String>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
      <BusinessData>
         <Field/><Field/><Field/><Field/>
      </BusinessData>
    </BusinessCollection>
  </xml>
**/
//==============================================================
function parseBusinessCollectionByIndex(xml,idx){
  if(xml == null){
    alert("xml is NULL");
    return null;
  }
  if(xml.documentElement == null){
    alert("documentElement is NULL");
    return null;
  }
  var object = new Object();
  var objRequest = new Object();
  var objResponse = new Array();
  object["response"] = objResponse;
  var objKeys = new Array();
  object["request"] = objRequest;
  object["response"] = objResponse;
  object["response_keys"] = objKeys;
  object["error"] = "";

  if(!checkAJAX(xml)) return null;

  var request = xml.getElementsByTagName("Request").item(0);
  var response = xml.getElementsByTagName("Response").item(0);

  if(request != null && request.hasChildNodes && request.childNodes.item(0).hasChildNodes){
    var reqNodes = request.getElementsByTagName("FIELD");
    for(var i = 0; i < reqNodes.length; i++){
      var item = reqNodes.item(i);
      objRequest[item.getAttribute("NAME")] = item.getAttribute("VALUE");
    }
  }else{
    object.error = "REQUEST IS NULL";
    return object;
  }

  if(response != null){
      if(response.childNodes.item(idx).hasChildNodes){
      object["length"] = response.childNodes.item(idx).childNodes.length;
      var resNodes = response.childNodes.item(idx).childNodes;
      for(var i = 0; i < resNodes.length; i++){
         var item = resNodes.item(i);
        var fieldNodes = item.getElementsByTagName("FIELD");
        var objNode = new Object();
        objResponse[i] = objNode;
        for(var j= 0; j < fieldNodes.length; j++){
          var field = fieldNodes.item(j);
          var nodeName = '';
          var nodeValue = '';
          nodeName = $(field).attr('NAME');
          nodeValue =  $(field).text();
           
          console.log('name : ' +  nodeName);
          console.log('value : ' +  nodeValue);
          if(nodeValue == null || nodeValue == ''){
            var namedNodeMap = field.attributes;
            for(var k = 0; k < namedNodeMap.length; k++){
            var map = namedNodeMap.item(k);
              if(map.nodeName == 'NAME') nodeName = map.nodeValue;
              else if(map.nodeName == 'VALUE') nodeValue = map.nodeValue;
            }
            // alert(nodeName + '/' + nodeValue);
          }
          objNode[nodeName] = nodeValue;
        }
      }
    }else{
      object["length"] = 0;
    }
  }
  return object;
}

var getNowScroll = function()
{
  var de = document.documentElement;
  var b = document.body;
  var now = {};
  now.x = document.all ? (!de.scrollLeft ? b.scrollLeft : de.scrollLeft) : (window.pageXOffset ? window.pageXOffset : window.scrollX);
  now.y = document.all ? (!de.scrollTop ? b.scrollTop : de.scrollTop) : (window.pageYOffset ? window.pageYOffset : window.scrollY);
  return now;
}

function getCurrentPosition() 
{  
     var position = new Object();
     var tempX, tempY;  
     var evt =  window.event || event;
     if (evt.pageX || evt.pageY) {
       // alert(evt.pageX)
       tempX = evt.pageX;  
       tempY = evt.pageY;
       // tempX = evt.clientX + document.documentElement.scrollLeft;  
       // tempY = evt.clientY + document.documentElement.scrollTop;  
       // alert(event.offsetY +"," + event.screenY +"," + window.event.clientY + "," +  evt.Y + "," + evt.pageY + "," + evt.clientY + "," + tempY);
     } else {  
       // var scroll = getNowScroll();  
       // alert(evt.clientX + "," + evt.clientY);
       // alert(evt.pageX + "," + evt.pageY);
       tempX = evt.clientX  + document.body.scrollLeft + document.documentElement.scrollLeft ; // scroll.x;  
       tempY = evt.clientY  + document.body.scrollTop + document.documentElement.scrollTop ; // scroll.y;  
       //tempX = evt.X;  
       //tempY = evt.Y;  
     }  
     position["x"] = tempX;  
     position["y"] = tempY;   
     return position;
}  


function getCumulativeOffset(element) 
{ 
  var valueT = 0, valueL = 0; 
  do { 
    valueT += element.offsetTop || 0; 
    valueL += element.offsetLeft || 0; 
    element = element.offsetParent; 
  } while (element); 
  return [valueL, valueT]; 
} 

function getCurrentPositionNoScroll() 
{  
     var position = new Object();
     var tempX, tempY;  
     var evt =  window.event || event;

     if (document.all) {
     //var scroll = getNowScroll();  
     //alert(scroll.y);
       tempX = evt.clientX;  
       tempY = evt.clientY;  
       //tempX = evt.X;  
       //tempY = evt.Y;  
     } else {  
       tempX = evt.pageX;  
       tempY = evt.pageY;
       tempX = evt.clientX + document.documentElement.scrollLeft;  
       tempY = evt.clientY + document.documentElement.scrollTop;  
       //alert(tempY);
     }  
     position["x"] = tempX;  
     position["y"] = tempY;   
     return position;
}  

function getTagPosition() 
{  
     var position = new Object();
     var tempX, tempY;  
     var evt =  window.event || event;
     
     position["x"] = evt.srcElement.offsetLeft;  
     position["y"] = evt.srcElement.offsetTop;   
     return position;
} 

function _(strName)
{
  return document.getElementById(strName);
}

function removeAllChildNodesById(strNodeID)
{
  // var node = strNodeID;
  node = _(strNodeID);
  if(node.hasChildNodes())
  {
    var arrNode = new Array();
    var c = node.childNodes;
    for(var i = 0; i < c.length; i++)
    {
      arrNode.push(c.item(i));
    }
    for(var i = 0; i < arrNode.length; i++)
    {
      node.removeChild(arrNode[i]);
    }
  }
}

function checkBrowser()
{

}

function createElement (tagName, name, type)
{
    var newEle;
    try {
      if (type) newEle = document.createElement("<" + tagName + " name='" + name + "' type='" + type + "'>");
      else newEle = document.createElement("<" + tagName + " name='" + name + "'>");
    } 
    catch (e) {
      newEle = document.createElement(tagName);
      newEle.setAttribute("name", name);
      if (type) newEle.setAttribute("type", type);
    }
    return newEle;
}


function createElementWithStyle (tagName, name, type , c, style)
{
    var newEle;
    try {
      newEle = document.createElement("<" + tagName + " name='" + name + "' type='" + type + "' class='" + c+ "' style='" + style + "'>");
    } 
    catch (e) {
      newEle = document.createElement(tagName);
      if (name)newEle.setAttribute("name", name);
            if (c)newEle.setAttribute("class", c);
            if (style)newEle.setAttribute("style", style);
      if (type) newEle.setAttribute("type", type);
    }
    return newEle;
}

function createElementWidthValue (tagName, name, type , value)
{
    var newEle;
    try {
      if (type) newEle = document.createElement("<" + tagName + " name='" + name + "' type='" + type + "'>"+value+"</"+tagName+">");
      else newEle = document.createElement("<" + tagName + " name='" + name + "'>"+value+"</"+tagName+">");
    } 
    catch (e) {
      newEle = document.createElement("<" + tagName + ">");
      newEle.setAttribute("name", name);
      if (type) newEle.setAttribute("type", type);
    }
    return newEle;
}


function isHanCheck(str) 
{
    var i;
    var ch;
    
    for (i=0;i<str.length;i++) {
        ch = escape(str.charAt(i));        //ISO-Latin-1 문자셋으로 변경

        if (strCharByte(ch) != 2) { //한글이 아닐 경우
            return;
        }
    }
}

function strCharByte(chStr) 
{
    if (chStr.substring(0, 2) == '%u') {
        if (chStr.substring(2,4) == '00')
            return 1;
        else
            return 2;        //한글
    } else if (chStr.substring(0,1) == '%') {
        if (parseInt(chStr.substring(1,3), 16) > 127)
            return 2;        //한글
        else
            return 1;
    } else {
            return 1;
    }
}

function fnEnterEvent(function_name)
{
  if(event.keyCode == 13)
  {
    eval(function_name+'()');
    return;
  }
}

function fnNumberCheck(object)
{
  if(object != null && object.value != null)
  {
    if(isNaN(object.value))
    {
      alert("Not Number!!!.");
      return false;
    }
  }
  return true;
}

function fnMailCheck(object) 
{ 
  if(object != null && object.value != null)
  {
     /** 체크사항 
       - @가 2개이상일 경우 
       - .이 붙어서 나오는 경우 
       -  @.나  .@이 존재하는 경우 
       - 맨처음이.인 경우 
       - @이전에 하나이상의 문자가 있어야 함 
       - @가 하나있어야 함 
       - Domain명에 .이 하나 이상 있어야 함 
       - Domain명의 마지막 문자는 영문자 2~4개이어야 함 **/ 

      var check1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;  

      var check2 = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/; 
       
      if ( !check1.test(object.value) && check2.test(object.value) ) { 
          return true; 
      } else { 
          return false; 
      } 
  } 
}

//str은 한글이어야만 한다. 
function fnCheckHan(str) 
{ 
    strarr = new Array(str.length); 
    schar = new Array('/','.','>','<',',','?','}','{',' ','\\','|','(',')','+','='); 
    flag = true; 
    for (i=0; i<str.length; i++) { 
        for (j=0; j<schar.length; j++) { 
            if (schar[j] ==str.charAt(i)) { 
                flag = false; 
            } 
        } 
        strarr[i] = str.charAt(i) 
        if ((strarr[i] >=0) && (strarr[i] <=9)) { 
            flag = false; 
        } else if ((strarr[i] >='a') && (strarr[i] <='z')) { 
            flag = false; 
        } else if ((strarr[i] >='A') && (strarr[i] <='Z')) { 
            flag = false; 
        } else if ((escape(strarr[i]) > '%60') && (escape(strarr[i]) <'%80') ) { 
            flag = false; 
        } 
    } 
    if (flag) { 
        return true; 
    } else { 
        return false; 
    } 
} 


function isHan(Objectname)
{
  var intErr;
  var strValue = Objectname;
  // var strValue = Objectname.value
  var retCode = 0;
 
   for (i = 0; i < strValue.length; i++)
   {
    var retCode = strValue.charCodeAt(i);
    var retChar = strValue.substr(i,1).toUpperCase();
    retCode = parseInt(retCode);
   
    if ((retChar < "0" || retChar > "9") && (retChar < "A" || retChar > "Z") && ((retCode > 255) || (retCode < 0)))
    {
     intErr = -1;
     break;
    }
   }
  if(intErr == -1 ) return true;
  else return false;
}

function fnNull()
{
}

function fnShowOrHideMenu(div_object)
{
  var pos = getCurrentPosition();
  // alert(pos.x +"/" + pos.y);
  // var pos = getCumulativeOffset(div_object);
  // var elm = _(div_object);

  // alert(elm.style.left);

  var obj = _(div_object);
  if(obj != null)
  {
    if(obj.style.display == 'block')
    {
      // alert("block");
      obj.style.display = 'none';
    }
    else
    {
      // alert((pos.x+10) + '/' +(pos.y+10));
      obj.style.display = 'block';
      obj.style.position = "absolute";
      obj.style.left = pos.x + 'px';
      obj.style.top = pos.y + 'px';
      // obj.style.left = elm.style.left +10;
      // obj.style.top = elm.style.top +10;

    }
  }

}

function fnShowDiv(div_object)
{
  var obj = _(div_object);
  if(obj != null)
  {
    obj.style.display = 'block';
  }
}

function fnHideDiv(div_object)
{
  var obj = _(div_object);
  if(obj != null)
  {
    obj.style.display = 'none';
  }
}

function fnShowOrHide(div_object)
{
  var obj = _(div_object);
  if(obj != null)  {
    if(obj.style.display == 'block')    {
      obj.style.display = 'none';
    }else  {
      obj.style.display = 'block';
    }
  }
}

function popMenu(div_id){
  fnShowOrHide(div_id);
  var pos = getCurrentPosition();
  var div = _(div_id);
    div.style.left = pos.x+'px';
    div.style.top = pos.y + 'px';
}
function position(div_id){
  var pos = getCurrentPosition();
  var div = _(div_id);
    div.style.left = pos.x+'px';
    div.style.top = pos.y + 'px';
}

function fnLocateDivInClickEvent(div,offSetX, offSetY)
{
  var divResult = _(div);
  divResult.style.display = "block";
  divResult.style.position = "absolute";
  var position = getCurrentPosition();
  divResult.style.left = position.x + offSetX + 'px';
  divResult.style.top = position.y + offSetY + 'px'; 
}

function fnLocateDivInClickEventNoScroll(div,offSetX, offSetY)
{
  var divResult = _(div);
  divResult.style.display = "block";
  divResult.style.position = "absolute";
  var position = getCurrentPositionNoScroll();
  divResult.style.left = position.x + offSetX + 'px';
  divResult.style.top = position.y + offSetY + 'px'; 
}

function _rand()
{
  return 'NODE' + '-' + ((new Date()).getTime()) + '-' + (Math.floor(100000000000000*Math.random()));
}

function _key()
{
  return _rand();
}
function strReplace(subject, search, replace) {
  return subject.split(search).join(replace);
}

function enterToBR(strText){
  if(strText == null || strText == 'null') return "";
  return strText.replace(/\r\n/g,"<BR>").replace(/\n/g,"<BR>");
}

function BRToEnter(strText){
  if(strText == null || strText == 'null') return "";
  return strText.replace(/<BR>/g,"\r\n").replace(/<br>/g,"\r\n");
}

function TextToHtml(strText)
{
  if(strText == null || strText == 'null') return "";
  return strText.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/<BR>/g,"\r\n").replace(/&quot;/g,"\"").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
}
function TextToHtmlNoBR(strText)
{
  if(strText == null || strText == 'null') return "";
  return strText.replace(/&#47;/g,"/").replace(/&gt;/g,">").replace(/&lt;/g,"<").replace(/&quot;/g,"\"").replace(/&#39;/g,"\'").replace(/&amp;/g,"&");
}

function HtmlToText(strText)
{
  return strText.replace(/&amp;/g,"&").replace(/&#39;/g,"\'").replace(/<BR>/g,"\r\n").replace(/&quot;/g,"\"").replace(/&lt;/g,"<").replace(/&gt;/g,">");
}

function HtmlToTextNoBR(strText)
{
  return strText.replace(/&/g,"&amp;").replace(/\'/g,"&#39;").replace(/\"/g,"&quot;").replace(/</g,"&lt;").replace(/>/g,"&gt;");
}

function AnacondaSubmit(arg_frm)
{
  // alert(arg_frm.action);
        arg_frm.setAttribute("accept-charset","utf-8");
  arg_frm.submit();
        // callAjaxByForm(arg_frm.method, arg_frm.name);
}

function AnacondaNavigate(url)
{
  // alert(arg_frm.action);
  document.location.href = url;
  // arg_frm.submit();
}


function AnacondaRoleCheck(cmd)
{
  var url = "/Anaconda.do?CMD=CMD_SEQ_104838692381307840961514&TARGET_CMD=" + cmd;
  var ajax = new ajaxInteractionWithCustomHandler('AnacondaRoleCheck',url,'', new AnacondaRoleCheckHandler(cmd));
  ajax.doGet();
}

function AnacondaRoleCheckHandler(command)
{
  var CMD = command;
  this.doRun = function(action, REQ)
  {
    hideRunning(action);
    if(REQ.responseText != '')
    {
      alert(REQ.responseText);
    }
    else
    {
      document.location.href = '/Anaconda.do?CMD=' + CMD;
    }
  }
  this.doRuning = function(action)
  {
    showRunning(action);
  }
}

function showRunning(callerName)
{
  var running_div = document.getElementById('running_div');
  if(running_div == null)
  {
    running_div = document.createElement("div");
    running_div.setAttribute("id","running_div");
    running_div.innerHTML = '<img src="/jsp/anaconda/img/ajax-loader.gif" />';
    //running_div.style.width='400px';
    //running_div.style.height='400px';
        //top: 50%;        /* 화면의 중앙에 위치 */
        //left: 50%;        /* 화면의 중앙에 위치 */
        // margin: -100px 0 0 -100px;        /* 높이의 절반과 너비의 절반 만큼 margin 을 이용하여 조절 해 줍니다. */
    running_div.style.position = 'absolute';
    running_div.style.borderColor = '#C1DEF0';
    running_div.style.borderStyle = 'solid';
    running_div.style.borderWidth = '1px';
    running_div.style.left = '50%';
    running_div.style.top = '50%';
    running_div.style.margin = '-50px 0 0 -50px';
    running_div.style.display = 'block';
    var body = document.getElementsByTagName("BODY");
    if(body != null)
    {
      // alert(body.length);
      body[0].appendChild(running_div);
    }
  }
  running_div.style.display = 'block';
  // alert(running_div.innerHTML);
}
function hideRunning(callerName)
{
  var running_div = document.getElementById('running_div');
  if(running_div != null)
  {
    running_div.style.display = 'none';
  }
}

function getForm(form_name)
{
  var frm = document.getElementById(form_name) == null ? document.createElement("form") : document.getElementById(form_name);
  frm.setAttribute("name",form_name);
  frm.setAttribute("id",form_name);
  return frm;
}

function getInput(param_name, param_value , type)
{
  var input = document.getElementById(param_name) == null ? document.createElement("input") : document.getElementById(param_name);
  input.setAttribute("name",param_name);
  input.setAttribute("value",param_value);
  input.setAttribute("type",type);
  return input;
}

function addFormData(frm, param_name, param_value)
{
  frm.appendChild(getInput(param_name,param_value));
  return frm;
}

function getUploadForm(form_name , file_name)
{
  var frm = getForm(form_name);
  frm.method = 'post';
    frm.encoding = 'multipart/form-data';
  addFormData(frm, 'file-name' , file_name , 'file');
  return frm;
}

function upload(url, file_name)
{
  var frm = getForm('upload-form');
  frm.setAttribute('enctype','multipart/form-data');
  var input = getInput('file-name' , file_name , 'file');
  var files =  input.files;
  alert(files.length);
  for (var i = 0; i < files.length; i++)
    // alert(files[i].name);
  frm.appendChild(input);
  document.body.appendChild(frm);
  var file = input.files[0];
  console.log("File name: " + file.name);
    console.log("File size: " + file.fileSize);
    console.log("Binary content: " + file.getAsBinary());
    console.log("Text content: " + file.getAsText(""));
  console.log("Url : " + file.getAsDataURL());
}



function highlight(id, text)
{
    inputText = document.getElementById(id)
    var innerHTML = inputText.innerHTML
    var index = innerHTML.indexOf(text);
    if ( index >= 0 )
    { 
        innerHTML = innerHTML.substring(0,index) + "<span class='highlight'>" + innerHTML.substring(index,index+text.length) + "</span>" + innerHTML.substring(index + text.length);
        inputText.innerHTML = innerHTML 
    }

}

function setCookie(name, value, expire)
{
  var today = new Date();
  today.setDate(today.getDate() + expire);
  document.cookie = name + "=" + escape(value) + ";path=/; expires=" + today.toGMTString() + ";";
}

function getCookie(name)
{
  var search = name + "=";
  var x = 0;
  var cookieData = document.cookie;
  var start = cookieData.indexOf(search);
  var cValue = '';
    if(start != -1){
     start += search.length;
     var end = cookieData.indexOf(';', start);
     if(end == -1)end = cookieData.length;
     cValue = cookieData.substring(start, end);
    }
    return unescape(cValue);
}

function ajaxConda(frmName,cmd,json , fnSuccess){

        var anacondaUrl = '/Anaconda';

        if(frmName != null){    
     if($("#"+frmName).attr('action')){
        anacondaUrl = $("#"+frmName).attr('action');
     }
        } 
        if(anacondaUrl.indexOf('.json') == -1 &&  anacondaUrl.indexOf('.do') == -1){ 
     if(json == null || json == true) anacondaUrl += '.json';
     else  anacondaUrl += '.do';
  }

        var params = "";
        if(frmName != null) params = $("#"+frmName).serialize();
        if(cmd != null) anacondaUrl = anacondaUrl + "?CMD=" + cmd;
        $.ajax({
            type : 'post',
            url : anacondaUrl,
            data : params,
            dataType : 'text',
            error: function(data, status, error){
                alert(data + "," + status + "," + error);
            },
            success : function(data, status){
                // alert('Applied successfully.');
                if(fnSuccess != null) fnSuccess(data);
            }
            /* ,
            beforeSend: function(){
                $('.spinner').show()
            },
            complete: function(){
                $('.spinner').hide();
            } */
        });
}

function ajaxCondaPlus(frmName,cmd,json,fnSuccess,fnError){

        var anacondaUrl = '/Anaconda';
        if(frmName != null){    
     if($("#"+frmName).attr('action')){
        anacondaUrl = $("#"+frmName).attr('action');
     }
        } 
        if(anacondaUrl.indexOf('.json') == -1 &&  anacondaUrl.indexOf('.do') == -1){ 
     if(json == null || json == true) anacondaUrl += '.json';
     else  anacondaUrl += '.do';
  }
        var params = "";
        if(frmName != null) params = $("#"+frmName).serialize();
        if(cmd != null) anacondaUrl = anacondaUrl + "?CMD=" + cmd;
        $.ajax({
            type : 'post',
            url : anacondaUrl,
            data : params,
            dataType : 'text',
            error: function(data, status, error){
                if(fnError != null)fnError(data);
            },
            success : function(data, status){
                if(fnSuccess != null) fnSuccess(data);
            }
            /* ,
            beforeSend: function(){
                $('.spinner').show()
            },
            complete: function(){
                $('.spinner').hide();
            } */
        });
}


function createChart(id, t, title, c_label, c_data){
  var ctx = $('#' + id);
  var myChart = new Chart(ctx, {
    type: t,
    data: {
        labels: c_label, // ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
        datasets: [{
            label: title , // '# of Votes',
            data: c_data, // [12, 19, 3, 5, 2, 3],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        } ,
        responsive: true,
        maintainAspectRatio: true
    }
  });
  return ctx;
}
