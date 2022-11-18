<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.DataDao"%>
<%@ page import="dao.Book"%>
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



	<div id="shopCartDetail" class="shopCartDetail wrapper">
		<div id="cart" class="cart wrapper clearfix">
			<div class="header designSettingElement text-titleWithFontSize">
				<span class="title">장바구니<span id="cartSize"></span></span>
			</div>
			<% 
// 			out.print(user);
			DataDao dao=new DataDao(); 
			String asd = request.getParameter("id");
			
			List<Book> bk = dao.selectBuyBookInfo(asd);
			
		
                                       
                                            %>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">삭제</th>
						<th scope="col">상품정보</th>
						<th scope="col">제목</th>
						<th scope="col">가격</th>
<!-- 						<th scope="col">수량</th> -->
					</tr>
				</thead>
				<tbody>




<!-- 					//아이디랑 isbn 이 같이 파라미터로 넘어와서 // info에 id를 넣어서 그걸 가져오면 되는데 // 지금 info에는 책 정보밖에 없음 -->
<!--                                         // id는 따로 만들어서 넣어야? if (bk !=null && bk.size()> 0) { -->
                                      <% 
                                        	
                                      int sum =0;
                                        	for (Book info : bk) {
											 sum+=info.getPrice();
                                        %>
					
						<tr>
							<td> <input type="submit" value="삭제" onclick="location.href='deleteBookInCart_proc.jsp?isbn=<%=info.getIsbn()%>&id=<%=user%>'" /></td>
							<td><a href=""><img src="<%=info.getThumbnail()%>" /></a></td>
						
                                            <td>
                                                <%=info.getTitle()%>
                                            </td>
<!--                                       가격 : 수량 조절하면 반영되어 변해야함  -->
                                            <td>
                                                <%=info.getPrice()%>원
                                            </td>
<!--                                             <td> -->
<!--                                                 <form -->
<!-- 								action="updateBookInCart_proc.jsp"> -->

									
<!-- 						*상세페이지에서 장바구니 버튼 누르면 value값에 장바구니 테이블에 변경된 수량으로 들어가게 수정해야함  -->
<!-- 						 최소값 이하로 입력하면 입력제한하고 알림창 띄우기 	, 숫자만 입력 할 수 있게 제한 				-->
<!-- 									<input name="cnt" id="cnt" type="number" value="1" min="1" /> -->
<!-- <!-- 									----------------------------------------------------- --> -->
<%--                                     <input name="isbn" type="hidden" value=<%=info.getIsbn()%>> --%>
<!--                                     <input name="id" type="hidden" value="asd" /> -->
									
<!-- 						*수량조절 칸에서 책의 수량 입력해서 저장버튼 누르면 (테이블에 update는 되는상태) => 변경된 수량으로 입력칸에 표시되게 하기 -->
<%--                                     <input id=<%=info.getIsbn() %> type="submit" value="저장"> --%>
<!--                                                 </form> -->


<%--                                            <input type="submit" value="삭제" onclick="location.href='deleteBookInCart_proc.jsp?isbn=<%=info.getIsbn()%>&id=asd'" /> --%>
<!--                                             </td> -->
                                            </tr>
                                    
                                        <% }  %>




                                            
                                          
                               
                                
			</table>

  <div
						class="tb-total clearfix">
                                                <div id="cartInfoDiv"
							class="info designSettingElement shape">
                                                    <div class="price">
<!--                                                       <div -->
<!-- 									class="title">상품 합계</div> -->
                                                      
									

                                                        <div
									id="cartTotalProductPrice" class="content"></div>
                                                    </div>
                                                    <div
								id="cartDiscountDiv" class="discount">
                                                        <div
									class="hide">

                                                            <span
										class="icomoon-ic-info designSettingElement text-assi"></span>
                                                            <span
										id="cartDiscountList" class=""></span>
                                                        </div>

                                                        <div
									id="cartDiscountPrice" class="content"></div>
                                                    </div>

                                                </div>
                                                <div id="cartTotalDiv"
							class="total">
                                                    <div
								class="title bold">합계</div>
                                                    <div
								id="cartTotalDiscountAppliedPrice" class="content bold"><%=sum %>원</div>
                                                </div>
                                            </div>


                                <div
				class="btn-wrapper shopCartInfo hide">
                                    <button id="btn_orderProducts"
					class="designSettingElement button"
					onclick="location.href='buyNowCartNo.jsp'">주문하기</button>
                                </div>


						      </div>
                        </div>


                        <script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous"></script>
                </body>

                </html>