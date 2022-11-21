<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.DataDao"%>
<%@ page import="dao.Book"%>
<%@ page import="dao.cartDao"%>
<%@ page import="dao.cart"%>
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
.cart.wrapper, .searchProduct.field, .searchProductResult.field .no-result,
	.productDetail.wrapper {
	position: relative;
	width: 100%;
	max-width: 1240px;
	min-height: 300px;
	height: auto;
	margin: 0 auto;
	padding: 60px 36px 70px;
	background-color: transparent;
	z-index: 1;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.wrapper>.header, .wrapper .field .header {
	width: 100%;
	margin-bottom: 40px;
}

.item-wrapper.text-title p, .designSettingElement.text-titleWithFontSize
	{
	color: #000000;
	font-family: Noto Sans, sans-serif;
	font-weight: 400;
	letter-spacing: 0em;
	line-height: 1.5em;
}

.item-wrapper.text-title, .designSettingElement.text-titleWithFontSize {
	font-size: 22px;
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

div {
	display: block;
}

.cart.wrapper .tb-title {
	padding: 16px 0 15px;
}

.wrapper .tb-title {
	border-bottom: 1px solid #ddd;
	height: 51px;
}

.designSettingElement.shape, .designSettingElement.shape .cke_contents {
	border-color: #CCCCCC !important;
}

.cart.wrapper .tb-title>.item-list-header>.name {
	width: 53%;
}

.wrapper .tb-title span {
	display: inline-block;
	font-size: 14px;
	line-height: 17px;
	float: left;
}

.cart.wrapper .tb-title>.item-list-header>.qty {
	width: 25%;
	text-align: center;
	padding-left: calc(25% - 114px);
}

.cart.wrapper .tb-title.with-delivery-price>.item-list-header>.price {
	width: 20%;
	text-align: center;
}

.cart.wrapper .tb-title.with-delivery-price>.deliveryCharge {
	display: inline-block;
	width: 20%;
	text-align: center;
}

.cart.wrapper .tb-total .info {
	padding: 20px 0;
}

.wrapper .tb-total .info {
	font-size: 14px;
	border-bottom: 1px solid #ddd;
	padding: 20px 0;
}

.cart.wrapper .tb-total .title {
	margin-right: 15px;
}

.wrapper .tb-total .content {
	display: inline-block;
	width: 40%;
	text-align: right;
}

.wrapper .tb-total .total#cartTotalDiv {
	margin-bottom: 0;
}

.wrapper .tb-total .total {
	margin-bottom: 50px;
	padding: 20px 0;
	font-size: 15px;
	font-weight: bold;
}

.wrapper .tb-total {
	float: right;
	width: 50%;
	vertical-align: middle;
	line-height: 24px;
	text-align: right;
}

.cart.wrapper .btn-wrapper {
	margin-top: 40px;
	text-align: right;
	vertical-align: middle;
}

#body.button-type-normal .designSettingElement.button {
	color: #FFFFFF !important;
	background-color: #222222 !important;
	border-color: #222222 !important;
}

#body .designSettingElement.button {
	border-width: 1px;
}

.cart.wrapper .row.naverPayButton {
	text-align: right;
	margin-top: 40px;
}

.npay_button_box, .npay_button_box2 {
	width: auto !important;
	height: 100% !important;
	*height: auto !important;
	zoom: 1 !important;
	padding: 0 4px !important;
	border-top: 2px solid #2b2f3a !important;
	background-color: #fff !important;
}

.npay_button {
	position: relative !important;
	margin: 0 !important;
	padding: 11px 0 11px 86px !important;
	zoom: 1 !important;
}

.npay_storebtn_bx, .npay_button_box, .npay_button_box2,
	.npay_storebtn_bx *, .npay_button_box *, .npay_button_box2 * {
	display: block !important;
	overflow: hidden !important;
	float: none !important;
	position: static !important;
	top: auto !important;
	left: auto !important;
	width: auto !important;
	height: auto !important;
	margin: 0 !important;
	padding: 0 !important;
	border: 0 none !important;
	font-size: 12px !important;
	line-height: 16px !important;
	font-family: '돋움', Dotum, Helvetica, sans-serif !important;
	text-align: left !important;
	text-decoration: none !important;
	vertical-align: top !important;
	background: none !important;
	border-radius: 0 !important;
}
</style>
</head>

<body>
	<%@ include file="navBar.jsp"%>




<div class="container" style="width:100%; height:30vh; backGround-color: rgb(151, 200, 237); text-align: center;line-height: 30vh;">
 <div class="fontBox" style="font-size : 50px; ">
<h1>주문이 정상적으로 완료되었습니다</h1>
</div>
<div>




<button onclick="location.href='index.jsp'" type="button" class="btn btn-primary btn-lg">메인화면으로 이동</button>
<%
cartDao dao = new cartDao();



dao.deleteBuyBookInfo((String)user);

%>




</div>


























<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
		

</body>

</html>