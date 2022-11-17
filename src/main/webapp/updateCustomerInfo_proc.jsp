<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.DataDao"%>
<%@ page import="dao.Customer"%>

<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<style>
.login.wrapper, .myPage.wrapper, .orderDetails.wrapper, .payment-process.wrapper,
	.cart.payment-process.wrapper, .shopCustomerGradePolicy.wrapper {
	position: relative;
	width: 100%;
	max-width: 960px;
	min-height: 300px;
	height: auto;
	margin: 0 auto;
	padding: 60px 16px 70px;
}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	img, ins, kbd, q, s, samp, small, strike, sub, sup, tt, var, b, u, i,
	center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table,
	caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas,
	details, embed, figure, figcaption, footer, header, hgroup, menu, nav,
	output, ruby, section, summary, time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}

* {
	color: inherit;
	font-size: 1em;
	font-family: inherit;
	line-height: inherit;
	box-sizing: inherit;
	-webkit-box-sizing: inherit;
	-moz-box-sizing: inherit;
	margin: 0;
}

div {
	display: block;
}

body, input, textarea, select, button {
	font-family: sans-serif;
	-webkit-font-smoothing: antialiased;
}

body {
	word-wrap: break-word;
	word-break: break-word;
}

.column-wrapper.two-column {
	zoom: 1;
}

.column-wrapper.two-column:before, .column-wrapper.two-column:after {
	content: '\0020';
	display: block;
	overflow: hidden;
	visibility: hidden;
	width: 0;
	height: 0;
}

.column-wrapper.two-column:after {
	clear: both;
}

.column-wrapper.two-column:before, .column-wrapper.two-column:after {
	content: '\0020';
	display: block;
	overflow: hidden;
	visibility: hidden;
	width: 0;
	height: 0;
}

.column-wrapper.two-column .field:first-child {
	margin-right: 14%;
}

.column-wrapper.two-column .field {
	width: 43%;
	display: inline-block;
	vertical-align: top;
	float: left;
}

.wrapper>.header, .wrapper .field .header {
	width: 100%;
	margin-bottom: 40px;
}

.designSettingElement.text-title {
	color: #000000;
	font-family: Noto Sans, sans-serif;
	font-weight: 400;
	letter-spacing: 0em;
}

.item-element .no-content-msg, .wrapper .no-content-msg {
	text-align: center;
	padding: 100px 0;
	line-height: 1.5em;
}

.designSettingElement.text-body {
	color: #404040;
	font-family: Noto Sans, sans-serif;
	font-weight: 400;
	letter-spacing: 0em;
}

.wrapper .field .header.otherTitle {
	margin-top: 70px;
}

.wrapper>.header, .wrapper .field .header {
	width: 100%;
	margin-bottom: 40px;
}

.myPage.wrapper .memberInfo.field .function.logout, .myPage.wrapper .infoList.field .function.point
	{
	text-align: right;
	margin-bottom: 18px;
}

.wrapper .field .content .row {
	margin-bottom: 20px;
}

.wrapper .field .row .title, .wrapper .field .row .identityNumber-title,
	.payment-process.wrapper .signup .content .row .title {
	display: block;
	font-size: 14px;
	line-height: 17px;
	margin-bottom: 12px;
}

label {
	cursor: default;
}

.wrapper .field .row input[type=text], .wrapper .field .row input[type=search],
	.wrapper .field .row input[type=password], .wrapper .field .row input[type=number],
	.wrapper .field .row input[type=tel], .wrapper .field .row input[type=email]
	{
	background-color: transparent;
	-webkit-appearance: none;
	-moz-appearance: none;
}

.wrapper .field .row input[type=text], .wrapper .field .row input[type=search],
	.wrapper .field .row input[type=password], .wrapper .field .row input[type=number],
	.wrapper .field .row input[type=tel], .wrapper .field .row input[type=email],
	.wrapper .field .row select {
	font-size: 14px;
	line-height: 23px;
	width: 100%;
	height: 45px;
	border: 1px solid #ddd;
	padding: 10px 15px;
}

.designSettingElement.shape, .designSettingElement.shape .cke_contents {
	border-color: #CCCCCC !important;
}

input[readonly], input[readonly="readonly"], select[disabled], select[disabled="disabled"],
	.boardPost-wrapper .infoInput .postImageSettingRow button,
	.readonly-textarea-wrapper {
	background-color: rgba(175, 175, 175, 0.05) !important;
}

input[type=text], input[type=password], input[type=number], input[type=tel],
	input[type=email], input[type=search], select, textarea {
	border-radius: 0 !important;
}

body, input, textarea, select, button {
	font-family: sans-serif;
	-webkit-font-smoothing: antialiased;
}

a, a:hover, a:active, a:focus, a:visited, input, button, select {
	text-decoration: none;
	outline: none !important;
}

.myPage.wrapper .field .content .row.contact input:not(.payletter-phone),
	.login.wrapper .field .content .row.contact input:not(.payletter-phone),
	.orderDetails.wrapper .column-wrapper.two-column .field .content .row.contact input:not(.payletter-phone)
	{
	display: inline-block;
	width: 30%;
}

body.button-shape-roundedSquare .section-wrapper .section .item-wrapper.customForm .customFormSubmitButton,
	#body.button-shape-roundedSquare .section-wrapper .section .item-wrapper.button .item-element,
	#body.button-shape-roundedSquare .section-wrapper .section .item-wrapper.review .review-button,
	#body.button-shape-roundedSquare .item-wrapper.productList .productListWrapper .product-cart-elem,
	#body.button-shape-roundedSquare .item-wrapper.productListSlide .productListWrapper .product-cart-elem,
	#body.button-shape-roundedSquare .designSettingElement.button {
	border-radius: 3px;
}

body.button-type-normal .designSettingElement.button {
	color: #FFFFFF !important;
	background-color: #222222 !important;
	border-color: #222222 !important;
}

body .designSettingElement.button {
	border-width: 1px;
	background-color: #000 !important;
	color: #ffffff !important;
	border-radius: 3px;
	display: inline-block;
	width: auto;
	height: auto;
	padding: 12px 20px;
	white-space: nowrap;
	line-height: 1.25;
	cursor: pointer;
}
</style>
</head>
<body>
	<%@ include file="navBar.jsp"%>
	
	<%
	
	
	String customerPw = request.getParameter("customerPw");
	String customerEmail = request.getParameter("customerEmail");
	String customerPhone1 = request.getParameter("customerPhone1");
	String post = request.getParameter("post2");
	

	Customer cs = new Customer();
	DataDao dao = new DataDao();
	
	
	cs.setPassword(customerPw);
	cs.setEmail(customerEmail);
	cs.setAddress(post);
	cs.setPhone_num(customerPhone1);
	cs.setId(user.toString());
	
	
	
	dao.updateCustomerInfo(cs);
	 
	
	%>
	
	

	<script>

var referrer = document.referrer;

location.href=referrer;


</script>
	
</body>
</html>