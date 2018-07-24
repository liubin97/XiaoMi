<%--
  Created by IntelliJ IDEA.
  User: 10334
  Date: 2018/7/24
  Time: 11:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <!--头部-->
    <header>
        <!--logo-->
        <div class="am-fl tpl-header-logo">
            <a href="#"><img src="assets/img/logo.png" alt=""></a>
        </div>
        <!-- 右侧内容 -->
        <div class="tpl-header-fluid">
            <!-- 侧边切换 -->
            <div class="am-fl tpl-header-switch-button am-icon-list">
                    <span>

                </span>
            </div>
            <!-- 其它功能-->
            <div class="am-fr tpl-header-navbar">
                <ul>
                    <!-- 欢迎语 -->
                    <li class="am-text-sm tpl-header-navbar-welcome">
                        <a href="javascript:;">欢迎你, <span></span> </a>
                    </li>
                    <!-- 退出 -->
                    <li class="am-text-sm">
                        <a href="login.jsp">
                            <span class="am-icon-sign-out"></span> 退出
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </header>
    <!-- 风格切换 -->
    <div class="tpl-skiner">
        <div class="tpl-skiner-toggle am-icon-cog"></div>
        <div class="tpl-skiner-content">
            <div class="tpl-skiner-content-title">
                选择主题
            </div>
            <div class="tpl-skiner-content-bar">
                <span class="skiner-color skiner-white" data-color="theme-white"></span>
                <span class="skiner-color skiner-black" data-color="theme-black"></span>
            </div>
        </div>
    </div>
    <!-- 侧边导航栏 -->
    <div class="left-sidebar">
        <!--用户信息-->
        <div class="tpl-sidebar-user-panel">
            <div class="tpl-user-panel-slide-toggleable">
                <div class="tpl-user-panel-profile-picture">
                    <img src="assets/img/user04.png" alt="">
                </div>
                <span class="user-panel-logged-in-text">
                        <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>

                    </span>
            </div>
        </div>
        <!--菜单-->
        <ul class="sidebar-nav">
            <li class="sidebar-nav-link">
                <a href="addGroupBuying.html">
                    <i class="am-icon-home sidebar-nav-link-logo"></i>首页
                </a>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 管理团购
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="addGroupBuying.jsp">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 新增团购
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="manageGroupBuying.jsp">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 团购管理
                        </a>
                    </li>
                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="javascript:;" class="sidebar-nav-sub-title">
                    <i class="am-icon-table sidebar-nav-link-logo"></i> 管理秒杀
                    <span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                </a>
                <ul class="sidebar-nav sidebar-nav-sub">
                    <li class="sidebar-nav-link">
                        <a href="addSecKill.jsp">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 新增秒杀
                        </a>
                    </li>

                    <li class="sidebar-nav-link">
                        <a href="manageSecKill.jsp">
                            <span class="am-icon-angle-right sidebar-nav-link-logo"></span> 秒杀管理
                        </a>
                    </li>

                </ul>
            </li>
            <li class="sidebar-nav-link">
                <a href="manageGoodsComment.jsp">
                    <i class="am-icon-wpforms sidebar-nav-link-logo"></i> 评价管理
                </a>
            </li>
        </ul>
    </div>




