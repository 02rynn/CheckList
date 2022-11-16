<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.BookDao" %>
<%@page import="org.json.simple.JSONObject" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<%

String nail = request.getParameter("isbn");
BookDao dao = new BookDao();

JSONObject item = dao.getAladinItemForDetail(nail);






%>

    <div class="bookDetail" style="display: flex; align-items: center;">
        <div class="bookImg" style="width: 60%; margin-left: 50px; ">
            <div id="shopProductImgsDiv" class="content mainImg productImgType_thumbnails ratio_default loading"
                imgSrc="/uploadedFiles/95268/product/image_1668245931868.jpg">
                <!--데이터베이스에서 이미지-->
                <div id='shopProductImgsMainDiv' class='main img-div img'>
                    <div class='shopProductImgMainWrapper type_thumbnails sequence_0 on' data-shopproductsequence='0'>
                        <img  style="width: 50%; margin: 30px" src=<%=item.get("cover")%> />

                    </div>
                </div>
                <div class="swiper-button-prev swiper-button-black"></div>
                <div class="swiper-button-next swiper-button-black"></div>
                <div class="swiper-pagination"></div>
            </div>

        </div>

        <div class="bookDetailInfo" style="margin-right: 70px; width:40%">
            <div id="shopProductNameWrapper" class="row">
                <h1 id="shopProductName" class="row name designSettingElement productName"><%=item.get("title") %></h1>
                <div id="shopProductReviewElem" class="designSettingElement text-body hide"
                    data-product-rating-value=0.0></div>
            </div>

            <div id="shopProductPrice" class="price row designSettingElement">
                <span class="productPriceSpan"><%=item.get("priceSales") %>원</span>
            </div>

            <div id="shopProductCaptionDiv" class="row caption designSettingElement text-body">
                <span id="shopProductCaption" class="text">
                    <!--데이터베이스에서 가져오기-->
                </span>
            </div>


            <div id="productAdditionalInfo" class="row productInfo designSettingElement text-body">

                <div id="shopSettingShipmentDiv" class="shipping">
                    <span class="title"> 배송비 무료</span> <span
                        class="shopSettingShipmentInfo description js-deliveryPriceText">
                        - </span>
                </div>
                <div class="js-extraFeeDescription hide" style="margin-top: 0;">
                    <span class="title"></span> <span class="shopSettingShipmentInfo description"> </span>
                </div>
            </div>


            <div id="shopProductQuantityDiv" class="productQuantityDiv row designSettingElement text-body ">
                <span class="text">수량</span> <input type="number" id="productQuantity"
                    class="productQuantity designSettingElement shape" value="1" min="1" data-initialQuantity="7">
            </div>

            <div class="product-order-summary-wrapper designSettingElement text-body ">
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
                <div class="normalButton" style="display: flex; margin-left: 15px; margin: 20px;">
                    <div class="btn-wrapper buyButton">
                        <button id="btn_buyNow" class="btn btn-primary
                                          " data-is-mini-cart-available="false"
                            onclick="require('v2/mall/service/product').detail.handlePurchase('buyNow', event)">
                            구매하기</button>
                    </div>
                    <div class="btn-wrapper cartButton " style="margin-left: 10px;">
                        <button id="btn_addToCart" class="btn btn-primary
                                          " data-is-mini-cart-available="false"
                            onclick="require('v2/mall/service/product').detail.handlePurchase('', event)">
                            장바구니에 담기</button>
                    </div>
                </div>
            </div>



            <div class="row naverPayButton">
                <script type="text/javascript" src="//pay.naver.com/customer/js/naverPayButton.js" charset="UTF-8">
                </script>

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
                        require("v2/mall/service/product").detail.handlePurchase("naverPayOrder",
                            event);
                    };
                    var wishlist_nc = function () {
                        require("v2/mall/service/product").detail.handlePurchase("naverPayZzim", event);
                    };
                    naver.NaverPayButton.apply({
                        BUTTON_KEY: "0F96F8DF-BC03-4637-A5E3-1911F4E2F9C6", // 네이버페이에서 제공받은 버튼 인증 키 입력
                        TYPE: "desktop" == "mobile" ? naverPayBtnMobileType : "C", // 버튼 모음 종류 설정
                        COLOR: naverPayColor, // 버튼 모음의 색 설정
                        COUNT: "product" == "cart" ? 1 :
                        2, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
                        ENABLE: "notSoldOut" == "soldOut" ? "N" : "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
                        BUY_BUTTON_HANDLER: buy_nc, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
                        WISHLIST_BUTTON_HANDLER: wishlist_nc // 찜하기 버튼 이벤트 Handler 함수 등록
                    });
                </script>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;margin-top: 20px; width: 100%;
            maxlength:50;">
                <thead>
                    <!--테이블의 제목 -->
                    <tr>
                        <th style="background-color: #eeeeee;   text-align:  center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">상품이름</th>
                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">글쓴이</th>
                        <th style="background-color: #eeeeee; text-align: center;">등록일</th>
                        <th style="background-color: #eeeeee; text-align: center;">평점 </th>
                    </tr>
                </thead>

                <h1 style="margin-top: 30px;">독자님들의 후기</h1>
                <tbody style="background-color:#eeeeee;">
                    <!-- 데이터베이스에서 글번호, 책이름, 책제목, 글쓴이, 등록일, 평점 가지고와서 보여지도록  -->
                    <tr>
                        <td>1</td>
                        <td>sql재밌어요 책</td>
                        <td>책이 어렵네요</td>
                        <td>홍길동</td>
                        <td>오늘</td>
                        <td>3점</td>
                    </tr>
                </tbody>
            </table>
            <a href="Write.jsp" class="btn btn-primary" style="width: 100px; position: relative; 
            left: 90%;">글쓰기 </a>
        </div>
    </div>


</body>

</html>