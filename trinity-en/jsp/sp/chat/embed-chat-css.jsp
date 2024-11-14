<%@ page contentType="text/css; charset=UTF-8" pageEncoding="UTF-8" %>

@import url(https://fonts.googleapis.com/earlyaccess/nanumgothic.css);
@import url(https://fonts.googleapis.com/earlyaccess/nanummyeongjo.css);
@import url(https://fonts.googleapis.com/earlyaccess/nanumgothiccoding.css);


.text-center {
    text-align: left!important;
}

/* width */
.chat ::-webkit-scrollbar {
  width: 3px;
}

/* Track */
.chat ::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px #4285F4; 
  border-radius: 10px;
}
 
/* Handle */
.chat ::-webkit-scrollbar-thumb {
  background: #4285F4; 
  border-radius: 10px;
}

/* Handle on hover */
.chat ::-webkit-scrollbar-thumb:hover {
  background: #4285F4; 
}

.close-chat {
  z-index: 20;
  position: absolute;
  right: 8%;
  top: 17%;
  width: 22px;
  height: 22px;
  opacity: 0.3;
}
.close-chat:hover {
  opacity: 0.8;
}
.close-chat:before, .close-chat:after {
  position: absolute;
  left: 15px;
  content: ' ';
  height: 23px;
  width: 2px;
  background-color: #C7FDFE;
}
.close-chat:before {
  transform: rotate(45deg);
}
.close-chat:after {
  transform: rotate(-45deg);
}


/* ---------------------------------------- */


.chat-widget-wrapper {
  display: block;
  width: 300px;
  height: 62px;
  position: absolute;
  bottom: 20px;
  right: 0;
  padding: 10px;

  cursor: pointer;
  animation: all 2s linear; }

.chat-widget-container {
  position: relative;
  padding: 10px;
/*background-color: #fff;*/
  border-radius: 4px; }

  .chat-widget-container.open {
    border-top-right-radius: 0;
    border-top-left-radius: 0; }

  .chat-widget-container .chat-widget-text p {
    margin: 0 auto;
    color: #808080; }

    .chat-widget-container .chat-widget-text p.heading {
      color: #00aeef;
      font-weight: 600; }

.chat-widget-avatar {
  width: 80px;
  height: 80px;
  position: absolute;
  top: -11px;
  right: 30px;
  background-color: #fff;
  border: 4px solid #fff;
  border-radius: 50%; }

.chat-box-container {
  position: absolute;
  width: 300px;
  height: 0;
  background-color: #f1f1f1;
  bottom: 10px;
  border-top-right-radius: 4px;
  border-top-left-radius: 4px;
  overflow: hidden;
  -webkit-transition: all 0.2s ease 0s;
  -moz-transition: all 0.2s ease 0s;
  -ms-transition: all 0.2s ease 0s;
  -o-transition: all 0.2s ease 0s;
  transition: all 0.2s ease 0s;
  z-index: 1000; }

  .chat-box-container.show {
    bottom: 72px;
    height: 300px; }

  .chat-box-container .chat-box-nav {
    background-color: #00aeef;
    width: 100%;
    height: 40px; }



@grey: #e5e5ea;
@blue: #1289fe;

blockquote {
  margin: 0 auto;
  max-width: 320px;
}

p {
  margin: 0 0 0.5em;
  border-radius: 1em;
  padding: 0.5em 1em;
  background: @grey;
  max-width: 75%;
  clear: both;
  position: relative;
  
  &.them {
    float: left;
    
    &::after {
      content: "";
      position: absolute;
      left: -0.5em;
      bottom: 0;
      width: 0.5em;
      height: 1em;
      border-right: 0.5em solid @grey;
      border-bottom-right-radius: 1em 0.5em;
    }
  }
  
  &.me {
    float: right;
    background-color: @blue;
    color: white;
   
    &::after {
      content: "";
      position: absolute;
      right: -0.5em;
      bottom: 0;
      width: 0.5em;
      height: 1em;
      border-left: 0.5em solid @blue;
      border-bottom-left-radius: 1em 0.5em;
    }
  }
}





/*--------------------
Mixins
--------------------*/
/*--------------------
Body
--------------------*/
/*--------------------
Chat
--------------------*/
.chat {
  font-family:'NanumBarunGothic', 'serif';
  position: relative;
  /*  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);*/
  width: 100%;
  height: 100%;
  max-height: 520px;
  z-index: 10000;
  overflow: hidden;
  /*box-shadow: 0 5px 30px rgba(0, 0, 0, .2);*/
  /* background: #4285F4; */
  background: transparent;
  border-radius: 8px;
  /* -webkit-border-radius: 20px; */
  -moz-border-radius: 20px;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
  }

/*--------------------
Chat Title
--------------------*/
.chat-title {
  //flex: 0 1 45px;
  position: relative;
  z-index: 10000;
  width: 100%;
  height: 50px; 
  border-bottom: 1px solid #ccc;
  color: #777;
  padding-top: 5px;
  padding-bottom: 5px;
  background-color: #4285F4;
  text-transform: uppercase;
  text-align: center;
  }
  .chat-title h1,
  .chat-title h2 {
    font-weight: normal;
    font-size: 14px;
    margin: 0;
    padding: 0; }
  .chat-title h2 {
    /* color: rgba(255, 255, 255, .8);*/
    font-size: 11px;
    letter-spacing: 1px; }
  .chat-title .avatar {
    position: absolute;
    z-index: 10000;
    top: 8px;
    left: 9px;
    -webkit-border-radius: 30px;
    -moz-border-radius: 30px;
    border-radius: 30px;
    width: 60px;
    height: 60px;
    overflow: hidden;
    margin: 0;
    padding: 0;
    border: 1px solid #fff; }
    .chat-title .avatar img {
      width: 100%;
      height: auto; }

/*--------------------
Messages
--------------------*/
.messages {
  // background:url('/jsp/sp/img/duna-bg-1457.png');
  background:url('/jsp/sp/img/duna_chat_bg.png');
  flex: 1 1 auto;
  z-index:10000;
  /*  color: rgba(255, 255, 255, .5);
  color: #fff;*/
  overflow: hidden;
  position: relative;
  width: 100%; }
  .messages .messages-content {
    padding-bottom: 10px;
    position: absolute;
    top: 0;
    left: 0;
    height: 101%;
    width: 100%; }
  .messages .message {
    clear: both;
    float: left;
    padding: 6px 10px 7px;
    -webkit-border-radius: 20px 20px 20px 0;
    -moz-border-radius: 20px 20px 20px 0;
    border-radius: 20px 20px 20px 0;
    /* background: #eee; */
    background: #fff;
    /*rgba(0, 0, 0, 0.1);*/
    margin: 8px 0;
    font-size: 14px;
    line-height: 1.4;
    margin-left: 35px;
    margin-bottom: 20px;
    position: relative;
    border: 1px solid #ccc;
    /*text-shadow: 0 1px 1px rgba(0, 0, 0, .2);*/ }
    .messages .message .talker {
      position: absolute;
      bottom: -15px;
      font-size: 10px;
      color: #555;
      right: 65px;
      /* color: rgba(255, 255, 255, .7);*/ }
    .messages .message .timestamp {
      position: absolute;
      bottom: -15px;
      font-size: 10px;
      color: #555;
      right: 30px;
      /* color: rgba(255, 255, 255, .7);*/ }

    .messages .message .checkmark-sent-delivered {
      position: absolute;
      bottom: -15px;
      right: 10px;
      font-size: 12px;
      color: #999; }
    .messages .message .checkmark-read {
      color: blue;
      position: absolute;
      bottom: -15px;
      right: 16px;
      font-size: 12px; }
    .messages .message::before {
      /*  content: '';
      position: absolute;
      bottom: -6px;
      border-top: 6px solid rgba(0, 0, 0, 0.1);
      left: 0;
      border-right: 7px solid transparent;*/ }
    .messages .message .avatar {
      position: absolute;
      z-index: 10000;
      bottom: -15px;
      left: -35px;
      -webkit-border-radius: 30px;
      -moz-border-radius: 30px;
      border-radius: 30px;
      width: 30px;
      height: 30px;
      overflow: hidden;
      margin: 0;
      padding: 0;
      border: 2px solid rgba(255, 255, 255, 0.5); }
      .messages .message .avatar img {
        width: 100%;
        height: auto; }
    .messages .message.message-personal {
      float: right;
      text-align: right;
      /*      background: linear-gradient(120deg, #ddd, #eee);*/
      background: #fff;
      border: 1px solid #ccc;
      -webkit-border-radius: 20px 20px 0 20px;
      -moz-border-radius: 20px 20px 0 20px;
      border-radius: 20px 20px 0 20px; }
      .messages .message.message-personal::before {
        /*
          content:"";
      border-color:#4A90E2 transparent;
        width:0;
        border-style:solid;*/
        /*
        left: auto;
        right: 0;
        border-right: none;
       border-left: 8px solid transparent;
        border-top: 9px solid #fff;
        
        bottom: -8px;*/ }
    .messages .message:last-child {
      margin-bottom: 30px; }
    .messages .message.new {
      transform: scale(0);
      transform-origin: 0 0;
      animation: bounce 500ms linear both; }
    .messages .message.loading::before {
      position: relative;
      /*  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);*/
      content: '';
      display: block;
      width: 5px;
      height: 5px;
      border-radius: 50%;
      /*  background: rgba(255, 255, 255, .5);*/
      background: #888;
      z-index: 1000;
      margin-top: 4px;
      animation: ball 0.45s cubic-bezier(0, 0, 0.15, 1) alternate infinite;
      border: none;
      animation-delay: .15s; }
    .messages .message.loading span {
      display: block;
      font-size: 0;
      width: 20px;
      height: 10px;
      position: relative; }
      .messages .message.loading span::before {
        position: relative;
        /*  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);*/
        content: '';
        display: block;
        width: 5px;
        height: 5px;
        border-radius: 50%;
        /*  background: rgba(255, 255, 255, .5);*/
        background: #888;
        z-index: 1000;
        margin-top: 4px;
        animation: ball 0.45s cubic-bezier(0, 0, 0.15, 1) alternate infinite;
        margin-left: -7px; }
      .messages .message.loading span::after {
        position: relative;
        /*  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);*/
        content: '';
        display: block;
        width: 5px;
        height: 5px;
        border-radius: 50%;
        /*  background: rgba(255, 255, 255, .5);*/
        background: #888;
        z-index: 1000;
        margin-top: 4px;
        animation: ball 0.45s cubic-bezier(0, 0, 0.15, 1) alternate infinite;
        margin-left: 7px;
        animation-delay: .3s; }

/*--------------------
Message Box
--------------------*/
.message-box {
  flex: 0 1 42px;
  /* width: 88%; */
  border : none;
  background: #4285F4;
  /* margin: 9px 9px 9px 9px; */
  /*-webkit-box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);
-moz-box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);
box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);*/
  /*background: rgba(0, 0, 0, 0.3);
    border-top:1px solid #e3e3e3;*/
  padding: 10px;
  position: relative;
  /* -webkit-border-radius: 20px; */
  -moz-border-radius: 20px;
  /* border-radius: 8px; */
  /* height: 14px; */
  /* border: 1px solid #ccc; */
}
  .message-box .duna-input {
    background: none;
    border: none;
    padding : 0px 0px 0px 6px;
    outline: none !important;
    resize: none;
    /* color: rgba(255, 255, 255, .8);*/
    font-size: 15px;
    height: 29px ;
    // line-height : 1;
    margin-top: 5px;
    // padding-right: 10px !important;
    width: 75% ;
    color: #444;
    background: #FFFFFF;
    border-radius: 4px;
    }
  .message-box textarea:focus:-webkit-placeholder {
    color: transparent; }
  .message-box .message-submit {
    position: absolute;
    z-index: 999;
    top: 15px;
    right: 10px;
    color: #4A90E2;
    border: none;
    /* background: #c29d5f;*/
    background: #fff;
    width: 18% !important;
    font-size: 12px;
    text-transform: uppercase;
    line-height: 1;
    padding: 8px 10px;
    border-radius: 5px;
    outline: none !important;
    transition: background .2s ease;
    cursor: pointer; }
    .message-box .message-submit:hover {
      background: #fff;
      color: #333; }

/*--------------------
Custom Srollbar
--------------------*/
.mCSB_scrollTools {
  margin: 1px -3px 1px 0;
  opacity: 0; }

.mCSB_inside > .mCSB_container {
  margin-right: 0px;
  padding: 0 10px; }

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar {
  background-color: rgba(0, 0, 0, 0.5) !important; }

/*--------------------
Bounce
--------------------*/
@keyframes bounce {
  0% {
    transform: matrix3d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  4.7% {
    transform: matrix3d(0.45, 0, 0, 0, 0, 0.45, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  9.41% {
    transform: matrix3d(0.883, 0, 0, 0, 0, 0.883, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  14.11% {
    transform: matrix3d(1.141, 0, 0, 0, 0, 1.141, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  18.72% {
    transform: matrix3d(1.212, 0, 0, 0, 0, 1.212, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  24.32% {
    transform: matrix3d(1.151, 0, 0, 0, 0, 1.151, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  29.93% {
    transform: matrix3d(1.048, 0, 0, 0, 0, 1.048, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  35.54% {
    transform: matrix3d(0.979, 0, 0, 0, 0, 0.979, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  41.04% {
    transform: matrix3d(0.961, 0, 0, 0, 0, 0.961, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  52.15% {
    transform: matrix3d(0.991, 0, 0, 0, 0, 0.991, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  63.26% {
    transform: matrix3d(1.007, 0, 0, 0, 0, 1.007, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  85.49% {
    transform: matrix3d(0.999, 0, 0, 0, 0, 0.999, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); }
  100% {
    transform: matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1); } }

@keyframes ball {
  from {
    transform: translateY(0) scaleY(0.8); }
  to {
    transform: translateY(-10px); } }

.avenue-messenger {
  opacity: 1;
  -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  border-radius: 20px;
  height: calc(100% - 60px) !important;
  max-height: 520px !important;
  min-height: 220px !important;
  width: 320px;
  /*  transform: translateY(0);
    -webkit-transform: translateY(0);
    -moz-transform: translateY(0);
  */
  background: rgba(255, 255, 255, 0.9);
  position: fixed;
  right: 20px;
  bottom: 20px;
  margin: auto;
  z-index: 10;
  box-shadow: 2px 10px 40px rgba(22, 20, 19, 0.4);
  /*  transform: translateX(300px);*/
  -webkit-transition: 0.3s all ease-out 0.1s, transform 0.2s ease-in;
  -moz-transition: 0.3s all ease-out 0.1s, transform 0.2s ease-in; }

.avenue-messenger div.agent-face {
  position: absolute;
  left: 0;
  top: -50px;
  right: 0;
  margin: auto;
  width: 101px;
  height: 50px;
  background: transparent;
  z-index: 12; 
}

.avenue-messenger div {
  font-size: 14px;
  color: #232323; }

.circle {
  display: block;
  width: 80px;
  height: 80px;
  margin: 1em auto;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  -webkit-border-radius: 99em;
  -moz-border-radius: 99em;
  border-radius: 99em;
  border: 2px solid #fff;
  /*#4A90E2;*/
  /* -webkit-box-shadow: 0px 0px 10px rgba(0,0,0,.8);
  -moz-box-shadow: 0px 0px 10px rgba(0,0,0,.8);
box-shadow: 0px 0px 10px rgba(0,0,0,.8);*/ }

.contact-icon .circle:hover {
  box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
  -webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
  -moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);
  transition: 0.2s all ease-out 0.2s;
  -webkit-transition: 0.2s all ease-out 0.2s;
  -moz-transition: 0.2s all ease-out 0.2s; }

.arrow_box:after {
  border-color: rgba(255, 255, 255, 0);
  border-left-color: #fff;
  border-width: 5px;
  margin-top: -5px; }

.arrow_box {
  position: relative;
  background: #fff;
  border: 1px solid #4A90E2; }

.arrow_box:after, .arrow_box:before {
  left: 100%;
  top: 50%;
  border: solid transparent;
  content: " ";
  height: 0;
  width: 0;
  position: absolute;
  pointer-events: none; }

.menu div.items {
  /*  height: 140px;
  width: 180px;
  overflow: hidden;
  position: absolute;
  left: -130px;
  z-index: 2;
  top: 20px;*/ }

.menu .items span {
  color: #111;
  z-index: 12;
  font-size: 14px;
  text-align: center;
  position: absolute;
  right: 0;
  top: 40px;
  height: 86px;
  line-height: 40px;
  background: #fff;
  border-left: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  border-right: 1px solid #ccc;
  width: 48px;
  opacity: 0;
  border-bottom-left-radius: 20px;
  border-bottom-right-radius: 20px;
  transition: .3s all ease-in-out;
  -webkit-transition: .3s all ease-in-out;
  -moz-transition: .3s all ease-in-out; }

.menu .button {
  font-size: 30px;
  z-index: 12;
  text-align: right;
  color: #333;
  content: "...";
  display: block;
  width: 48px;
  line-height: 25px;
  height: 40px;
  border-top-right-radius: 20px;
  /*  border-top-left-radius:20px;*/
  position: absolute;
  right: 0;
  padding-right: 10px;
  cursor: pointer;
  transition: .3s all ease-in-out;
  -webkit-transition: .3s all ease-in-out;
  -moz-transition: .3s all ease-in-out; }

.menu .button.active {
  background: #ccc; }

/*
.menu .button:hover .menu .items span {
  display: block;
  left: -2px;
  opacity: 1;
}*/
.menu .items span.active {
  opacity: 1;
  /*border-radius:10px;
  height: 180px;
  width: 400px;
  transform:translateY(0);
  -webkit-transform:translateY(0);
  -moz-transform:translateY(0);*/ }

.menu .items a {
  color: #111;
  text-decoration: none; }

.menu .items a:hover {
  color: #777; }

@media only screen and (max-device-width: 667px), screen and (max-width: 450px) {
  .avenue-messenger {
    z-index: 2147483001 !important;
    width: 100% !important;
    height: 100% !important;
    max-height: none !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    -webkit-border-radius: 0 !important;
    -moz-border-radius: 0 !important;
    border-radius: 0 !important;
    background: #fff; }
  .avenue-messenger div.agent-face {
    top: -10px !important;
    /* left:initial !important;*/ }
  .chat {
    -webkit-border-radius: 0 !important;
    -moz-border-radius: 0 !important;
    border-radius: 0 !important;
    max-height: initial !important; }
  .chat-title {
    padding: 20px 20px 15px 10px !important;
   }
  .circle {
    width: 80px;
    height: 20px;
    border: 1px solid #fff; }
  .menu .button {
    border-top-right-radius: 0; } }

@media only screen and (min-device-width: 667px) {
  div.half {
    margin: auto;
    width: 80px;
    height: 40px;
    background-color: #fff;
    border-top-left-radius: 60px;
    border-top-right-radius: 60px;
    border-bottom: 0;
    box-shadow: 1px 4px 20px rgba(22, 20, 19, 0.6);
    -webkit-box-shadow: 1px 4px 20px rgba(22, 20, 19, 0.6);
    -moz-box-shadow: 1px 4px 20px rgba(22, 20, 19, 0.6); } }



#floating-button{
  width: 55px;
  height: 55px;
  border-radius: 50%;
  background: #4285F4;
  position: fixed;
  bottom: 30px;
  right: 30px;
  cursor: pointer;
  // box-shadow: 1px 2px 1px #C5BBB8;
}

.plus{
  color: white;
  position: absolute;
  top: 0;
  display: block;
  bottom: 0;
  left: 0;
  right: 0;
  text-align: center;
  padding: 0;
  margin: 0;
  line-height: 55px;
  font-size: 38px;
  font-family: 'Roboto';
  font-weight: 300;
  animation: plus-out 0.3s;
  transition: all 0.3s;
}




/*
== malihu jquery custom scrollbar plugin ==
Plugin URI: http://manos.malihu.gr/jquery-custom-content-scroller
*/



/*
CONTENTS: 
	1. BASIC STYLE - Plugin's basic/essential CSS properties (normally, should not be edited). 
	2. VERTICAL SCROLLBAR - Positioning and dimensions of vertical scrollbar. 
	3. HORIZONTAL SCROLLBAR - Positioning and dimensions of horizontal scrollbar.
	4. VERTICAL AND HORIZONTAL SCROLLBARS - Positioning and dimensions of 2-axis scrollbars. 
	5. TRANSITIONS - CSS3 transitions for hover events, auto-expanded and auto-hidden scrollbars. 
	6. SCROLLBAR COLORS, OPACITY AND BACKGROUNDS 
		6.1 THEMES - Scrollbar colors, opacity, dimensions, backgrounds etc. via ready-to-use themes.
*/



/* 
------------------------------------------------------------------------------------------------------------------------
1. BASIC STYLE  
------------------------------------------------------------------------------------------------------------------------
*/

.mCustomScrollbar{ -ms-touch-action: pinch-zoom; touch-action: pinch-zoom; /* direct pointer events to js */ }
.mCustomScrollbar.mCS_no_scrollbar, .mCustomScrollbar.mCS_touch_action{ -ms-touch-action: auto; touch-action: auto; }

.mCustomScrollBox{ /* contains plugin's markup */
	position: relative;
	overflow: hidden;
	height: 100%;
	max-width: 100%;
	outline: none;
	direction: ltr;
}

.mCSB_container{ /* contains the original content */
	overflow: hidden;
	width: auto;
	height: auto;
}



/* 
------------------------------------------------------------------------------------------------------------------------
2. VERTICAL SCROLLBAR 
y-axis
------------------------------------------------------------------------------------------------------------------------
*/

.mCSB_inside > .mCSB_container{ margin-right: 30px; }

.mCSB_container.mCS_no_scrollbar_y.mCS_y_hidden{ margin-right: 0; } /* non-visible scrollbar */

.mCS-dir-rtl > .mCSB_inside > .mCSB_container{ /* RTL direction/left-side scrollbar */
	margin-right: 0;
	margin-left: 30px;
}

.mCS-dir-rtl > .mCSB_inside > .mCSB_container.mCS_no_scrollbar_y.mCS_y_hidden{ margin-left: 0; } /* RTL direction/left-side scrollbar */

.mCSB_scrollTools{ /* contains scrollbar markup (draggable element, dragger rail, buttons etc.) */
	position: absolute;
	width: 16px;
	height: auto;
	left: auto;
	top: 0;
	right: 0;
	bottom: 0;
}

.mCSB_outside + .mCSB_scrollTools{ right: -26px; } /* scrollbar position: outside */

.mCS-dir-rtl > .mCSB_inside > .mCSB_scrollTools, 
.mCS-dir-rtl > .mCSB_outside + .mCSB_scrollTools{ /* RTL direction/left-side scrollbar */
	right: auto;
	left: 0;
}

.mCS-dir-rtl > .mCSB_outside + .mCSB_scrollTools{ left: -26px; } /* RTL direction/left-side scrollbar (scrollbar position: outside) */

.mCSB_scrollTools .mCSB_draggerContainer{ /* contains the draggable element and dragger rail markup */
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0; 
	height: auto;
}

.mCSB_scrollTools a + .mCSB_draggerContainer{ margin: 20px 0; }

.mCSB_scrollTools .mCSB_draggerRail{
	width: 2px;
	height: 100%;
	margin: 0 auto;
	-webkit-border-radius: 16px; -moz-border-radius: 16px; border-radius: 16px;
}

.mCSB_scrollTools .mCSB_dragger{ /* the draggable element */
	cursor: pointer;
	width: 100%;
	height: 30px; /* minimum dragger height */
	z-index: 1;
}

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ /* the dragger element */
	position: relative;
	width: 4px;
	height: 100%;
	margin: 0 auto;
	-webkit-border-radius: 16px; -moz-border-radius: 16px; border-radius: 16px;
	text-align: center;
}

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar{ width: 12px; /* auto-expanded scrollbar */ }

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{ width: 8px; /* auto-expanded scrollbar */ }

.mCSB_scrollTools .mCSB_buttonUp,
.mCSB_scrollTools .mCSB_buttonDown{
	display: block;
	position: absolute;
	height: 20px;
	width: 100%;
	overflow: hidden;
	margin: 0 auto;
	cursor: pointer;
}

.mCSB_scrollTools .mCSB_buttonDown{ bottom: 0; }



/* 
------------------------------------------------------------------------------------------------------------------------
3. HORIZONTAL SCROLLBAR 
x-axis
------------------------------------------------------------------------------------------------------------------------
*/

.mCSB_horizontal.mCSB_inside > .mCSB_container{
	margin-right: 0;
	margin-bottom: 30px;
}

.mCSB_horizontal.mCSB_outside > .mCSB_container{ min-height: 100%; }

.mCSB_horizontal > .mCSB_container.mCS_no_scrollbar_x.mCS_x_hidden{ margin-bottom: 0; } /* non-visible scrollbar */

.mCSB_scrollTools.mCSB_scrollTools_horizontal{
	width: auto;
	height: 16px;
	top: auto;
	right: 0;
	bottom: 0;
	left: 0;
}

.mCustomScrollBox + .mCSB_scrollTools.mCSB_scrollTools_horizontal,
.mCustomScrollBox + .mCSB_scrollTools + .mCSB_scrollTools.mCSB_scrollTools_horizontal{ bottom: -26px; } /* scrollbar position: outside */

.mCSB_scrollTools.mCSB_scrollTools_horizontal a + .mCSB_draggerContainer{ margin: 0 20px; }

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	width: 100%;
	height: 2px;
	margin: 7px 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_dragger{
	width: 30px; /* minimum dragger width */
	height: 100%;
	left: 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	width: 100%;
	height: 4px;
	margin: 6px auto;
}

.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar{
	height: 12px; /* auto-expanded scrollbar */
	margin: 2px auto;
}

.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{
	height: 8px; /* auto-expanded scrollbar */
	margin: 4px 0;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonLeft,
.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonRight{
	display: block;
	position: absolute;
	width: 20px;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
	cursor: pointer;
}

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonLeft{ left: 0; }

.mCSB_scrollTools.mCSB_scrollTools_horizontal .mCSB_buttonRight{ right: 0; }



/* 
------------------------------------------------------------------------------------------------------------------------
4. VERTICAL AND HORIZONTAL SCROLLBARS 
yx-axis 
------------------------------------------------------------------------------------------------------------------------
*/

.mCSB_container_wrapper{
	position: absolute;
	height: auto;
	width: auto;
	overflow: hidden;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	margin-right: 30px;
	margin-bottom: 30px;
}

.mCSB_container_wrapper > .mCSB_container{
	padding-right: 30px;
	padding-bottom: 30px;
	-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;
}

.mCSB_vertical_horizontal > .mCSB_scrollTools.mCSB_scrollTools_vertical{ bottom: 20px; }

.mCSB_vertical_horizontal > .mCSB_scrollTools.mCSB_scrollTools_horizontal{ right: 20px; }

/* non-visible horizontal scrollbar */
.mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden + .mCSB_scrollTools.mCSB_scrollTools_vertical{ bottom: 0; }

/* non-visible vertical scrollbar/RTL direction/left-side scrollbar */
.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden + .mCSB_scrollTools ~ .mCSB_scrollTools.mCSB_scrollTools_horizontal, 
.mCS-dir-rtl > .mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside > .mCSB_scrollTools.mCSB_scrollTools_horizontal{ right: 0; }

/* RTL direction/left-side scrollbar */
.mCS-dir-rtl > .mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside > .mCSB_scrollTools.mCSB_scrollTools_horizontal{ left: 20px; }

/* non-visible scrollbar/RTL direction/left-side scrollbar */
.mCS-dir-rtl > .mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside > .mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden + .mCSB_scrollTools ~ .mCSB_scrollTools.mCSB_scrollTools_horizontal{ left: 0; }

.mCS-dir-rtl > .mCSB_inside > .mCSB_container_wrapper{ /* RTL direction/left-side scrollbar */
	margin-right: 0;
	margin-left: 30px;
}

.mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden > .mCSB_container{ padding-right: 0; }

.mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden > .mCSB_container{ padding-bottom: 0; }

.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside > .mCSB_container_wrapper.mCS_no_scrollbar_y.mCS_y_hidden{
	margin-right: 0; /* non-visible scrollbar */
	margin-left: 0;
}

/* non-visible horizontal scrollbar */
.mCustomScrollBox.mCSB_vertical_horizontal.mCSB_inside > .mCSB_container_wrapper.mCS_no_scrollbar_x.mCS_x_hidden{ margin-bottom: 0; }



/* 
------------------------------------------------------------------------------------------------------------------------
5. TRANSITIONS  
------------------------------------------------------------------------------------------------------------------------
*/

.mCSB_scrollTools, 
.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCSB_scrollTools .mCSB_buttonUp,
.mCSB_scrollTools .mCSB_buttonDown,
.mCSB_scrollTools .mCSB_buttonLeft,
.mCSB_scrollTools .mCSB_buttonRight{
	-webkit-transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
	-moz-transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
	-o-transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
	transition: opacity .2s ease-in-out, background-color .2s ease-in-out;
}

.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger_bar, /* auto-expanded scrollbar */
.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerRail, 
.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger_bar, 
.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerRail{
	-webkit-transition: width .2s ease-out .2s, height .2s ease-out .2s, 
				margin-left .2s ease-out .2s, margin-right .2s ease-out .2s, 
				margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s,
				opacity .2s ease-in-out, background-color .2s ease-in-out; 
	-moz-transition: width .2s ease-out .2s, height .2s ease-out .2s, 
				margin-left .2s ease-out .2s, margin-right .2s ease-out .2s, 
				margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s,
				opacity .2s ease-in-out, background-color .2s ease-in-out; 
	-o-transition: width .2s ease-out .2s, height .2s ease-out .2s, 
				margin-left .2s ease-out .2s, margin-right .2s ease-out .2s, 
				margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s,
				opacity .2s ease-in-out, background-color .2s ease-in-out; 
	transition: width .2s ease-out .2s, height .2s ease-out .2s, 
				margin-left .2s ease-out .2s, margin-right .2s ease-out .2s, 
				margin-top .2s ease-out .2s, margin-bottom .2s ease-out .2s,
				opacity .2s ease-in-out, background-color .2s ease-in-out; 
}



/* 
------------------------------------------------------------------------------------------------------------------------
6. SCROLLBAR COLORS, OPACITY AND BACKGROUNDS  
------------------------------------------------------------------------------------------------------------------------
*/

/* 
----------------------------------------
6.1 THEMES 
----------------------------------------
*/

/* default theme ("light") */

.mCSB_scrollTools{ opacity: 0.75; filter: "alpha(opacity=75)"; -ms-filter: "alpha(opacity=75)"; }

.mCS-autoHide > .mCustomScrollBox > .mCSB_scrollTools,
.mCS-autoHide > .mCustomScrollBox ~ .mCSB_scrollTools{ opacity: 0; filter: "alpha(opacity=0)"; -ms-filter: "alpha(opacity=0)"; }

.mCustomScrollbar > .mCustomScrollBox > .mCSB_scrollTools.mCSB_scrollTools_onDrag,
.mCustomScrollbar > .mCustomScrollBox ~ .mCSB_scrollTools.mCSB_scrollTools_onDrag,
.mCustomScrollBox:hover > .mCSB_scrollTools,
.mCustomScrollBox:hover ~ .mCSB_scrollTools,
.mCS-autoHide:hover > .mCustomScrollBox > .mCSB_scrollTools,
.mCS-autoHide:hover > .mCustomScrollBox ~ .mCSB_scrollTools{ opacity: 1; filter: "alpha(opacity=100)"; -ms-filter: "alpha(opacity=100)"; }

.mCSB_scrollTools .mCSB_draggerRail{
	background-color: #000; background-color: rgba(0,0,0,0.4);
	filter: "alpha(opacity=40)"; -ms-filter: "alpha(opacity=40)"; 
}

.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-color: #fff; background-color: rgba(255,255,255,0.75);
	filter: "alpha(opacity=75)"; -ms-filter: "alpha(opacity=75)"; 
}

.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{
	background-color: #fff; background-color: rgba(255,255,255,0.85);
	filter: "alpha(opacity=85)"; -ms-filter: "alpha(opacity=85)"; 
}
.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{
	background-color: #fff; background-color: rgba(255,255,255,0.9);
	filter: "alpha(opacity=90)"; -ms-filter: "alpha(opacity=90)"; 
}

.mCSB_scrollTools .mCSB_buttonUp,
.mCSB_scrollTools .mCSB_buttonDown,
.mCSB_scrollTools .mCSB_buttonLeft,
.mCSB_scrollTools .mCSB_buttonRight{
	background-image: url(mCSB_buttons.png); /* css sprites */
	background-repeat: no-repeat;
	opacity: 0.4; filter: "alpha(opacity=40)"; -ms-filter: "alpha(opacity=40)"; 
}

.mCSB_scrollTools .mCSB_buttonUp{
	background-position: 0 0;
	/* 
	sprites locations 
	light: 0 0, -16px 0, -32px 0, -48px 0, 0 -72px, -16px -72px, -32px -72px
	dark: -80px 0, -96px 0, -112px 0, -128px 0, -80px -72px, -96px -72px, -112px -72px
	*/
}

.mCSB_scrollTools .mCSB_buttonDown{
	background-position: 0 -20px;
	/* 
	sprites locations
	light: 0 -20px, -16px -20px, -32px -20px, -48px -20px, 0 -92px, -16px -92px, -32px -92px
	dark: -80px -20px, -96px -20px, -112px -20px, -128px -20px, -80px -92px, -96px -92px, -112 -92px
	*/
}

.mCSB_scrollTools .mCSB_buttonLeft{
	background-position: 0 -40px;
	/* 
	sprites locations 
	light: 0 -40px, -20px -40px, -40px -40px, -60px -40px, 0 -112px, -20px -112px, -40px -112px
	dark: -80px -40px, -100px -40px, -120px -40px, -140px -40px, -80px -112px, -100px -112px, -120px -112px
	*/
}

.mCSB_scrollTools .mCSB_buttonRight{
	background-position: 0 -56px;
	/* 
	sprites locations 
	light: 0 -56px, -20px -56px, -40px -56px, -60px -56px, 0 -128px, -20px -128px, -40px -128px
	dark: -80px -56px, -100px -56px, -120px -56px, -140px -56px, -80px -128px, -100px -128px, -120px -128px
	*/
}

.mCSB_scrollTools .mCSB_buttonUp:hover,
.mCSB_scrollTools .mCSB_buttonDown:hover,
.mCSB_scrollTools .mCSB_buttonLeft:hover,
.mCSB_scrollTools .mCSB_buttonRight:hover{ opacity: 0.75; filter: "alpha(opacity=75)"; -ms-filter: "alpha(opacity=75)"; }

.mCSB_scrollTools .mCSB_buttonUp:active,
.mCSB_scrollTools .mCSB_buttonDown:active,
.mCSB_scrollTools .mCSB_buttonLeft:active,
.mCSB_scrollTools .mCSB_buttonRight:active{ opacity: 0.9; filter: "alpha(opacity=90)"; -ms-filter: "alpha(opacity=90)"; }


/* theme: "dark" */

.mCS-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.15); }

.mCS-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: rgba(0,0,0,0.85); }

.mCS-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: rgba(0,0,0,0.9); }

.mCS-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -80px 0; }

.mCS-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -80px -20px; }

.mCS-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -80px -40px; }

.mCS-dark.mCSB_scrollTools .mCSB_buttonRight{ background-position: -80px -56px; }

/* ---------------------------------------- */



/* theme: "light-2", "dark-2" */

.mCS-light-2.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-dark-2.mCSB_scrollTools .mCSB_draggerRail{
	width: 4px;
	background-color: #fff; background-color: rgba(255,255,255,0.1);
	-webkit-border-radius: 1px; -moz-border-radius: 1px; border-radius: 1px;
}

.mCS-light-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	width: 4px;
	background-color: #fff; background-color: rgba(255,255,255,0.75);
	-webkit-border-radius: 1px; -moz-border-radius: 1px; border-radius: 1px;
}

.mCS-light-2.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-dark-2.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-light-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	width: 100%;
	height: 4px;
	margin: 6px auto;
}

.mCS-light-2.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.85); }

.mCS-light-2.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-light-2.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.9); }

.mCS-light-2.mCSB_scrollTools .mCSB_buttonUp{ background-position: -32px 0; }

.mCS-light-2.mCSB_scrollTools .mCSB_buttonDown{	background-position: -32px -20px; }

.mCS-light-2.mCSB_scrollTools .mCSB_buttonLeft{	background-position: -40px -40px; }

.mCS-light-2.mCSB_scrollTools .mCSB_buttonRight{ background-position: -40px -56px; }


/* theme: "dark-2" */

.mCS-dark-2.mCSB_scrollTools .mCSB_draggerRail{
	background-color: #000; background-color: rgba(0,0,0,0.1);
	-webkit-border-radius: 1px; -moz-border-radius: 1px; border-radius: 1px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-color: #000; background-color: rgba(0,0,0,0.75);
	-webkit-border-radius: 1px; -moz-border-radius: 1px; border-radius: 1px;
}

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-dark-2.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-dark-2.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonUp{ background-position: -112px 0; }

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonDown{ background-position: -112px -20px; }

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -120px -40px; }

.mCS-dark-2.mCSB_scrollTools .mCSB_buttonRight{	background-position: -120px -56px; }

/* ---------------------------------------- */



/* theme: "light-thick", "dark-thick" */

.mCS-light-thick.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-dark-thick.mCSB_scrollTools .mCSB_draggerRail{
	width: 4px;
	background-color: #fff; background-color: rgba(255,255,255,0.1);
	-webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	width: 6px;
	background-color: #fff; background-color: rgba(255,255,255,0.75);
	-webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px;
}

.mCS-light-thick.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-dark-thick.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	width: 100%;
	height: 4px;
	margin: 6px 0;
}

.mCS-light-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	width: 100%;
	height: 6px;
	margin: 5px auto;
}

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.85); }

.mCS-light-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-light-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.9); }

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonUp{ background-position: -16px 0; }

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonDown{	background-position: -16px -20px; }

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonLeft{	background-position: -20px -40px; }

.mCS-light-thick.mCSB_scrollTools .mCSB_buttonRight{ background-position: -20px -56px; }


/* theme: "dark-thick" */

.mCS-dark-thick.mCSB_scrollTools .mCSB_draggerRail{
	background-color: #000; background-color: rgba(0,0,0,0.1);
	-webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-color: #000; background-color: rgba(0,0,0,0.75);
	-webkit-border-radius: 2px; -moz-border-radius: 2px; border-radius: 2px;
}

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-dark-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonUp{ background-position: -96px 0; }

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonDown{ background-position: -96px -20px; }

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -100px -40px; }

.mCS-dark-thick.mCSB_scrollTools .mCSB_buttonRight{	background-position: -100px -56px; }

/* ---------------------------------------- */



/* theme: "light-thin", "dark-thin" */

.mCS-light-thin.mCSB_scrollTools .mCSB_draggerRail{ background-color: #fff; background-color: rgba(255,255,255,0.1); }

.mCS-light-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ width: 2px; }

.mCS-light-thin.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-dark-thin.mCSB_scrollTools_horizontal .mCSB_draggerRail{ width: 100%; }

.mCS-light-thin.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-thin.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	width: 100%;
	height: 2px;
	margin: 7px auto;
}


/* theme "dark-thin" */

.mCS-dark-thin.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.15); }

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-dark-thin.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonUp{	background-position: -80px 0; }

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonDown{ background-position: -80px -20px; }

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -80px -40px; }

.mCS-dark-thin.mCSB_scrollTools .mCSB_buttonRight{ background-position: -80px -56px; }

/* ---------------------------------------- */



/* theme "rounded", "rounded-dark", "rounded-dots", "rounded-dots-dark" */

.mCS-rounded.mCSB_scrollTools .mCSB_draggerRail{ background-color: #fff; background-color: rgba(255,255,255,0.15); }

.mCS-rounded.mCSB_scrollTools .mCSB_dragger, 
.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger, 
.mCS-rounded-dots.mCSB_scrollTools .mCSB_dragger, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger{ height: 14px; }

.mCS-rounded.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dots.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	width: 14px;
	margin: 0 1px;
}

.mCS-rounded.mCSB_scrollTools_horizontal .mCSB_dragger, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal .mCSB_dragger, 
.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_dragger, 
.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_dragger{ width: 14px; }

.mCS-rounded.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	height: 14px;
	margin: 1px 0;
}

.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar{
	width: 16px; /* auto-expanded scrollbar */
	height: 16px;
	margin: -1px 0;
}

.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-rounded.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail, 
.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-rounded-dark.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{ width: 4px; /* auto-expanded scrollbar */ }

.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded .mCSB_dragger_bar, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_dragger .mCSB_dragger_bar{
	height: 16px; /* auto-expanded scrollbar */
	width: 16px;
	margin: 0 -1px;
}

.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-rounded.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-rounded-dark.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{
	height: 4px; /* auto-expanded scrollbar */
	margin: 6px 0;
}

.mCS-rounded.mCSB_scrollTools .mCSB_buttonUp{ background-position: 0 -72px; }

.mCS-rounded.mCSB_scrollTools .mCSB_buttonDown{ background-position: 0 -92px; }

.mCS-rounded.mCSB_scrollTools .mCSB_buttonLeft{ background-position: 0 -112px; }

.mCS-rounded.mCSB_scrollTools .mCSB_buttonRight{ background-position: 0 -128px; }


/* theme "rounded-dark", "rounded-dots-dark" */

.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.15); }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-rounded-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -80px -72px; }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -80px -92px; }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -80px -112px; }

.mCS-rounded-dark.mCSB_scrollTools .mCSB_buttonRight{ background-position: -80px -128px; }


/* theme "rounded-dots", "rounded-dots-dark" */

.mCS-rounded-dots.mCSB_scrollTools_vertical .mCSB_draggerRail, 
.mCS-rounded-dots-dark.mCSB_scrollTools_vertical .mCSB_draggerRail{ width: 4px; }

.mCS-rounded-dots.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	background-color: transparent;
	background-position: center;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail{
	background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAANElEQVQYV2NkIAAYiVbw//9/Y6DiM1ANJoyMjGdBbLgJQAX/kU0DKgDLkaQAvxW4HEvQFwCRcxIJK1XznAAAAABJRU5ErkJggg==");
	background-repeat: repeat-y;
	opacity: 0.3;
	filter: "alpha(opacity=30)"; -ms-filter: "alpha(opacity=30)"; 
}

.mCS-rounded-dots.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-rounded-dots-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	height: 4px;
	margin: 6px 0;
	background-repeat: repeat-x;
}

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonUp{ background-position: -16px -72px; }

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonDown{ background-position: -16px -92px; }

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -20px -112px; }

.mCS-rounded-dots.mCSB_scrollTools .mCSB_buttonRight{ background-position: -20px -128px; }


/* theme "rounded-dots-dark" */

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_draggerRail{
	background-image: url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAALElEQVQYV2NkIAAYSVFgDFR8BqrBBEifBbGRTfiPZhpYjiQFBK3A6l6CvgAAE9kGCd1mvgEAAAAASUVORK5CYII=");
}

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -96px -72px; }

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -96px -92px; }

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -100px -112px; }

.mCS-rounded-dots-dark.mCSB_scrollTools .mCSB_buttonRight{ background-position: -100px -128px; }

/* ---------------------------------------- */



/* theme "3d", "3d-dark", "3d-thick", "3d-thick-dark" */

.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-repeat: repeat-y;
	background-image: -moz-linear-gradient(left, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 100%);
	background-image: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(255,255,255,0.5)), color-stop(100%,rgba(255,255,255,0)));
	background-image: -webkit-linear-gradient(left, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: -o-linear-gradient(left, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: -ms-linear-gradient(left, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: linear-gradient(to right, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	background-repeat: repeat-x;
	background-image: -moz-linear-gradient(top, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 100%);
	background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(255,255,255,0.5)), color-stop(100%,rgba(255,255,255,0)));
	background-image: -webkit-linear-gradient(top, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: -o-linear-gradient(top, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: -ms-linear-gradient(top, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
	background-image: linear-gradient(to bottom, rgba(255,255,255,0.5) 0%,rgba(255,255,255,0) 100%);
}


/* theme "3d", "3d-dark" */

.mCS-3d.mCSB_scrollTools_vertical .mCSB_dragger, 
.mCS-3d-dark.mCSB_scrollTools_vertical .mCSB_dragger{ height: 70px; }

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger, 
.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger{ width: 70px; }

.mCS-3d.mCSB_scrollTools, 
.mCS-3d-dark.mCSB_scrollTools{
	opacity: 1;
	filter: "alpha(opacity=30)"; -ms-filter: "alpha(opacity=30)"; 
}

.mCS-3d.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ -webkit-border-radius: 16px; -moz-border-radius: 16px; border-radius: 16px; }

.mCS-3d.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail{
	width: 8px;
	background-color: #000; background-color: rgba(0,0,0,0.2);
	box-shadow: inset 1px 0 1px rgba(0,0,0,0.5), inset -1px 0 1px rgba(255,255,255,0.2);
}

.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 	 
.mCS-3d.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-3d.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-3d.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #555; }

.mCS-3d.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ width: 8px; }

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	width: 100%;
	height: 8px;
	margin: 4px 0;
	box-shadow: inset 0 1px 1px rgba(0,0,0,0.5), inset 0 -1px 1px rgba(255,255,255,0.2);
}

.mCS-3d.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	width: 100%;
	height: 8px;
	margin: 4px auto;
}

.mCS-3d.mCSB_scrollTools .mCSB_buttonUp{ background-position: -32px -72px; }

.mCS-3d.mCSB_scrollTools .mCSB_buttonDown{ background-position: -32px -92px; }

.mCS-3d.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -40px -112px; }

.mCS-3d.mCSB_scrollTools .mCSB_buttonRight{ background-position: -40px -128px; }


/* theme "3d-dark" */

.mCS-3d-dark.mCSB_scrollTools .mCSB_draggerRail{
	background-color: #000; background-color: rgba(0,0,0,0.1);
	box-shadow: inset 1px 0 1px rgba(0,0,0,0.1);
}

.mCS-3d-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail{ box-shadow: inset 0 1px 1px rgba(0,0,0,0.1); }

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -112px -72px; }

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -112px -92px; }

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -120px -112px; }

.mCS-3d-dark.mCSB_scrollTools .mCSB_buttonRight{	background-position: -120px -128px; }

/* ---------------------------------------- */



/* theme: "3d-thick", "3d-thick-dark" */

.mCS-3d-thick.mCSB_scrollTools, 
.mCS-3d-thick-dark.mCSB_scrollTools{
	opacity: 1;
	filter: "alpha(opacity=30)"; -ms-filter: "alpha(opacity=30)"; 
}

.mCS-3d-thick.mCSB_scrollTools, 
.mCS-3d-thick-dark.mCSB_scrollTools, 
.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerContainer, 
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerContainer{ -webkit-border-radius: 7px; -moz-border-radius: 7px; border-radius: 7px; }

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }

.mCSB_inside + .mCS-3d-thick.mCSB_scrollTools_vertical, 
.mCSB_inside + .mCS-3d-thick-dark.mCSB_scrollTools_vertical{ right: 1px; }

.mCS-3d-thick.mCSB_scrollTools_vertical, 
.mCS-3d-thick-dark.mCSB_scrollTools_vertical{ box-shadow: inset 1px 0 1px rgba(0,0,0,0.1), inset 0 0 14px rgba(0,0,0,0.5); }

.mCS-3d-thick.mCSB_scrollTools_horizontal, 
.mCS-3d-thick-dark.mCSB_scrollTools_horizontal{
	bottom: 1px;
	box-shadow: inset 0 1px 1px rgba(0,0,0,0.1), inset 0 0 14px rgba(0,0,0,0.5);
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	box-shadow: inset 1px 0 0 rgba(255,255,255,0.4);
	width: 12px;
	margin: 2px;
	position: absolute;
	height: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{ box-shadow: inset 0 1px 0 rgba(255,255,255,0.4); }

.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,  
.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-3d-thick.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #555; }

.mCS-3d-thick.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	height: 12px;
	width: auto;
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerContainer{
	background-color: #000; background-color: rgba(0,0,0,0.05);
	box-shadow: inset 1px 1px 16px rgba(0,0,0,0.1);
}

.mCS-3d-thick.mCSB_scrollTools .mCSB_draggerRail{ background-color: transparent; }

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonUp{ background-position: -32px -72px; }

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonDown{ background-position: -32px -92px; }

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -40px -112px; }

.mCS-3d-thick.mCSB_scrollTools .mCSB_buttonRight{	background-position: -40px -128px; }


/* theme: "3d-thick-dark" */

.mCS-3d-thick-dark.mCSB_scrollTools{ box-shadow: inset 0 0 14px rgba(0,0,0,0.2); }

.mCS-3d-thick-dark.mCSB_scrollTools_horizontal{ box-shadow: inset 0 1px 1px rgba(0,0,0,0.1), inset 0 0 14px rgba(0,0,0,0.2); }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ box-shadow: inset 1px 0 0 rgba(255,255,255,0.4), inset -1px 0 0 rgba(0,0,0,0.2); }
 
.mCS-3d-thick-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{ box-shadow: inset 0 1px 0 rgba(255,255,255,0.4), inset 0 -1px 0 rgba(0,0,0,0.2); }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar,  
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #777; }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerContainer{
	background-color: #fff; background-color: rgba(0,0,0,0.05);
	box-shadow: inset 1px 1px 16px rgba(0,0,0,0.1);
}

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: transparent; }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -112px -72px; }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -112px -92px; }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -120px -112px; }

.mCS-3d-thick-dark.mCSB_scrollTools .mCSB_buttonRight{	background-position: -120px -128px; }

/* ---------------------------------------- */



/* theme: "minimal", "minimal-dark" */

.mCSB_outside + .mCS-minimal.mCSB_scrollTools_vertical, 
.mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
	right: 0; 
	margin: 12px 0; 
}

.mCustomScrollBox.mCS-minimal + .mCSB_scrollTools.mCSB_scrollTools_horizontal, 
.mCustomScrollBox.mCS-minimal + .mCSB_scrollTools + .mCSB_scrollTools.mCSB_scrollTools_horizontal, 
.mCustomScrollBox.mCS-minimal-dark + .mCSB_scrollTools.mCSB_scrollTools_horizontal, 
.mCustomScrollBox.mCS-minimal-dark + .mCSB_scrollTools + .mCSB_scrollTools.mCSB_scrollTools_horizontal{
	bottom: 0; 
	margin: 0 12px; 
}

/* RTL direction/left-side scrollbar */
.mCS-dir-rtl > .mCSB_outside + .mCS-minimal.mCSB_scrollTools_vertical, 
.mCS-dir-rtl > .mCSB_outside + .mCS-minimal-dark.mCSB_scrollTools_vertical{
	left: 0; 
	right: auto;
}

.mCS-minimal.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-minimal-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: transparent; }

.mCS-minimal.mCSB_scrollTools_vertical .mCSB_dragger, 
.mCS-minimal-dark.mCSB_scrollTools_vertical .mCSB_dragger{ height: 50px; }

.mCS-minimal.mCSB_scrollTools_horizontal .mCSB_dragger, 
.mCS-minimal-dark.mCSB_scrollTools_horizontal .mCSB_dragger{ width: 50px; }

.mCS-minimal.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-color: #fff; background-color: rgba(255,255,255,0.2);
	filter: "alpha(opacity=20)"; -ms-filter: "alpha(opacity=20)"; 
}

.mCS-minimal.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-minimal.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{
	background-color: #fff; background-color: rgba(255,255,255,0.5);
	filter: "alpha(opacity=50)"; -ms-filter: "alpha(opacity=50)"; 
}


/* theme: "minimal-dark" */

.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{
	background-color: #000; background-color: rgba(0,0,0,0.2);
	filter: "alpha(opacity=20)"; -ms-filter: "alpha(opacity=20)"; 
}

.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-minimal-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{
	background-color: #000; background-color: rgba(0,0,0,0.5);
	filter: "alpha(opacity=50)"; -ms-filter: "alpha(opacity=50)"; 
}

/* ---------------------------------------- */



/* theme "light-3", "dark-3" */

.mCS-light-3.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools .mCSB_draggerRail{
	width: 6px;
	background-color: #000; background-color: rgba(0,0,0,0.2);
}

.mCS-light-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ width: 6px; }

.mCS-light-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-dark-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-light-3.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	width: 100%;
	height: 6px;
	margin: 5px 0;
}

.mCS-light-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-light-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools_vertical.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{
	width: 12px;
}

.mCS-light-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-light-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_dragger.mCSB_dragger_onDrag_expanded + .mCSB_draggerRail, 
.mCS-dark-3.mCSB_scrollTools_horizontal.mCSB_scrollTools_onDrag_expand .mCSB_draggerContainer:hover .mCSB_draggerRail{
	height: 12px;
	margin: 2px 0;
}

.mCS-light-3.mCSB_scrollTools .mCSB_buttonUp{ background-position: -32px -72px; }

.mCS-light-3.mCSB_scrollTools .mCSB_buttonDown{ background-position: -32px -92px; }

.mCS-light-3.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -40px -112px; }

.mCS-light-3.mCSB_scrollTools .mCSB_buttonRight{ background-position: -40px -128px; }


/* theme "dark-3" */

.mCS-dark-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-dark-3.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-dark-3.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-dark-3.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-dark-3.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.1); }

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonUp{ background-position: -112px -72px; }

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonDown{ background-position: -112px -92px; }

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -120px -112px; }

.mCS-dark-3.mCSB_scrollTools .mCSB_buttonRight{	background-position: -120px -128px; }

/* ---------------------------------------- */



/* theme "inset", "inset-dark", "inset-2", "inset-2-dark", "inset-3", "inset-3-dark" */

.mCS-inset.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-2.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-3.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail{
	width: 12px;
	background-color: #000; background-color: rgba(0,0,0,0.2);
}

.mCS-inset.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-2.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ 
	width: 6px;
	margin: 3px 5px;
	position: absolute;
	height: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-inset.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-2.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-2-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-3.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-3-dark.mCSB_scrollTools_horizontal .mCSB_dragger .mCSB_dragger_bar{
	height: 6px;
	margin: 5px 3px;
	position: absolute;
	width: auto;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}

.mCS-inset.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-inset-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-inset-2.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-inset-2-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-inset-3.mCSB_scrollTools_horizontal .mCSB_draggerRail, 
.mCS-inset-3-dark.mCSB_scrollTools_horizontal .mCSB_draggerRail{
	width: 100%;
	height: 12px;
	margin: 2px 0;
}

.mCS-inset.mCSB_scrollTools .mCSB_buttonUp, 
.mCS-inset-2.mCSB_scrollTools .mCSB_buttonUp, 
.mCS-inset-3.mCSB_scrollTools .mCSB_buttonUp{ background-position: -32px -72px; }

.mCS-inset.mCSB_scrollTools .mCSB_buttonDown, 
.mCS-inset-2.mCSB_scrollTools .mCSB_buttonDown, 
.mCS-inset-3.mCSB_scrollTools .mCSB_buttonDown{ background-position: -32px -92px; }

.mCS-inset.mCSB_scrollTools .mCSB_buttonLeft, 
.mCS-inset-2.mCSB_scrollTools .mCSB_buttonLeft, 
.mCS-inset-3.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -40px -112px; }

.mCS-inset.mCSB_scrollTools .mCSB_buttonRight, 
.mCS-inset-2.mCSB_scrollTools .mCSB_buttonRight, 
.mCS-inset-3.mCSB_scrollTools .mCSB_buttonRight{ background-position: -40px -128px; }


/* theme "inset-dark", "inset-2-dark", "inset-3-dark" */

.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-inset-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-inset-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.1); }

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonUp, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonUp, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonUp{ background-position: -112px -72px; }

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonDown, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonDown, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonDown{ background-position: -112px -92px; }

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonLeft, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonLeft, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonLeft{ background-position: -120px -112px; }

.mCS-inset-dark.mCSB_scrollTools .mCSB_buttonRight, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_buttonRight, 
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_buttonRight{	background-position: -120px -128px; }


/* theme "inset-2", "inset-2-dark" */

.mCS-inset-2.mCSB_scrollTools .mCSB_draggerRail, 
.mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail{
	background-color: transparent;
	border-width: 1px;
	border-style: solid;
	border-color: #fff;
	border-color: rgba(255,255,255,0.2);
	-webkit-box-sizing: border-box; -moz-box-sizing: border-box; box-sizing: border-box;
}

.mCS-inset-2-dark.mCSB_scrollTools .mCSB_draggerRail{ border-color: #000; border-color: rgba(0,0,0,0.2); }


/* theme "inset-3", "inset-3-dark" */

.mCS-inset-3.mCSB_scrollTools .mCSB_draggerRail{ background-color: #fff; background-color: rgba(255,255,255,0.6); }

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_draggerRail{ background-color: #000; background-color: rgba(0,0,0,0.6); }

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.75); }

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.85); }

.mCS-inset-3.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-inset-3.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #000; background-color: rgba(0,0,0,0.9); }

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.75); }

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:hover .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.85); }

.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger:active .mCSB_dragger_bar,
.mCS-inset-3-dark.mCSB_scrollTools .mCSB_dragger.mCSB_dragger_onDrag .mCSB_dragger_bar{ background-color: #fff; background-color: rgba(255,255,255,0.9); }
