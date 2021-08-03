<%@page contentType="text/javascript; charset=UTF-8" pageEncoding="UTF-8"  %>

$("#btn-login").click(function(e) {
	e.preventDefault();
	if(!confirm('정말로 삭제하시겠습니까?')) return;
	//$('#form-destroy')[0].submit();
});

$("#btn-enter").click(function(e) {
	e.preventDefault();
	if(!confirm('정말로 삭제하시겠습니까?')) return;
	//$('#form-destroy')[0].submit();
});

$("#btn-forgot").click(function(e) {
	e.preventDefault();
	if(!confirm('정말로 삭제하시겠습니까?')) return;
	//$('#form-destroy')[0].submit();
});
