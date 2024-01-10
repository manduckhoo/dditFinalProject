<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- start notification Dropdown -->
<li class="nav-item dropdown"><a class="nav-link nav-icon-hover"
	href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
	aria-expanded="false"> <i class="ti ti-bell-ringing"></i>
		<div class="notification bg-primary rounded-circle"></div>
</a>
	<div
		class="dropdown-menu content-dd dropdown-menu-end dropdown-menu-animate-up "
		aria-labelledby="drop2" data-bs-popper="static">
		<div
			class="d-flex align-items-center justify-content-between py-3 px-7">
			<h5 class="mb-0 fs-5 fw-semibold">알림</h5>
<!-- 			<span class="badge text-bg-primary rounded-4 px-3 py-1 lh-sm">5 new</span> -->
		</div>
		<div class="message-body simplebar-scrollable-y" data-simplebar="init">
			<div class="simplebar-wrapper" style="margin: 0px;">
				<div class="simplebar-height-auto-observer-wrapper">
					<div class="simplebar-height-auto-observer"></div>
				</div>
				<div class="simplebar-mask">
					<div class="simplebar-offset" style="right: 0px; bottom: 0px;">
						<!-- 알림 들어갈 공간 -->
						<div class="simplebar-content-wrapper" tabindex="0" role="region"
							aria-label="scrollable content"
							style="height: auto; overflow: hidden scroll;">
							<div class="simplebar-content" style="padding: 0px;">
								<a href="javascript:void(0)"
									class="py-6 px-7 d-flex align-items-center dropdown-item">
									<span class="me-3"> <img
										src="/resources/bootstrap/src/assets/images/profile/user-1.jpg" alt="user"
										class="rounded-circle" width="48" height="48">
								</span>
									<div class="w-75 d-inline-block v-middle">

										<span class="fs-2 d-block text-body-secondary">Congratulate him</span>
									</div>
								</a>
							</div>
						</div>
						<!-- 알림 들어갈 공간 끝 -->
					</div>
				</div>
				<div class="simplebar-placeholder"
					style="width: 360px; height: 432px;"></div>
			</div>
			<div class="simplebar-track simplebar-horizontal"
				style="visibility: hidden;">
				<div class="simplebar-scrollbar" style="width: 0px; display: none;"></div>
			</div>
			<div class="simplebar-track simplebar-vertical"
				style="visibility: visible;">
				<div class="simplebar-scrollbar"
					style="height: 300px; display: block; transform: translate3d(0px, 0px, 0px);"></div>
			</div>
		</div>
		<div class="py-6 px-7 mb-1">
			<button class="btn btn-outline-primary w-100">See All Notifications</button>
		</div>

	</div></li>
<!-- ------------------------------- -->
<!-- end notification Dropdown -->
<!-- ------------------------------- -->