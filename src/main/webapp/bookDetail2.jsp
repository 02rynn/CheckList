<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="shopProductDetail wrapper">
      <div id="productDetail" class="productDetail wrapper"
         data-mini-cart-trigger-point="">
         <div class="top-info clearfix">
            <div id="shopProductImgsDiv"
               class="content mainImg productImgType_thumbnails ratio_default loading"
               imgSrc="/uploadedFiles/95268/product/image_1668245931868.jpg">
               <div id='shopProductImgsMainDiv' class='main img-div img'>
                  <div
                     class='shopProductImgMainWrapper type_thumbnails sequence_0 on'
                     data-shopproductsequence='0''>
                     <img data-shopProductSequence='0'
                        imgSrc='/uploadedFiles/95268/product/image_1668245931868.jpg'
                        class='shopProductImgMain thumbnails'
                        src='https://contents.sixshop.com/thumbnails/uploadedFiles/95268/product/image_1668245931868_1000.jpg' />
                  </div>
               </div>
               <div class="swiper-button-prev swiper-button-black"></div>
               <div class="swiper-button-next swiper-button-black"></div>
               <div class="swiper-pagination"></div>
            </div>





            <div id="shopProductContentInfo"
               class="content clearfix info align_left">
               <div id="shopProductNameWrapper" class="row">
                  <h1 id="shopProductName"
                     class="row name designSettingElement productName">Samulham
                     사물함 7호 The Letter</h1>
                  <div id="shopProductReviewElem"
                     class="designSettingElement text-body hide"
                     data-product-rating-value=0.0></div>
               </div>






               <div id="shopProductPrice" class="price row designSettingElement">



                  <span class="productPriceSpan">18,000원</span>



               </div>




               <div id="shopProductCaptionDiv"
                  class="row caption designSettingElement text-body">
                  <span id="shopProductCaption" class="text"> 
                            <!--데이터베이스에서 가져오기-->
                  </span>
               </div>


               <div id="productAdditionalInfo"
                  class="row productInfo designSettingElement text-body">

                  <div class="point rewardPointRate">
                     <span class="title">적립금</span> <span
                        class="rewardPointInfo description">3% <span
                        id="shopProductRewardPointInfoBtn"
                        class="designSettingElement text-assi icomoon-ic-info middle pointer"></span>
                     </span>
                  </div>
                  <div id='shopProductRewardPointInfo'
                     class='rewardPoint-wrapper designSettingElement text-body hide'>
                     <div class='rewardPoint-info'>
                        <span class='rewardPoint-title'>기본 적립</span><span
                           class='rewardPoint-description'>3%</span>
                     </div>
                  </div>


                  <div id="shopSettingShipmentDiv" class="shipping">
                     <span class="title"> 배송비 </span> <span
                        class="shopSettingShipmentInfo description js-deliveryPriceText">
                        - </span>
                  </div>
                  <div class="js-extraFeeDescription hide" style="margin-top: 0;">
                     <span class="title"></span> <span
                        class="shopSettingShipmentInfo description"> </span>
                  </div>
                  <div id="shopProductDetailSameShippingPolicyProductSearchLink"
                     class="hide">
                     <span class="title"></span> <a
                        class="description designSettingElement text-link">함께 구매 시
                        배송비 절약 상품 보기</a>
                  </div>

                  <div id="shopProductAdditionalFixedOptionPriceDiv"
                     class="shopProductAdditionalFixedOptionPriceDiv hide">
                     <span class="title">추가 금액</span> <span
                        class="shopProductAdditionalFixedOptionPriceInfo description"></span>
                  </div>

               </div>



               <div id="togetherBuyProducts" class="hide"></div>


               <div id="shopProductQuantityDiv"
                  class="productQuantityDiv row designSettingElement text-body ">
                  <span class="text">수량</span> <input type="number"
                     id="productQuantity"
                     class="productQuantity designSettingElement shape" value="1"
                     min="1" data-initialQuantity="7">
               </div>


               <div id="shopProductCartErrorDiv"
                  class="shopProductCartErrorDiv row designSettingElement text-body hide">



                  <span class="text">품절된 상품입니다.</span>


               </div>

               <div
                  class="product-order-summary-wrapper designSettingElement text-body ">
                  <div class="product-order-summary-info designSettingElement shape">
                     <div class="product-order-summary-row">
                        <span class="title">주문 수량</span> <span class="row-content">
                           <i class="ico-info-triangle no-ico-hover-effect hide"></i>&nbsp;
                           <span id="product-order-total-quantity">0개</span>
                        </span>
                     </div>
                     <div class="product-order-summary-row">
                        <span class="title">총 상품 금액</span> <span class="row-content">
                           <span id="product-order-total-price">0원</span>
                        </span>
                     </div>
                  </div>
               </div>




               <div id="productActionButtonDiv" class="productActionButtonDiv row">



                  <div class="normalButton">
                     <div class="btn-wrapper buyButton">
                        <button id="btn_buyNow"
                           class="buyNow designSettingElement button 
                                            "
                           data-is-mini-cart-available="false"
                           onclick="require('v2/mall/service/product').detail.handlePurchase('buyNow', event)">
                           구매하기</button>
                     </div>
                     <div class="btn-wrapper cartButton">
                        <button id="btn_addToCart"
                           class="addToCart designSettingElement button outline 
                                            "
                           data-is-mini-cart-available="false"
                           onclick="require('v2/mall/service/product').detail.handlePurchase('', event)">
                           장바구니에 담기</button>
                     </div>
                  </div>


               </div>



               <div class="row naverPayButton">



                  <script type="text/javascript"
                     src="//pay.naver.com/customer/js/naverPayButton.js"
                     charset="UTF-8"></script>



                  <script type="text/javascript">
                var naverPayBtnMobileType;
                var naverPayColor = "white" == "white" ? 2 : 3;

                if (naverPayColor === 2) {
                    naverPayBtnMobileType = "MA";
                }

                if (naverPayColor === 3) {
                    naverPayBtnMobileType = "MB";
                }

                var buy_nc = function (event) {
                    require("v2/mall/service/product").detail.handlePurchase("naverPayOrder", event);
                };
                var wishlist_nc = function () {
                    require("v2/mall/service/product").detail.handlePurchase("naverPayZzim", event);
                };
                naver.NaverPayButton.apply({
                    BUTTON_KEY: "0F96F8DF-BC03-4637-A5E3-1911F4E2F9C6", // 네이버페이에서 제공받은 버튼 인증 키 입력
                    TYPE: "desktop" == "mobile" ? naverPayBtnMobileType : "C", // 버튼 모음 종류 설정
                    COLOR: naverPayColor, // 버튼 모음의 색 설정
                    COUNT: "product" == "cart" ? 1 : 2, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
                    ENABLE: "notSoldOut" == "soldOut" ? "N" : "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
                    BUY_BUTTON_HANDLER: buy_nc, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
                    WISHLIST_BUTTON_HANDLER: wishlist_nc // 찜하기 버튼 이벤트 Handler 함수 등록
                });
            </script>
               </div>
</body>
</html>