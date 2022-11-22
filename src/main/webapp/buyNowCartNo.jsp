<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dao.Customer" %>
<%@ page import="dao.Book" %>
<%@ page import="dao.BuyBookDao" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style>
		* {
			box-sizing: border-box;
		}

		.card {
			display: flex;
			flex-direction: column;
			padding: 24px 16px;
			margin-bottom: 16px;
		}

		.order-item {
			display: flex;
			flex-direction: row;
		}

		.order-item-thumnail {
			margin-right: 16px;
			cursor: pointer;
			width: 86px;
		}

		.item-qty-and-price-wrapper {
			display: flex;
			flex-direction: colums;
			flex: 1;
		}

		.title-supplement {
			display: flex;
			flex: 1 1 auto;
			flex-direction: row;
			justify-content: flex-end;
		}

		.form-group {
			margin-bottom: 16px;
		}

		.form-group input {
			flex: 1 1 auto;
			padding: 13px 16px;
			border-radius: 6px;
			border: 1px solid lightgray;
		}

		.multiple-rows {
			display: flex;
			flex-direction: column;
		}

		.designSettingElement.brand-color.brand-color-bg {
			background-color: #000 !important;
		}

		.designSettingElement.brand-color.brand-color-text-reverse {
			color: #ffffff !important;
		}

		.btn {
			width: 100%;
			cursor: pointer;
		}
	</style>
</head>

<body>
	<%@ include file = "navBar.jsp" %>

	<% 

String thumbnail = request.getParameter("thumbnail");
String title = request.getParameter("title");
int price = Integer.parseInt(request.getParameter("price"));

String isbn = request.getParameter("isbn");

Book bk = new Book();
Customer cs = new Customer();
cs.setId((String)user);

BuyBookDao dao = new BuyBookDao();

bk = dao.selectBuyBookInfoInBuyPage(isbn);
cs = dao.selectCustomerInfoInBuyPage((String)user);

cs.setId((String)user);


// out.print(isbn);
// out.print(price);





%>

	<form action="Purchase_proc.jsp" method="get" name="pay">
		<input name="isbn" value=<%=isbn %> type="hidden" />
		<input name="price" value=<%=price %> type="hidden" />
		<input name="title" value="<%=bk.getTitle()%>" type="hidden" />
		<div class="PaymentOrder" style="width: 750px;">
			<div class="card collapsed">
				<div class="card-title-wrapper">
					<h1 class="page-title-text" style="text-align: center; padding: 24px 16px;">별책부록</h1>
				</div>
				<div class="OrderSheet">
					<div class="OrderItems">
						<div class="card-title-wrapper">
							<h2 class="title-text">주문상품</h2>
						</div>
						<br />
						<div class="card-body-wrapper">
							<div class="order-item-list">
								<div class="order-item">
									<img src=<%=bk.getThumbnail() %>>

									<div class="order-item-info-wrapper">
										<span class="item-title"><%=bk.getTitle() %></span>
										<div class="item-qty-and-price-wrapper">1개
											<%-- 									<%=price %> --%>

										</div>

									</div>
								</div>
							</div>
							<br />
							<div class="order-total-wrapper">
								<span>상품합계</span>
								<div class="order-total-price-wrapper" style="display: block; text-align: right;">
									<span class="order-total-price"
										style="color: blue; font-weight: bold;"><%=bk.getPrice() %></span>

									<span class="order-total-unit" style="color: blue; font-weight: bold;">원</span>
								</div>
							</div>
						</div>

					</div>
					<div class="OrderInfo">
						<div class="card-title-wrapper">
							<h2 class="title-text">주문자</h2>
							<div class="title-supplement">
								<span style="color: blue"><%=cs.getCustomer_name() %></span>
							</div>
						</div>
					</div>

					<div class="ShippingInfo">
						<div class="card-title-wrapper">
							<h2 class="text-title">배송지</h2>
						</div>
						<div class="card-body-wrapper">
							<div class="shipping-address-type-selector">
								<label class="radio-container"> <input class="radio-input" name="shippingAddressType"
										type="radio" value="DEFAULT" disabled="true"> <span class="checkmark"></span>
									<span class="text-label">기본배송지</span>
								</label> <label class="radio-container"> <input class="radio-input"
										name="shippingAddressType" type="radio" value="NEW" checked> <span
										class="checkmark"></span> <span class="text-label">신규입력</span>
								</label>
							</div>
							<div class="new-shipping-address-form-wrapper">
								<div class="form-group">
									<label>이름</label>
									<div class="input-group">
										<input type="text" value=<%=cs.getCustomer_name() %> name="name">
									</div>
								</div>
								<!-- 							<div class="form-group"> -->
								<!-- 								<label>우편번호</label> -->
								<!-- 								<div class="input-group"> -->
								<!-- 									<div class="multiple-columns"> -->
								<!-- 										<input type="tel"> -->
								<!-- 										<button type="button"> -->
								<!-- 											<span>검색하기</span> -->
								<!-- 										</button> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
								<!-- 							</div> -->
								<div class="form-group">
									<label>주소</label>
									<div class="input-group">
										<div class="multiple-rows">
											<input type="text" value=<%=cs.getAddress() %> name="address">
										</div>
									</div>
								</div>
								<div class="form-group" data-ref-id="shippingInfoComponent-recipientPhone-ko"
									data-status="normal">
									<label>연락처</label>
									<div class="input-group">
										<div class="multiple-columns">
											<input type="tel" maxlength="11" data-form-field="phoneOne"
												data-scheme-type="localTel"
													onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
												class="designSettingElement point-color point-color-border-on-focus"
												value=<%=cs.getPhone_num() %> name="phone">

										</div>
										<div class="msg-stack">
											<div class="msg-row">
												<span class="msg-text" data-msg="연락처가 올바르지 않습니다."></span>
											</div>
										</div>
									</div>
								</div>
								<div class="set-as-default-wrapper" data-shipping-address-type="NEW"
									data-customer-restrict="customer">
									<div class="form-group">
										<div class="input-group-checkbox">
											<input id="shippingInfoComponent-setAsDefault"
												data-ref-id="shippingInfoComponent-setAsDefault" type="checkbox"> <label
												class="checkbox-container designSettingElement point-color point-color-checkbox"
												for="shippingInfoComponent-setAsDefault">기본 배송지로 설정하기
											</label>
										</div>
									</div>
								</div>
								<div class="shipping-request-wrapper">
									<div class="form-group" data-status="normal">
										<label>배송 시 요청 사항</label>
										<div class="input-group">
											<input type="text" data-form-field="deliveryRequest"
												data-scheme-type="deliveryRequest"
												class="designSettingElement point-color point-color-border-on-focus">

										</div>
									</div>
								</div>

								<div class="card-title-body-wrapper" data-loading-restrict="loaded">



									<hr class="horizontal-rule">
									<div class="info-list">

										<div class="info-item" data-ref-id="paymentInfoComponent-deliveryPriceInfo">
											<span class="title"> 배송비 <i class="icomoon-ic-info hide"
													data-ref-id="paymentInfoComponent-showDeliveryPriceListIcon"
													data-collapsable-controller
													data-collapsable-target="deliveryPriceList"></i>
											</span> <span class="value" data-field="deliveryPrice">무료</span>
										</div>
										<div class="info-item collapsable collapsed"
											data-collapsable-tag="deliveryPriceList" style="margin-top: 6px;">
											<div class="multiple-rows" data-collapsable-area
												data-ref-id="paymentInfoComponent-deliveryPriceList"></div>
										</div>

									</div>
									<hr class="horizontal-rule">
									<div class="order-total-wrapper">
										<span class="order-total-label">결제 금액</span>
										<div
											class="order-total-price-wrapper designSettingElement point-color point-color-text">
											<span class="order-total-price"
												data-field="orderPrice"><%=bk.getPrice() %></span>
											<span class="order-total-price-unit">원</span>
										</div>
									</div>
									<br />
									<div class="PayMethods">
										<div class="card-title-wrapper">
											<h2 class="title-text">결제 방법</h2>
										</div>
										<div class="card-body-wrapper" data-loading-restrict="loaded">

											<div class="methods-container pay-methods" data-locale-restrict="ko">
												<label class="method-item" data-paymethod-type="CARD" data-radio-button>
													<label
														class="radio-container designSettingElement point-color point-color-radio">
														<input class="radio-input" name="paymethodType" id="paymethodType" type="radio"
															value="CARD"> <span class="checkmark"></span>
														<span class="text-label">신용 / 체크카드</span>
													</label>
												</label> <label class="method-item" data-paymethod-type="KAKAOPAY"
													data-radio-button> <label
														class="radio-container designSettingElement point-color point-color-radio">
														<input class="radio-input" name="paymethodType" id="paymethodType" type="radio"
															value="KAKAOPAY"> <span class="checkmark"></span> <span
															class="text-label">카카오페이</span>
													</label>
												</label> <label class="method-item" data-paymethod-type="BANK"
													data-radio-button> <label
														class="radio-container designSettingElement point-color point-color-radio">
														<input class="radio-input" name="paymethodType" id="paymethodType" type="radio"
															value="BANK"> <span class="checkmark"></span>
														<span class="text-label">계좌 이체</span>
													</label>
												</label> <label class="method-item" data-paymethod-type="WITHOUT_BANK"
													data-radio-button>
													<label
														class="radio-container designSettingElement point-color point-color-radio">
														<input class="radio-input" name="paymethodType" id="paymethodType" type="radio"
															value="WITHOUT_BANK"> <span class="checkmark"></span> <span
															class="text-label">무통장
															입금</span>
													</label>
												</label>
											</div>

											<div class="method-additional-infos-container" data-locale-restrict="ko">
											</div>


										</div>
									</div>
									<br />
									<div class="fixed-card">


										<!-- 								  <form action="Purchase_proc.jsp" method="get"> -->
										<%-- 								   <input name="isbn" value=<%=isbn %> type="hidden"/> --%>
										<button type="submit" data-ref-id="checkoutBtnComponent" id="paybtn"
											class="CheckoutBtnComponent btn btn-cta designSettingElement brand-color brand-color-bg brand-color-text-reverse">
											<span data-locale-restrict="ko"> <span
													data-field="orderPrice"><%=bk.getPrice() %></span>원 결제하기
											</span>
										</button>



									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	<script>
	
	

	
	document.getElementById('paybtn').addEventListener('click', (e) => {
		e.preventDefault();
		let form = document.pay;
		if(form.paymethodType.value == "" ){
		alert("결제 방법을 선택하세요")
		form.paymethodType.focus();
		return false;
		}	else if (form.name.value == "") {
			alert("이름은 필수입니다")
			form.name.focus();
			return false;
		} else if (form.address.value == "") {
			alert("주소는 필수입니다")
			form.address.focus();
			return false;
		} else if (form.phone.value == "") {
			alert("연락처는 필수입니다")
			form.phone.focus();
			return false;
		} else {
			if (confirm('결제하시겠습니까?')) {
				form.action = "Purchase_proc.jsp";
				form.submit();
			}
		}
	});
		
	
	</script>
	

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous">
	</script>
</body>

</html>