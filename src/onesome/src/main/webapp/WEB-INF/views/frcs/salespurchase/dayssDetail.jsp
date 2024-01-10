<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- ${detailList} --%>
<!-- 브레드 크럼 시작  -->
<div
	class="card bg-success-subtle shadow-none position-relative overflow-hidden mb-4">
	<div class="card-body px-4 py-3">
		<div class="row align-items-center">
			<div class="col-9">
				<h4 class="fw-semibold mb-8">매입/매출 분석</h4>
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a
							class="text-muted text-decoration-none" href="/frcs/main">Main</a>
						</li>
						<li class="breadcrumb-item text-muted" aria-current="page">일일
							매출 분석</li>
						<li class="breadcrumb-item text-muted" aria-current="page">상세</li>
					</ol>
				</nav>
			</div>
			<div class="col-3">
				<div class="text-center mb-n5">
					<img
						src="/resources/bootstrap/src/assets/images/breadcrumb/ChatBc.png"
						alt="" class="img-fluid mb-n4">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 브레드 크럼 끝  -->

<!-- @@@@@ 좌측 일 매출 내역 @@@@@@ -->
<div class="container-fluid">
	<div class="card overflow-hidden invoice-application">
		<div
			class="d-flex align-items-center justify-content-between gap-3 m-3 d-lg-none">
			<button class="btn btn-primary d-flex" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#chat-sidebar"
				aria-controls="chat-sidebar">
				<i class="ti ti-menu-2 fs-5"></i>
			</button>
			<form class="position-relative w-100">
				<input type="text" class="form-control search-chat py-2 ps-5"
					id="text-srh" placeholder="Search Contact"> <i
					class="ti ti-search position-absolute top-50 start-0 translate-middle-y fs-6 text-dark ms-3"></i>
			</form>
		</div>
		<div class="d-flex">
			<div class="w-25 d-none d-lg-block border-end user-chat-box">
				<div class="p-3 border-bottom fs-6"
					style="text-align: center; font-weight: bolder;">일일 매출 내역</div>
				<div class="app-invoice">
					<ul class="overflow-auto invoice-users"
						style="height: calc(100vh - 262px)" data-simplebar="init">
						<div class="simplebar-wrapper" style="margin: 0px;">
							<div class="simplebar-height-auto-observer-wrapper">
								<div class="simplebar-height-auto-observer"></div>
							</div>
							<div class="simplebar-mask">
								<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
									<div class="simplebar-content-wrapper" tabindex="0"
										role="region" aria-label="scrollable content"
										style="height: 100%; overflow: hidden;">
										<!-- 매출 내역 시작 -->
										<div class="simplebar-content" style="padding: 0px;">
											<c:forEach var="paymentVO" items="${detailList}"
												varStatus="stat">
												<li class="tdtd" value="${paymentVO.pynmNo}"><a
													href="javascript:void(0)"
													class="p-3 bg-hover-light-black border-bottom d-flex align-items-start invoice-user listing-user bg-light"
													id="invoice-123" data-invoice-id="123">
														<div
															class="btn btn-primary round rounded-circle d-flex align-items-center justify-content-center">
															<i>${stat.count}</i>
														</div>
														<div class="ms-3 d-inline-block w-75">
															<h5 class="mb-0 invoice-customer">결제 번호 :
																${paymentVO.pynmNo}</h5>
															<br /> <span
																class="fs-3 invoice-id text-truncate text-body-color d-block w-85">결제자
																: ${paymentVO.memberVOList[0].memNm} </span> <span
																class="fs-3 invoice-date text-nowrap text-body-color d-block">결제일
																: <fmt:formatDate value="${paymentVO.pynmDt}"
																	dateStyle="long" />
															</span>
														</div>
												</a></li>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
							<div class="simplebar-placeholder"
								style="width: 287px; height: 459px;"></div>
						</div>
						<div class="simplebar-track simplebar-horizontal"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="width: 0px; display: none;"></div>
						</div>
						<div class="simplebar-track simplebar-vertical"
							style="visibility: hidden;">
							<div class="simplebar-scrollbar"
								style="height: 0px; display: none;"></div>
						</div>
					</ul>
				</div>
			</div>
			<!-- @@@@@ 좌측 일 매출 내역 끝 @@@@@@ -->


			<div class="w-75 w-xs-100 chat-container">
				<div class="invoice-inner-part h-100">
					<div class="invoiceing-box">
						<div
							class="invoice-header d-flex align-items-center border-bottom p-3">
							<h4 class="font-medium text-uppercase mb-0"
								style="font-weight: bolder;">주문 내역</h4>
						</div>
						
						<!-- ajax 시작 -->
						<div id="daysDetailTable"></div>
						<!-- ajax 끝 -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

<script type="text/javascript">
$(function(){
	$(".tdtd").on("click", function(){
		
		var pynmNo = $(this).attr("value"); 
		
        console.log(pynmNo);
		
		let data = {
				"frcsNo" : ${paymentVO.frcsNo},
				"pynmNo" : pynmNo
		}
		
		console.log(data);
		
		$.ajax({
			url:"/frcs/salespurchase/dayssDetail",
			contentType:"application/json;charset=utf-8",
		     type:"post",
		     data:JSON.stringify(data),
		     dataType:"json",
		     async:false,
		     beforeSend:function(xhr){
		         xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		      },
		     success:function(result){
		    	
// 		    	 console.log("된거니?", result.daysDetail);
// 		    	 console.log("네뮤명 : ", result.daysDetail[0].menuNm);
// 		    	 console.log("네뮤명2 : ", result.daysDetail[1].menuNm);
// 		    	 console.log("가격 : ", result.daysDetail[0].menuPrice);
// 		    	 console.log("가격2 : ", result.daysDetail[1].menuPrice);

				 $("#daysDetailTable *").remove();
		    	 let totalAmount = 0;
		    	 
		    	 const token = $("meta[name='_csrf']").attr("content");
		    	 
// 		    	 let str = `<div class="p-3" id="custa"
		    	 
		    	 let str = `<div class="p-3" id="custom-invoice" style="display: block;">`
					 str +=`<div class="invoice-123" id="printableArea" style="display: block;">`
					 str +=`<div class="row pt-3">`
					 str +=`<div class="col-md-12">`
					 str +=`<div class="table-responsive mt-5" style="clear: both">`
					 str +=`<h5 class="mb-0 invoice-customer">결제번호 : \${pynmNo}</h5>`
					 str +=`<br/>`
					 str +=`<table class="table table-hover">`
					 str +=`<thead>`;
					 						<!-- start row -->
					 str +=`<tr>`
					 str +=`<th class="text-center">#</th>`
					 str +=`<th>메뉴명</th>`
					 str +=`<th class="text-center">수량</th>`
					 str +=`<th class="text-center">합계</th>`
					 str +=`</tr>`
											<!-- end row -->
					 str +=`</thead>`;
					 str +=`<tbody>`;
					 result.daysDetail.forEach(function(paymentDetailVO, index){
					 str +=`<tr>
					 			<td class="text-center">\${index + 1}</td>
					 			<td>\${paymentDetailVO.menuNm}</td>
					 			<td class="text-center">\${paymentDetailVO.pynmCnt}</td>
					 			<td class="text-end replaceComma">\${paymentDetailVO.menuPrice} 원</td>
					 		</tr>`
					 totalAmount += parseFloat(paymentDetailVO.menuPrice);
					 });		
					 console.log("합계나오냐? : ", totalAmount);
					 str +=`</tbody>`;
					 str +=`</table>`;
					 str +=`</div>`;
					 str +=`</div>`;
					 
					 str +=`<div class="col-md-12">
							<div class="pull-right mt-4 text-end">
							<hr>
							<h3 class="replaceComma">
								<b>Total :</b> \${totalAmount} 원
							</h3>
							</div>
							<div class="clearfix"></div>`
					 str +=`<hr>
							<div class="text-end">
							<button class="btn mb-1 waves-effect waves-light btn-outline-primary" type="submit">
							<a href="/frcs/salespurchase/dayss"> 목록으로 </a>
							</button>
							</div>`
					 
		    	 
		    	 $("#daysDetailTable").html(str);
				
				 const cnt = document.querySelectorAll(".replaceComma").length;
		         // console.log("cnt===", cnt)

                 for (let i=0; i<cnt; i++){
                    let nonComma = document.querySelectorAll(".replaceComma").item(i).innerText;
                    // console.log("nonComma======= : ", nonComma);
                    let comma = nonComma.toString().replace(/\B(?=(\d{3})+(?!\d))/g,',');
                    // console.log("comma========", comma)

                    document.querySelectorAll(".replaceComma").item(i).innerText = comma;

                 }
					
		    	 
		     }
		})
		
	})
})
</script>