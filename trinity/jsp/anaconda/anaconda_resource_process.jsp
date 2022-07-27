<%@ page contentType="text/xml; charset=UTF-8" %><%@page pageEncoding="UTF-8" %><%@ page import="java.util.*"%><%@ page import="java.net.*"%><%@ page import="com.stuko.anaconda.XmlConfig.*"%><%@ page import="com.stuko.anaconda.Auth.*"%><%@ page import="com.stuko.anaconda.front.*"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.action.*"%><%@ page import="com.stuko.anaconda.value.*"%><%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%><%@ page import="com.stuko.anaconda.util.InitClass"%><%@ page import="com.stuko.anaconda.business.*"%><%@ page import="com.stuko.anaconda.Exception.*"%><%@ page import="com.stuko.anaconda.util.*"%><%@ page import="com.stuko.anaconda.SQLCommand.*"%><%
	String strCode 	= request.getParameter("code");
	String strSearch	= request.getParameter("search") == null ? "" : request.getParameter("search");
	String strName	= request.getParameter("res_name") != null ? URLDecoder.decode(request.getParameter("res_name"),"UTF-8") : request.getParameter("res_name");
	String strValue	= request.getParameter("res_value") != null ? URLDecoder.decode(request.getParameter("res_value"),"UTF-8") : request.getParameter("res_value");
	String strType  = request.getParameter("res_type");
	String strKey  = request.getParameter("res_key");
	String strRtn = "";
         String owner = "";
	RequestHelper helper = (RequestHelper)request.getAttribute(InitClass.HELPER);
	DefaultAuth auth = (DefaultAuth)helper.getSessionObject();
	if(auth != null)
	{
		owner = auth.getAuthItem(("MEMBER_NAME"));	
	}

	try
	{
		BusinessData businessData = (BusinessData)request.getAttribute(InitClass.getBusinessDataValue());
		DefaultXmlResource res = DefaultXmlResource.getInstance();
		if(strCode.equals("remove"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES);
			if(col != null)
			{
				col.removeDefaultXmlData(strKey);
			}
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("create"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES);
			if(col == null)
			{
				col = new DefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES);
			}
			res.addDefaultXmlDataCollection(col);
			DefaultXmlData dxd = new DefaultXmlData();
			dxd.setTYPE("RES");
			dxd.set("res_type",strType);
			dxd.set("res_name",strName);
			dxd.set("res_value",strValue);
			col.addDefaultXmlData(dxd);
			res.save(col);
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("remove_xml_data"))
		{
			if(BusinessHelper.checkBusinessNull(RequestUtil.getParameter(request,"res_key")))
			{
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
				if(col != null)
				{
					col.removeDefaultXmlData(strName);
					res.save(col);
				}
			}
		}
		else if(strCode.equals("create_xml_data"))
		{
			if(BusinessHelper.checkBusinessNull(RequestUtil.getParameter(request,"res_key")))
			{
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
				if(col == null)
				{
					col = new DefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
					res.addDefaultXmlDataCollection(col);
				}
				
				DefaultXmlData dxd = col.getDefaultXmlData(RequestUtil.getParameter(request,"res_name")); 
				if(dxd == null)
				{
					dxd = new DefaultXmlData(RequestUtil.getParameter(request,"res_name"));
					col.addDefaultXmlData(dxd);
				}
				DataAccessCenter dac = new DataAccessCenter(RequestUtil.getParameter(request,"res_jndi"));
				BusinessCollection bc = dac.getTableInfo();
				for(int i = 0; i < bc.size(); i++)
				{
					BusinessData bd = bc.getBusinessData(i);
					dxd.setTYPE("TABLE");
					ExceptionCenter.debug(bd.getBusinessName() + "/" + dxd.getNAME());
					if(bd.getBusinessName().equals(dxd.getNAME()))
					{
						BusinessData fields = new BusinessData();
						for(int j = 0; j < bd.size(); j++)
						{
							BusinessItem item = (BusinessItem)bd.get(j);
							ExceptionCenter.debug("============>" + item.FIELD_NAME + "/" + item.getValue());
							fields.addField(item.FIELD_NAME,item.FIELD_TYPE,"");						
						}
						dxd.setBusinessData(fields);
						break;
					}
				}
				res.save(col);
				strRtn = res.httpXmlData(businessData,col);
			}
		}
		else if(strCode.equals("create_xml_table_config"))
		{
			ExceptionCenter.debug("############################## TABLE CONFIG START #####################################");
			ExceptionCenter.debug("RES_KEY="+request.getParameter("res_key") );
			ExceptionCenter.debug("RES_NAME="+request.getParameter("res_name") );
			if(BusinessHelper.checkBusinessNull(RequestUtil.getParameter(request,"res_key")))
			{
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
				if(col != null)
				{
					DefaultXmlData dxd = col.getDefaultXmlData(RequestUtil.getParameter(request,"res_name")); 
					if(dxd != null)
					{
						ExceptionCenter.debug("Find DXD");
						dxd.set("list",request.getParameter("list"));
						dxd.set("read",request.getParameter("read"));
						dxd.set("update",request.getParameter("update"));
						dxd.set("insert",request.getParameter("insert"));
						dxd.set("key",request.getParameter("key"));
						res.save(col);
						strRtn = res.httpXmlData(businessData,col);
					}
				}
			}
			ExceptionCenter.debug("############################## TABLE CONFIG END #####################################");
		}
		else if(strCode.equals("create_xml_service"))
		{
			ExceptionCenter.debug("############################## XML SERVICE START #####################################");
			if(BusinessHelper.checkBusinessNull(RequestUtil.getParameter(request,"res_key")))
			{
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
				if(col != null)
				{
					DefaultXmlData dxd = col.getDefaultXmlData(RequestUtil.getParameter(request,"res_name")); 
					if(dxd != null)
					{
						BizLogicXmlResource xmlResource = BizLogicXmlResource.getInstance();
						BusinessCollection businessCollection = null;
						AutoSeq autoseq = new AutoSeq();
						String	strColBizName = autoseq.getBCollectionSeq();
						businessCollection = new BusinessCollection(strColBizName);			
						businessCollection.setBIZ_COLLECTION_KOR_NAME("XML서비스 -" + RequestUtil.getParameter(request,"res_name") );
						BusinessData fields = dxd.getBusinessData();
						String key = dxd.getData("key");
						String[] arr_key = key.split(",");
						ExceptionCenter.debug(key + "/" + arr_key.length);
						String strKeyFieldCondition = " WHERE ";
						if(arr_key != null && arr_key.length != 0)
						{
							for(int i = 0, j = 0; i < arr_key.length ; i++)
							{
								String strKeyField = arr_key[i];
								String strFieldValue = fields.getFieldType(strKeyField);
								if(BusinessHelper.checkBusinessNull(strFieldValue))
								{
									if(j == 0)
									{
										strKeyFieldCondition =  strKeyFieldCondition + strKeyField + " = ? ";
									}
									else
									{
										strKeyFieldCondition =  strKeyFieldCondition + " AND " + strKeyField + " = ? ";
									}
                                                                        j++;
								}
							}
						}
						else
						{
							strKeyFieldCondition = "";
						}
						//------------------------------------------------------
						// INSERT 프로세스
						//------------------------------------------------------
						BusinessData insert_process = new BusinessData(RequestUtil.getParameter(request,"res_name") + "_insert");
						insert_process.setDATA_DATASOURCE(RequestUtil.getParameter(request,"res_jndi"));
						insert_process.setTYPE("SQL");
                                                       insert_process.setOWNER(owner);
						String strSQL = "";
						String strColumn = "";
						String strParam = "";
						String insert = dxd.getData("insert");
						String[] arr_insert = insert.split(",");
						for(int i = 0 , j = 0 ;i < arr_insert.length;i++)
						{
							String strKeyField = arr_insert[i];
							String strFieldValue = fields.getFieldType(strKeyField);
							if(BusinessHelper.checkBusinessNull(strFieldValue))
							{
								if(j == 0)
								{
									strColumn = strColumn + strKeyField;
									strParam  = strParam + "?";
								}
								else
								{
									strColumn = strColumn + "," + strKeyField;
									strParam  = strParam + ",?";
								}
								j++;
								insert_process.addField(strKeyField,strFieldValue,"");
							}
						}
						strSQL = "INSERT INTO " + RequestUtil.getParameter(request,"res_name") + " (" + strColumn + ")" + " VALUES(" + strParam + ")";
						insert_process.setSQL(strSQL);
						//------------------------------------------------------
						// UPDATE 프로세스
						//------------------------------------------------------
						BusinessData update_process = new BusinessData(RequestUtil.getParameter(request,"res_name") + "_update");
						update_process.setDATA_DATASOURCE(RequestUtil.getParameter(request,"res_jndi"));
						strSQL = "";
						strColumn = "";
						strParam = "";
						update_process.setTYPE("SQL");
                                                       update_process.setOWNER(owner);
						String update = dxd.getData("update");
						String[] arr_update = update.split(",");
						
						for(int i = 0 , j = 0 ;i < arr_update.length;i++)
						{
							String strKeyField = arr_update[i];
							String strFieldValue = fields.getFieldType(strKeyField);
							ExceptionCenter.debug("UPDATE FIELD==>" + strFieldValue + "/" + strKeyField);
							if(BusinessHelper.checkBusinessNull(strFieldValue))
							{
								if(j == 0)
								{
									strColumn = strColumn + strKeyField + "= ?" ;
								}
								else
								{
									strColumn = strColumn + "," + strKeyField + "= ?" ;
								}
								j++;
								update_process.addField(strKeyField,strFieldValue,"");
							}
						}
						if(arr_key != null && arr_key.length != 0)
						{
							for(int i = 0; i < arr_key.length ; i++)
							{
								update_process.addField(arr_key[i],fields.getFieldType(arr_key[i]),"");
							}
						}
						strSQL = "UPDATE " + RequestUtil.getParameter(request,"res_name") + " SET " + strColumn + strKeyFieldCondition;
						update_process.setSQL(strSQL);

						//------------------------------------------------------
						// DELETE 프로세스
						//------------------------------------------------------
						BusinessData delete_process = new BusinessData(RequestUtil.getParameter(request,"res_name") + "_delete");
						delete_process.setDATA_DATASOURCE(RequestUtil.getParameter(request,"res_jndi"));
						strSQL = "";
						strColumn = "";
						strParam = "";
						delete_process.setTYPE("SQL");
                                                       delete_process.setOWNER(owner);
						strSQL = "DELETE FROM " + RequestUtil.getParameter(request,"res_name") + strKeyFieldCondition;
						delete_process.setSQL(strSQL);
						if(arr_key != null && arr_key.length != 0)
						{
							for(int i = 0; i < arr_key.length ; i++)
							{
								delete_process.addField(arr_key[i],fields.getFieldType(arr_key[i]),"");
							}
						}
						//------------------------------------------------------
						// READ 프로세스
						//------------------------------------------------------
						BusinessData read_process = new BusinessData(RequestUtil.getParameter(request,"res_name") + "_read");
						read_process.setDATA_DATASOURCE(RequestUtil.getParameter(request,"res_jndi"));
						strSQL = "";
						strColumn = "";
						strParam = "";
						read_process.setTYPE("SQL");
                                                       read_process.setOWNER(owner);
						String read = dxd.getData("read");
						String[] arr_read = read.split(",");
						
						for(int i = 0 , j = 0 ;i < arr_read.length;i++)
						{
							String strKeyField = arr_read[i];
							String strFieldValue = fields.getFieldType(strKeyField);
							ExceptionCenter.debug("READ FIELD==>" + strFieldValue + "/" + strKeyField + "/"  + i);
							if(BusinessHelper.checkBusinessNull(strFieldValue))
							{
								if(j == 0)
								{
									strColumn = strColumn + strKeyField ;
								}
								else
								{
									strColumn = strColumn + "," + strKeyField ;
								}
								j++;
								// read_process.addField(strKeyField,strFieldValue,"");
							}
						}
						
						strSQL = "SELECT " + strColumn + " FROM " + RequestUtil.getParameter(request,"res_name") + strKeyFieldCondition;
						read_process.setSQL(strSQL);
						if(arr_key != null && arr_key.length != 0)
						{
							for(int i = 0; i < arr_key.length ; i++)
							{
								read_process.addField(arr_key[i],fields.getFieldType(arr_key[i]),"");
							}
						}
						//------------------------------------------------------
						// LIST 프로세스 , READ와 같은 데이터 읽는다.
						//------------------------------------------------------
						BusinessData list_process = new BusinessData(RequestUtil.getParameter(request,"res_name") + "_list");
						list_process.setDATA_DATASOURCE(RequestUtil.getParameter(request,"res_jndi"));
						String list_column = strColumn;
						strSQL = "";
						strColumn = "";
						strParam = "";
						list_process.setTYPE("SQL");
                                                       list_process.setOWNER(owner);
						String list = dxd.getData("list");
						String[] arr_list = list.split(",");
						
						String strListCondition = " WHERE ";
						if(arr_list != null && arr_list.length != 0)
						{
							for(int i = 0 , j = 0 ;i < arr_list.length;i++)
							{
								String strKeyField = arr_list[i];
								String strFieldValue = fields.getFieldType(strKeyField);
								ExceptionCenter.debug("LIST FIELD==>" + strFieldValue + "/" + strKeyField + "/"  + i);
								if(BusinessHelper.checkBusinessNull(strFieldValue))
								{
									if(j == 0)
									{
										strListCondition =  strListCondition + strKeyField + " = ? ";
									}
									else
									{
										strListCondition =  strListCondition + " AND " + strKeyField + " = ? ";
									}
									j++;
									ExceptionCenter.debug("LIST FIND");
								}
							}
						}
						else
						{
							strListCondition = "";
						}
						strSQL = "SELECT " + list_column + " FROM " + RequestUtil.getParameter(request,"res_name") + strKeyFieldCondition;
						list_process.setSQL(strSQL);
						if(arr_key != null && arr_key.length != 0)
						{
							for(int i = 0; i < arr_key.length ; i++)
							{
								list_process.addField(arr_key[i],fields.getFieldType(arr_key[i]),"");
							}
						}
						
						//------------------------------------------------------
						// SAVE 프로세스
						//------------------------------------------------------
						businessCollection.addBusinessData(insert_process);
						businessCollection.addBusinessData(update_process);
						businessCollection.addBusinessData(delete_process);
						businessCollection.addBusinessData(read_process);
						businessCollection.addBusinessData(list_process);
						xmlResource.addBusinessCollection(businessCollection);
						xmlResource.save(businessCollection);
						dxd.set("Business.Service.Name",businessCollection.getBusinessName());
						res.save(col);
					}
				}
			}
		}
		else if(strCode.equals("create_rest_service"))
		{
			ExceptionCenter.debug("############################## REST SERVICE START #####################################");
			if(BusinessHelper.checkBusinessNull(RequestUtil.getParameter(request,"res_key")))
			{
				
				DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(RequestUtil.getParameter(request,"res_key"));
				if(col != null)
				{
					DefaultXmlData dxd = col.getDefaultXmlData(RequestUtil.getParameter(request,"res_name")); 
					if(dxd != null)
					{
						WebActionXmlResource waXmlResource = WebActionXmlResource.getInstance();
						AutoSeq autoseq = new AutoSeq();
						String wac_name = autoseq.getWACollectionSeq();
						String wa_name = autoseq.getWActionSeq();
						WebActionCollection wac = waXmlResource.createActionCollection(wac_name);
						waXmlResource.createAction(wac_name
								 , "REST 서비스 WAC - " + RequestUtil.getParameter(request,"res_name")										 
								 , wa_name
								 , "REST 서비스 WA - " + RequestUtil.getParameter(request,"res_name")
								 , autoseq.getCommandSeq()
								 , "REST 서비스 자동 생성"
								 );
						WebAction action = waXmlResource.searchWebActionEqualsName(wa_name);
						if(action != null)
						{
							action.setACTION_CLASS("com.stuko.anaconda.action.XCAction");
							action.setCOMMAND(autoseq.getCommandSeq());
							action.setFORWARD_TYPE("VIEW");
							action.setISAUTH("N");
							action.setFILTER_IGNORE("N");
							action.setBIZ_SERVICE(dxd.getData("Business.Service.Name"));
                                                                action.setOWNER(owner);
						}
						waXmlResource.save(wac);
					}
				}
			}
			ExceptionCenter.debug("############################## REST SERVICE END #####################################");
		}
		else if(strCode.equals("update"))
		{
			DefaultXmlDataCollection col = res.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES);
			if(col != null)
			{
				DefaultXmlData dxd = col.getDefaultXmlData(strKey);
				dxd.setTYPE("RES");
				dxd.set("res_type",strType);
				dxd.set("res_name",strName);
				dxd.set("res_value",strValue);
				res.save(col);
			}
			strRtn = res.httpXmlData(businessData,col);
		}
		else if(strCode.equals("search"))
		{
			DefaultXmlResource resource = DefaultXmlResource.getInstance();
			DefaultXmlData data = null;
			DefaultXmlDataCollection dxdc = null;
			DefaultXmlDataCollection collection = new DefaultXmlDataCollection("Response");
			dxdc = resource.getDefaultXmlDataCollection(com.stuko.anaconda.value.BlankField.ANACONDA_RES);
			Iterator subIt = dxdc.iterator();
			for(;subIt.hasNext();)
			{
				data = (DefaultXmlData)subIt.next();
				if(data.toString().indexOf(strSearch) >= 0)
				{
					collection.addDefaultXmlData(data);
				}
			}
			strRtn = resource.httpXmlData(businessData,collection);
			// System.out.println(strRtn);
		}
		out.print(strRtn);
	}
	catch (Exception e) 
	{
		e.printStackTrace();
	}
%>
