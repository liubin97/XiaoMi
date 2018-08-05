!function (e) {
    function t(i) {
        if (a[i]) return a[i].exports;
        var o = a[i] = {exports: {}, id: i, loaded: !1};
        return e[i].call(o.exports, o, o.exports, t), o.loaded = !0, o.exports
    }

    var a = {};
    return t.m = e, t.c = a, t.p = "", t(0)
}([function (e, t, a) {
    e.exports = a(1)
}, function (e, t, a) {
    a(2), a(3), a(4), a(5), a(6), MI.checkout = function () {
        function e(e) {
            if (e.length) {
                var t = {};
                return t.address_id = e.attr("data-address_id"), t.consignee = e.attr("data-consignee"), t.tel = e.attr("data-tel"), t.province_id = e.attr("data-province_id"), t.province_name = e.attr("data-province_name"), t.city_id = e.attr("data-city_id"), t.city_name = e.attr("data-city_name"), t.district_id = e.attr("data-district_id"), t.district_name = e.attr("data-district_name"), t.area = e.attr("data-area") ? e.attr("data-area") : "", t.area_name = e.attr("data-area_name") ? e.attr("data-area_name") : "", t.address = e.attr("data-address"), t.tag_name = e.attr("data-tag_name") ? e.attr("data-tag_name") : "", t.zipcode = e.attr("data-zipcode") ? e.attr("data-zipcode") : "", t.neededit = e.attr("data-neededit"), t
            }
        }

        function t(e, t) {
            if (e && t) {
                var a = $('.J_addressItem[data-address_id="' + e + '"]'),
                    i = t.phone.substr(0, 3) + "****" + t.phone.substr(7, 11);
                a.attr({
                    "data-consignee": t.uname,
                    "data-tel": i,
                    "data-province_id": t.province,
                    "data-province_name": t.provinceName,
                    "data-city_id": t.city,
                    "data-city_name": t.cityName,
                    "data-district_id": t.county,
                    "data-district_name": t.countyName,
                    "data-address": t.address,
                    "data-tag_name": t.tag,
                    "data-zipcode": t.zipcode,
                    "data-area": t.area,
                    "data-area_name": t.areaName,
                    "data-neededit": "N"
                }), a.find(".uname").text(t.uname), a.find(".tag").text(t.tag), a.find(".utel").html(i), a.find(".uaddress").html(t.provinceName + " " + t.cityName + " " + t.countyName + " " + t.areaName + "<br>" + t.address), a.trigger("click")
            }
        }

        function a() {
            if (checkoutConfig && checkoutConfig.invoice) {
                var e, t = !1, a = !1;
                $.each(checkoutConfig.invoice, function (t, a) {
                    e = $('.J_option[data-invoice-type="' + a.type + '"]'), e.length && (e.removeClass("hide"), e.attr("data-value", a.value), a.checked && e.trigger("click"))
                }), 1 === checkoutConfig.invoice.length ? ($("#J_invoiceDefaultTip").addClass("hide"), 4 === checkoutConfig.invoice[0].value ? (t = !0, $("#J_onlyEleTip").removeClass("hide")) : 1 === checkoutConfig.invoice[0].value ? a = !0 : $("#J_invoiceModify").addClass("hide")) : ($('.J_option[data-invoice-type="personal"]').addClass("hide"), $("#J_showPaperOption").one("click", function () {
                    $('.J_option[data-invoice-type="personal"]').removeClass("hide").trigger("click"), $(this).addClass("hide").parent().addClass("active")
                })), w.checkoutData.invoiceCompanyCode ? $('.J_option[data-invoice-mode="company"]').trigger("click") : $('.J_option[data-invoice-mode="personal"]').trigger("click"), S()
            }
        }

        function i() {
            $(".J_option").each(function () {
                var e = $(this).hasClass("selected");
                if (e) {
                    var t = $(this).attr("data-type"), a = $(this).attr("data-value");
                    if (!t) return;
                    w.checkoutData[t] = a
                }
            }), p()
        }

        function o(e) {
            if (w.checkoutData.address) {
                var t = "";
                t += w.checkoutData.address.consignee + " " + w.checkoutData.address.tel, t += "<br>" + w.checkoutData.address.province_name + " " + w.checkoutData.address.city_name + " ", t += w.checkoutData.address.district_name + " " + w.checkoutData.address.address + " ", checkoutConfig.hasPresales && $("#J_yushouAddress").html(t), checkoutConfig.hasGiftcard && ($("#J_lipinUserName").html(w.checkoutData.address.consignee), $("#J_lipinUserPhone").html(w.checkoutData.address.tel), $("#J_lipinUserAddress").html(w.checkoutData.address.province_name + " " + w.checkoutData.address.city_name + " " + w.checkoutData.address.district_name + " " + w.checkoutData.address.address + " ")), e || (t += '<a href="javascript:void(0);" class="modify J_modify">修改</a>'), $("#J_confirmAddress").html(t).removeClass("hide"), n(w.checkoutData.address.address_id)
            }
        }

        function r(e) {
            var t = doT.template($("#J_newAddressTemplate").html()), a = t(e);
            $(".J_addressItem").eq(0).length ? $(".J_addressItem").eq(0).before(a) : $("#J_newAddress").before(a), $(".J_addressItem").eq(0).trigger("click")
        }

        function s() {
            var e = (new Date).getTime();
            $.ajax({
                type: "POST",
                url: w.urls.getPayment + "?v" + e,
                dataType: "json",
                data: {
                    region_id: w.checkoutData.address.city_id,
                    pay_id: w.checkoutData.pay,
                    invoice_type: w.checkoutData.invoice,
                    invoice_title: w.checkoutData.invoiceTitle ? w.checkoutData.invoiceTitle : "",
                    quick_order: checkoutConfig.quickOrder
                },
                timeout: 1e4,
                error: function () {
                    L.tipMsg("网络超时，请刷新重试！")
                },
                success: function (e) {
                    e && 1 === e.code ? c(e.data) : L.tipMsg(e.msg)
                }
            })
        }

        function n(e) {
            if (e) {
                var t = "*", a = $("#J_addressList").find(".selected"), i = a.offset(), o = $(".J_confirmBigProTip"),
                    r = $("#J_popBigProTip"), s = $("#J_checkoutToPay");
                o.html("").addClass("hide"), $.ajax({
                    url: w.urls.bigProStatus,
                    dataType: "json",
                    data: {address_id: e, bts: w.bts, quick_order: checkoutConfig.quickOrder},
                    timeout: 1e4,
                    error: function () {
                    },
                    success: function (e) {
                        if (e && 1 === e.code) {
                            if (e.data.address.need_edit) return void a.find(".J_addressModify").trigger("click");
                            if (e.data.detail && 1 === e.data.detail.display && e.data.detail.text ? $("#J_bigproPostTip").removeClass("hide").html("<span>" + e.data.detail.text + "</span>") : $("#J_bigproPostTip").addClass("hide").html(""), e.data.can_delivery && !e.data.is_cos) return checkoutConfig.bigProStatus = 1, s.addClass("btn-primary").removeClass("btn-gray").html("立即下单").val("立即下单"), void r.html("").addClass("hide").css({
                                top: 0,
                                left: 0
                            });
                            if (e.data.can_delivery) {
                                if (e.data.is_cos) {
                                    var n = w.urls.subscribe, c = "";
                                    $.each(e.data.items, function (e, a) {
                                        a.is_cos && (t += a.name + ", ", c = a.goods_id)
                                    }), n += c, t += "该地区暂时缺货", t += " <a href=" + n + ' target="_blank">登记到货提醒 &gt;</a>'
                                }
                            } else $.each(e.data.items, function (e, a) {
                                a.can_delivery || (t += a.name + ", ")
                            }), t += "该地区暂时不可配送";
                            o.html(t).removeClass("hide"), r.html(t).removeClass("hide").css({
                                top: i.top + 202,
                                left: i.left
                            }), checkoutConfig.bigProStatus = 0, s.addClass("btn-gray").removeClass("btn-primary").html("暂时缺货").val("暂时缺货")
                        }
                    }
                })
            }
        }

        function c(e) {
            if (e) {
                checkoutConfig.invoice = e.invoice, a();
                var t = $('.J_option[data-type="pay"]').parent(".J_optionList"), o = "";
                t.html(""), $.each(e.paylist, function (e, a) {
                    o = a.checked ? "selected" : "", "1" === a.pay_id && (a.brief += " <span>（支持微信支付、支付宝、银联、财付通、小米钱包等）</span>"), t.append('<li data-type="pay" class="J_option ' + o + '" data-value="' + a.pay_id + '">' + a.brief + "</li>")
                });
                var r = $('.J_option[data-type="shipment"]').parent(".J_optionList");
                r.html("");
                var s = "", n = !1;
                $.each(e.shipmentlist, function (e, t) {
                    o = t.checked ? "selected" : "", t.list && t.list.length > 0 && (s = '<p class="hide">温馨提示：预计 ' + t.list[0].tips_day + " 天后可去米家自提，具体时间以短信通知为准，记得携带有效证件哦<br/>米家地址：" + t.list[0].address + "<br/>联系电话：" + t.list[0].tel + "<br/>营业时间：" + t.list[0].officeTime + "</p>", s += '<input type="hidden" name="Checkout[pickup_id]" value="' + t.list[0].home_id + '" />', n = !0), e >= 1 && r.addClass("options-list"), r.append('<li data-type="shipment" class="J_option ' + o + '" data-amount="' + t.amount + '" data-value="' + t.shipment_id + '">' + t.brief + s + "</li>")
                }), w.serveiceSelf && !n ? (r.find(".J_option").removeClass("selected"), w.checkoutData.shipment = null, w.serveiceSelf = !1, $("#J_serviceSelfTip").html("").hide(), $(".section-time").show()) : w.serveiceSelf && n && r.find('.J_option[data-value="25"]').addClass("selected").siblings().removeClass("selected"), i()
            }
        }

        function d() {
            $("#J_useCoupon").on("click", function () {
                $("#J_couponBox").removeClass("hide").find(".J_tabSwitch > li").eq(0).trigger("click")
            }), $(".J_couponCancel").on("click", function () {
                $("#J_couponBox").addClass("hide")
            }), $("#J_couponList").find("li").on("click", function () {
                $(this).addClass("selected").siblings().removeClass("selected")
            }), $("#J_useCouponCode").on("click", function () {
                var e = $.trim($("#coupon_code").val()), t = /^\d{16,}$/;
                return t.test(e) ? void l(e, "yes") : void $("#coupon_code").trigger("error", ["优惠券码不正确"])
            }), $("#J_useSelectedCoupon").on("click", function () {
                var e = $("#J_couponList").find(".selected").attr("data-id");
                e || L.tipMsg("请选择优惠券"), l(e, "no")
            }), $("#J_changeConpon").on("click", function () {
                h(), $("#J_useCoupon").trigger("click")
            }), $("#J_couponList").find("li").length > 0 && "1" === $("#J_couponList").find("li").eq(0).attr("data-choose") && ($("#J_couponList").find("li").eq(0).trigger("click"), $("#J_useSelectedCoupon").trigger("click"))
        }

        function l(e, t) {
            e && t && $.ajax({
                type: "POST",
                url: w.urls.coupon,
                dataType: "json",
                data: {cardtype: t, value: e, pay_id: w.checkoutData.pay},
                timeout: 1e4,
                error: function () {
                },
                success: function (a) {
                    a && 1 === a.code ? (w.couponInfo.type = t, w.couponInfo.val = e, w.couponInfo.data = a.data, u(a.data), C()) : L.tipMsg(a.msg)
                }
            })
        }

        function u(e) {
            e && ($("#J_couponBox").addClass("hide"), w.couponInfo.couponPostFree = e.postFree ? !0 : !1, w.couponInfo.postage = parseInt(e.shipment_expense), w.couponInfo.couponPrice = parseFloat(e.replaceMoney), w.couponInfo.couponPrice > 0 && $("#J_couponVal").html("-" + w.couponInfo.couponPrice), checkoutConfig.postage = parseFloat(e.shipment_expense), w.couponInfo.title = e.title, $("#J_useCoupon").addClass("hide"), $("#J_couponTitle").html(e.title).parent().removeClass("hide"), f())
        }

        function h() {
            w.couponInfo = {
                couponPrice: 0,
                couponPostFree: !1,
                title: ""
            }, $("#J_useCoupon").removeClass("hide"), $("#J_couponTitle").html("").parent().addClass("hide"), $("#J_couponVal").html("-0"), p(), C(), f()
        }

        function p() {
            w.selfService = "6" === w.checkoutData.pay ? !0 : !1;
            var e = 0;
            $('.J_option[data-type="shipment"]').each(function () {
                return $(this).hasClass("selected") ? (e = parseFloat($(this).attr("data-amount")), "25" === $(this).attr("data-value") ? (w.serveiceSelf = !0, $("#J_serviceSelfTip").html($(this).find("p").html()).show(), $(".section-time").hide()) : (w.serveiceSelf = !1, $("#J_serviceSelfTip").html("").hide(), $(".section-time").show()), !1) : void 0
            }), 0 === e ? w.postFree = !0 : checkoutConfig.postage = e;
            var t = $("#J_invoiceCompanyCode");
            "personal" === w.checkoutData.invoiceMode ? (t.addClass("hide").find(".input-text").trigger("valid"), w.checkoutData.invoiceCompanyCode = "") : (t.removeClass("hide").find(".input-text"), w.checkoutData.invoiceCompanyCode && t.trigger("blur")), "personal" === w.checkoutData.invoiceType && checkoutConfig.invoice.length > 1 ? ($("#J_invoicePaperTip").removeClass("hide"), $("#J_invoiceDefaultTip").addClass("hide")) : (checkoutConfig.invoice.length > 1 && $("#J_invoiceDefaultTip").removeClass("hide"), $("#J_invoicePaperTip").addClass("hide")), f()
        }

        function f() {
            var e = checkoutConfig.postage, t = checkoutConfig.totalPrice - w.couponInfo.couponPrice;
            checkoutConfig.hasBigPro || (w.postFree = t < checkoutConfig.bcPrice ? !1 : !0), (w.couponInfo.couponPostFree || checkoutConfig.postFree || w.postFree || w.selfService) && (e = 0), w.couponInfo.postage && (e = w.couponInfo.postage), w.serveiceSelf && (e = 0), t += e, t -= w.ecardAmount, checkoutConfig.subsidyPrice > 0 && (t -= checkoutConfig.subsidyPrice), 0 > t && (t = 0), $("#J_totalPrice").html(parseFloat(t).toFixed(2)), $("#J_postageVal").html(e)
        }

        function m() {
            $(".J_raiseBuyItem").on("click", function (e) {
                var t = L.parseJson($(this).attr("data-info")), a = $(this).hasClass("selected");
                $(e.target).hasClass("warning") || a || ("true" === t.isBatch ? v("#J_choosePro-" + t.actId, $(this)) : ($(this).attr({
                    "data-productid": t.productId,
                    "data-itemid": t.itemid
                }), g(t.goodsId, t.actId, t.type, $(this))))
            }), $(".J_raiseBuyItem").on("click", ".J_del", function () {
                var e = $(this).parent().parent(), t = L.parseJson(e.attr("data-info")),
                    a = e.attr("data-del-itemid") ? e.attr("data-del-itemid") : t.itemid + "_" + t.productId;
                a && _(a, e)
            })
        }

        function g(e, t, a, i) {
            var o = MI.GLOBAL_CONFIG.cartSite + "/cart/addCartActivity.php",
                r = {itemid: i.attr("data-itemid"), productid: i.attr("data-productid")};
            $.ajax({
                url: o,
                dataType: "jsonp",
                data: "id=" + e + "&promotion_id=" + t + "&promotion_type=" + a + "&api=1",
                jsonp: "jsonpcallback",
                timeout: 1e4,
                error: function () {
                    L.tipMsg("网络请求超时")
                },
                success: function (e) {
                    1 === e.code ? (i.attr("data-del-itemid", r.itemid + "_" + r.productid), i.addClass("selected"), C()) : L.tipMsg(e.message)
                }
            })
        }

        function v(e, t) {
            if (!e || !$(e).length || !t) return !1;
            var a = $(e), i = a.find(".J_chooseProList"), o = a.find(".J_chooseProBtn"), r = a.attr("data-isadd") || !1,
                s = a.attr("data-isgift") || !1, n = i.find("li").length;
            a.addClass("modal-choose-pro-" + n), a.on("shown.bs.modal", function () {
                $(".modal-backdrop").addClass("modal-backdrop-dark")
            }).modal({backdrop: "static", show: !0}).removeClass("hide").on("hide.bs.modal", function () {
            }), i.children("li").on("click", function () {
                $(this).addClass("selected").siblings().removeClass("selected");
                var e = $(this).attr("data-gid");
                o.attr("href", "/cart/add/" + e).removeClass("btn-disable").addClass("btn-primary")
            }), o.off().on("click", function () {
                if ($(this).hasClass("btn-disable")) return !1;
                var e = i.find(".selected").attr("data-gid"), o = i.find(".selected").attr("data-productid");
                if ("true" === r && i.find('[data-isbuy="true"]').length > 0) {
                    e = "";
                    var n = !0, c = 0;
                    i.find('[data-isbuy="true"]').each(function () {
                        var t = $(this).attr("data-pid"), a = $(this).attr("data-num"), i = $(this).attr("data-actid");
                        $(this).hasClass("selected") && (a = parseInt(a) + 1, n = !1), e += (c > 0 ? "_" : "") + t + "-0-" + a + "-" + i, c += 1
                    }), n && (e += "_" + i.find(".selected").attr("data-gid"))
                }
                if ("true" === r || "true" === s) {
                    var d = $(this).attr("data-actid"), l = $(this).attr("data-type"),
                        u = L.parseJson(t.attr("data-info"));
                    t.attr({"data-productid": o, "data-itemid": u.itemid}), g(e, d, l, t)
                }
                return a.modal("hide"), !1
            })
        }

        function _(e, t) {
            return e && t ? void $.ajax({
                dataType: "jsonp",
                url: MI.GLOBAL_CONFIG.cartSite + "/cart/delete/" + e + "?_v=" + Math.random(),
                jsonp: "jsonpcallback",
                cache: "false",
                success: function (e) {
                    1 === e.code ? (t.removeClass("selected"), C()) : L.tipMsg(e.msg)
                }
            }) : !1
        }

        function k() {
            var e = $(".J_showBaoxian"), t = "selected", a = "", i = null;
            e.on("click", function () {
                var e = $(this).hasClass(t);
                if (e) return i = null, a = "", !1;
                a = $(this).attr("data-goodsid") + "?parent_itemId=" + $(this).attr("data-parent_itemid"), i = $(this);
                var o = window.doT.template($("#J_agreementTmp").html()), r = $(this).data("infor");
                $("#J_modalAgreement").modal("show").html(o(r))
            }), e.on("click", ".J_del", function () {
                var e = $(this).parent().parent(), t = e.attr("data-itemid");
                t && _(t, e)
            }), e.find(".agreement").on("click", function (e) {
                e.stopPropagation()
            }), $("body").on("click", ".J_agreement", function () {
                $(this).toggleClass("active"), $("#J_modalAgreement").find(".btn").toggleClass("btn-disabled")
            }), $("#J_modalAgreement").on("click", ".btn", function () {
                $(this).hasClass("btn-disabled") || (MI.addShopCart(a, function (e, a) {
                    1 === e.code ? (a.addClass(t), C()) : L.tipMsg(e.message)
                }, i), $("#J_modalAgreement").modal("hide"))
            })
        }

        function C(e, t) {
            var a = {
                ecard: M.config.selCardId.join(","),
                coupon_code: w.couponInfo.val ? w.couponInfo.val : "",
                coupon_type: w.couponInfo.type ? w.couponInfo.type : "",
                address_id: w.checkoutData.address ? w.checkoutData.address.address_id : "",
                quick_order: checkoutConfig.quickOrder
            };
            a = $.extend(a, e), $.ajax({
                type: "POST",
                url: w.urls.update + "?v" + Math.random(),
                dataType: "json",
                data: a,
                timeout: 1e4,
                error: function () {
                    L.tipMsg("抱歉！网络错误，请刷新重试！")
                },
                success: function (e) {
                    e && 1 === e.code ? (y(e.data), e.data.baoxianItems && J(e.data.baoxianItems), M.checkEcardResult(e.data)) : 6000011 === e.code ? M.revertEcardResult() : 6000009 === e.code && "ecard" === t ? (L.tipMsg("您的订单中未包含小米手机产品，无法使用现金券"), M.toggleLoading(!1)) : ("ecard" === t && M.toggleLoading(!1), L.tipMsg(e.msg))
                }
            })
        }

        function y(e) {
            var t = doT.template($("#J_checkoutGoodsTemplate").html()), a = t(e.items);
            $("#J_goodsList").html(a);
            var i = doT.template($("#J_checkoutMoneyTemplate").html()), o = i(e);
            $("#J_moneyBox").html(o), checkoutConfig.totalPrice = e.productMoney - e.activityDiscountMoney, w.couponInfo.data ? u(w.couponInfo.data) : f()
        }

        function J(e) {
            return e ? void $.each(e, function (e, t) {
                var a = $(".J_showBaoxian[data-parent_itemid=" + t.parent_itemId + "]");
                a.length && a.attr("data-itemid", t.itemId).removeAttr("onclick")
            }) : !1
        }

        function b() {
            if (!w.checkoutData.address || !w.checkoutData.address.address_id) return L.tipMsg("请选择地址！"), void L.docScroll(".checkout-box");
            if (!w.checkoutData.shipment) return void L.tipMsg("请选择配送方式！");
            if (0 === w.checkoutData.eInvoicePhone) return void L.tipMsg("请填写正确的收票人手机号！");
            if (0 === w.checkoutData.eInvoiceMail) return void L.tipMsg("请填写正确的收票人邮箱！");
            var e = {
                address_id: w.checkoutData.address.address_id,
                pay_id: w.checkoutData.pay,
                best_time: w.checkoutData.time,
                invoice_type: w.checkoutData.invoice,
                shipment_id: w.checkoutData.shipment,
                pickup_id: "",
                coupons_value: w.couponInfo.val ? w.couponInfo.val : "",
                coupons_type: w.couponInfo.type ? w.couponInfo.type : "",
                invoice_title: "",
                invoice_tel: w.checkoutData.eInvoicePhone ? w.checkoutData.eInvoicePhone : "",
                invoice_email: w.checkoutData.eInvoiceMail ? w.checkoutData.eInvoiceMail : ""
            };
            if (!w.checkoutData.invoiceTitle) return L.tipMsg("请输入发票抬头！"), void $("#invoice_title").trigger("blur");
            if (e.invoice_title = w.checkoutData.invoiceTitle, "company" === w.checkoutData.invoiceMode) {
                if (!w.checkoutData.invoiceCompanyCode) return L.tipMsg("纳税人识别号为15-20位数字或大写字母，请正确填写！"), void $("#invoice_company_code").trigger("blur");
                e.invoice_company_code = w.checkoutData.invoiceCompanyCode
            }
            if ("1" === checkoutConfig.showCaptcha) {
                var t = $("#J_captchaToken").val(), a = $.trim($("#captcha_code").val());
                if (!a || !t) return L.tipMsg("请输入验证码"), $("#captcha_code").trigger("blur"), !1;
                e.captcha_code = a, e.captcha_token = t
            }
            w.serveiceSelf && (e.pickup_id = $('input[name="Checkout[pickup_id]"]').val()), w.ecard && (e.ecard = w.ecard.id, e.sms_token = w.ecard.smsToken);
            var i = $.cookie("miUserRiskToken") || "";
            $.ajax({
                type: "POST",
                url: w.urls.submitUrl + "?" + Math.random(),
                dataType: "json",
                data: {Checkout: e, risk_token: i, quick_order: checkoutConfig.quickOrder},
                timeout: 1e4,
                error: function () {
                },
                success: function (e) {
                    e && 1 === e.code ? (w.checkoutData.orderId = e.data.order_id, location.href = w.urls.confirm + "?id=" + e.data.order_id) : e.data.items && e.data.items.length ? I(e) : L.tipMsg(e.msg)
                }
            })
        }

        function I(e) {
            if (e) {
                $("#J_modalTipGoods").remove();
                var t = doT.template($("#J_tipGoodsTemplate").html()), a = t(e);
                $("body").append(a), e.data.items && e.data.items.length > 3 && $("#J_tipGoodskList").carousel({
                    itemPerSlide: 3,
                    containerSelector: "#J_modalTipGoods",
                    controlsSelector: ".modal-bd",
                    controls: !0,
                    pager: !1
                }), $("#J_modalTipGoods").modal({backdrop: "static", show: !0})
            }
        }

        function A() {
            $("#J_captchaBox").removeClass("hide").show();
            var e = "//captcha.hd.mi.com/captcha?style=chinese&service=order.mi.com&sessionId=0";
            $("#J_captchaChange").on("click", function () {
                $("#J_captchaImg").attr("src", e + Math.random())
            });
            var t = function () {
                $("#captcha_code").trigger("error", ["请输入正确验证码"]), $("#J_captchaChange").trigger("click")
            };
            $("#captcha_code").on("blur", function () {
                var e = $.trim($(this).val()), a = $(this).attr("data-authurl"), i = a.replace("{answer}", e);
                e ? $.ajax({
                    type: "post",
                    url: i + "&v=" + Math.random(),
                    dataType: "jsonp",
                    jsonp: "callback",
                    timeout: 1e4,
                    error: function () {
                        L.tipMsg("抱歉！验证码验证失败，请刷新页面重试!")
                    },
                    success: function (e) {
                        e.data && e.data.result && e.data.result === !0 && e.data.token ? $("#J_captchaToken").val(e.data.token) : t()
                    }
                }) : t()
            })
        }

        function T() {
            var t = $(".J_addressItem").eq(0), a = !1, i = 0, o = function (e) {
                $("#J_addressTopCon").html('<span class="uname">' + e.consignee + '</span><span class="utel">' + e.tel + "</span> " + e.province_name + " " + e.city_name + " " + e.district_name + " " + e.address), $("#J_addressTopBar").addClass("address-top-bar-active")
            };
            $(window).on("scroll", function () {
                if (i = $(this).scrollTop(), !w.checkoutData.address && t.length && i > 500 && !a) {
                    var r = e(t);
                    o(r), a = !0
                } else 500 > i && (a = !1, $("#J_addressTopBar").removeClass("address-top-bar-active"))
            }), $("#J_addressTopBarBtn").on("click", function () {
                $("html, body").animate({scrollTop: 0}, 500), t.trigger("click")
            })
        }

        function S() {
            var e = "";
            $.each(checkoutConfig.invoice, function (t, a) {
                a.value === parseInt(w.checkoutData.invoice) && (e = a.desc)
            }), $("#J_invoiceDesc").html(e), "0" !== w.checkoutData.invoice ? $("#J_invoiceTitle").html(w.checkoutData.invoiceTitle) : $("#J_invoiceDesc").siblings().addClass("hide")
        }

        var w = {
            selectedCla: "selected",
            checkoutData: {},
            couponInfo: {couponPrice: 0},
            ecardAmount: 0,
            postFree: !1,
            selfService: !1,
            urls: {
                editAddress: MI.GLOBAL_CONFIG.orderSite + "/address/add.php",
                getPayment: MI.GLOBAL_CONFIG.orderSite + "/buy/getRegionPayment.php",
                submitUrl: MI.GLOBAL_CONFIG.orderSite + "/buy/submit",
                bigProStatus: MI.GLOBAL_CONFIG.orderSite + "/address/cartDelivery.php",
                subscribe: MI.GLOBAL_CONFIG.orderSite + "/misc/subscribe/goods/",
                confirm: MI.GLOBAL_CONFIG.orderSite + "/buy/confirm",
                coupon: MI.GLOBAL_CONFIG.orderSite + "/buy/validateCoupon.php",
                update: MI.GLOBAL_CONFIG.orderSite + "/buy/checkoutAjax.php",
                submitErrorUrl: MI.GLOBAL_CONFIG.staticSite + "/fasttip/"
            }
        }, M = {
            config: {
                captchaUrl: "//captcha.hd.mi.com/captcha?style=chinese&service=order.mi.com&sessionId=0",
                smsUrl: MI.GLOBAL_CONFIG.orderSite + "/ecard/sendSms.php?r=",
                checkSmsUrl: MI.GLOBAL_CONFIG.orderSite + "/ecard/checkSms.php?r=",
                bindUrl: MI.GLOBAL_CONFIG.orderSite + "/ecard/postBind.php?r=",
                listUrl: MI.GLOBAL_CONFIG.orderSite + "/ecard/getUsableList.php?r=",
                smsToken: null,
                ecardData: null,
                selEcard: null,
                selCardId: [],
                cardType: "recycle"
            }, init: function () {
                var e = this;
                $("#J_useEcard").on("click", function () {
                    return e.config.ecardResultShow && "recycle" === e.config.cardType ? (L.tipMsg("现金券不能和礼品卡同时使用！"), !1) : (e.showBox($(this)), !1)
                }), $("#J_useRecycle").on("click", function () {
                    return e.config.ecardResultShow && "normal" === e.config.cardType ? (L.tipMsg("礼品卡不能和现金券同时使用！"), !1) : (e.showBox($(this)), !1)
                }), $(".J_ecardCancel, .J_recycleCancel").on("click", function () {
                    return e.hideBox().trigger("hide.checkout"), !1
                }), $("#ecard_password").formatter({
                    formatPattern: [5, 5, 5, 5],
                    maxlength: 23
                }), $("#J_useSelEcard, #J_useSelRecycle").on("click", function () {
                    return e.config.selCardId.length && e.sendSms(), !1
                }), $("#J_checkEcardSms").on("click", function () {
                    return e.checkSms(), !1
                }), $("#J_cancelEcardSms").on("click", function () {
                    return $("#J_ecardSmsBox").addClass("hide"), "normal" === e.config.cardType ? $("#J_ecardList").removeClass("hide") : $("#J_recycleList").removeClass("hide"), !1
                }), $("#J_bindEcard").on("click", function () {
                    return e.checkCaptcha(), !1
                }), $("#J_ecardCaptchaImg").on("click", function () {
                    $(this).attr("src", e.config.captchaUrl + "&r=" + Math.random())
                }), $("#J_ecardBox").on("hide.checkout", function () {
                    e.config.selCardId.length && e.revertEcard()
                }), $("#J_ecardQa").on("click", function () {
                    $("#J_ecardQaDetail").toggleClass("hide")
                }), e.getList()
            }, showBox: function (e) {
                var t = this, a = $(e);
                if (a) {
                    var i = $("#J_ecardBox"), o = a.attr("data-type"), r = {normal: "100px", recycle: "150px"},
                        s = $("#J_recycleBox");
                    t.config.cardType = o, i.css({top: r[o]}).removeClass("hide"), "normal" === o ? (i.find(".J_tabSwitch").removeClass("hide").find("li").eq(0).trigger("click"), i.find(".tab-container").removeClass("hide"), s.addClass("hide")) : "recycle" === o && (i.find(".J_tabSwitch, .tab-container").addClass("hide"), s.removeClass("hide"), $("#J_recycleList").removeClass("hide"));
                    var n = $('<div class="modal-backdrop J_ecardBackdrop" />');
                    n.css({
                        width: "100%",
                        height: $("body").height(),
                        "z-index": "100"
                    }), $("body").append(n), t.getList(), $("#J_ecardCaptchaImg").trigger("click"), t.setEcardInfo()
                }
            }, hideBox: function () {
                var e = this;
                return $("#J_ecardBox").addClass("hide"), $(".J_ecardBackdrop").remove(), e.revertInput(), $("#J_ecardBox")
            }, revertEcard: function () {
                var e = this;
                e.config.selCardId = [], e.config.smsToken = null, e.config.bindCardId = null, w.ecardAmount = 0, C()
            }, revertEcardResult: function () {
                var e = this;
                e.config.ecardResultShow ? ($("#J_useEcard").removeClass("hide"), $("#J_ecardResult").addClass("hide"), $("#J_ecardVal").html("0元"), w.ecard = {}, e.config.ecardResultShow = !1, e.revertEcard()) : (e.toggleLoading(!1), L.tipMsg("您的订单中没有可以用礼品卡抵扣的商品"))
            }, setEcardInfo: function () {
                var e = checkoutConfig.postage;
                (w.couponInfo.couponPostFree || checkoutConfig.postFree || w.postFree || w.selfService) && (e = 0), w.couponInfo.postage && (e = w.couponInfo.postage), w.serveiceSelf && (e = 0);
                var t = this, a = checkoutConfig.totalPrice + e - w.ecardAmount - w.couponInfo.couponPrice,
                    i = $("#J_ecardInfo"), o = "礼品卡", r = '<span class="tip">（暂不支持抵扣运费、意外保、电话卡等）</span>';
                "recycle" === t.config.cardType && (i = $("#J_recycleInfo"), o = "现金券"), i.html(w.ecardAmount > 0 && a > 0 ? "已选择" + o + " <span>" + w.ecardAmount + "元</span>，还需支付 <span>" + a.toFixed(2) + "元</span>" + r : w.ecardAmount > 0 ? "已选择" + o + " <span>" + w.ecardAmount + "元</span>" : "未选择" + o + "，还需支付 <span>" + a.toFixed(2) + "元</span>" + r)
            }, toggleLoading: function (e) {
                var t = $("#J_ecardBox").find(".loading");
                e ? t.removeClass("hide") : t.addClass("hide")
            }, getList: function () {
                var e = this;
                $.ajax({
                    type: "POST",
                    url: e.config.listUrl + Math.random(),
                    dataType: "json",
                    data: {bts: w.bts, card_type: e.config.cardType},
                    timeout: 1e4,
                    error: function () {
                        L.tipMsg("抱歉！网络错误，请刷新重试！")
                    },
                    success: function (t) {
                        1 === t.code ? (e.config.ecardData = t.data.data, e.formatList()) : L.tipMsg(t.msg)
                    }
                })
            }, formatList: function () {
                var e = this;
                if (e.config.ecardData) {
                    if (e.toggleLoading(!1), !e.config.ecardData.length && "normal" === e.config.cardType) return void $("#J_ecardEmpty").removeClass("hide");
                    e.config.ecardData.length && "recycle" === e.config.cardType && $("#J_useRecycle").removeClass("hide");
                    var t = doT.template($("#J_ecardTemplate").html()),
                        a = t({data: e.config.ecardData, type: e.config.cardType});
                    "normal" === e.config.cardType ? ($("#J_ecardEmpty").addClass("hide"), $("#J_ecardList").html(a).parent().removeClass("hide")) : "recycle" === e.config.cardType && $("#J_recycleList").removeClass("hide").html(a).parent().removeClass("hide"), e.config.bindCardId && (e.checkCard($('.J_ecardItem[data-id="' + e.config.bindCardId + '"]')), e.config.bindCardId = null), $(".J_ecardCheckbox").on("click", function () {
                        var t = $(this).parents("tr"), a = t.hasClass("disabled");
                        a || e.checkCard(t)
                    })
                }
            }, checkCard: function (e) {
                if (e) {
                    var t = this, a = $(e), i = "selected", o = a.attr("data-id"), r = a.hasClass(i), s = "";
                    if (r) {
                        var n = $.inArray(o, t.config.selCardId);
                        t.config.selCardId.splice(n, 1), s = t.config.selCardId.length ? t.config.selCardId.join(",") : ""
                    } else s = t.config.selCardId.length ? t.config.selCardId.join(",") + "," + o : o;
                    t.toggleLoading(!0), C({ecard: s}, "ecard")
                }
            }, checkEcardResult: function (e) {
                if (e) {
                    var t, a = this, i = parseFloat(e.need_pay_amount) > 0 ? !0 : !1;
                    if (w.ecardAmount = e.ecards.ecard_amount, f(), a.toggleLoading(!1), a.setEcardInfo(), "recycle" === a.config.cardType && $("#J_ecardMoneyLabel").html("现金券："), e.ecards.ecard_amount > 0) {
                        if (a.config.selCardId = [], $(".J_ecardItem").each(function () {
                            $(this).removeClass("selected disabled");
                            var e = $(this).attr("data-balance");
                            $(this).find(".J_income").html("0"), $(this).find(".J_balance").html(e)
                        }), $.each(e.ecards.details, function (e, i) {
                            t = $('.J_ecardItem[data-id="' + i.card_id + '"]'), t.addClass("selected"), t.find(".J_income").html(Math.abs(i.income)), t.find(".J_balance").html(i.new_balance), a.config.selCardId.push(i.card_id)
                        }), !i) {
                            var o = null;
                            $(".J_ecardItem").each(function () {
                                o = $(this).hasClass("selected"), o || $(this).addClass("disabled")
                            })
                        }
                    } else a.formatList();
                    a.config.ecardResultShow && a.setEcardResult()
                }
            }, sendSms: function () {
                var e = this;
                e.toggleLoading(!0), $("#ecard_sms").trigger("valid");
                var t = "ecard_check";
                "recycle" === e.config.cardType && (t = "huanxin_check"), $.ajax({
                    type: "POST",
                    url: e.config.smsUrl + Math.random(),
                    dataType: "json",
                    data: {sms_action: t, bts: w.bts, sms_token: e.config.smsToken ? e.config.smsToken : ""},
                    timeout: 1e4,
                    error: function () {
                        L.tipMsg("抱歉！网络错误，请刷新重试！")
                    },
                    success: function (t) {
                        if (e.toggleLoading(!1), t && 1 === t.code) {
                            if (t.data.safe_mobile) {
                                $("#J_ecardMobile").html("（" + t.data.safe_mobile + "）"), "normal" === e.config.cardType ? $("#J_ecardList").addClass("hide") : "recycle" === e.config.cardType && $("#J_recycleList").addClass("hide"), $("#J_ecardSmsBox").removeClass("hide");
                                var a, i = $("#J_smsCountdown"), o = $("#J_repeatSms"),
                                    r = $("#J_smsCountdown").find("i"), s = 60;
                                i.removeClass("hide"), o.addClass("hide"), r.html(s), a = setInterval(function () {
                                    return 0 >= s ? (i.addClass("hide"), o.removeClass("hide").one("click", function () {
                                        return e.sendSms(), !1
                                    }), void clearInterval(a)) : (s -= 1, void r.html(s))
                                }, 1e3)
                            }
                        } else 500311 === t.code ? e.setEcardResult() : L.tipMsg(t.msg)
                    }
                })
            }, checkSms: function () {
                var e = this, t = $("#ecard_sms"), a = $.trim(t.val()), i = function (e) {
                    var a = e ? e : "验证码错误";
                    t.trigger("error", [a]).focus()
                };
                return a.length < 6 ? void i() : void $.ajax({
                    type: "POST",
                    url: e.config.checkSmsUrl + Math.random(),
                    dataType: "json",
                    data: {sms_code: a, bts: w.bts},
                    timeout: 1e4,
                    error: function () {
                        L.tipMsg("抱歉！网络错误，请刷新重试！")
                    },
                    success: function (t) {
                        t && 1 === t.code ? (e.config.smsToken = t.data.sms_token, e.setEcardResult()) : i(t.msg)
                    }
                })
            }, setEcardResult: function () {
                var e = this;
                e.hideBox(), $("#J_cancelEcardSms").trigger("click");
                var t, a, i, o;
                "normal" === e.config.cardType ? (a = $("#J_useEcard"), t = $("#J_ecardResult"), i = $("#J_ecardVal"), o = $("#J_ecardModify")) : "recycle" === e.config.cardType && (a = $("#J_useRecycle"), t = $("#J_recycleResult"), i = $("#J_recycleVal"), o = $("#J_recycleModify")), t.removeClass("hide"), a.addClass("hide"), i.html("-" + w.ecardAmount + "元"), w.ecard = {
                    id: e.config.selCardId.length > 1 ? e.config.selCardId.join(",") : e.config.selCardId[0],
                    smsToken: e.config.smsToken
                }, e.config.ecardResultShow = !0, o.off().one("click", function () {
                    return e.showBox(a), a.removeClass("hide"), t.addClass("hide"), w.ecard = {}, e.config.ecardResultShow = !1, C(), !1
                })
            }, checkCaptcha: function () {
                var e = this, t = $("#ecard_captcha"), a = $("#J_ecardCaptchaImg"), i = $.trim(t.val()),
                    o = function () {
                        t.trigger("error", ["请输入正确验证码"]).focus(), a.trigger("click")
                    };
                if (!i) return o(), !1;
                var r = t.attr("data-authurl");
                r = r.replace("{answer}", i) + "​&timestamp=" + (new Date).getTime(), $.ajax({
                    url: r,
                    dataType: "jsonp",
                    timeout: 1e4,
                    error: function () {
                    },
                    success: function (t) {
                        t.data && t.data.result && t.data.result === !0 && t.data.token ? e.bindCard({
                            token: t.data.token,
                            answer: i
                        }) : o()
                    }
                })
            }, bindCard: function (e) {
                var t = this, a = $("#ecard_password"), i = a.attr("data-origin-value");
                if (e) {
                    if (!i) return a.trigger("error", ["密码错误"]).focus(), !1;
                    t.toggleLoading(!0), $.ajax({
                        type: "POST",
                        url: t.config.bindUrl + Math.random(),
                        dataType: "json",
                        data: {bts: w.bts, card_cipher: i, captcha_code: e.answer, captcha_token: e.token},
                        timeout: 1e4,
                        error: function () {
                        },
                        success: function (e) {
                            t.toggleLoading(!1), 1 === e.code ? ($("#J_ecardBox").find(".J_tabSwitch > li").eq(0).trigger("click"), t.getList(), t.config.selCardId = [], t.config.bindCardId = e.data.ecard_id, t.revertInput()) : t.bindError(e)
                        }
                    })
                }
            }, revertInput: function () {
                $("#ecard_password").val("").trigger("valid").parent().removeClass("form-section-active"), $("#ecard_captcha").val("").trigger("valid").parent().removeClass("form-section-active"), $("#ecard_sms").val("").trigger("valid").parent().removeClass("form-section-active"), $("#J_ecardCaptchaImg").trigger("click")
            }, bindError: function (e) {
                var t = {
                    60000010: {title: "您的账号未绑定安全手机！", desc: "为了您的资金安全，请前往小米账号中心绑定安全手机使用礼品卡支付时，需安全手机接收验证码"},
                    100405: {title: "该礼品卡未激活或已绑定!", desc: "请联系购买人，确认订单收货并激活礼品卡，每个礼品卡密码只能被绑定一次，若已被绑定，将不能再次绑定。"},
                    100404: {
                        title: "输入的礼品卡号或密码有误！",
                        desc: "如果您使用的是电子密码，可联系购买者询问正确的卡号和密码，如果您使用的是实物礼品卡，请核对您所输入的和卡片背面印有的卡号和密码是否一致"
                    },
                    100406: {
                        title: "输入的礼品卡号或密码有误！",
                        desc: "如果您使用的是电子密码，可联系购买者询问正确的卡号和密码，如果您使用的是实物礼品卡，请核对您所输入的和卡片背面印有的卡号和密码是否一致"
                    }
                };
                t[e.code] ? L.tipMsgs(t[e.code]) : L.tipMsg(e.msg)
            }
        }, x = function () {
            $("#J_miniHeaderTitle").html("<h2>确认订单</h2>"), MI.form.init(), w.bts = $.cookie("xm_order_btauth") ? $.cookie("xm_order_btauth") : null, $("#J_addressList").on("click", ".J_addressItem", function (t) {
                t.preventDefault(), $(this).addClass("selected").siblings(".J_addressItem").removeClass("selected"), w.checkoutData.address = e($(this));
                var a = "N" === $(this).attr("data-editable") ? !0 : !1;
                if (s(), C(), o(a), (checkoutConfig.hasBigTv || checkoutConfig.hasAir) && !checkoutConfig.hasEvent) {
                    var i = $(this).offset();
                    $(".J_bigProTip").css({top: i.top + $(this).outerHeight(), left: i.left})
                }
            }), $("#J_showMoreAddress").on("click", function () {
                var e = $("#J_addressList").find(".selected");
                e.length && e.index() > 2 && e.insertBefore($(".J_addressItem").eq(0)), $(".J_addressItem:gt(2)").toggleClass("hide"), $(this).find(".text").toggleClass("hide")
            }), $("#J_addressList").on("click", ".J_addressItem  .J_addressModify", function (e) {
                e.stopPropagation(), MI.checkUserRisk.init({
                    action: "addr_add", callback: function () {
                        MI.addressEdit.editAddress({
                            action: "edit",
                            hasTv: checkoutConfig.hasBigTv,
                            addressId: w.checkoutData.address.address_id,
                            addressData: w.checkoutData.address,
                            callback: function (e, a) {
                                t(a.address_id, a)
                            }
                        })
                    }
                })
            }), $("#J_newAddress").on("click", function () {
                MI.checkUserRisk.init({
                    action: "addr_add", callback: function () {
                        MI.addressEdit.editAddress({
                            action: "new",
                            hasTv: checkoutConfig.hasBigTv,
                            callback: function (e, t) {
                                r(t)
                            }
                        })
                    }
                })
            }), $("#J_confirmAddress").on("click", ".J_modify", function () {
                $("#J_addressList").find(".selected").find(".J_addressModify").trigger("click"), L.docScroll(".checkout-box")
            }), $(".J_tabSwitch").tabSwitch({
                onShow: function (e) {
                    e.removeClass("hide").show(), e.find(".J_tabSwitch > li").eq(0).trigger("click")
                }
            }), $(".J_optionList").on("click", ".J_option", function () {
                $(this).addClass("selected").siblings(".J_option").removeClass("selected");
                var e = $(this).attr("data-type"), t = $(this).attr("data-value");
                e && ("invoice-mode" !== e && (w.checkoutData[e] = t), "invoice" === e ? ($('.J_option[data-type="invoice"]').removeClass("selected"), $(this).addClass("selected"), w.checkoutData.invoiceType = $(this).attr("data-invoice-type"), "0" === t ? $("#J_invoceInfoOpionsContent").addClass("hide") : ($("#J_invoiceInfoBox").removeClass("hide").siblings(".more").removeClass("hide"), $('.J_option[data-type="invoice-mode"]').removeClass("hide")), "electron" === w.checkoutData.invoiceType ? $(".J_eInvoiceMore").removeClass("hide") : $(".J_eInvoiceMore").addClass("hide")) : "invoice-mode" === e && (w.checkoutData.invoiceMode = $(this).attr("data-invoice-mode")),
                    p())
            }), $("#invoice_title").on("blur", function () {
                var e = $.trim($(this).val()).replace(/[&<>`"'\/]/g, function (e) {
                    return {
                        "&": "&amp;",
                        "<": "&lt;",
                        ">": "&gt;",
                        "`": "&#x60;",
                        '"': "&quot;",
                        "'": "&#x27;",
                        "/": "&#x2f;"
                    }[e]
                });
                return w.checkoutData.invoiceTitle = "", e.length ? e.length > 50 ? void $(this).trigger("error", ["发票抬头必须少于50个字"]) : ($(this).trigger("valid"), void(w.checkoutData.invoiceTitle = e)) : void $(this).trigger("error", ["发票抬头不能为空"])
            }).trigger("blur"), $("#invoice_company_code").on("blur", function () {
                var e = $.trim($(this).val()), t = /^[A-Z0-9]{15}$|^[A-Z0-9]{17,18}$|^[A-Z0-9]{20}$/;
                if (w.checkoutData.invoiceCompanyCode = "", e) {
                    if (!t.test(e)) return void $(this).trigger("error", ["纳税人识别号为15、17、18、20位数字或大写字母，请正确填写！"]);
                    $(this).trigger("valid"), w.checkoutData.invoiceCompanyCode = e
                }
            }).trigger("blur"), $("#einvoice_phone").on("blur", function () {
                var e = $.trim($(this).val()), t = /^1[0-9]{10}$/, a = $(this).attr("data-tel");
                if (e) {
                    if (w.checkoutData.eInvoicePhone = 0, e !== a && !t.test(e)) return void $(this).trigger("error", ["请输入正确的手机号"]);
                    $(this).trigger("valid"), w.checkoutData.eInvoicePhone = e !== a ? e : ""
                }
            }).trigger("blur"), $("#einvoice_mail").on("blur", function () {
                var e = $.trim($(this).val()),
                    t = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/,
                    a = $(this).attr("data-email");
                if (e) {
                    if (w.checkoutData.eInvoiceMail = 0, e !== a && !t.test(e)) return void $(this).trigger("error", ["请输入正确的邮箱地址"]);
                    $(this).trigger("valid"), w.checkoutData.eInvoiceMail = e !== a ? e : ""
                }
            }).trigger("blur"), a(), i(), d(), m(), k(), $("#J_checkoutToPay").on("click", function () {
                var e = $(this).hasClass("btn-gray");
                return e ? !1 : void MI.checkUserRisk.init({
                    action: "buy_submit", callback: function () {
                        b()
                    }
                })
            }), "1" === checkoutConfig.showCaptcha && A(), $(".J_carouselList").carousel({
                itemPerSlide: 3,
                containerSelector: ".J_carouselContainer",
                controlsSelector: ".J_carouselControl",
                controls: !1,
                pager: !0
            }), $("#J_yushouSubmit").on("click", function () {
                $("#J_yushouTip").modal("hide"), w.persalesChecked = !0, b()
            }), $("#J_lipinSubmit").on("click", function () {
                $("#J_lipinTip").modal("hide"), w.giftCardChecked = !0, b()
            }), T(), M.init(), $("#J_invoiceInfoSubmit").on("click", function () {
                return 0 === w.checkoutData.eInvoicePhone ? void $("#einvoice_phone").trigger("focus") : 0 === w.checkoutData.eInvoiceMail ? void $("#einvoice_mail").trigger("focus") : w.checkoutData.invoiceTitle ? "company" !== w.checkoutData.invoiceMode || w.checkoutData.invoiceCompanyCode ? ($("#J_modalInvoiceInfo").modal("hide"), void S()) : void $("#invoice_company_code").trigger("focus") : void $("#invoice_title").trigger("focus")
            }), $(document).on("mouseup", function (e) {
                var t = ["#J_einvoiceDetail", "#J_couponBox", "#J_ecardQaDetail", "[data-bubble]"];
                $.each(t, function (t, a) {
                    $(a).is(e.target) || 0 !== $(a).has(e.target).length || $(a).addClass("hide")
                })
            }), $("[data-bubble-toggle]").on("click.showBubble", function () {
                var e = $(this).attr("data-bubble-toggle");
                e && $('[data-bubble="' + e + '"]').removeClass("hide")
            }), MI.addressEdit.init()
        }, L = {
            tipMsg: function (e) {
                e ? $("#J_modalAlert").one("show.bs.modal", function () {
                    $("#J_alertMsg").html(e)
                }).modal({show: !0, backdrop: "static"}).removeClass("hide").one("hidden.bs.modal", function () {
                    $(this).addClass("hide"), $("#J_alertMsg").html("")
                }) : $("#J_modalAlert").modal("hide")
            }, tipMsgs: function (e) {
                e ? $("#J_modalAlert").addClass("modal-alerts").one("show.bs.modal", function () {
                    $("#J_alertMsg").html(e.title).after("<p>" + e.desc + "</p>")
                }).modal({show: !0, backdrop: "static"}).removeClass("hide").one("hide.bs.modal", function () {
                    $(this).addClass("hide").removeClass("modal-alerts"), $("#J_alertMsg").html("").siblings("p").remove()
                }) : $("#J_modalAlert").modal("hide")
            }, docScroll: function (e) {
                if ($(e).length) {
                    var t = $(e).offset().top;
                    $("html, body").animate({scrollTop: t}, 500)
                }
            }, parseJson: function (e) {
                return new Function("return " + e)()
            }
        };
        return {init: x}
    }(), $(document).ready(function () {
        MI.checkout.init()
    })
}, function (e, t) {
    !function (e) {
        function t(a, i) {
            function o(t) {
                s = t.find(l.tabSelector), s.on(l.events, function (a) {
                    var i = s.index(e(this));
                    if (a.preventDefault(), e(this).attr("href") && e(this).attr("href").split("#")[1]) {
                        var o = e(window).scrollTop();
                        window.location.hash = e(this).attr("href").split("#")[1], e("body, html").scrollTop(o)
                    }
                    r.each(function () {
                        e(this).find(l.tabSelector).eq(i).addClass("tab-active").siblings(l.tabSelector).removeClass("tab-active")
                    }), "function" == typeof l.onShow ? l.onShow(c.eq(i), i) : c.eq(i).removeClass("hide").show(), "function" == typeof l.onHide ? l.onHide(c.eq(i).siblings(l.contentSelector), i) : c.eq(i).siblings(l.contentSelector).addClass("hide").hide(), l.onLoad(t, i, l)
                })
            }

            var r, s, n, c, d, l;
            if (d = {
                isSync: !1,
                events: "click",
                tabSelector: "li",
                containerSelector: ".tab-container",
                contentSelector: ".tab-content",
                onShow: null,
                onHide: null,
                onLoad: e.noop
            }, l = e.extend({}, d, i), l.isSync === !1) {
                if (0 === a.length) return a;
                if (a.length > 1) return a.each(function () {
                    t(e(this), i)
                }), a
            }
            r = e(a), n = r.first().attr("data-tab-target") ? e("#" + r.first().attr("data-tab-target")) : r.first().siblings(l.containerSelector), c = n.children(l.contentSelector), r.each(function () {
                o(e(this))
            }), l.onLoad(r, l)
        }

        e.fn.tabSwitch = function (e) {
            return t(this, e), this
        }
    }(jQuery)
}, function (e, t) {
    !function (e) {
        function t(t) {
            function a() {
                return 0 >= $ ? !1 : (k && clearInterval(k), void(k = setTimeout(function () {
                    var e = C === $ - 1 ? 0 : C + 1;
                    i(e), a()
                }, f.pause)))
            }

            function i(e) {
                return C === e ? !1 : (_.css({
                    marginLeft: -g * m * e,
                    transition: "margin-left " + f.speed / 1e3 + "s " + f.easing
                }), f.controls && (0 === e ? l.addClass("control-disabled") : l.removeClass("control-disabled"), e === $ - 1 ? u.addClass("control-disabled") : u.removeClass("control-disabled")), f.pager && h.find("li").eq(e).addClass("pager-active").siblings().removeClass("pager-active"), void(C = e))
            }

            function o() {
                for (var t = '<ul class="xm-pagers">', a = 0, o = $; o > a; a += 1) t += '<li class="pager' + (0 === a ? " pager-active" : "") + '"><span class="dot">' + (a + 1) + "</span></li>";
                t += "</ul>", h.html(t), h.find("li").off(".carousel").on("click.carousel", function () {
                    e(this).addClass("pager-active").siblings().removeClass("pager-active"), i(h.find("li").index(e(this)))
                })
            }

            function r() {
                m = f.itemPerSlide || Math.ceil(n.width() / g), $ = Math.ceil(c.length / m), 1 >= $ || (i(0), f.pager && o(), f.auto && (a(), f.controls && d.find(".control").off(".carousel").on({
                    "mouseenter.carousel": function () {
                        k && clearTimeout(k)
                    }, "mouseleave.carousel": function () {
                        a()
                    }
                }), f.pager && h.find(".pager").off(".carousel").on({
                    "mouseenter.carousel": function () {
                        k && clearTimeout(k)
                    }, "mouseleave.carousel": function () {
                        a()
                    }
                })))
            }

            var s, n, c, d, l, u, h, p, f, m, g, v, $, _ = e(this), k = 0, C = -1;
            return p = {
                itemSelector: "> li",
                itemWidth: null,
                itemHeight: null,
                itemPerSlide: null,
                containerSelector: null,
                controlsSelector: null,
                pagersSelector: null,
                speed: 500,
                easing: "ease",
                auto: !1,
                pause: 5e3,
                controls: !0,
                controlsClass: "xm-controls-line-small",
                pager: !1,
                onLoad: e.noop
            }, f = e.extend({}, p, t), c = _.find(f.itemSelector), f.itemPerSlide && c.length <= f.itemPerSlide ? this : (g = f.itemWidth || c.outerWidth(!0), v = f.itemHeight || c.outerHeight(), s = f.containerSelector ? _.closest(f.containerSelector) : _.parent(), s.addClass("xm-carousel-container"), n = _.wrap('<div class="xm-carousel-wrapper"></div>').closest(".xm-carousel-wrapper").css({
                height: v,
                overflow: "hidden"
            }), _.css("width", g * c.length), f.controls && (d = e('<div class="xm-controls ' + f.controlsClass + ' xm-carousel-controls"><a class="control control-prev iconfont" href="javascript: void(0);">&#xe628;</a><a class="control control-next iconfont" href="javascript: void(0);">&#xe623;</a></div>'), f.controlsSelector ? s.find(f.controlsSelector).append(d) : d.insertAfter(n), l = d.find(".control-prev"), u = d.find(".control-next"), l.on("click", function (t) {
                t.preventDefault(), e(this).hasClass("control-disabled") || i(C - 1)
            }), u.on("click", function (t) {
                t.preventDefault(), e(this).hasClass("control-disabled") || i(C + 1)
            })), f.pager && (h = e('<div class="xm-pagers-wrapper"></div>'), f.pagersSelector ? s.find(f.pagersSelector).append(h) : h.insertAfter(n)), r(), f.onLoad(_), void e(window).on("resize", r))
        }

        e.fn.carousel = function (e) {
            return this.each(function () {
                t.call(this, e)
            }), this
        }
    }(jQuery)
}, function (e, t) {
    !function (e) {
        function t(a, i) {
            function o(e) {
                var t = "undefined" != typeof navigator ? navigator.userAgent : null, a = /iphone/i.test(t);
                return 8 === e || 46 === e || a && 127 === e
            }

            function r(e) {
                var t = {35: "end", 36: "home", 37: "leftarrow", 38: "uparrow", 39: "rightarrow", 40: "downarrow"};
                return t[e]
            }

            function s(e) {
                return "Meta" === e || "Control" === e || "Alt" === e || "Shift" === e
            }

            function n(e) {
                return f.inputPattern.test(e)
            }

            function c(e, t) {
                return t = t > e.length ? e.length : t, 0 > t ? 0 : c(e, t - 1) + e[t]
            }

            function d(t) {
                var a, i = e(t)[0];
                if ("number" == typeof i.selectionStart) return {begin: i.selectionStart, end: i.selectionEnd};
                if (a = document.selection.createRange(), a && a.parentElement() === i) {
                    var o = i.createTextRange(), r = i.createTextRange(), s = i.value.length;
                    return o.moveToBookmark(a.getBookmark()), r.collapse(!1), o.compareEndPoints("StartToEnd", r) > -1 ? {
                        begin: s,
                        end: s
                    } : {begin: -o.moveStart("character", -s), end: -o.moveEnd("character", -s)}
                }
                return {begin: 0, end: 0}
            }

            function l(t, a) {
                var i = e(t)[0];
                if (i.setSelectionRange) i.focus(), i.setSelectionRange(a, a); else if (i.createTextRange) {
                    var o = i.createTextRange();
                    o.collapse(!0), o.moveStart("character", a), o.moveEnd("character", a), o.select()
                }
            }

            function u(e) {
                return e.split(f.sepSymbol).join("")
            }

            function h(t) {
                var a, i = e(t), o = i.val(), r = u(o), s = r, n = 0, h = f.formatPattern.length, p = d(i).end, m = !0,
                    g = 0;
                for (p !== i.val().length && (m = !1, g = 0); h > n && (a = c(f.formatPattern, n) + n, !(r.length + n + 1 <= a)); n += 1) m && p > a ? g += 1 : p === a && (g += 1), s = [s.slice(0, a), s.slice(a)].join(f.sepSymbol);
                f.maxlength > 0 && (s = s.slice(0, f.maxlength)), p += g, i.val(s), l(i, p)
            }

            function p(e) {
                e.attr("data-origin-value", u(e.val()))
            }

            var f, m = {
                elmType: "input",
                formatPattern: [5, 5, 5, 5],
                maxlength: parseInt(a.attr("maxlength")),
                inputPattern: "all",
                sepSymbol: "-"
            }, g = !1;
            return 0 === a.length ? a : a.length > 1 ? (a.each(function () {
                t(e(this), i)
            }), a) : (f = e.extend({}, m, i), void a.on({
                keydown: function (e) {
                    return "all" === f.inputPattern || n(e.key) ? (s(e.key) && (g = !0), void(g && (g = "both"))) : !1
                }, keyup: function (t) {
                    var a = e(this);
                    return s(t.key) || "both" !== g ? void(o(t.which) || r(t.which) || s(t.key) || (h(a), p(a))) : void(g = !1)
                }, paste: function () {
                    var t = e(this);
                    setTimeout(function () {
                        h(t), p(t)
                    }, 10)
                }, change: function () {
                    var t = e(this);
                    p(t)
                }
            }))
        }

        e.fn.formatter = function (e) {
            return t(this, e), this
        }
    }(jQuery)
}, function (e, t) {
    MI.checkUserRisk = function () {
        function e() {
            return multiline(function () {/*!@tpl
	<div  class="modal modal-hide fade modal-user-risk" id="J_modalUserRisk">
	    <div class="modal-hd">
	        <h3 class="title">验证信息</h3>
	        <a class="close" data-dismiss="modal" href="javascript: void(0);"><i class="iconfont">&#xe602;</i></a>
	    </div>
	    <div class="modal-bd">
	        <h3 class="title">您的账号存在风险</h3>
	        <p class="desc">如需继续操作，我们将向您绑定的手机 <span id="J_userRiskPhone"></span> 发送验证码</p>

	        <div class="form-section">
	            <label class="input-label" for="J_riskCode">输入验证码</label>
	            <input class="input-text input-url" type="text" id="J_riskCode" name="J_riskCode" />
	            <a href="javascript:void(0);" class="btn btn-get" id="J_getRiskCode">获取验证码 &gt;</a>
	            <span href="javascript:void(0);" class="btn btn-coutdown hide" id="J_riskCoutdown"></span>
	        </div>
	        <div class="tip-msg" id="J_riskTipMsg"></div>
	    </div>
	    <div class="modal-ft">
	        <a class="btn btn-gray" data-dismiss="modal" href="javascript: void(0);">取消</a>
	        <a class="btn btn-primary" href="javascript: void(0);" id="J_submitRiskCode">提交</a>
	    </div>
	</div>
	  */
                console.log()
            })
        }

        function t() {
            return multiline(function () {/*!@tpl
	<div  class="modal modal-hide fade modal-user-risk" id="J_modalUserRisk">
	    <div class="modal-hd">
	        <h3 class="title">验证信息</h3>
	        <a class="close" data-dismiss="modal" href="javascript: void(0);"><i class="iconfont">&#xe602;</i></a>
	    </div>
	    <div class="modal-bd">
	        <h3 class="title">您的账号存在风险</h3>
	        <p class="desc">如需继续操作，请前往账号中心完成安全设置</p>
	        <a href="https://account.xiaomi.com/pass/auth/security/home" class="btn btn-primary "
	        id="J_riskPortalLink" target="_blank">前往小米账号中心</a>
	    </div>
	</div>
	  */
                console.log()
            })
        }

        function a() {
            var a = MI.GLOBAL_CONFIG.orderSite + "/risk/checkuser", o = $.cookie("miUserRiskToken") || "";
            $.ajax({
                type: "POST", url: a, dataType: "json", data: {risk_token: o}, timeout: 5e3, error: function () {
                    alert("抱歉！网络超时，请刷新重试！")
                }, success: function (a) {
                    -1 === a.code ? (c(), a.data && a.data.safe_mobile ? ($("body").append(e()), $("#J_userRiskPhone").html(a.data.safe_mobile)) : $("body").append(t()), i()) : 1 === a.code && "function" == typeof u.callback ? u.callback() : alert(a.msg)
                }
            })
        }

        function i() {
            var e = $("#J_modalUserRisk");
            MI.form.init(), e.modal({show: !0, backdrop: "static"}), $("#J_submitRiskCode").on("click", function () {
                return s(), !1
            }), $("#J_getRiskCode").on("click", function () {
                return o(), !1
            })
        }

        function o() {
            var e = MI.GLOBAL_CONFIG.orderSite + "/risk/sendsms";
            $.ajax({
                type: "POST", url: e, dataType: "json", data: {sms_action: u.action}, success: function (e) {
                    1 === e.code ? r() : n(e.msg)
                }
            })
        }

        function r() {
            var e, t = 60, a = $("#J_riskCoutdown"), i = function () {
                return a.html(t + "秒后重新获取"), t -= 1, e && clearTimeout(e), 0 >= t ? (a.addClass("hide").siblings(".btn").removeClass("hide"), !1) : void(e = setTimeout(i, 1e3))
            };
            n(), a.removeClass("hide").siblings(".btn").addClass("hide"), i()
        }

        function s() {
            var e = $.trim($("#J_riskCode").val()), t = MI.GLOBAL_CONFIG.orderSite + "/risk/checksmscode";
            return e ? void $.ajax({
                type: "POST",
                url: t,
                dataType: "json",
                data: {sms_code: e},
                timeout: 5e3,
                error: function () {
                    n("抱歉！网络超时，请重试!")
                },
                success: function (e) {
                    1 === e.code && "function" == typeof u.callback ? ($("#J_modalUserRisk").modal("hide"), $.cookie("miUserRiskToken", e.data.risk_token, {
                        expires: 1,
                        path: "/",
                        domain: "mi.com"
                    }), u.callback()) : n(e.msg)
                }
            }) : void n("请输入正确的验证码!")
        }

        function n(e) {
            $("#J_riskTipMsg").html(e ? e : "")
        }

        function c() {
            $("#J_modalUserRisk").remove(), $.cookie("miUserRiskToken", null)
        }

        function d(e) {
            u = $.extend(l, e || {}), a()
        }

        var l = {action: "", callback: $.noop}, u = {};
        return {init: d}
    }()
}, function (e, t, a) {
    a(7), MI.namespace("searchAddress"), MI.searchAddress = {
        init: function (e) {
            var t = this, a = {searchCallback: $.noop};
            t.options = $.extend(a, e), t.apiUrl = {
                search: MI.GLOBAL_CONFIG.orderSite + "/address/searchByKeywords",
                translate: MI.GLOBAL_CONFIG.orderSite + "/address/getAreaInfoByLocation",
                login: MI.GLOBAL_CONFIG.orderSite + "/site/login?redirectUrl=" + location.href
            }, t.$input = $("#J_searchAddressInput"), t.$inputClear = $("#J_searchAddressInputClear"), t.$searchWrapper = $("#J_searchAddressWrapper"), t.$loading = t.$searchWrapper.find(".loading"), t.$nearbyAddr = t.$searchWrapper.find("#J_nearbyAddress"), t.$nearbyAddrList = t.$nearbyAddr.find(".list"), t.$searchAddr = t.$searchWrapper.find("#J_searchAdress"), t.$searchAddrList = t.$searchAddr.find(".list"), t.$noResult = t.$searchWrapper.find("#J_noSearchResult"), t.searchVal = null, t.nearbyData = null, t.checkLogin(), t.searchEvent(), t.selectEvent()
        }, checkLogin: function () {
            this.isLogin = ($.cookie("cUserId") || $.cookie("userId")) && $.cookie("xm_order_btauth") ? !0 : !1
        }, revert: function () {
            this.$input.val(""), this.searchVal = null, this.toggleShow(this.$nearbyAddr, !1), this.toggleShow(this.$searchAddr, !1), this.toggleShow(this.$noResult, !1)
        }, searchEvent: function () {
            var e, t, a = this, i = 200;
            a.$input.on({
                focus: function () {
                    a.toggleShow(a.$loading, !0), a.searchVal ? a.searchAddress() : a.nearbyData ? a.formatAddress(a.nearbyData, null, "nearby") : a.searchAddress()
                }, blur: function () {
                    t && clearTimeout(t), t = setTimeout(function () {
                        a.toggleShow(a.$loading, !1), a.toggleShow(a.$nearbyAddr, !1), a.toggleShow(a.$searchAddr, !1), a.toggleShow(a.$noResult, !1), $(".J_switchType").eq(0).show()
                    }, 200)
                }, keyup: function () {
                    e && clearTimeout(e), e = setTimeout(function () {
                        a.searchVal = $.trim(a.$input.val().replace(/[\-_'=+|\\\/]/g, " ")), a.searchVal ? a.toggleShow(a.$inputClear, !0) : a.toggleShow(a.$inputClear, !1), a.toggleShow(a.$nearbyAddr, !1), a.toggleShow(a.$searchAddr, !1), a.toggleShow(a.$noResult, !1), a.toggleShow(a.$loading, !0), a.searchAddress()
                    }, i)
                }
            }), a.$inputClear.on("click", function () {
                a.searchVal = null, a.$input.val("").focus(), a.toggleShow(a.$inputClear, !1)
            })
        }, selectEvent: function () {
            var e = this;
            $.each([e.$nearbyAddrList, e.$searchAddrList], function (t, a) {
                a.on("click", ".J_searchAddressItem", function () {
                    var t = $(this).attr("data-code"), a = $(this).attr("data-location");
                    e.translateSearchResult({code: t, location: a})
                })
            })
        }, toggleShow: function (e, t) {
            t ? e.removeClass("hide") : e.addClass("hide")
        }, searchAddress: function () {
            var e = this, t = e.searchVal ? "search" : "nearby";
            $.ajax({
                url: e.apiUrl.search,
                dataType: "jsonp",
                jsonp: "jsonpcallback",
                data: {keywords: e.searchVal},
                timeout: 3e4,
                cache: !0,
                error: function () {
                },
                success: function (a) {
                    if (a && 1 === a.code) {
                        if ($(".J_switchType").eq(0).show(), !a.data || !a.data.length) return e.toggleShow(e.$loading, !1), void("search" === t && (e.toggleShow(e.$noResult, !0), $(".J_switchType").eq(0).hide()));
                        e.searchVal || (e.nearbyData = a.data), e.formatAddress(a.data.slice(0, 5), null, t)
                    }
                }
            })
        }, formatAddress: function (e, t, a) {
            if (e) {
                var i = this, o = multiline(function () {/*!@tpl
	        {{~it :value:index}}
	            <li class="J_searchAddressItem" data-code="{{=value.adcode ? value.adcode : ''}}"
	            data-location="{{=value.location}}">
	                <div class="address-title">
	                    <span class="item">{{=value.name}}</span>
	                </div>
	                <div class="address-desc">
	                    {{=value.pname}}{{=value.cityname}}{{=value.adname}}
	                </div>
	                <a class="btn btn-primary">选择</a>
	            </li>
	        {{~}}
	        */
                    console.log()
                }), r = "";
                i.toggleShow(i.$loading, !1), i.toggleShow(i.$noResult, !1), "nearby" === a ? (r = doT.template(o)(e), i.$nearbyAddrList.html(r), i.toggleShow(i.$nearbyAddr, !0)) : "search" === a && (r = doT.template(o)(e), i.$searchAddrList.html(r), i.toggleShow(i.$searchAddr, !0)), "function" == typeof t && $.proxy(t, i)()
            }
        }, translateSearchResult: function (e) {
            var t = this;
            $.ajax({
                url: t.apiUrl.translate,
                dataType: "jsonp",
                jsonp: "jsonpcallback",
                data: {adcode: e.code, location: e.location},
                timeout: 3e4,
                error: function () {
                },
                success: function (e) {
                    e && 1 === e.code && t.formatChooseResult(e.data)
                }
            })
        }, formatChooseResult: function (e) {
            var t = this, a = [];
            $.each(e, function (e, t) {
                a.push({id: t.id, name: t.name, zcode: t.zipcode ? t.zipcode : ""})
            }), a.length && "function" == typeof t.options.searchCallback && t.options.searchCallback(a)
        }
    }, MI.namespace("addressEdit"), MI.addressEdit = {
        init: function () {
            var e = this;
            this.userAddress = {}, this.editOptions = {
                action: "new",
                hastv: !1,
                addressId: 0,
                addressData: {},
                callback: $.noop
            }, this.buildDom(), MI.form.init(), this.formElem = {
                $modal: $("#J_modalEditAddress"),
                $name: $("#J_addressNameInput"),
                $phone: $("#J_addressPhoneInput"),
                $addressDetail: $("#J_addressDetailInput"),
                $zipcode: $("#J_addressZipcodeInput"),
                $tag: $("#J_addressTagInput"),
                $tip: $("#J_formTipMsg"),
                $fourAddress: $("#J_selectAddressTrigger"),
                $selectAddress: $("#J_selectAddressWrapper")
            }, this.riskToken = $.cookie("miUserRiskToken") || "", MI.searchAddress.init({
                searchCallback: function (t) {
                    e.formElem.$selectAddress.addClass("hide"), e.saveSelectAddress(t)
                }
            }), this.fourAddress = new MI.fourAddress, this.fourAddress.init({
                wrapperElm: "#J_fourAddressWrapper",
                selectEnd: function (t) {
                    e.formElem.$selectAddress.addClass("hide"), e.saveSelectAddress(t)
                }
            }), this.switchType(), this.switchSelectAddress(), $("#J_editAddressSave").on("click", function () {
                var t = !1;
                $(".J_addressInput").each(function () {
                    return t = e.validation($(this)), t ? void 0 : !1
                }), t && e.saveAddress()
            }), $(".J_addressInput").on("blur", function () {
                var t = $.trim($(this).val()), a = "four_address" === $(this).attr("name") ? !0 : !1;
                t && !a && e.validation($(this))
            })
        }, buildDom: function () {
            var e = multiline(function () {/*!@tpl
	        <div class="modal modal-hide fade modal-edit-address" id="J_modalEditAddress">
	            <div class="modal-header">
	                <span class="title">添加收货地址</span>
	                <a class="close" data-dismiss="modal" href="javascript: void(0);"><i class="iconfont">&#xe602;</i></a>
	            </div>
	            <div class="modal-body">
	                <div class="form-box clearfix">
	                    <div class="form-section form-name">
	                        <label class="input-label" for="user_name">姓名</label>
	                        <input class="input-text J_addressInput" type="text"
	                        id="J_addressNameInput" name="user_name" placeholder="收货人姓名" />
	                    </div>
	                    <div class="form-section form-phone">
	                        <label class="input-label" for="user_phone">手机号</label>
	                        <input class="input-text J_addressInput" type="text"
	                        id="J_addressPhoneInput" name="user_phone"  placeholder="11位手机号" />
	                    </div>
	                    <div class="form-section form-four-address">
	                        <input id="J_selectAddressTrigger" class="input-text J_addressInput"
	                        type="text"  name="four_address" readonly="readonly"
	                        value="选择省 / 市 / 区 / 街道" placeholder="选择省 / 市 / 区 / 街道" />
	                        <i class="iconfont">&#xe61c;</i>
	                    </div>
	                    <div class="form-section form-address-detail">
	                        <label class="input-label" for="user_adress">详细地址</label>
	                        <textarea class="input-text J_addressInput" type="text"
	                        id="J_addressDetailInput" name="user_adress" placeholder="详细地址，路名或街道名称，门牌号"></textarea>
	                    </div>
	                    <div class="form-section form-zipcode">
	                        <label class="input-label" for="user_zipcode">邮政编码</label>
	                        <input class="input-text J_addressInput" type="text" id="J_addressZipcodeInput"
	                        name="user_zipcode" />
	                    </div>
	                    <div class="form-section form-tag">
	                        <label class="input-label" for="user_tag">地址标签</label>
	                        <input class="input-text J_addressInput" type="text" id="J_addressTagInput"
	                        name="user_tag"  placeholder="如&quot;家&quot;、&quot;公司&quot;。限5个字内" />
	                    </div>

	                    <div class="form-section form-tip-msg clearfix" id="J_formTipMsg"></div>
	                </div>

	                <div class="select-address-wrapper hide"  id="J_selectAddressWrapper">
	                    <span class="select-address-close">x</span>
	                    <div class="search-address-wrapper J_selectAddressItem" data-type="search"
	                    id="J_searchAddressWrapper">
	                        <div class="search-section">
	                            <i class="icon icon-search iconfont">&#xe616;</i>
	                            <input class="search-input" id="J_searchAddressInput" type="text"
	                            placeholder="输入街道、乡镇、小区或商圈名称" autocomplete="off">
	                            <span class="icon icon-del iconfont hide" id="J_searchAddressInputClear">&#xd7;</span>
	                        </div>

	                        <div class="search-example">例如：北京 华润五彩城</div>

	                        <div class="loading hide"><div class="loader"></div></div>

	                        <!-- 附近商圈 -->
	                        <div class="nearby-address hide" id="J_nearbyAddress">
	                            <div class="title">附近商圈</div>
	                            <ul class="list clearfix"></ul>
	                        </div>

	                        <!-- 搜索列表 -->
	                        <div class="search-address hide" id="J_searchAdress">
	                            <ul class="list clearfix"></ul>
	                        </div>

	                        <div class="no-result hide" id="J_noSearchResult">
	                            没有找到这个地方，<a href="javascript:void(0);"   class="J_switchTypeTrigger"
	                            data-type="select">手动选择&gt;</a>
	                        </div>
	                        <div class="switch-type J_switchType">
	                            <a href="javascript:void(0);"   class="J_switchTypeTrigger"
	                            data-type="select">手动选择地址&gt;</a>
	                        </div>
	                    </div>
	                    <div class="four-address-wrapper hide J_selectAddressItem" data-type="select" >
	                        <div id="J_fourAddressWrapper"></div>
	                        <div class="switch-type">
	                            <a href="javascript:void(0);"   class="J_switchTypeTrigger"
	                            data-type="search"> 搜索地址快速定位&gt;</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	            <div class="modal-footer">
	                <a href="javascript:void(0);" class="btn btn-primary" id="J_editAddressSave">保存</a>
	                <a href="#J_modalEditAddress" class="btn btn-gray" data-toggle="modal">取消</a>
	            </div>
	        </div>
	        */
                console.log()
            });
            $("body").append(e)
        }, editAddress: function (e) {
            var t = this;
            t.editOptions = $.extend(t.editOptions, e), "new" === t.editOptions.action ? t.showModal() : "edit" === t.editOptions.action && (t.setFormAddress(), t.showModal()), t.riskToken = $.cookie("miUserRiskToken") || "", "true" === t.editOptions.hastv && t.formElem.$name.attr("placeholder", "收货时将核对身份证信息").siblings("label").html("真实姓名")
        }, showModal: function () {
            var e = this;
            e.formElem.$modal.modal({show: !0, backdrop: "static"}).one("hidden", function () {
                e.revertForm()
            })
        }, saveSelectAddress: function (e) {
            var t = this, a = "";
            t.userAddress.province = e[0].id, t.userAddress.provinceName = e[0].name, t.userAddress.city = e[1].id, t.userAddress.cityName = e[1].name, t.userAddress.county = e[2].id, t.userAddress.countyName = e[2].name, t.userAddress.zipcode = e[2].zcode, t.userAddress.area = e[3].id, t.userAddress.areaName = e[3].name, $.each(e, function (e, t) {
                a += " " + t.name
            }), t.formElem.$fourAddress.val(a).addClass("active"), t.formElem.$zipcode.val(e[2].zcode).trigger("focus").trigger("blur")
        }, setFormAddress: function () {
            var e = this, t = e.editOptions.addressData;
            e.userAddress.province = t.province_id, e.userAddress.provinceName = t.province_name, e.userAddress.city = t.city_id, e.userAddress.cityName = t.city_name, e.userAddress.county = t.district_id, e.userAddress.countyName = t.district_name, e.userAddress.zipcode = t.zipcode, e.userAddress.area = t.area, e.userAddress.areaName = t.area_name, e.userAddress.phone = t.tel, setTimeout(function () {
                e.formElem.$phone.attr("placeholder", t.tel), e.formElem.$addressDetail.val(t.address).trigger("focus"), e.formElem.$zipcode.val(t.zipcode).trigger("focus"), t.tag_name && e.formElem.$tag.val(t.tag_name).trigger("focus"), e.formElem.$fourAddress.val(t.province_name + " " + t.city_name + " " + t.district_name + " " + t.area_name).addClass("active"), e.formElem.$name.val(t.consignee).trigger("focus")
            }, 200)
        }, validation: function (e) {
            if (e.length) {
                var t, a = this, i = e.attr("name"), o = $.trim(e.val());
                if ("user_name" === i) {
                    if (t = /^[a-zA-Z\u4e00-\u9fa5·]+$/, o.length < 2 || o.length > 20) return e.trigger("error", ["收货人姓名，最少2个最多20个中文字"]), !1;
                    if (!t.test(o)) return e.trigger("error", ["收货人姓名不正确（只能是英文、汉字）"]), !1;
                    e.trigger("valid"), a.userAddress.uname = o
                } else if ("user_phone" === i) {
                    if (t = /^1[0-9]{10}$/, !t.test(o) && "edit" !== a.editOptions.action) return e.trigger("error", ["请输入正确的手机号"]), !1;
                    if ("edit" === a.editOptions.action && "" !== o && !t.test(o)) return e.trigger("error", ["请输入正确的手机号"]), !1;
                    e.trigger("valid"), a.userAddress.phone = o
                } else if ("four_address" === i) {
                    if (!(a.userAddress.province && a.userAddress.city && a.userAddress.county && a.userAddress.area)) return e.trigger("error", ["请选择地址"]), !1
                } else if ("user_adress" === i) {
                    o = o.replace(/</g, "").replace(/>/g, "").replace(/\//g, "").replace(/\\/g, ""), t = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
                    var r = /^\d+$/, s = /^[0-9a-zA-Z]+$/;
                    if (o.length < 5 || o.length > 32) return e.trigger("error", ["详细地址长度不对，最小为 5 个字，最大32个字"]), !1;
                    if (t.test(o) || r.test(o) || s.test(o)) return e.trigger("error", ["详细地址不正确"]), !1;
                    e.trigger("valid"), a.userAddress.address = o
                } else if ("user_zipcode" === i) {
                    if (t = /^\d{6}$/, !t.test(o)) return e.trigger("error", ["邮编是6位数字"]), !1;
                    e.trigger("valid"), a.userAddress.zipcode = o
                } else if ("user_tag" === i) {
                    if (o.length > 5) return e.trigger("error", ["地址标签最长5个字"]), !1;
                    e.trigger("valid"), a.userAddress.tag = o
                }
                return !0
            }
        }, saveAddress: function () {
            var e = this, t = {
                    consignee: e.userAddress.uname,
                    province_id: e.userAddress.province,
                    city_id: e.userAddress.city,
                    district_id: e.userAddress.county,
                    area: e.userAddress.area,
                    address: e.userAddress.address,
                    zipcode: e.userAddress.zipcode,
                    tel: e.userAddress.phone,
                    tag_name: e.userAddress.tag
                }, a = $.cookie("xm_order_btauth") ? $.cookie("xm_order_btauth") : "",
                i = MI.GLOBAL_CONFIG.orderSite + "/address/add.php?bts=" + a;
            "edit" === e.editOptions.action && (t.address_id = e.editOptions.addressId, i += "&id=" + e.editOptions.addressId + "&action=edit"), e.formElem.$tip.html(""), $.ajax({
                type: "POST",
                url: i,
                dataType: "json",
                data: {newAddress: t, risk_token: e.riskToken},
                timeout: 1e4,
                error: function () {
                },
                success: function (t) {
                    t && 1 === t.code ? (e.formElem.$modal.modal("hide"), e.userAddress.address_id = t.data.address_id, "function" == typeof e.editOptions.callback && ("edit" !== e.editOptions.action || e.userAddress.phone || (e.userAddress.phone = e.editOptions.addressData.tel), e.editOptions.callback(e.editOptions.action, e.userAddress))) : e.formElem.$tip.html(t.msg)
                }
            })
        }, switchType: function () {
            $(".J_switchTypeTrigger").on("click", function () {
                var e = $(this).attr("data-type");
                e && $(".J_selectAddressItem[data-type=" + e + "]").removeClass("hide").siblings(".J_selectAddressItem").addClass("hide")
            })
        }, switchSelectAddress: function () {
            var e = this;
            e.formElem.$fourAddress.on("click", function () {
                e.formElem.$selectAddress.removeClass("hide").find(".select-address-close").one("click", function () {
                    e.formElem.$selectAddress.addClass("hide")
                })
            })
        }, revertForm: function () {
            var e = this;
            e.formElem.$name.val("").trigger("valid"), e.formElem.$phone.attr("placeholder", "手机号").val("").trigger("valid"), e.formElem.$fourAddress.val(e.formElem.$fourAddress.attr("placeholder")).trigger("valid"), e.formElem.$addressDetail.val("").trigger("valid"), e.formElem.$zipcode.val("").trigger("valid"), e.formElem.$tag.val("").trigger("valid"), e.formElem.$tip.html("").trigger("valid"), e.formElem.$selectAddress.addClass("hide"), $('.J_switchTypeTrigger[data-type="search"]').trigger("click"), this.fourAddress.init()
        }
    }
}, function (e, t) {
    MI.namespace("fourAddress"), MI.fourAddress = function () {
        this.options = {
            wrapperElm: "#J_selectAddressWrapper",
            optionsWrapper: ".J_optionsWrapper",
            selectWrapper: "#J_selectWrapper",
            maxLevel: 4,
            afterFormat: $.noop,
            selectEnd: $.noop
        }
    }, MI.fourAddress.prototype = {
        constructor: MI.fourAddress, init: function (e) {
            var t = this;
            "object" == typeof e && (t.options = $.extend(t.options, e)), t.$wrapper = $(t.options.wrapperElm), t.$wrapper.length && (t.addrUrl = "//s1.mi.com/open/common/js/address_all_new.js?v=7930814", t.addressData = [], t.addrTemp = multiline(function () {/*!@tpl
	          <div class="select-box clearfix" id="J_selectWrapper">
	              <div class="select-first select-item J_select" data-init-txt="选择省份/自治区">选择省份/自治区</div>
	              <div class="select-item J_select hide" data-init-txt="选择城市/地区"></div>
	              <div class="select-item J_select hide" data-init-txt="选择区县"></div>
	              <div class="select-last select-item J_select hide" data-init-txt="选择配送区域"></div>
	          </div>

	          <div class="options-box">
	              <ul class="options-list J_optionsWrapper clearfix">
	                  {{~it :value:index}}
	                      <li class="option J_option"
	                      data-value="{{=value.id}}"
	                      data-txt="{{=value.name}}">{{=value.name}}
	                      </li>
	                  {{~}}
	              </ul>
	              <ul class="options-list J_optionsWrapper clearfix hide"></ul>
	              <ul class="options-list J_optionsWrapper clearfix hide"></ul>
	              <ul class="options-list J_optionsWrapper clearfix hide"></ul>
	          </div>
	        */
                console.log()
            }), t.optionTemp = multiline(function () {/*!@tpl
	          {{~it :value:index}}
	            {{? value.region_id}}
	            <li class="J_option" data-txt="{{=value.region_name}}" data-value="{{=value.region_id}}">
	            {{=value.region_name}}</li>
	            {{?? }}
	            <li class="J_option" data-txt="{{=value.name}}" data-value="{{=value.id}}"
	            data-zipcode="{{=value.zipcode ? value.zipcode : ''}}">{{=value.name}}</li>
	            {{? }}
	          {{~}}
	        */
                console.log()
            }), t.result = {}, t.lastLevel = t.options.maxLevel - 1, t.getAllRegions())
        }, getAllRegions: function () {
            var e = this;
            $.ajax({
                url: e.addrUrl, dataType: "script", cache: !0, timeout: 3e4, error: function () {
                }, success: function () {
                    "undefined" != typeof window.data && (e.addressData = window.data), e.formatRegions()
                }
            })
        }, formatRegions: function () {
            var e = this, t = doT.template(e.addrTemp), a = t(e.addressData);
            e.$wrapper.html(a), e.$optionsWrapper = e.$wrapper.find(e.options.optionsWrapper), e.$selectWrapper = e.$wrapper.find(e.options.selectWrapper), e.selectEvent(), "function" == typeof e.options.afterFormat && e.options.afterFormat()
        }, selectEvent: function () {
            var e = this, t = 0;
            e.$selectWrapper.on("click.seladdr", ".J_select", function () {
                var a = $(this).addClass("active"), i = $(this).attr("data-init-txt");
                a && (t = $(this).index(), e.$selectWrapper.find(".J_select:gt(" + t + ")").addClass("hide").removeClass("active"), e.$optionsWrapper.addClass("hide").eq(t).removeClass("hide"), $(this).html(i).removeClass("active"))
            }), e.$optionsWrapper.on("click.seladdr", ".J_option", function () {
                var a = parseInt($(this).attr("data-value")), i = $(this).attr("data-txt"),
                    o = $(this).attr("data-zipcode") || "", r = t + 1, s = e.$selectWrapper.find(".J_select").eq(r);
                return e.result[t] = {
                    id: a,
                    name: i,
                    zcode: o
                }, e.$selectWrapper.find(".J_select").eq(t).html(i).addClass("active"), t === e.lastLevel ? void("function" == typeof e.options.selectEnd && e.options.selectEnd(e.result)) : (t += 1, r >= e.lastLevel ? e.getLastLevelData() : e.formatNextLevelOption(a, r), void(s.length && s.html(s.attr("data-init-txt")).removeClass("hide")))
            })
        }, getAddressLevelData: function (e) {
            var t = [], a = this;
            return $.each(a.addressData, function (a, i) {
                return i.id === e ? (t = i.child, !1) : void(i.child && $.each(i.child, function (a, i) {
                    return i.id === e ? (t = i.child, !1) : void(i.child && $.each(i.child, function (a, i) {
                        return i.id === e ? (t = i.tags, !1) : void 0
                    }))
                }))
            }), t
        }, formatNextLevelOption: function (e, t) {
            if (e) {
                var a = this, i = a.getAddressLevelData(e, t), o = a.formatOption(i);
                a.$optionsWrapper.addClass("hide").eq(t).html(o).removeClass("hide"), 1 === i.length && setTimeout(function () {
                    a.$optionsWrapper.eq(t).find(".J_option").eq(0).trigger("click")
                }, 50)
            }
        }, getLastLevelData: function () {
            var e = this, t = MI.GLOBAL_CONFIG.orderSite + "/api/getAddressRegion.php";
            e.$optionsWrapper.addClass("hide").eq(e.lastLevel).html('<div class="loading"><div class="loader"></div></div>').removeClass("hide"), $.ajax({
                url: t,
                dataType: "jsonp",
                jsonp: "jsonpcallback",
                data: {parent: e.result[2].id},
                tiemout: 3e4,
                error: function () {
                },
                success: function (t) {
                    if (t && t.data.regions) {
                        var a = [];
                        $.each(t.data.regions, function (e, t) {
                            a.push(t)
                        });
                        var i = e.formatOption(a);
                        e.$optionsWrapper.eq(e.lastLevel).html(i)
                    }
                }
            })
        }, formatOption: function (e) {
            var t = this, a = "";
            return e ? a = doT.template(t.optionTemp)(e) : void 0
        }, getResult: function () {
            return this.result
        }
    }
}]);