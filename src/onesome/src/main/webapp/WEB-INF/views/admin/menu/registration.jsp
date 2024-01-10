<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="/resources/css/adminMenu.css">

<div class="card bg-info-subtle shadow-none position-relative overflow-hidden mb-4">
    <div class="card-body px-4 py-3">
        <div class="row align-items-center">
            <div class="col-9">
                <h4 class="fw-semibold mb-8">메뉴 등록</h4>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/main">Main</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-muted text-decoration-none" href="/admin/menu/list">List</a>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="col-3">
                <div class="text-center mb-n5">
                </div>
            </div>
        </div>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <div class="admin-menu-boby">
            <form action="/admin/menu/registration" method="post" enctype="multipart/form-data" id="menu-reg-frm">
                <div id="menu-basic-info-area">
                    <div class="row">
                        <div class="col">
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴사진
                                    </strong>
                                </div>
                                <div class="col-sm-8 menu-img-area" style="min-height: 400px">
<%--                                    <img class="menu-img" src="/resources/upload/menu/2023/12/20/3e0e908f-c7d0-49d8-8b2c-24a0860050d3_돌체라떼.jpg"/>--%>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        사진등록
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="file" class="form-control" id="uploadFile" name="uploadFile" required>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴유형
                                    </strong>
                                </div>
                                <div class="col-sm-4">
                                    <select class="form-select" id="ctgry-sel" required>
                                        <option value="" disabled selected>선택해주세요</option>
                                    </select>
                                </div>
                                <div class="col-sm-4" id="ctgryDetail-sel-area">
                                    <select class="form-select" id="ctgryDetail-sel" name="ctgryDetailId" required disabled>
                                        <option value="" disabled selected>선택해주세요</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴명
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" id="menuNm" name="menuNm" required>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        판매가
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control" name="menuPrice" required>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        출시일
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="menuStrtDt" required>
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        판매종료일
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                                    <input type="date" class="form-control" name="menuEndDt">
                                </div>
                            </div>
                            <div class="row admin-menu-row">
                                <div class="col-sm-4">
                                    <strong class="menu-tit-bundle">
                                        메뉴설명
                                    </strong>
                                </div>
                                <div class="col-sm-8">
                            <textarea class="menu-textarea form-control" name="menuDescription" id="menuDescription"
                                      required></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="menu-recipe-area">
                    <h4 class="menu-subtitle text-center">소모 물품 등록</h4>
                    <hr>
                    <div class="col" id="insert-btn-area">
                        <button type="button" id="addProdRow" class="btn btn-primary">추가</button>
                    </div>
                    <table class="table border text-nowrap customize-table mb-0 align-middle">
                        <thead class="text-dark fs-4">
                        <tr>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">번호</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">물품유형</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">물품명</h6>
                            </th>
                            <th>
                                <h6 class="fs-4 fw-semibold mb-0">수량</h6>
                            </th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody id="prod-tbody">
                        <tr>
                            <td>
                                <div class="d-flex align-items-center row-cnt">
                                    1
                                </div>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <select class="form-select product-cd-sel" required>
                                        <option value="" disabled selected>선택해주세요</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <select class="form-select product-item-sel" name="recipeVOList[0].prdctNo"
                                            required>
                                        <option value="" disabled selected>선택해주세요</option>
                                    </select>
                                </div>
                            </td>
                            <td>
                                <div class="d-flex align-items-center">
                                    <div class="form-group">
                                        <input type="number" value="1" name="recipeVOList[0].recQy"
                                               class="form-control recQy" required/>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <button type="button" class="btn btn-danger row-del-btn"><i class='bx bxs-trash'></i></button>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="menu-submit-area">
                    <button type="button" class="menu-submit-btn">등록</button>
                </div>
                <sec:csrfInput/>
            </form>
        </div>
    </div>
</div>

<script src="/resources/js/menuRegistration.js"></script>
