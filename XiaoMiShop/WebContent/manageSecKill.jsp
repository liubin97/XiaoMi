<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="asset/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="asset/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <script src="asset/js/echarts.min.js"></script>
    <link rel="stylesheet" href="asset/css/amazeui.min.css" />
    <link rel="stylesheet" href="asset/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="asset/css/app.css">
    <script src="laydate/laydate.js"></script>
</head>
<body data-type="widgets">
<div class="am-g tpl-g">
    <c:import url="xm_topleft.jsp"></c:import>
    <div class="tpl-content-wrapper">

        <div class="row-content am-cf">


            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="widget am-cf">
                        <div class="widget-head am-cf">
                            <div class="widget-title am-fl">秒杀管理</div>
                        </div>

                        <div class="widget-body widget-body-lg am-fr">
                            <form class="am-form-inline" action="selectSecKill.action" method="post">

                                <div class="am-u-sm-12 am-u-lg-3 am-u-md-6 ">

                                    <div class="am-form-group">
                                        <input type="text" class="am-form-field " name="starttime" id="starttime" placeholder="请选择秒杀开始日期"  readonly  >
                                    </div>

                                </div>
                                <div class="am-u-sm-12 am-u-lg-3 am-u-md-6 ">

                                    <div class="am-form-group">
                                        <input type="text" class="am-form-field " name="endtime" id="endtime" placeholder="请选择秒杀结束日期"  readonly  >
                                    </div>
                                </div>

                                <div class="am-u-sm-12 am-u-lg-3 am-u-md-12 am-u-end">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field" id="goods_detail_id" name="goods_detail_id" placeholder="请输入商品ID"/>
                                        <span class="am-input-group-btn">
                                    <button class="am-btn am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="submit"></button>
                                    </span>
                                    </div>

                                </div>
                            </form>

                            <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black" id="">
                                <thead>
                                <tr>
                                    <th>秒杀编号</th>
                                    <th>秒杀商品编号</th>
                                    <th>秒杀名字</th>
                                    <th>秒杀价格</th>
                                    <th>秒杀最大数量</th>
                                    <th>秒杀开始时间</th>
                                    <th>秒杀结束时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${resultList}" var="secKillInfo" varStatus="loop">
                                    <tr class="gradeX">
                                        <td>${secKillInfo.seckill_id}</td>
                                        <td>${secKillInfo.goods_detail_id}</td>
                                        <td>${secKillInfo.seckill_name}</td>
                                        <td>${secKillInfo.seckill_money}</td>
                                        <td>${secKillInfo.seckill_num}</td>
                                        <td><fmt:formatDate value="${secKillInfo.seckill_starttime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td><fmt:formatDate value="${secKillInfo.seckill_endtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td>
                                            <div class="tpl-table-black-operation">
                                                <c:if test="${isEdit[loop.count-1]==0}">
                                                    <a href="selectEditMSecKill.action?seckill_id=${secKillInfo.seckill_id}" ><i class="am-icon-pencil">编辑</i> </a>
                                                    <a href="deleteMSecKill.action?seckill_id=${secKillInfo.seckill_id}&pageNum=${MG_PageNum}" class="tpl-table-black-operation-del">
                                                        <i class="am-icon-trash">删除</i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${isEdit[loop.count-1]==1}">
                                                    <a  class="am-disabled"><i class="am-icon-pencil">编辑</i> </a>
                                                    <a  class="tpl-table-black-operation-del am-disabled">
                                                        <i class="am-icon-trash">删除</i>
                                                    </a>
                                                </c:if>
                                            </div>
                                        </td>
                                    </tr>

                                </c:forEach>

                                </tbody>

                            </table>
                            <c:if test="${maxPageNum!=null}">
                            <div class="am-u-lg-12 am-cf">
                                <!-- 动态页码 -->
                                <div class="am-fr">
                                    <ul class="am-pagination tpl-pagination">
                                        <li class="am-disabled"><a href="#">«</a></li>
                                        <c:forEach begin="1" end="${maxPageNum}" var="p"  >
                                            <c:if test="${p==MG_PageNum}">
                                                <li class="am-active"><a href="#">${p}</a></li>
                                            </c:if>
                                            <c:if test="${p!=MG_PageNum}">
                                                <li><a href="selectSecKill.action?pageNum=${p}"  >${p}</a></li>
                                            </c:if>
                                        </c:forEach>
                                        <li><a href="#">»</a></li>
                                    </ul>
                                </div>
                            </div>
                            </c:if>
                        </div>
                    </div>

                </div>


            </div>
        </div>
    </div>
</div>
<script>
    var start=laydate.render({
        elem: '#starttime'
        ,type: 'datetime'
        ,done:function (value,date,endDate) {
            end.config.min={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            };//开始日选好后重置结束日期的最小日期
            end.config.value={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            };//将结束日的初始值设为开始日
        }

    });
</script>
<script>
    var end=laydate.render({
        elem: '#endtime'
        ,type: 'datetime'
        ,done:function (value,date,endDate) {
            start.config.max={
                year:date.year,
                month:date.month-1,
                date:date.date,
                hours:date.hours,
                minutes:date.minutes,
                seconds:date.seconds
            }
        }
    });
</script>
<script src="asset/js/jquery.min.js"></script>
<script src="asset/js/theme.js"></script>
<script src="asset/js/amazeui.min.js"></script>
<script src="asset/js/amazeui.datatables.min.js"></script>
<script src="asset/js/dataTables.responsive.min.js"></script>
<script src="asset/js/app.js"></script>
</body>
</html>