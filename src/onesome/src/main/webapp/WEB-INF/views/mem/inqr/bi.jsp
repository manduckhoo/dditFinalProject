<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/memInquirer.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/twoSome.js"></script>
        <!-- S : #container -->
        <div id="container">
            <section>
                <div class="container breadcrumb2 ">
                   <nav class="breadcrumb" aria-label="breadcrumb"
						style="margin-top: 70px; margin-left:10px;">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="/mem/main"><b>Home</b></b></a></li>
								<li class="breadcrumb-item active" aria-current="page"
									style="color: #d50037"><b>브랜드</b></li>
							</ol>
						</nav>
					</nav>
                </div>
				
                <div class="container">
                    <!-- 콘텐츠 제목 -->
                    <div class="title-wrap content-title-wrap">
                        <h1 class="title-h1">브랜드</h1>
                    </div>
                    <!-- //콘텐츠 제목 -->
                </div>

                <!-- S : 본문 -->
                <div class="container">
                    <section>
                        <div class="title-wrap type-bi">
                            <h2 class="title-h2 title-black font-mark">Small Indulgence</h2>
                        </div>
                        <div class="flex-list flex-list-bi">
                            <div class="flex-item">
                                <p class="title-h4">
                                    나만의 즐거움을 만날 수 있는<br>
                                    프리미엄 디저트 카페
                                </p>
                                <p class="desc">
                                    섬세한 디테일이 만드는 커피 맛의 차이. <br>
                                    이것이 바로 원썸 커피만의 Small Indulgence(작은 사치) 입니다.<br>
                                    거기에, 다양한 커피마다 최적으로 어울리는 색다른 디저트까지<br>
                                    나만의 즐거움을 만날 수 있는 프리미엄 디저트 카페 원썸플레이스입니다.
                                </p>
                            </div>
                        </div>
                
                        <ul class="box-list type-bi __layout2" style="display: flex;">
                            <li style="height: 400px;">
                                <span class="span-tag">MAIN BI</span>
                                <img src="https://www.twosome.co.kr/resources/images/content/bi_img_text.svg" alt="A TWOSOME PLACE COFFEE &amp; DESSERT">
                            </li>
                            <li style="height: 400px;">
                                <span class="span-tag">Emblem</span>
                                <img src="https://www.twosome.co.kr/resources/images/content/bi_img_logo.svg" alt="A TWOSOME PLACE COFFEE &amp; DESSERT">
                            </li>
                        </ul>
                
                        <div class="box-bi-gradient" style="margin-bottom: 200px;padding-bottom: 200px;">
                            <div class="box-bi-gradient-coffee swiper-container">
                                <ul class="swiper-wrapper">
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_coffee01.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_coffee02.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_coffee03.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_coffee04.jpg" alt=""></li>
                                </ul>
                            </div>
                            <div class="box-bi-gradient-dessert swiper-container" style=" height: 0px;">
                                <ul class="swiper-wrapper">
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_dessert01.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_dessert02.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_dessert03.jpg" alt=""></li>
                                    <li class="swiper-slide box-bi-image"><img src="/resources/images/content/bi_grad_dessert04.jpg" alt=""></li>
                                </ul>
                            </div>
                            <p class="title font-mark">
                                <em style="position: absolute;left: 117px;">405</em> <em style="
									    position: absolute;
									    left: 302px;
									    margin-left: -30;
									    padding-left: -30;
									    padding-left: -30;
									    margin-left: -;
									">NO.3</em> <br>
                                <em>A</em> CUP OF COFFEE<br>
                                <em>ONE</em> OF NOTEBOOK<br>
                                <em>SOME</em> ERROR<br>
                                <em>PLACE</em><br>
                                	<em>❤</em>
                            </p>
                            <p class="desc">
                                따스한 한 잔의 커피가 있고,<br>
                                우리가 함께 하며,<br>
                                눈과 입이 즐거운 디저트를 즐기는,<br>
                               작은 사치를 누릴 수 있는 행복한 공간
                            </p>
                            
                        </div>
                        
                    </section>
                </div>
                <!-- E : 본문 -->
                <div  class="container">
				<section class="ui-img-exp type2 is-reverse"  >
                        <div class="box txt">
                            <h3 class="title-h5">내 취향에 맞는 브랜드</h3>
                            <p>원썸은 2023년, 국내 업계 최초로 스폐셜 원두 서비스를 시작하며,<br class="is-tablet-hide"> 
                            그 날 그 날 고객이 기분에 맞는 원두를 선택할 수 있는<br class="is-tablet-hide"> 
                            서비스를 제안했습니다.</p>
                            <p>상황과 기분에 맞는 다양한 원두를 선택할 수 있는 커피 메뉴와<br class="is-tablet-hide">  
                            디저트 메뉴를 유연하게 준비하고<br> 
                            커피와 가장 잘 어울리는 케이크를 제안하는 원썸만의 큐레이션은<br class="is-tablet-hide">  
                            고객이 커피 문화에 더 친근하게 접근하고<br>  
                            자신만의 취향을 찾아갈 수 있게 합니다.</p>
                            <p>지금 바로 원썸에서,<br>  
                            당신의 취향을 발견하는 기쁨을 누려보시겠어요?</p>
                        </div>
                        <div class="box">
                            <img src="https://www.twosome.co.kr/resources/images/content/img_20th_brand03.jpg" alt="">
                        </div>
                    </section>
                    <section class="ui-img-exp type2 mb120" style="margin-bottom: 120px;">
                        <div class="box">
                            <img src="https://www.twosome.co.kr/resources/images/content/img_20th_brand04.jpg" alt="">
                        </div>
                        <div class="box txt">
                            <h3 class="title-h5">함께 하는 브랜드</h3>
                                <p>원썸이 생각하는 휴식의 가치는<br>  
                                바쁘고 정신없이 흘러가는 일상에서<br> 
                                사람들과 함께 어울려 누리는 시간입니다.</p>
                                <p>그래서 원썸은 어울림의 즐거움을 아는 당신을 위해<br> 
                                디저트와 커피를 함께 즐기는 디저트 페어링,<br> 
                                여럿이 함께 나누기 좋은 홀케이크,<br>  
                                친구, 동료, 가족과 함께 보내기 좋은 밝고 세련된 공간과 같이<br class="is-tablet-hide"> 
                                ‘함께’여서 더 좋은 메뉴와 공간을 준비하고 당신을 기다리고 있습니다.</p>
                                <p>당신이 함께 하고 싶은 모든 순간,<br>  
                                원썸플레이스와 함께 하세요.</p>
                        </div>
                    </section>
				</div>
            </section>
        </div>

        <script>
	     // 20210405 : 수치 수정
	        $(document).ready(function(){
	            swiperBiCoffee = new Swiper('.box-bi-gradient-coffee', {
	                loop: true,
	                effect: 'fade',
	                autoplayDisableOnInteraction: true,
	                autoplay: {
	                    delay: 1200,
	                },
	                speed: 1200,
	                // simulateTouch: false,
	                slidesPerView: 1,
	                spaceBetween: 0
	            });
	            swiperBiDessert = new Swiper('.box-bi-gradient-dessert', {
	                loop: true,
	                effect: 'fade',
	                autoplayDisableOnInteraction: true,
	                autoplay: {
	                    delay: 1200,
	                },
	                speed: 1200,
	                // simulateTouch: false,
	                slidesPerView: 1,
	                spaceBetween: 0
	            });
	        });
        </script>
        <!-- E : #container -->
