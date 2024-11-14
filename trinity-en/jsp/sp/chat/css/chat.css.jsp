<%@ page contentType="text/css; charset=UTF-8" pageEncoding="UTF-8" %>

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
  position: relative;
  /*  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);*/
  width: 100%;
  height: calc(100% - 15px);
  max-height: 500px;
  z-index: 10;
  overflow: hidden;
  /*box-shadow: 0 5px 30px rgba(0, 0, 0, .2);*/
  /* background: rgba(0, 0, 0, .5);*/
  background: transparent;
  border-radius: 20px;
  -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  display: flex;
  justify-content: space-between;
  flex-direction: column; }

/*--------------------
Chat Title
--------------------*/
.chat-title {
  flex: 0 1 45px;
  position: relative;
  z-index: 2;
  width: 100%;
  border-bottom: 1px solid #ccc;
  color: #777;
  padding-top: 50px;
  padding-bottom: 5px;
  background-color: #fff;
  text-transform: uppercase;
  text-align: center; }
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
    z-index: 1;
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
  background:url('/jsp/sp/img/duna_chat_bg.png');
  flex: 1 1 auto;
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
    background: #eee;
    /*rgba(0, 0, 0, 0.1);*/
    margin: 8px 0;
    font-size: 14px;
    line-height: 1.4;
    margin-left: 35px;
    position: relative;
    border: 1px solid #ccc;
    /*text-shadow: 0 1px 1px rgba(0, 0, 0, .2);*/ }
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
      z-index: 1;
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
      z-index: 2;
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
        z-index: 2;
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
        z-index: 2;
        margin-top: 4px;
        animation: ball 0.45s cubic-bezier(0, 0, 0.15, 1) alternate infinite;
        margin-left: 7px;
        animation-delay: .3s; }

/*--------------------
Message Box
--------------------*/
.message-box {
  flex: 0 1 42px;
  width: 90%;
  border : none;
  background: #fff;
  margin: 2px auto;
  /*-webkit-box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);
-moz-box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);
box-shadow: 0px 1px 1px 1px rgba(0,0,0,0.4);*/
  /*background: rgba(0, 0, 0, 0.3);
    border-top:1px solid #e3e3e3;*/
  padding: 10px;
  position: relative;
  -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  border-radius: 20px;
  height: 14px;
  border: 1px solid #ccc; 
}
  .message-box .message-input {
    background: none;
    border: none;
    outline: none !important;
    resize: none;
    /* color: rgba(255, 255, 255, .8);*/
    font-size: 15px;
    height: 24px;
    margin: 0;
    padding-right: 20px;
    width: 265px;
    color: #444; }
  .message-box textarea:focus:-webkit-placeholder {
    color: transparent; }
  .message-box .message-submit {
    position: absolute;
    z-index: 1;
    top: 12px;
    right: 10px;
    color: #4A90E2;
    border: none;
    /* background: #c29d5f;*/
    background: #fff;
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



.close {
  display: block;
  width: 100px;
  height: 100px;
  margin: 1em auto;
  background-size: cover;
  background-repeat: no-repeat;
  background-position: center center;
  -webkit-border-radius: 99em;
  -moz-border-radius: 99em;
  border-radius: 99em;
  opacity: 0.5;
  /*border: 1px solid #ccc;
  color:#ccc;*/
  /* -webkit-box-shadow: 0px -1px 2px 0px rgba(0, 0, 0, 0.5);
-moz-box-shadow:    0px -1px 2px 0px rgba(0, 0, 0, 0.5);
box-shadow:         0px -1px 2px 0px rgba(0, 0, 0, 0.5);*/ }

.close:hover {
  /*
-webkit-box-shadow:  0 1px 1px rgba(0,0,0,0.3);
-moz-box-shadow:  0 1px 1px rgba(0,0,0,0.3);
box-shadow: 0 1px 1px rgba(0,0,0,0.3);*/
  opacity: 0.9; }

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
    text-align: left; }
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
  background: #db4437;
  position: fixed;
  bottom: 30px;
  right: 30px;
  cursor: pointer;
  box-shadow: 0px 2px 5px #666;
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



//-----------------------------------------------
// Training chatting checkbox design
//-----------------------------------------------
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;

}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;

}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;




   // background-color: #dc3545;
    width: 70px;
    height: 34px;
    margin-top: 45px;
    margin-left: 126px;





}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}
 
input:checked + .slider {
    background-color: #dc3545;
    width: 70px;
    height: 34px;
    margin-top: 45px;
    margin-left: 126px;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;

}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);

}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}


blockquote:before {
  content: "\201C";
  font-size: 3em;
  font-family: Georgia;
  color: #bcbcbc;
  float: left;
  margin: -5px 10px 0px -10px;
}





/*!
 *  Font Awesome 4.7.0 by @davegandy - http://fontawesome.io - @fontawesome
 *  License - http://fontawesome.io/license (Font: SIL OFL 1.1, CSS: MIT License)
 */@font-face{font-family:'FontAwesome';src:url('../fonts/fontawesome-webfont.eot?v=4.7.0');src:url('../fonts/fontawesome-webfont.eot?#iefix&v=4.7.0') format('embedded-opentype'),url('../fonts/fontawesome-webfont.woff2?v=4.7.0') format('woff2'),url('../fonts/fontawesome-webfont.woff?v=4.7.0') format('woff'),url('../fonts/fontawesome-webfont.ttf?v=4.7.0') format('truetype'),url('../fonts/fontawesome-webfont.svg?v=4.7.0#fontawesomeregular') format('svg');font-weight:normal;font-style:normal}.fa{display:inline-block;font:normal normal normal 14px/1 FontAwesome;font-size:inherit;text-rendering:auto;-webkit-font-smoothing:antialiased;-moz-osx-font-smoothing:grayscale}.fa-lg{font-size:1.33333333em;line-height:.75em;vertical-align:-15%}.fa-2x{font-size:2em}.fa-3x{font-size:3em}.fa-4x{font-size:4em}.fa-5x{font-size:5em}.fa-fw{width:1.28571429em;text-align:center}.fa-ul{padding-left:0;margin-left:2.14285714em;list-style-type:none}.fa-ul>li{position:relative}.fa-li{position:absolute;left:-2.14285714em;width:2.14285714em;top:.14285714em;text-align:center}.fa-li.fa-lg{left:-1.85714286em}.fa-border{padding:.2em .25em .15em;border:solid .08em #eee;border-radius:.1em}.fa-pull-left{float:left}.fa-pull-right{float:right}.fa.fa-pull-left{margin-right:.3em}.fa.fa-pull-right{margin-left:.3em}.pull-right{float:right}.pull-left{float:left}.fa.pull-left{margin-right:.3em}.fa.pull-right{margin-left:.3em}.fa-spin{-webkit-animation:fa-spin 2s infinite linear;animation:fa-spin 2s infinite linear}.fa-pulse{-webkit-animation:fa-spin 1s infinite steps(8);animation:fa-spin 1s infinite steps(8)}@-webkit-keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}@keyframes fa-spin{0%{-webkit-transform:rotate(0deg);transform:rotate(0deg)}100%{-webkit-transform:rotate(359deg);transform:rotate(359deg)}}.fa-rotate-90{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=1)";-webkit-transform:rotate(90deg);-ms-transform:rotate(90deg);transform:rotate(90deg)}.fa-rotate-180{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=2)";-webkit-transform:rotate(180deg);-ms-transform:rotate(180deg);transform:rotate(180deg)}.fa-rotate-270{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=3)";-webkit-transform:rotate(270deg);-ms-transform:rotate(270deg);transform:rotate(270deg)}.fa-flip-horizontal{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=0, mirror=1)";-webkit-transform:scale(-1, 1);-ms-transform:scale(-1, 1);transform:scale(-1, 1)}.fa-flip-vertical{-ms-filter:"progid:DXImageTransform.Microsoft.BasicImage(rotation=2, mirror=1)";-webkit-transform:scale(1, -1);-ms-transform:scale(1, -1);transform:scale(1, -1)}:root .fa-rotate-90,:root .fa-rotate-180,:root .fa-rotate-270,:root .fa-flip-horizontal,:root .fa-flip-vertical{filter:none}.fa-stack{position:relative;display:inline-block;width:2em;height:2em;line-height:2em;vertical-align:middle}.fa-stack-1x,.fa-stack-2x{position:absolute;left:0;width:100%;text-align:center}.fa-stack-1x{line-height:inherit}.fa-stack-2x{font-size:2em}.fa-inverse{color:#fff}.fa-glass:before{content:"\f000"}.fa-music:before{content:"\f001"}.fa-search:before{content:"\f002"}.fa-envelope-o:before{content:"\f003"}.fa-heart:before{content:"\f004"}.fa-star:before{content:"\f005"}.fa-star-o:before{content:"\f006"}.fa-user:before{content:"\f007"}.fa-film:before{content:"\f008"}.fa-th-large:before{content:"\f009"}.fa-th:before{content:"\f00a"}.fa-th-list:before{content:"\f00b"}.fa-check:before{content:"\f00c"}.fa-remove:before,.fa-close:before,.fa-times:before{content:"\f00d"}.fa-search-plus:before{content:"\f00e"}.fa-search-minus:before{content:"\f010"}.fa-power-off:before{content:"\f011"}.fa-signal:before{content:"\f012"}.fa-gear:before,.fa-cog:before{content:"\f013"}.fa-trash-o:before{content:"\f014"}.fa-home:before{content:"\f015"}.fa-file-o:before{content:"\f016"}.fa-clock-o:before{content:"\f017"}.fa-road:before{content:"\f018"}.fa-download:before{content:"\f019"}.fa-arrow-circle-o-down:before{content:"\f01a"}.fa-arrow-circle-o-up:before{content:"\f01b"}.fa-inbox:before{content:"\f01c"}.fa-play-circle-o:before{content:"\f01d"}.fa-rotate-right:before,.fa-repeat:before{content:"\f01e"}.fa-refresh:before{content:"\f021"}.fa-list-alt:before{content:"\f022"}.fa-lock:before{content:"\f023"}.fa-flag:before{content:"\f024"}.fa-headphones:before{content:"\f025"}.fa-volume-off:before{content:"\f026"}.fa-volume-down:before{content:"\f027"}.fa-volume-up:before{content:"\f028"}.fa-qrcode:before{content:"\f029"}.fa-barcode:before{content:"\f02a"}.fa-tag:before{content:"\f02b"}.fa-tags:before{content:"\f02c"}.fa-book:before{content:"\f02d"}.fa-bookmark:before{content:"\f02e"}.fa-print:before{content:"\f02f"}.fa-camera:before{content:"\f030"}.fa-font:before{content:"\f031"}.fa-bold:before{content:"\f032"}.fa-italic:before{content:"\f033"}.fa-text-height:before{content:"\f034"}.fa-text-width:before{content:"\f035"}.fa-align-left:before{content:"\f036"}.fa-align-center:before{content:"\f037"}.fa-align-right:before{content:"\f038"}.fa-align-justify:before{content:"\f039"}.fa-list:before{content:"\f03a"}.fa-dedent:before,.fa-outdent:before{content:"\f03b"}.fa-indent:before{content:"\f03c"}.fa-video-camera:before{content:"\f03d"}.fa-photo:before,.fa-image:before,.fa-picture-o:before{content:"\f03e"}.fa-pencil:before{content:"\f040"}.fa-map-marker:before{content:"\f041"}.fa-adjust:before{content:"\f042"}.fa-tint:before{content:"\f043"}.fa-edit:before,.fa-pencil-square-o:before{content:"\f044"}.fa-share-square-o:before{content:"\f045"}.fa-check-square-o:before{content:"\f046"}.fa-arrows:before{content:"\f047"}.fa-step-backward:before{content:"\f048"}.fa-fast-backward:before{content:"\f049"}.fa-backward:before{content:"\f04a"}.fa-play:before{content:"\f04b"}.fa-pause:before{content:"\f04c"}.fa-stop:before{content:"\f04d"}.fa-forward:before{content:"\f04e"}.fa-fast-forward:before{content:"\f050"}.fa-step-forward:before{content:"\f051"}.fa-eject:before{content:"\f052"}.fa-chevron-left:before{content:"\f053"}.fa-chevron-right:before{content:"\f054"}.fa-plus-circle:before{content:"\f055"}.fa-minus-circle:before{content:"\f056"}.fa-times-circle:before{content:"\f057"}.fa-check-circle:before{content:"\f058"}.fa-question-circle:before{content:"\f059"}.fa-info-circle:before{content:"\f05a"}.fa-crosshairs:before{content:"\f05b"}.fa-times-circle-o:before{content:"\f05c"}.fa-check-circle-o:before{content:"\f05d"}.fa-ban:before{content:"\f05e"}.fa-arrow-left:before{content:"\f060"}.fa-arrow-right:before{content:"\f061"}.fa-arrow-up:before{content:"\f062"}.fa-arrow-down:before{content:"\f063"}.fa-mail-forward:before,.fa-share:before{content:"\f064"}.fa-expand:before{content:"\f065"}.fa-compress:before{content:"\f066"}.fa-plus:before{content:"\f067"}.fa-minus:before{content:"\f068"}.fa-asterisk:before{content:"\f069"}.fa-exclamation-circle:before{content:"\f06a"}.fa-gift:before{content:"\f06b"}.fa-leaf:before{content:"\f06c"}.fa-fire:before{content:"\f06d"}.fa-eye:before{content:"\f06e"}.fa-eye-slash:before{content:"\f070"}.fa-warning:before,.fa-exclamation-triangle:before{content:"\f071"}.fa-plane:before{content:"\f072"}.fa-calendar:before{content:"\f073"}.fa-random:before{content:"\f074"}.fa-comment:before{content:"\f075"}.fa-magnet:before{content:"\f076"}.fa-chevron-up:before{content:"\f077"}.fa-chevron-down:before{content:"\f078"}.fa-retweet:before{content:"\f079"}.fa-shopping-cart:before{content:"\f07a"}.fa-folder:before{content:"\f07b"}.fa-folder-open:before{content:"\f07c"}.fa-arrows-v:before{content:"\f07d"}.fa-arrows-h:before{content:"\f07e"}.fa-bar-chart-o:before,.fa-bar-chart:before{content:"\f080"}.fa-twitter-square:before{content:"\f081"}.fa-facebook-square:before{content:"\f082"}.fa-camera-retro:before{content:"\f083"}.fa-key:before{content:"\f084"}.fa-gears:before,.fa-cogs:before{content:"\f085"}.fa-comments:before{content:"\f086"}.fa-thumbs-o-up:before{content:"\f087"}.fa-thumbs-o-down:before{content:"\f088"}.fa-star-half:before{content:"\f089"}.fa-heart-o:before{content:"\f08a"}.fa-sign-out:before{content:"\f08b"}.fa-linkedin-square:before{content:"\f08c"}.fa-thumb-tack:before{content:"\f08d"}.fa-external-link:before{content:"\f08e"}.fa-sign-in:before{content:"\f090"}.fa-trophy:before{content:"\f091"}.fa-github-square:before{content:"\f092"}.fa-upload:before{content:"\f093"}.fa-lemon-o:before{content:"\f094"}.fa-phone:before{content:"\f095"}.fa-square-o:before{content:"\f096"}.fa-bookmark-o:before{content:"\f097"}.fa-phone-square:before{content:"\f098"}.fa-twitter:before{content:"\f099"}.fa-facebook-f:before,.fa-facebook:before{content:"\f09a"}.fa-github:before{content:"\f09b"}.fa-unlock:before{content:"\f09c"}.fa-credit-card:before{content:"\f09d"}.fa-feed:before,.fa-rss:before{content:"\f09e"}.fa-hdd-o:before{content:"\f0a0"}.fa-bullhorn:before{content:"\f0a1"}.fa-bell:before{content:"\f0f3"}.fa-certificate:before{content:"\f0a3"}.fa-hand-o-right:before{content:"\f0a4"}.fa-hand-o-left:before{content:"\f0a5"}.fa-hand-o-up:before{content:"\f0a6"}.fa-hand-o-down:before{content:"\f0a7"}.fa-arrow-circle-left:before{content:"\f0a8"}.fa-arrow-circle-right:before{content:"\f0a9"}.fa-arrow-circle-up:before{content:"\f0aa"}.fa-arrow-circle-down:before{content:"\f0ab"}.fa-globe:before{content:"\f0ac"}.fa-wrench:before{content:"\f0ad"}.fa-tasks:before{content:"\f0ae"}.fa-filter:before{content:"\f0b0"}.fa-briefcase:before{content:"\f0b1"}.fa-arrows-alt:before{content:"\f0b2"}.fa-group:before,.fa-users:before{content:"\f0c0"}.fa-chain:before,.fa-link:before{content:"\f0c1"}.fa-cloud:before{content:"\f0c2"}.fa-flask:before{content:"\f0c3"}.fa-cut:before,.fa-scissors:before{content:"\f0c4"}.fa-copy:before,.fa-files-o:before{content:"\f0c5"}.fa-paperclip:before{content:"\f0c6"}.fa-save:before,.fa-floppy-o:before{content:"\f0c7"}.fa-square:before{content:"\f0c8"}.fa-navicon:before,.fa-reorder:before,.fa-bars:before{content:"\f0c9"}.fa-list-ul:before{content:"\f0ca"}.fa-list-ol:before{content:"\f0cb"}.fa-strikethrough:before{content:"\f0cc"}.fa-underline:before{content:"\f0cd"}.fa-table:before{content:"\f0ce"}.fa-magic:before{content:"\f0d0"}.fa-truck:before{content:"\f0d1"}.fa-pinterest:before{content:"\f0d2"}.fa-pinterest-square:before{content:"\f0d3"}.fa-google-plus-square:before{content:"\f0d4"}.fa-google-plus:before{content:"\f0d5"}.fa-money:before{content:"\f0d6"}.fa-caret-down:before{content:"\f0d7"}.fa-caret-up:before{content:"\f0d8"}.fa-caret-left:before{content:"\f0d9"}.fa-caret-right:before{content:"\f0da"}.fa-columns:before{content:"\f0db"}.fa-unsorted:before,.fa-sort:before{content:"\f0dc"}.fa-sort-down:before,.fa-sort-desc:before{content:"\f0dd"}.fa-sort-up:before,.fa-sort-asc:before{content:"\f0de"}.fa-envelope:before{content:"\f0e0"}.fa-linkedin:before{content:"\f0e1"}.fa-rotate-left:before,.fa-undo:before{content:"\f0e2"}.fa-legal:before,.fa-gavel:before{content:"\f0e3"}.fa-dashboard:before,.fa-tachometer:before{content:"\f0e4"}.fa-comment-o:before{content:"\f0e5"}.fa-comments-o:before{content:"\f0e6"}.fa-flash:before,.fa-bolt:before{content:"\f0e7"}.fa-sitemap:before{content:"\f0e8"}.fa-umbrella:before{content:"\f0e9"}.fa-paste:before,.fa-clipboard:before{content:"\f0ea"}.fa-lightbulb-o:before{content:"\f0eb"}.fa-exchange:before{content:"\f0ec"}.fa-cloud-download:before{content:"\f0ed"}.fa-cloud-upload:before{content:"\f0ee"}.fa-user-md:before{content:"\f0f0"}.fa-stethoscope:before{content:"\f0f1"}.fa-suitcase:before{content:"\f0f2"}.fa-bell-o:before{content:"\f0a2"}.fa-coffee:before{content:"\f0f4"}.fa-cutlery:before{content:"\f0f5"}.fa-file-text-o:before{content:"\f0f6"}.fa-building-o:before{content:"\f0f7"}.fa-hospital-o:before{content:"\f0f8"}.fa-ambulance:before{content:"\f0f9"}.fa-medkit:before{content:"\f0fa"}.fa-fighter-jet:before{content:"\f0fb"}.fa-beer:before{content:"\f0fc"}.fa-h-square:before{content:"\f0fd"}.fa-plus-square:before{content:"\f0fe"}.fa-angle-double-left:before{content:"\f100"}.fa-angle-double-right:before{content:"\f101"}.fa-angle-double-up:before{content:"\f102"}.fa-angle-double-down:before{content:"\f103"}.fa-angle-left:before{content:"\f104"}.fa-angle-right:before{content:"\f105"}.fa-angle-up:before{content:"\f106"}.fa-angle-down:before{content:"\f107"}.fa-desktop:before{content:"\f108"}.fa-laptop:before{content:"\f109"}.fa-tablet:before{content:"\f10a"}.fa-mobile-phone:before,.fa-mobile:before{content:"\f10b"}.fa-circle-o:before{content:"\f10c"}.fa-quote-left:before{content:"\f10d"}.fa-quote-right:before{content:"\f10e"}.fa-spinner:before{content:"\f110"}.fa-circle:before{content:"\f111"}.fa-mail-reply:before,.fa-reply:before{content:"\f112"}.fa-github-alt:before{content:"\f113"}.fa-folder-o:before{content:"\f114"}.fa-folder-open-o:before{content:"\f115"}.fa-smile-o:before{content:"\f118"}.fa-frown-o:before{content:"\f119"}.fa-meh-o:before{content:"\f11a"}.fa-gamepad:before{content:"\f11b"}.fa-keyboard-o:before{content:"\f11c"}.fa-flag-o:before{content:"\f11d"}.fa-flag-checkered:before{content:"\f11e"}.fa-terminal:before{content:"\f120"}.fa-code:before{content:"\f121"}.fa-mail-reply-all:before,.fa-reply-all:before{content:"\f122"}.fa-star-half-empty:before,.fa-star-half-full:before,.fa-star-half-o:before{content:"\f123"}.fa-location-arrow:before{content:"\f124"}.fa-crop:before{content:"\f125"}.fa-code-fork:before{content:"\f126"}.fa-unlink:before,.fa-chain-broken:before{content:"\f127"}.fa-question:before{content:"\f128"}.fa-info:before{content:"\f129"}.fa-exclamation:before{content:"\f12a"}.fa-superscript:before{content:"\f12b"}.fa-subscript:before{content:"\f12c"}.fa-eraser:before{content:"\f12d"}.fa-puzzle-piece:before{content:"\f12e"}.fa-microphone:before{content:"\f130"}.fa-microphone-slash:before{content:"\f131"}.fa-shield:before{content:"\f132"}.fa-calendar-o:before{content:"\f133"}.fa-fire-extinguisher:before{content:"\f134"}.fa-rocket:before{content:"\f135"}.fa-maxcdn:before{content:"\f136"}.fa-chevron-circle-left:before{content:"\f137"}.fa-chevron-circle-right:before{content:"\f138"}.fa-chevron-circle-up:before{content:"\f139"}.fa-chevron-circle-down:before{content:"\f13a"}.fa-html5:before{content:"\f13b"}.fa-css3:before{content:"\f13c"}.fa-anchor:before{content:"\f13d"}.fa-unlock-alt:before{content:"\f13e"}.fa-bullseye:before{content:"\f140"}.fa-ellipsis-h:before{content:"\f141"}.fa-ellipsis-v:before{content:"\f142"}.fa-rss-square:before{content:"\f143"}.fa-play-circle:before{content:"\f144"}.fa-ticket:before{content:"\f145"}.fa-minus-square:before{content:"\f146"}.fa-minus-square-o:before{content:"\f147"}.fa-level-up:before{content:"\f148"}.fa-level-down:before{content:"\f149"}.fa-check-square:before{content:"\f14a"}.fa-pencil-square:before{content:"\f14b"}.fa-external-link-square:before{content:"\f14c"}.fa-share-square:before{content:"\f14d"}.fa-compass:before{content:"\f14e"}.fa-toggle-down:before,.fa-caret-square-o-down:before{content:"\f150"}.fa-toggle-up:before,.fa-caret-square-o-up:before{content:"\f151"}.fa-toggle-right:before,.fa-caret-square-o-right:before{content:"\f152"}.fa-euro:before,.fa-eur:before{content:"\f153"}.fa-gbp:before{content:"\f154"}.fa-dollar:before,.fa-usd:before{content:"\f155"}.fa-rupee:before,.fa-inr:before{content:"\f156"}.fa-cny:before,.fa-rmb:before,.fa-yen:before,.fa-jpy:before{content:"\f157"}.fa-ruble:before,.fa-rouble:before,.fa-rub:before{content:"\f158"}.fa-won:before,.fa-krw:before{content:"\f159"}.fa-bitcoin:before,.fa-btc:before{content:"\f15a"}.fa-file:before{content:"\f15b"}.fa-file-text:before{content:"\f15c"}.fa-sort-alpha-asc:before{content:"\f15d"}.fa-sort-alpha-desc:before{content:"\f15e"}.fa-sort-amount-asc:before{content:"\f160"}.fa-sort-amount-desc:before{content:"\f161"}.fa-sort-numeric-asc:before{content:"\f162"}.fa-sort-numeric-desc:before{content:"\f163"}.fa-thumbs-up:before{content:"\f164"}.fa-thumbs-down:before{content:"\f165"}.fa-youtube-square:before{content:"\f166"}.fa-youtube:before{content:"\f167"}.fa-xing:before{content:"\f168"}.fa-xing-square:before{content:"\f169"}.fa-youtube-play:before{content:"\f16a"}.fa-dropbox:before{content:"\f16b"}.fa-stack-overflow:before{content:"\f16c"}.fa-instagram:before{content:"\f16d"}.fa-flickr:before{content:"\f16e"}.fa-adn:before{content:"\f170"}.fa-bitbucket:before{content:"\f171"}.fa-bitbucket-square:before{content:"\f172"}.fa-tumblr:before{content:"\f173"}.fa-tumblr-square:before{content:"\f174"}.fa-long-arrow-down:before{content:"\f175"}.fa-long-arrow-up:before{content:"\f176"}.fa-long-arrow-left:before{content:"\f177"}.fa-long-arrow-right:before{content:"\f178"}.fa-apple:before{content:"\f179"}.fa-windows:before{content:"\f17a"}.fa-android:before{content:"\f17b"}.fa-linux:before{content:"\f17c"}.fa-dribbble:before{content:"\f17d"}.fa-skype:before{content:"\f17e"}.fa-foursquare:before{content:"\f180"}.fa-trello:before{content:"\f181"}.fa-female:before{content:"\f182"}.fa-male:before{content:"\f183"}.fa-gittip:before,.fa-gratipay:before{content:"\f184"}.fa-sun-o:before{content:"\f185"}.fa-moon-o:before{content:"\f186"}.fa-archive:before{content:"\f187"}.fa-bug:before{content:"\f188"}.fa-vk:before{content:"\f189"}.fa-weibo:before{content:"\f18a"}.fa-renren:before{content:"\f18b"}.fa-pagelines:before{content:"\f18c"}.fa-stack-exchange:before{content:"\f18d"}.fa-arrow-circle-o-right:before{content:"\f18e"}.fa-arrow-circle-o-left:before{content:"\f190"}.fa-toggle-left:before,.fa-caret-square-o-left:before{content:"\f191"}.fa-dot-circle-o:before{content:"\f192"}.fa-wheelchair:before{content:"\f193"}.fa-vimeo-square:before{content:"\f194"}.fa-turkish-lira:before,.fa-try:before{content:"\f195"}.fa-plus-square-o:before{content:"\f196"}.fa-space-shuttle:before{content:"\f197"}.fa-slack:before{content:"\f198"}.fa-envelope-square:before{content:"\f199"}.fa-wordpress:before{content:"\f19a"}.fa-openid:before{content:"\f19b"}.fa-institution:before,.fa-bank:before,.fa-university:before{content:"\f19c"}.fa-mortar-board:before,.fa-graduation-cap:before{content:"\f19d"}.fa-yahoo:before{content:"\f19e"}.fa-google:before{content:"\f1a0"}.fa-reddit:before{content:"\f1a1"}.fa-reddit-square:before{content:"\f1a2"}.fa-stumbleupon-circle:before{content:"\f1a3"}.fa-stumbleupon:before{content:"\f1a4"}.fa-delicious:before{content:"\f1a5"}.fa-digg:before{content:"\f1a6"}.fa-pied-piper-pp:before{content:"\f1a7"}.fa-pied-piper-alt:before{content:"\f1a8"}.fa-drupal:before{content:"\f1a9"}.fa-joomla:before{content:"\f1aa"}.fa-language:before{content:"\f1ab"}.fa-fax:before{content:"\f1ac"}.fa-building:before{content:"\f1ad"}.fa-child:before{content:"\f1ae"}.fa-paw:before{content:"\f1b0"}.fa-spoon:before{content:"\f1b1"}.fa-cube:before{content:"\f1b2"}.fa-cubes:before{content:"\f1b3"}.fa-behance:before{content:"\f1b4"}.fa-behance-square:before{content:"\f1b5"}.fa-steam:before{content:"\f1b6"}.fa-steam-square:before{content:"\f1b7"}.fa-recycle:before{content:"\f1b8"}.fa-automobile:before,.fa-car:before{content:"\f1b9"}.fa-cab:before,.fa-taxi:before{content:"\f1ba"}.fa-tree:before{content:"\f1bb"}.fa-spotify:before{content:"\f1bc"}.fa-deviantart:before{content:"\f1bd"}.fa-soundcloud:before{content:"\f1be"}.fa-database:before{content:"\f1c0"}.fa-file-pdf-o:before{content:"\f1c1"}.fa-file-word-o:before{content:"\f1c2"}.fa-file-excel-o:before{content:"\f1c3"}.fa-file-powerpoint-o:before{content:"\f1c4"}.fa-file-photo-o:before,.fa-file-picture-o:before,.fa-file-image-o:before{content:"\f1c5"}.fa-file-zip-o:before,.fa-file-archive-o:before{content:"\f1c6"}.fa-file-sound-o:before,.fa-file-audio-o:before{content:"\f1c7"}.fa-file-movie-o:before,.fa-file-video-o:before{content:"\f1c8"}.fa-file-code-o:before{content:"\f1c9"}.fa-vine:before{content:"\f1ca"}.fa-codepen:before{content:"\f1cb"}.fa-jsfiddle:before{content:"\f1cc"}.fa-life-bouy:before,.fa-life-buoy:before,.fa-life-saver:before,.fa-support:before,.fa-life-ring:before{content:"\f1cd"}.fa-circle-o-notch:before{content:"\f1ce"}.fa-ra:before,.fa-resistance:before,.fa-rebel:before{content:"\f1d0"}.fa-ge:before,.fa-empire:before{content:"\f1d1"}.fa-git-square:before{content:"\f1d2"}.fa-git:before{content:"\f1d3"}.fa-y-combinator-square:before,.fa-yc-square:before,.fa-hacker-news:before{content:"\f1d4"}.fa-tencent-weibo:before{content:"\f1d5"}.fa-qq:before{content:"\f1d6"}.fa-wechat:before,.fa-weixin:before{content:"\f1d7"}.fa-send:before,.fa-paper-plane:before{content:"\f1d8"}.fa-send-o:before,.fa-paper-plane-o:before{content:"\f1d9"}.fa-history:before{content:"\f1da"}.fa-circle-thin:before{content:"\f1db"}.fa-header:before{content:"\f1dc"}.fa-paragraph:before{content:"\f1dd"}.fa-sliders:before{content:"\f1de"}.fa-share-alt:before{content:"\f1e0"}.fa-share-alt-square:before{content:"\f1e1"}.fa-bomb:before{content:"\f1e2"}.fa-soccer-ball-o:before,.fa-futbol-o:before{content:"\f1e3"}.fa-tty:before{content:"\f1e4"}.fa-binoculars:before{content:"\f1e5"}.fa-plug:before{content:"\f1e6"}.fa-slideshare:before{content:"\f1e7"}.fa-twitch:before{content:"\f1e8"}.fa-yelp:before{content:"\f1e9"}.fa-newspaper-o:before{content:"\f1ea"}.fa-wifi:before{content:"\f1eb"}.fa-calculator:before{content:"\f1ec"}.fa-paypal:before{content:"\f1ed"}.fa-google-wallet:before{content:"\f1ee"}.fa-cc-visa:before{content:"\f1f0"}.fa-cc-mastercard:before{content:"\f1f1"}.fa-cc-discover:before{content:"\f1f2"}.fa-cc-amex:before{content:"\f1f3"}.fa-cc-paypal:before{content:"\f1f4"}.fa-cc-stripe:before{content:"\f1f5"}.fa-bell-slash:before{content:"\f1f6"}.fa-bell-slash-o:before{content:"\f1f7"}.fa-trash:before{content:"\f1f8"}.fa-copyright:before{content:"\f1f9"}.fa-at:before{content:"\f1fa"}.fa-eyedropper:before{content:"\f1fb"}.fa-paint-brush:before{content:"\f1fc"}.fa-birthday-cake:before{content:"\f1fd"}.fa-area-chart:before{content:"\f1fe"}.fa-pie-chart:before{content:"\f200"}.fa-line-chart:before{content:"\f201"}.fa-lastfm:before{content:"\f202"}.fa-lastfm-square:before{content:"\f203"}.fa-toggle-off:before{content:"\f204"}.fa-toggle-on:before{content:"\f205"}.fa-bicycle:before{content:"\f206"}.fa-bus:before{content:"\f207"}.fa-ioxhost:before{content:"\f208"}.fa-angellist:before{content:"\f209"}.fa-cc:before{content:"\f20a"}.fa-shekel:before,.fa-sheqel:before,.fa-ils:before{content:"\f20b"}.fa-meanpath:before{content:"\f20c"}.fa-buysellads:before{content:"\f20d"}.fa-connectdevelop:before{content:"\f20e"}.fa-dashcube:before{content:"\f210"}.fa-forumbee:before{content:"\f211"}.fa-leanpub:before{content:"\f212"}.fa-sellsy:before{content:"\f213"}.fa-shirtsinbulk:before{content:"\f214"}.fa-simplybuilt:before{content:"\f215"}.fa-skyatlas:before{content:"\f216"}.fa-cart-plus:before{content:"\f217"}.fa-cart-arrow-down:before{content:"\f218"}.fa-diamond:before{content:"\f219"}.fa-ship:before{content:"\f21a"}.fa-user-secret:before{content:"\f21b"}.fa-motorcycle:before{content:"\f21c"}.fa-street-view:before{content:"\f21d"}.fa-heartbeat:before{content:"\f21e"}.fa-venus:before{content:"\f221"}.fa-mars:before{content:"\f222"}.fa-mercury:before{content:"\f223"}.fa-intersex:before,.fa-transgender:before{content:"\f224"}.fa-transgender-alt:before{content:"\f225"}.fa-venus-double:before{content:"\f226"}.fa-mars-double:before{content:"\f227"}.fa-venus-mars:before{content:"\f228"}.fa-mars-stroke:before{content:"\f229"}.fa-mars-stroke-v:before{content:"\f22a"}.fa-mars-stroke-h:before{content:"\f22b"}.fa-neuter:before{content:"\f22c"}.fa-genderless:before{content:"\f22d"}.fa-facebook-official:before{content:"\f230"}.fa-pinterest-p:before{content:"\f231"}.fa-whatsapp:before{content:"\f232"}.fa-server:before{content:"\f233"}.fa-user-plus:before{content:"\f234"}.fa-user-times:before{content:"\f235"}.fa-hotel:before,.fa-bed:before{content:"\f236"}.fa-viacoin:before{content:"\f237"}.fa-train:before{content:"\f238"}.fa-subway:before{content:"\f239"}.fa-medium:before{content:"\f23a"}.fa-yc:before,.fa-y-combinator:before{content:"\f23b"}.fa-optin-monster:before{content:"\f23c"}.fa-opencart:before{content:"\f23d"}.fa-expeditedssl:before{content:"\f23e"}.fa-battery-4:before,.fa-battery:before,.fa-battery-full:before{content:"\f240"}.fa-battery-3:before,.fa-battery-three-quarters:before{content:"\f241"}.fa-battery-2:before,.fa-battery-half:before{content:"\f242"}.fa-battery-1:before,.fa-battery-quarter:before{content:"\f243"}.fa-battery-0:before,.fa-battery-empty:before{content:"\f244"}.fa-mouse-pointer:before{content:"\f245"}.fa-i-cursor:before{content:"\f246"}.fa-object-group:before{content:"\f247"}.fa-object-ungroup:before{content:"\f248"}.fa-sticky-note:before{content:"\f249"}.fa-sticky-note-o:before{content:"\f24a"}.fa-cc-jcb:before{content:"\f24b"}.fa-cc-diners-club:before{content:"\f24c"}.fa-clone:before{content:"\f24d"}.fa-balance-scale:before{content:"\f24e"}.fa-hourglass-o:before{content:"\f250"}.fa-hourglass-1:before,.fa-hourglass-start:before{content:"\f251"}.fa-hourglass-2:before,.fa-hourglass-half:before{content:"\f252"}.fa-hourglass-3:before,.fa-hourglass-end:before{content:"\f253"}.fa-hourglass:before{content:"\f254"}.fa-hand-grab-o:before,.fa-hand-rock-o:before{content:"\f255"}.fa-hand-stop-o:before,.fa-hand-paper-o:before{content:"\f256"}.fa-hand-scissors-o:before{content:"\f257"}.fa-hand-lizard-o:before{content:"\f258"}.fa-hand-spock-o:before{content:"\f259"}.fa-hand-pointer-o:before{content:"\f25a"}.fa-hand-peace-o:before{content:"\f25b"}.fa-trademark:before{content:"\f25c"}.fa-registered:before{content:"\f25d"}.fa-creative-commons:before{content:"\f25e"}.fa-gg:before{content:"\f260"}.fa-gg-circle:before{content:"\f261"}.fa-tripadvisor:before{content:"\f262"}.fa-odnoklassniki:before{content:"\f263"}.fa-odnoklassniki-square:before{content:"\f264"}.fa-get-pocket:before{content:"\f265"}.fa-wikipedia-w:before{content:"\f266"}.fa-safari:before{content:"\f267"}.fa-chrome:before{content:"\f268"}.fa-firefox:before{content:"\f269"}.fa-opera:before{content:"\f26a"}.fa-internet-explorer:before{content:"\f26b"}.fa-tv:before,.fa-television:before{content:"\f26c"}.fa-contao:before{content:"\f26d"}.fa-500px:before{content:"\f26e"}.fa-amazon:before{content:"\f270"}.fa-calendar-plus-o:before{content:"\f271"}.fa-calendar-minus-o:before{content:"\f272"}.fa-calendar-times-o:before{content:"\f273"}.fa-calendar-check-o:before{content:"\f274"}.fa-industry:before{content:"\f275"}.fa-map-pin:before{content:"\f276"}.fa-map-signs:before{content:"\f277"}.fa-map-o:before{content:"\f278"}.fa-map:before{content:"\f279"}.fa-commenting:before{content:"\f27a"}.fa-commenting-o:before{content:"\f27b"}.fa-houzz:before{content:"\f27c"}.fa-vimeo:before{content:"\f27d"}.fa-black-tie:before{content:"\f27e"}.fa-fonticons:before{content:"\f280"}.fa-reddit-alien:before{content:"\f281"}.fa-edge:before{content:"\f282"}.fa-credit-card-alt:before{content:"\f283"}.fa-codiepie:before{content:"\f284"}.fa-modx:before{content:"\f285"}.fa-fort-awesome:before{content:"\f286"}.fa-usb:before{content:"\f287"}.fa-product-hunt:before{content:"\f288"}.fa-mixcloud:before{content:"\f289"}.fa-scribd:before{content:"\f28a"}.fa-pause-circle:before{content:"\f28b"}.fa-pause-circle-o:before{content:"\f28c"}.fa-stop-circle:before{content:"\f28d"}.fa-stop-circle-o:before{content:"\f28e"}.fa-shopping-bag:before{content:"\f290"}.fa-shopping-basket:before{content:"\f291"}.fa-hashtag:before{content:"\f292"}.fa-bluetooth:before{content:"\f293"}.fa-bluetooth-b:before{content:"\f294"}.fa-percent:before{content:"\f295"}.fa-gitlab:before{content:"\f296"}.fa-wpbeginner:before{content:"\f297"}.fa-wpforms:before{content:"\f298"}.fa-envira:before{content:"\f299"}.fa-universal-access:before{content:"\f29a"}.fa-wheelchair-alt:before{content:"\f29b"}.fa-question-circle-o:before{content:"\f29c"}.fa-blind:before{content:"\f29d"}.fa-audio-description:before{content:"\f29e"}.fa-volume-control-phone:before{content:"\f2a0"}.fa-braille:before{content:"\f2a1"}.fa-assistive-listening-systems:before{content:"\f2a2"}.fa-asl-interpreting:before,.fa-american-sign-language-interpreting:before{content:"\f2a3"}.fa-deafness:before,.fa-hard-of-hearing:before,.fa-deaf:before{content:"\f2a4"}.fa-glide:before{content:"\f2a5"}.fa-glide-g:before{content:"\f2a6"}.fa-signing:before,.fa-sign-language:before{content:"\f2a7"}.fa-low-vision:before{content:"\f2a8"}.fa-viadeo:before{content:"\f2a9"}.fa-viadeo-square:before{content:"\f2aa"}.fa-snapchat:before{content:"\f2ab"}.fa-snapchat-ghost:before{content:"\f2ac"}.fa-snapchat-square:before{content:"\f2ad"}.fa-pied-piper:before{content:"\f2ae"}.fa-first-order:before{content:"\f2b0"}.fa-yoast:before{content:"\f2b1"}.fa-themeisle:before{content:"\f2b2"}.fa-google-plus-circle:before,.fa-google-plus-official:before{content:"\f2b3"}.fa-fa:before,.fa-font-awesome:before{content:"\f2b4"}.fa-handshake-o:before{content:"\f2b5"}.fa-envelope-open:before{content:"\f2b6"}.fa-envelope-open-o:before{content:"\f2b7"}.fa-linode:before{content:"\f2b8"}.fa-address-book:before{content:"\f2b9"}.fa-address-book-o:before{content:"\f2ba"}.fa-vcard:before,.fa-address-card:before{content:"\f2bb"}.fa-vcard-o:before,.fa-address-card-o:before{content:"\f2bc"}.fa-user-circle:before{content:"\f2bd"}.fa-user-circle-o:before{content:"\f2be"}.fa-user-o:before{content:"\f2c0"}.fa-id-badge:before{content:"\f2c1"}.fa-drivers-license:before,.fa-id-card:before{content:"\f2c2"}.fa-drivers-license-o:before,.fa-id-card-o:before{content:"\f2c3"}.fa-quora:before{content:"\f2c4"}.fa-free-code-camp:before{content:"\f2c5"}.fa-telegram:before{content:"\f2c6"}.fa-thermometer-4:before,.fa-thermometer:before,.fa-thermometer-full:before{content:"\f2c7"}.fa-thermometer-3:before,.fa-thermometer-three-quarters:before{content:"\f2c8"}.fa-thermometer-2:before,.fa-thermometer-half:before{content:"\f2c9"}.fa-thermometer-1:before,.fa-thermometer-quarter:before{content:"\f2ca"}.fa-thermometer-0:before,.fa-thermometer-empty:before{content:"\f2cb"}.fa-shower:before{content:"\f2cc"}.fa-bathtub:before,.fa-s15:before,.fa-bath:before{content:"\f2cd"}.fa-podcast:before{content:"\f2ce"}.fa-window-maximize:before{content:"\f2d0"}.fa-window-minimize:before{content:"\f2d1"}.fa-window-restore:before{content:"\f2d2"}.fa-times-rectangle:before,.fa-window-close:before{content:"\f2d3"}.fa-times-rectangle-o:before,.fa-window-close-o:before{content:"\f2d4"}.fa-bandcamp:before{content:"\f2d5"}.fa-grav:before{content:"\f2d6"}.fa-etsy:before{content:"\f2d7"}.fa-imdb:before{content:"\f2d8"}.fa-ravelry:before{content:"\f2d9"}.fa-eercast:before{content:"\f2da"}.fa-microchip:before{content:"\f2db"}.fa-snowflake-o:before{content:"\f2dc"}.fa-superpowers:before{content:"\f2dd"}.fa-wpexplorer:before{content:"\f2de"}.fa-meetup:before{content:"\f2e0"}.sr-only{position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0, 0, 0, 0);border:0}.sr-only-focusable:active,.sr-only-focusable:focus{position:static;width:auto;height:auto;margin:0;overflow:visible;clip:auto}





.jq-toast-wrap,.jq-toast-wrap *{margin:0;padding:0}.jq-toast-wrap{display:block;position:fixed;width:250px;pointer-events:none!important;letter-spacing:normal;z-index:9000!important}.jq-toast-wrap.bottom-left{bottom:20px;left:20px}.jq-toast-wrap.bottom-right{bottom:20px;right:40px}.jq-toast-wrap.top-left{top:20px;left:20px}.jq-toast-wrap.top-right{top:20px;right:40px}.jq-toast-single{display:block;width:100%;padding:10px;margin:0 0 5px;border-radius:4px;font-size:12px;font-family:arial,sans-serif;line-height:17px;position:relative;pointer-events:all!important;background-color:#444;color:#fff}.jq-toast-single h2{font-family:arial,sans-serif;font-size:14px;margin:0 0 7px;background:0 0;color:inherit;line-height:inherit;letter-spacing:normal}.jq-toast-single a{color:#eee;text-decoration:none;font-weight:700;border-bottom:1px solid #fff;padding-bottom:3px;font-size:12px}.jq-toast-single ul{margin:0 0 0 15px;background:0 0;padding:0}.jq-toast-single ul li{list-style-type:disc!important;line-height:17px;background:0 0;margin:0;padding:0;letter-spacing:normal}.close-jq-toast-single{position:absolute;top:3px;right:7px;font-size:14px;cursor:pointer}.jq-toast-loader{display:block;position:absolute;top:-2px;height:5px;width:0;left:0;border-radius:5px;background:red}.jq-toast-loaded{width:100%}.jq-has-icon{padding:10px 10px 10px 50px;background-repeat:no-repeat;background-position:10px}.jq-icon-info{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGwSURBVEhLtZa9SgNBEMc9sUxxRcoUKSzSWIhXpFMhhYWFhaBg4yPYiWCXZxBLERsLRS3EQkEfwCKdjWJAwSKCgoKCcudv4O5YLrt7EzgXhiU3/4+b2ckmwVjJSpKkQ6wAi4gwhT+z3wRBcEz0yjSseUTrcRyfsHsXmD0AmbHOC9Ii8VImnuXBPglHpQ5wwSVM7sNnTG7Za4JwDdCjxyAiH3nyA2mtaTJufiDZ5dCaqlItILh1NHatfN5skvjx9Z38m69CgzuXmZgVrPIGE763Jx9qKsRozWYw6xOHdER+nn2KkO+Bb+UV5CBN6WC6QtBgbRVozrahAbmm6HtUsgtPC19tFdxXZYBOfkbmFJ1VaHA1VAHjd0pp70oTZzvR+EVrx2Ygfdsq6eu55BHYR8hlcki+n+kERUFG8BrA0BwjeAv2M8WLQBtcy+SD6fNsmnB3AlBLrgTtVW1c2QN4bVWLATaIS60J2Du5y1TiJgjSBvFVZgTmwCU+dAZFoPxGEEs8nyHC9Bwe2GvEJv2WXZb0vjdyFT4Cxk3e/kIqlOGoVLwwPevpYHT+00T+hWwXDf4AJAOUqWcDhbwAAAAASUVORK5CYII=);background-color:#31708f;color:#d9edf7;border-color:#bce8f1}.jq-icon-warning{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGYSURBVEhL5ZSvTsNQFMbXZGICMYGYmJhAQIJAICYQPAACiSDB8AiICQQJT4CqQEwgJvYASAQCiZiYmJhAIBATCARJy+9rTsldd8sKu1M0+dLb057v6/lbq/2rK0mS/TRNj9cWNAKPYIJII7gIxCcQ51cvqID+GIEX8ASG4B1bK5gIZFeQfoJdEXOfgX4QAQg7kH2A65yQ87lyxb27sggkAzAuFhbbg1K2kgCkB1bVwyIR9m2L7PRPIhDUIXgGtyKw575yz3lTNs6X4JXnjV+LKM/m3MydnTbtOKIjtz6VhCBq4vSm3ncdrD2lk0VgUXSVKjVDJXJzijW1RQdsU7F77He8u68koNZTz8Oz5yGa6J3H3lZ0xYgXBK2QymlWWA+RWnYhskLBv2vmE+hBMCtbA7KX5drWyRT/2JsqZ2IvfB9Y4bWDNMFbJRFmC9E74SoS0CqulwjkC0+5bpcV1CZ8NMej4pjy0U+doDQsGyo1hzVJttIjhQ7GnBtRFN1UarUlH8F3xict+HY07rEzoUGPlWcjRFRr4/gChZgc3ZL2d8oAAAAASUVORK5CYII=);background-color:#8a6d3b;color:#fcf8e3;border-color:#faebcc}.jq-icon-error{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAHOSURBVEhLrZa/SgNBEMZzh0WKCClSCKaIYOED+AAKeQQLG8HWztLCImBrYadgIdY+gIKNYkBFSwu7CAoqCgkkoGBI/E28PdbLZmeDLgzZzcx83/zZ2SSXC1j9fr+I1Hq93g2yxH4iwM1vkoBWAdxCmpzTxfkN2RcyZNaHFIkSo10+8kgxkXIURV5HGxTmFuc75B2RfQkpxHG8aAgaAFa0tAHqYFfQ7Iwe2yhODk8+J4C7yAoRTWI3w/4klGRgR4lO7Rpn9+gvMyWp+uxFh8+H+ARlgN1nJuJuQAYvNkEnwGFck18Er4q3egEc/oO+mhLdKgRyhdNFiacC0rlOCbhNVz4H9FnAYgDBvU3QIioZlJFLJtsoHYRDfiZoUyIxqCtRpVlANq0EU4dApjrtgezPFad5S19Wgjkc0hNVnuF4HjVA6C7QrSIbylB+oZe3aHgBsqlNqKYH48jXyJKMuAbiyVJ8KzaB3eRc0pg9VwQ4niFryI68qiOi3AbjwdsfnAtk0bCjTLJKr6mrD9g8iq/S/B81hguOMlQTnVyG40wAcjnmgsCNESDrjme7wfftP4P7SP4N3CJZdvzoNyGq2c/HWOXJGsvVg+RA/k2MC/wN6I2YA2Pt8GkAAAAASUVORK5CYII=);background-color:#a94442;color:#f2dede;border-color:#ebccd1}.jq-icon-success{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADsSURBVEhLY2AYBfQMgf///3P8+/evAIgvA/FsIF+BavYDDWMBGroaSMMBiE8VC7AZDrIFaMFnii3AZTjUgsUUWUDA8OdAH6iQbQEhw4HyGsPEcKBXBIC4ARhex4G4BsjmweU1soIFaGg/WtoFZRIZdEvIMhxkCCjXIVsATV6gFGACs4Rsw0EGgIIH3QJYJgHSARQZDrWAB+jawzgs+Q2UO49D7jnRSRGoEFRILcdmEMWGI0cm0JJ2QpYA1RDvcmzJEWhABhD/pqrL0S0CWuABKgnRki9lLseS7g2AlqwHWQSKH4oKLrILpRGhEQCw2LiRUIa4lwAAAABJRU5ErkJggg==);color:#dff0d8;background-color:#3c763d;border-color:#d6e9c6}
