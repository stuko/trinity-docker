<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.*"%>

<%@ page import="com.stuko.anaconda.XmlConfig.*"%>
<%@ page import="com.stuko.anaconda.Exception.ExceptionCenter"%>
<%@ page import="com.stuko.anaconda.front.*"%>
<%@ page import="com.stuko.anaconda.Auth.*"%>
<%@ page import="com.stuko.anaconda.value.*"%>
<%@ page import="com.stuko.anaconda.business.*"%>
<%@ page import="com.stuko.anaconda.openapi.*"%>
<%@ page import="com.stuko.anaconda.util.*"%>




  <div class="main">


        <div class="main-content dashboard">
            <div class="row">
                <div class="col-12">
                    <div class="box card-box">
                        <div class="icon-box bg-color-1">
                            <div class="icon bg-icon-1">
                                <i class="bx bxs-bell bx-tada bx-tada"></i>
                            </div>
                            <div class="content">
                                <h5 class="title-box">알림</h5>
                                <p class="color-1 mb-0 pt-4">5 읽지않음</p>
                            </div>
                        </div>
                        <div class="icon-box bg-color-2">
                            <div class="icon bg-icon-2">
                                <i class='bx bxs-message-rounded'></i>
                            </div>
                            <div class="content click-c">
                                <h5 class="title-box">메시지</h5>
                                <p class="color-2 mb-0 pt-4">5 읽지않음</p>
                            </div>
                        </div>
                        <div class="icon-box bg-color-3">
                            <a class="create d-flex" href="calendar.html">
                                <div class="icon bg-icon-3">
                                    <i class="bx bx-calendar"></i>
                                </div>
                                <div class="content">
                                    <h5 class="title-box">일정</h5>
                                    <p class="color-3 mb-0 pt-4">5 읽지않음</p>
                                </div>
                            </a>
                        </div>
                        <div class="icon-box bg-color-4">
                            <a class="create d-flex" href="#" data-toggle="modal" data-target="#add_project">
                                <div class="icon bg-white">
                                    <i class="bx bx-plus"></i>
                                </div>
                                <div class="content d-flex align-items-center">
                                    <h5 class="color-white">프로젝트 만들기</h5>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-6 col-md-6 col-sm-12 mb-0">
                    <div class="row">
                        <div class="col-12">
                            <!-- CUSTOMERS CHART -->
                            <div class="box f-height">
                                <div class="box-header d-flex justify-content-between mb-wrap">
                                    <h3 class="mt-9 ml-5">프로젝트 통계</h3>
                                    <ul class="card-list mb-0">
                                        <li class="custom-label"><span></span>완료</li>
                                        <li class="custom-label"><span></span>진행중</li>
                                    </ul>
                                </div>
                                <div class="box-body pt-20">
                                    <div id="customer-chart"></div>
                                </div>
                            </div>
                            <!-- END CUSTOMERS CHART -->
                        </div>
                        
                        <div class="col-6 col-xl-12 col-sm-12">
                            <div class="box">
                                <div class="box-body d-flex pb-0">
                                    <div class="me-auto">
                                        <h5 class="box-title mb-36">완료된 태스크</h5>
                                        <div class="progress skill-progress mb-10" style="height:10px;">
                                            <div class="progress-bar bg-primary progress-animated" style="width: 78%; height:10px;" role="progressbar">
                                                <span class="sr-only">78% 완료</span>
                                            </div>
                                        </div>
                                        <p class="fs-16 mb-0 mt-2"><span class="text-primary">87 </span>남아 있음</p>
                                    </div>
                                    <h4 class="numb font-wb fs-30">34</h4>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                    
                

            <div id="add_project" class="modal custom-modal fade" role="dialog">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">프로젝트 만들기</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>프로젝트 이름</label>
                                            <input class="form-control" value="" type="text">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>스폰서</label>
                                            <select class="select">
                                                <option>교수님</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>시작일자</label>
                                            <div class="cal-icon">
                                                <input class="form-control " type="date">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>종료일자</label>
                                            <div class="cal-icon">
                                                <input class="form-control" type="date">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>프로젝트 패턴</label>
                                            <select class="select">
                                                <option selected>조별과제 프로젝트</option>
                                                <option>모바일앱 개발 프로젝트</option>
                                                <option>웹사이트 개발 프로젝트</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>상세내용</label>
                                    <textarea rows="4" class="form-control" placeholder="Enter your message here"></textarea>
                                </div>
                                
                                <div class="submit-section">
                                    <button class="btn btn-primary submit-btn">저장</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal custom-modal fade" id="delete_project" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-header">
                                <h3>Delete Project</h3>
                                <p>Are you sure want to delete?</p>
                            </div>
                            <div class="modal-btn delete-action">
                                <div class="row">
                                    <div class="col-6 mb-0">
                                        <a href="javascript:void(0);" class="btn btn-primary continue-btn">Delete</a>
                                    </div>
                                    <div class="col-6 mb-0">
                                        <a href="javascript:void(0);" data-dismiss="modal" class="btn btn-primary cancel-btn">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal custom-modal fade" id="edit_project" role="dialog">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-header">
                                <h5 class="modal-title">Edit Project</h5>
                            </div>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="row">
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>Project Name</label>
                                            <input class="form-control" value="Gold App" type="text">
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-0">
                                        <div class="form-group">
                                            <label>Client</label>
                                            <select class="select">
                                                <option>Client 1</option>
                                                <option>Client 2</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="submit-section">
                                    <button class="btn btn-primary submit-btn">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
