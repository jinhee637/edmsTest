/**
 * 로딩에 대한 처리 펑션
 * jquery.blockUI.js 가 먼저 로딩 되어 있어야 함.
 */
function loading() {
	$.blockUI.defaults.overlayCSS.opacity = .2;
	$.blockUI.defaults.applyPlatformOpacityRules = false;
	$.blockUI.defaults.css = null;
	

	$(document).ajaxStop($.unblockUI);
	$.blockUI({
		
		message:"<div style='margin:0 auto;'><img src='/resources/images/common/loading.gif' /></div> ",
		focusInput : false
	});
}