<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
{
  "container" : "TXPContainer",
  "exist" : "true",
  "configuration" : {
    "FLOWS" : [
      {
        "MSG_TYPE": "msgType",
        "FLOW_NAME": "KAKAO.FLOW",
        "FLOW_TYPE": "sync",
        "IS_MERGE" : "true",
        "FLOW": [
          "TranslateContainer",
          "ProfileContainer",
          "IntentContainer",
          "SimpleAnalysisContainer",
          "DunaRuleContainer",
          "RecoverContainer",
          "StoreContainer,async"
        ]
      }
    ]  
  }
}
