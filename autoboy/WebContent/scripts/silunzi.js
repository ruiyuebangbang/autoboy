var silunzi = silunzi || {};
silunzi.util = {};
var lunzi = lunzi || {};
lunzi.string = {};
lunzi.util = {};
var silunziUtil = silunzi.util, lunziUtil = lunzi.util, lunziString = lunzi.string;
silunzi.util.onReturn = function(a, b) {
    if (!a) {
        a = window.event
    }
    if (a && a.keyCode && a.keyCode == 13) {
        b()
    }
};
silunzi.util.rtime = function() {
    return new Date().getTime()
};
silunzi.util.basePath = "/auto/";
silunzi.util.imgPath = "http://localhost:8080/auto/";
silunzi.util.cdnPath = "http://localhost:8080/auto/";
silunzi.util.icon = silunzi.util.cdnPath + "image/pub_icon.png";
silunzi.util.retdata = {};
silunzi.util.retdata.success = true;
silunzi.util.member = {};
silunzi.util.member.login = false;
silunzi.util.member.isMobile = false;
silunzi.util.member.headUrl = "";
silunzi.util.isNumber = function(a) {
    return /^\d+$/.test(a)
};
silunzi.util.isWarp = window.screen.availWidth >= 1280;
lunzi.util.cinemaCityPy = "";
silunzi.util.isNotNull = function(a) {
    return (!(a.match(/^\s*$/)))
};
silunzi.util._isObject = function(a) {
    return a.toString() === "[object Object]"
};
silunzi.util._hasObject = function(a) {
    a = a.toString().indexOf("[object Object]");
    return a >= 0 ? true : false
};
silunzi.util.isMobile = function(a) {
    return (/^(?:13\d|15[0-9]|18[0-9]|14[0-9])-?\d{5}(\d{3}|\*{3})$/.test(a))
};
silunzi.util.isEmail = function(a) {
    return (/^[a-zA-Z0-9._-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)*(\.[a-zA-Z]{2,4})$/.test(a))
};
silunzi.util.replaceStr = function(a) {
    $(a).value = $(a).value.replace(/[^\d]/g, "")
};
silunzi.util.isVideoURL = function(a) {
    var b = "^((https|http|ftp|rtsp|mms)?://)?(([0-9a-z_!~*'().&amp;=+$%-]+: )?[0-9a-z_!~*'().&amp;=+$%-]+@)?(([0-9]{1,3}.){3}[0-9]{1,3}|([0-9a-z_!~*'()-]+.)*(tudou|youku|56|ku6).[a-z]{2,6})(:[0-9]{1,4})?((/?)|(/[0-9a-zA-Z_/!~*'().;?:@&amp;=+$,%#-]+)+/?)$";
    return new RegExp(b).test(a)
};
var _debug = function() {
    if ("\v" == "v") {
        alert(arguments)
    } else {
        try {
            console.info(arguments)
        } catch (a) {
        }
    }
};
silunzi.util.refreshCaptcha = function(c, b) {
    if ($(c + "Img")) {
        $(c + "Img").setStyle("background", "url(" + silunzi.util.cdnPath + "image/loading2.gif) center center no-repeat")
    }
    var a = silunzi.util.basePath + "ajax/captcha.action?captchaId=" + $(c).value + "&r=" + silunzi.util.rtime();
    $(c + "Img").src = a
    
    $(c + "Input").value = "";
    if ($(c + "Input").retrieve("label")) {
        $(c + "Input").retrieve("label").text.innerHTML = "输入验证码"
    }
    $(c + "Input").onfocus = null
};
silunzi.util.openwin = function(a, c) {
    var b = new Element("form", {target: c,action: a,method: "post",styles: {display: "none","z-index": "-1"}}).addEvent("submit", function() {
        b.submit()
    }).inject(document.body);
    b.fireEvent("submit")
};
silunzi.util.getLength = function(c) {
    var b = 0;
    for (var a in c) {
        if (c.hasOwnProperty(a)) {
            b++
        }
    }
    return b
};
silunzi.util.baseValidForm = function(f, c) {
    var b = $(f).getElements("*[mustTxt]");
    var a = true;
    try {
        $each(b, function(e, h) {
            var g = $(e).get("value");
            if (!silunziUtil.isNotNull(g)) {
                if (c == "admin") {
                    alert($(e).get("mustTxt"))
                } else {
                    if (c == "member") {
                        lunziUtil.alert($(e).get("mustTxt"))
                    } else {
                        if ($(e)) {
                            $(e).focus()
                        }
                        if ($(e) && $(e).type != "hidden" && !$(e).match("textarea")) {
                            silunziUtil.showValidateErr(e, $(e).get("mustTxt"))
                        } else {
                            lunziUtil.alert($(e).get("mustTxt"))
                        }
                    }
                }
                a = false;
                throw "break"
            }
        })
    } catch (d) {
        return false
    }
    return a
};
silunzi.util.showValidateErr = function(c, e, a, b) {
    c = $(c);
    if (!c) {
        lunziUtil.alert(e);
        return false
    }
    if (c.retrieve("tips") == null) {
        c.store("tips", true);
        var d = new Element("div", {styles: {position: "absolute",width: "auto",height: "20px",border: "1px solid #ffcccc",background: "#ffeeee",padding: "0px 5px",color: "#333","z-index": "999",overflow: "hidden"}}).inject(document.body);
        new Element("div", {"class": "errmsg",html: e}).inject(d);
        d.position({relativeTo: c,position: "leftBottom",offset: {x: (c.getParent("label.text")) ? -7 : 0,y: (c.getParent("label.text")) ? -2 : 0}});
        (function() {
            d.dispose();
            c.store("tips", null)
        }).delay(2600)
    } else {
        return false
    }
};
silunzi.util.showErrorMsg = function(a, b) {
    if (!$(a)) {
        return
    }
    var c = new Hash(b);
    c.each(function(f, d) {
        var e = $(a).getElement("*[name=" + d + "]");
        if (d && e) {
            silunziUtil.showValidateErr(e, f)
        }
    })
};
silunzi.util.showLoading = function(b) {
    if (!$("loadingPic")) {
        var a = new Element("img", {id: "loadingPic",src: silunziUtil.cdnPath + "css/home/loading.gif",styles: {display: "block",position: "absolute",top: "0px",left: "0px",visibility: "hidden",padding: "4px","z-index": "401"}});
        a.inject(document.body)
    }
    silunzi.util.toCenter("loadingPic", b)
};
silunzi.util.hideLoading = function() {
    if ($("loadingPic")) {
        $("loadingPic").setStyle("visibility", "hidden")
    }
};
silunzi.util.showDialog = function(e, f, b, c) {
    if (!f) {
        f = $(e).getStyle("z-index")
    }
    if (f < 10) {
        f = 200
    }
    var d = $("dialogDisabledZone"), a = $(document.body).getScrollSize();
    if (!d) {
        d = new Element("div", {id: "dialogDisabledZone",styles: {position: "absolute","z-index": f - 1,left: "0px",top: "0px","background-color": "#000"}});
        d.inject($(document.body), "top")
    }
    d.setStyles({width: a.x,height: a.y,display: "",visibility: "visible","z-index": f - 1});
    d.setOpacity(0.3);
    $(e).setStyles({position: "absolute","z-index": f,display: "",top: 0,left: 0,visibility: "visible"}).show();
    silunzi.util.toCenter(e);
    if (b) {
        $(e).pin()
    }
};
silunzi.util.showAlbumDialog = function(d, f, a, b) {
    if (!f) {
        f = $(d).getStyle("z-index")
    }
    if (f < 10) {
        f = 200
    }
    $(document.body).setStyle("overflow", "hidden");
    var c = $("dialogDisabledZone"), e = $(document.body).getSize();
    winSize = $(document.body).getScrollSize();
    if (!c) {
        c = new Element("div", {id: "dialogDisabledZone",styles: {position: "absolute","z-index": f - 1,left: "0px",top: "0px","background-color": "#474747"}});
        c.inject($(document.body), "top")
    }
    c.setStyles({width: winSize.x,height: winSize.y,display: "",visibility: "visible","z-index": f - 1});
    $(d).setStyles({position: "absolute",height: e.y,"z-index": f,display: "",top: 0,left: 0,visibility: "visible"}).show();
    silunzi.util.toCenter(d);
    if (a) {
        $(d).pin()
    }
};
silunzi.util.hideAlbumDialog = function(a) {
    if ($("dialogDisabledZone")) {
        $("dialogDisabledZone").setStyles({visibility: "hidden",top: "0px",height: "0px"})
    }
    if ($(a)) {
        $(a).setStyles({display: "none",visibility: "hidden",top: "0px"})
    }
};
silunzi.util.hideDialog = function(a) {
    if ($("dialogDisabledZone")) {
        $("dialogDisabledZone").setStyles({visibility: "hidden",top: "0px",height: "0px"})
    }
    if ($(a)) {
        $(a).setStyles({display: "none",visibility: "hidden",top: "0px"})
    }
};
silunzi.util.toCenter = function(c, b) {
    var a = $(b) || document.body, d = $(c).getStyle("z-index");
    if (!d || (d < 10)) {
        d = 100
    }
    $(c).setStyles({position: "absolute","z-index": d,visibility: "visible"});
    $(c).position({relativeTo: a,position: "center",edge: "center"})
};
silunzi.util.moveTo = function(d, c, b, a) {
    if (!b) {
        b = 0
    }
    if (!a) {
        a = 0
    }
    var e = $(d).getStyle("z-index");
    if (!e || e < 10) {
        e = 100
    }
    $(d).setStyles({position: "absolute","z-index": e,visibility: "visible"});
    $(d).position({relativeTo: $(c),position: "upperLeft",offset: {x: b,y: a}});
    return this
};
silunzi.util.moveToMouse = function(b, a, c) {
    $(b).setStyles({position: "absolute","z-index": zIndex,visibility: "visible"});
    $(b).position({relativeTo: document.body,position: "upperLeft"})
};
silunzi.util.getValues = function(c, d) {
    if (!$(c)) {
        return null
    }
    var b = $(c).toQueryString().parseQueryString();
    if (!d) {
        return b
    }
    var e = new Hash(b), a = {};
    e.each(function(g, f) {
        if (f) {
            a[f] = (g && g.join) ? g.join(d) : g
        }
    });
    return a
};
silunzi.util.getPostValues = function(b) {
    if (!$(b)) {
        return null
    }
    var a = $(b).toQueryString().parseQueryString();
    return a
};
silunzi.util.setValues = function(a) {
    var b = new Hash(a);
    b.each(function(d, c) {
        if (c && $(c)) {
            if ($(c).getAttribute("type")) {
                $(c).value = d
            } else {
                if ($(c).match("select")) {
                    $(c).getElements("option").each(function(e) {
                        if (e.value == d) {
                            e.selected = true
                        }
                    })
                } else {
                    $(c).innerHTML = d
                }
            }
        }
    })
};
silunzi.util.updateHtml = function(b, a) {
    var c = new Hash(b);
    c.each(function(e, d) {
        if (d && $(d + "_" + a)) {
            $(d + "_" + a).set("html", e)
        }
    })
};
silunzi.util.inArea = function(b, a, d) {
    var c = $(b).getCoordinates();
    return a >= c.left && a <= c.right && d >= c.top && d <= c.bottom
};
silunzi.util.outArea = function(b, a, d) {
    var c = $(b).getCoordinates();
    return a < c.left || a > c.right || d < c.top || d > c.bottom
};
silunzi.util.show = function(a) {
    try {
        a.show()
    } catch (b) {
    }
};
silunzi.util.hide = function(a) {
    try {
        a.hide()
    } catch (b) {
    }
};
silunzi.util.openWindow = function(b, c, d, j, a, h, f) {
    var i = 20, e = 120, g;
    if (window.screen.height) {
        i = (window.screen.height - j) / 2
    }
    if (window.screen.width) {
        e = (window.screen.width - d) / 2
    }
    g = window.open(b, c, "width=" + d + ",height=" + j + ",resizable=" + (a ? "yes" : "no") + ",scrollbars=" + (h ? "yes" : "no") + ",status=" + (f ? "1" : "0") + ",top=" + i + ",left=" + e);
    if (g) {
        g.focus()
    }
    return g
};
silunzi.util.isEmptyObject = function(b) {
    for (var a in b) {
        return false
    }
    return true
};
silunzi.util.sendRequest = function(url, values, callback, vmethod) {
    if (typeof values === "object") {
        if (silunzi.util.isEmptyObject(values)) {
            vmethod = "get"
        }
    }
    var myRequest = new Request({url: url,method: vmethod || "post",onSuccess: function(resText) {
            eval(resText);
            if (callback) {
                callback.run(data)
            }
        },onFailure: function(res) {
            if (callback) {
                var data = {success: false,msg: "网络请求错误！"};
                if (res.status == 403) {
                    data.msg = "无权限！"
                }
                callback.run(data)
            }
        }});
    myRequest.send({data: values})
};
silunzi.util.sendRequest4Json = function(c, a, e, b) {
    if (typeof a === "object") {
        if (silunzi.util.isEmptyObject(a)) {
            b = "get"
        }
    }
    a.callMethod = "ajax";
    var d = new Request.JSON({url: c,method: b || "post",onSuccess: function(f) {
            f.success = f.success || (f.code == "0000");
            f.msg = f.msg || f.error;
            f.retval = f.retval || f.data;
            if (e) {
                e.run(f)
            }
        },onFailure: function(g) {
            if (e) {
                var f = {success: false,msg: "网络请求错误！"};
                if (g.status == 403) {
                    f.msg = "无权限！"
                }
                e.run(f)
            }
        },onError: function(h, f) {
            var g = {success: false,msg: "数据格式错误！"};
            if (e) {
                e.run(g)
            }
        }});
    d.send({data: a})
};
silunzi.util.sendLoad = function(c, b, a, f, d, e) {
    return silunzi.util.sendLoadCore(c, b, a, f, "true", d, e)
};
silunzi.util.sendLoadEasy = function(c, b, a, f, d, e) {
    return silunzi.util.sendLoadCore(c, b, a, f, "false", d, e)
};
silunzi.util.sendLoadCore = function(el, url, values, callback, iseval, ori, method) {
    try {
        var off = url.indexOf("#"), selector = "";
        if (off >= 0) {
            selector = url.slice(off + 1, url.length);
            url = url.slice(0, off)
        }
        var storeValue = $(ori) ? $(ori).retrieve("key") : null;
        var storeJS = $(ori) ? $(ori).retrieve("js") : null;
        iseval = iseval || "true";
        if (storeValue == null) {
            new Request.HTML({headers: {"Cache-Control": "no-cache,no-store","If-Modified-Since": "0"},url: url,method: method || "get",evalScripts: false,async: true,link: "cancel",onSuccess: function(responseTree, responseElements, responseHTML, responseJavaScript) {
                    if (selector && responseElements.length != 0) {
                        var child = new Element("div", {html: responseHTML}).getElement("*[id=" + selector + "]");
                        responseHTML = child.innerHTML
                    }
                    if (responseElements.length == 0) {
                        if (callback) {
                            try {
                                eval(responseHTML)
                            } catch (e) {
                            }
                            if (typeof data == "object") {
                                callback.run({success: false,html: responseHTML,json: data})
                            } else {
                                callback.run({success: true,html: responseHTML})
                            }
                        }
                    } else {
                        if (el && $(el)) {
                            $(el).set("html", responseHTML);
                            if (iseval == "true") {
                                eval(responseJavaScript)
                            }
                            $(ori) ? $(ori).store("key", responseHTML) : null;
                            $(ori) ? $(ori).store("js", responseJavaScript) : null;
                            if (callback) {
                                callback.run({success: true,html: responseHTML})
                            }
                        } else {
                            if (callback) {
                                callback.run(responseHTML)
                            }
                        }
                    }
                },onFailure: function(res) {
                    if (callback) {
                        callback.run({success: false,msg: "网络请求错误！"})
                    }
                }}).send({data: values})
        } else {
            if (el && $(el)) {
                if (storeValue) {
                    $(el).set("html", storeValue)
                }
                if (storeJS) {
                    eval(storeJS)
                }
                if (callback) {
                    callback.run({success: true,html: storeValue})
                }
            } else {
                if (callback) {
                    callback.run(storeValue)
                }
            }
        }
    } catch (e) {
    }
};
silunzi.util.sendLoadXML = function(c, b, a, d) {
    new Request({headers: {"Cache-Control": "no-cache,no-store","If-Modified-Since": "0"},url: b,method: "get",evalScripts: false,onSuccess: function(f, e) {
            if (d) {
                d.run({success: true,html: f,xml: e})
            }
        },onFailure: function(e) {
            if (d) {
                d.run({success: false,msg: "网络请求错误！"})
            }
        }}).send({data: a})
};
silunzi.util.slideIn = function(c) {
    var b = $(c);
    var a = new Fx.Slide(b, {mode: "vertical",transition: "sine:in",duration: 300});
    a.slideIn()
};
silunzi.util.removeAllOptions = function(a) {
    var b = $(a);
    b.getElements("option").dispose()
};
silunzi.util.addOptions = function(a, c, g, d) {
    var f = $(a), b, e;
    c.each(function(h) {
        if (g instanceof Function) {
            b = g.run(h)
        } else {
            b = h[g]
        }
        if (d instanceof Function) {
            e = d.run(h)
        } else {
            e = h[d]
        }
        new Element("option", {value: b,text: e}).inject(f)
    })
};
silunzi.util._escapeHtml = true;
silunzi.util.setEscapeHtml = function(a) {
    silunzi.util._escapeHtml = a
};
silunzi.util._shouldEscapeHtml = function(a) {
    if (a && a.escapeHtml != null) {
        return a.escapeHtml
    }
    return silunzi.util._escapeHtml
};
silunzi.util.escapeHtml = function(a) {
    var c = document.createElement("div");
    var b = document.createTextNode(a);
    c.appendChild(b);
    return c.innerHTML
};
silunzi.util._isHTMLElement = function(a, c) {
    if (a == null || typeof a != "object" || a.nodeName == null) {
        return false
    }
    if (c != null) {
        var b = a.nodeName.toLowerCase();
        if (typeof c == "string") {
            return b == c.toLowerCase()
        }
    }
    return true
};
silunzi.util._isArray = function(a) {
    return (a && a.join) ? true : false
};
silunzi.util.addRows = function(e, d, a, b) {
    e = $(e);
    if (e == null) {
        return
    }
    if (!silunzi.util._isHTMLElement(e, ["table", "tbody", "thead", "tfoot"])) {
        return
    }
    if (!b) {
        b = {}
    }
    if (!b.rowCreator) {
        b.rowCreator = silunzi.util._defaultRowCreator
    }
    if (!b.cellCreator) {
        b.cellCreator = silunzi.util._defaultCellCreator
    }
    var c, f;
    if (silunzi.util._isArray(d)) {
        for (f = 0; f < d.length; f++) {
            b.rowData = d[f];
            b.rowIndex = f;
            b.rowNum = f;
            b.data = null;
            b.cellNum = -1;
            c = silunzi.util._addRowInner(a, b);
            if (c != null) {
                e.appendChild(c)
            }
        }
    } else {
        if (typeof d == "object") {
            f = 0;
            for (var g in d) {
                b.rowData = d[g];
                b.rowIndex = g;
                b.rowNum = f;
                b.data = null;
                b.cellNum = -1;
                c = silunzi.util._addRowInner(a, b);
                if (c != null) {
                    e.appendChild(c)
                }
                f++
            }
        }
    }
};
silunzi.util._addRowInner = function(a, b) {
    var d = b.rowCreator(b);
    if (d == null) {
        return null
    }
    for (var e = 0; e < a.length; e++) {
        var c = a[e];
        if (typeof c == "function") {
            b.data = c(b.rowData, b)
        } else {
            b.data = c || ""
        }
        b.cellNum = e;
        var f = b.cellCreator(b);
        if (f != null) {
            if (b.data != null) {
                if (silunzi.util._isHTMLElement(b.data)) {
                    f.appendChild(b.data)
                } else {
                    if (silunzi.util._shouldEscapeHtml(b) && typeof (b.data) == "string") {
                        f.innerHTML = silunzi.util.escapeHtml(b.data)
                    } else {
                        f.innerHTML = b.data
                    }
                }
            }
            d.appendChild(f)
        }
    }
    return d
};
silunzi.util._defaultRowCreator = function(a) {
    return document.createElement("tr")
};
silunzi.util._defaultCellCreator = function(a) {
    return document.createElement("td")
};
silunzi.util.removeAllRows = function(c, a) {
    c = $(c);
    if (c == null) {
        return
    }
    if (!a) {
        a = {}
    }
    if (!a.filter) {
        a.filter = function() {
            return true
        }
    }
    if (!silunzi.util._isHTMLElement(c, ["table", "tbody", "thead", "tfoot"])) {
        return
    }
    var d = c.firstChild;
    var b;
    while (d != null) {
        b = d.nextSibling;
        if (a.filter(d)) {
            c.removeChild(d)
        }
        d = b
    }
};
function selectAll(a) {
    $(a).getElements("option").each(function(b) {
        b.selected = true
    })
}
var PanelGroup = new Class({tabList: [],initialize: function(c, g, d, i, e, b) {
        this.activeClass = d || "active";
        this.hideClass = i || "none";
        this.eventName = e || "click";
        this.current = g || "";
        var j = this.activeClass, f = this.hideClass, h = this.eventName, a = this;
        if (g && $(g)) {
            $(g).addClass(this.activeClass);
            $(g + "_content").removeClass(f)
        }
        this.tableList = c;
        c.each(function(l, k) {
            if ($(l)) {
                $(l).addEvent(h, function() {
                    if ($(a.current)) {
                        $(a.current).removeClass(j);
                        $(a.current + "_content").addClass(f)
                    }
                    a.current = l;
                    $(l).addClass(j);
                    $(l + "_content").removeClass(f);
                    if (b && $defined(b) && typeof b == "function") {
                        b.call(this, this)
                    }
                })
            }
        })
    }});
var ClassGroup = new Class({initialize: function(a, f, e, d) {
        this.current = f || "";
        this.activeClass = e || "active";
        this.hideClass = d || "none";
        this.tableList = a;
        var c = this.activeClass, b = this;
        if (f) {
            $(f).addClass(c)
        }
        a.each(function(g) {
            if ($(g)) {
                $(g).addEvent("click", function() {
                    if ($(b.current)) {
                        $(b.current).removeClass(c)
                    }
                    b.current = g;
                    $(g).addClass(c)
                })
            }
        })
    }});
function resizePicture(b, g, e, f, d) {
    var a = 0, c = 0, i = f || "/userfiles/", h = "";
    b.each(function(j) {
        Asset.image(j.get("src"), {styles: {opacity: 0,position: "absolute",left: 0,top: 0},onLoad: function() {
                var k = this.getSize();
                if (k.x >= g) {
                    if (k.x >= g || e) {
                        if (j.getParent().tagName != "A") {
                            j.inject(new Element("a", {href: j.src.replace(d + "/", ""),rel: "lightbox[galerie]",target: "_blank"}).inject(j, "before"))
                        }
                    }
                    if (k.x >= g && !d) {
                        a = k.y * g / k.x;
                        c = g;
                        j.set("width", c);
                        j.set("height", a);
                        j.setStyles({width: c + "px",height: a + "px"})
                    }
                    slidePicture()
                }
                this.dispose()
            }}).inject(document.body)
    })
}
function slidePicture() {
    var a = $$("a").filter(function(b) {
        return b.rel && b.rel.test(/^lightbox/i)
    });
    $$(a).slimbox({}, null, function(b) {
        return (this == b) || ((this.rel.length > 8) && (this.rel == b.rel))
    })
}
function copyToClipboard(a) {
    var b = $(a);
    if (Browser.Engine.trident) {
        b.select();
        therange = b.createTextRange();
        therange.execCommand("Copy");
        lunziUtil.alert("复制成功。现在您可以粘贴（Ctrl+v）到Blog 或BBS中了。");
        return
    } else {
        lunziUtil.alert("您使用的浏览器不支持此复制功能，请使用Ctrl+C或鼠标右键。");
        b.select()
    }
}
function stopPropagation(a) {
    a.stopPropagation()
}
function getFCKHtml(a) {
    var b = FCKeditorAPI.GetInstance(a);
    return b.GetXHTML()
}
function getFCKText(a, b) {
    var c = FCKeditorAPI.GetInstance(a), d = $(c.EditorDocument.body).get("text");
    if (b && d.length > b) {
        return d.substring(0, b)
    }
    return d
}
function setFCKHtml(a, c) {
    var b = FCKeditorAPI.GetInstance(a);
    return b.SetHTML(c)
}
function getAndClearFCKElement(a) {
    var c = FCKeditorAPI.GetInstance(a);
    var b = new Element("div", {html: c.GetXHTML()});
    ["script", "link", "style"].each(function(d) {
        b.getElements(d).dispose()
    });
    _process(b);
    c.SetHTML(b.innerHTML);
    return b.innerHTML
}
function _process(a) {
    a.erase("class");
    a.getChildren().each(function(b) {
        _process(b)
    })
}
function insertFCKHtml(a, c) {
    var b = FCKeditorAPI.GetInstance(a);
    return b.InsertHtml(c)
}
function refreshPage() {
    var c = "" + document.location.href, a = c.indexOf("refresh"), d = c.indexOf("#"), b = "";
    if (d > 0) {
        b = c.substring(d);
        c = c.substring(0, d)
    }
    if (a > 0) {
        c = c.substring(0, a - 1)
    } else {
        a = c.indexOf("?");
        if (a > 0) {
            c = c + "&refresh=1"
        } else {
            c = c + "?refresh=1"
        }
    }
    c += b;
    document.location.href = c
}
var runtopAndBottom = new Class({initialize: function(a, b) {
        this.isPause = false;
        this.maxScroll = $(a).getScrollSize().y - $(a).getSize().y;
        var d = this, c = function() {
            if (!d.isPause) {
                d.fx.start(0, $(a).getScroll().y + b)
            }
        };
        this.fx = new Fx.Scroll(a, {duration: 500,transition: Fx.Transitions.Sine.easeOut,onComplete: function() {
                if ($(a).getScroll().y == d.maxScroll) {
                    this.set(0, 0)
                }
            }});
        $(a).addEvents({mouseover: function() {
                d.isPause = true
            },mouseout: function() {
                d.isPause = false
            }});
        c.periodical(3000)
    }});
function checkLogin(c, a, b) {
    if (!b) {
        b = function() {
        }
    }
    if (silunzi.util.member.login) {
        a()
    } else {
        silunzi.util.sendRequest(silunziUtil.basePath + "ajax/common/checkLogon.xhtml", {}, function(d) {
            if (d.success) {
                silunzi.util.member.login = true;
                silunzi.util.member.memberid = d.id;
                silunzi.util.member.nickname = d.nickname;
                silunzi.util.member.isMobile = d.isMobile;
                silunzi.util.member.headUrl = d.headUrl;
                a()
            } else {
                showLogin(a, b)
            }
        })
    }
}
function gotoPosition(a) {
    if ($(a)) {
        $(window).scrollTo(0, $(a).getPosition().y)
    }
}
function gotoURL(a, b) {
    if (b) {
        document.location.target = b
    }
    document.location.href = a
}
var DefaultValue = new Class({initialize: function(b, a) {
        if ($(b).value.trim() == "") {
            $(b).value = a
        }
        $(b).addEvents({blur: function() {
                if (this.value.trim() == "") {
                    this.value = a
                }
            },focus: function() {
                if (this.value.trim() == a) {
                    this.value = ""
                }
            }})
    }});
function addMemberTreasure(memberid, tag, obj) {
    checkLogin(true, function() {
        var url = silunziUtil.basePath + "wala/addMicroAttention.xhtml";
        new Request({url: url,method: "post",onSuccess: function(resText) {
                eval(resText);
                if (data.success) {
                    if (tag == "micro") {
                        if ($chk(obj) && $chk(obj.getParent("span"))) {
                            obj.getParent("span").set("text", "已关注").addClass("gray")
                        } else {
                            refreshPage()
                        }
                    } else {
                        lunziUtil.alert(data.retval)
                    }
                } else {
                    lunziUtil.alert(data.msg)
                }
            }}).send({data: {memberid: memberid}})
    })
}
function microChange(c) {
    var a = 140;
    if ($chk($(c).value)) {
        a = 140 - $(c).value.length
    }
    if (a < 0) {
        var b = Math.abs(a);
        $("microText").set("styles", {color: "#C03B0C"});
        $("microText").set("html", '已超出<b style="font-size:13px;font-family: Constantia,Georgia" id="font">' + b + "</b>个汉字")
    } else {
        $("microText").set("styles", {color: "black"}).set("html", '你还可以输入<b style="font-size:13px;font-family: Constantia,Georgia" id="font">' + a + "</b>个字")
    }
}
function isCommuBlack(c, d) {
    var b = silunziUtil.basePath + "home/commu/isCommuBlack.xhtml";
    var a = {commuid: c};
    return silunziUtil.sendRequest(b, a, function(e) {
        if (e.success) {
            if (d) {
                window.document.location = d
            }
        } else {
            lunziUtil.alert(e.msg)
        }
    })
}
function addFans(e, d, a) {
    var c = silunziUtil.basePath + "ajax/common/tobeFans.xhtml";
    var b = {relatedid: d,tag: a};
    silunziUtil.sendRequest(c, b, function(f) {
        if (f.success) {
            lunziUtil.alert("已添加成功!")
        } else {
            lunziUtil.alert(f.msg)
        }
    });
    $(e).removeEvent("click", addFans)
}
function removeFriendRelate(c) {
    if (confirm("解除好友关系从好友列表中删除，确认删除吗？")) {
        var b = silunziUtil.basePath + "wala/removeFriend.xhtml";
        var a = {memberid: c};
        silunziUtil.sendRequest(b, a, function(d) {
            if (d.success) {
                refreshPage()
            } else {
                lunziUtil.alert(d.msg)
            }
        })
    }
}
silunzi.util.successAlert = function(a) {
    $(a).addClass("OkMsg");
    $(a).innerHTML = "设置成功！";
    (function() {
        $(this).removeClass("OkMsg");
        $(this).innerHTML = ""
    }.bind(a)).delay(3000)
};
var tableDialog = new Class({Implements: [Options, Events],options: {},initialize: function(c) {
        this.setOptions(c);
        this.options.table = new Element("table", {cellspacing: "0",cellpadding: "0",border: "0",width: "100%"});
        var b = new Element("tbody").inject(this.options.table);
        var d = new Element("tr").inject(b);
        new Element("td").addClass("dialog_tl").inject(d);
        new Element("td").addClass("dialog_c").inject(d);
        new Element("td").addClass("dialog_tr").inject(d);
        var e = new Element("tr").inject(b);
        new Element("td").addClass("dialog_c").inject(e);
        this.options.content = new Element("td").inject(e);
        new Element("td").addClass("dialog_c").inject(e);
        var a = new Element("tr").inject(b);
        new Element("td").addClass("dialog_bl").inject(a);
        new Element("td").addClass("dialog_c").inject(a);
        new Element("td").addClass("dialog_br").inject(a)
    }});
silunzi.util.mask = function(b, a) {
    lunzi.util.mask({element: b,mid: a || "mskid_defined_",title: "正在提交，请稍等..."})
};
silunzi.util.unmask = function() {
    lunzi.util.clearMask(arguments[0])
};
lunzi.util.maskContent = function(d, h, i, b, c, l, n, f, g, k, a, m) {
    var e = (i ? i.length * 20 + 100 : ""), j = h ? h.length * 12 > 360 ? 360 : h.length * 12 + 20 : 40, j = e ? e > j ? e : j : e;
    lunzi.util.core({bgel: $chk(d) ? $(d) : document.body,content: h,title: i || "",width: b || j,def: c || "",callback: l || $empty,bgcolor: n || "#fff",dialogBgcolor: f || "#aaa",isEsc: g || false,cancelCallback: k || $empty,initCallback: a || $empty,isPin: m || false})
};
lunzi.util.issure = function(d, g, h, b, c, j, e, k, a) {
    var f = (h ? h.length * 20 + 100 : ""), i = g ? g.length * 12 > 360 ? 360 : g.length * 12 + 40 : 40, i = f ? f > i ? f : i : f;
    lunzi.util.core({bgel: $chk(d) ? $(d) : document.body,content: g,title: h || "",width: b || i,def: c || "",callback: j || $empty,issure: true,cancelCallback: k || $empty,initCallback: a || $empty,sureBt: e || "确定"})
};
lunzi.util.confirm = function(e, f, d, c, b) {
    var a = e.length * 16 < 320 ? 320 : e.length * 16 + 60;
    a = a > 360 ? 360 : a;
    return lunzi.util.core({bgel: $chk(d) ? $(d) : document.body,content: e,title: "养车客提示",width: c || a,issure: true,callback: f,zIndex: 600,isConfirm: true,opacity: 0.4,def: "confirm",sureBt: b || "确定"})
};
lunzi.util.alert = function(d, f, c, b, e) {
    var a = d ? d.length * 16 < 320 ? d.length * 16 > 360 ? 360 : 320 : d.length * 16 + 60 : 320;
    return lunzi.util.core({bgel: $chk(c) ? $(c) : document.body,content: d,title: e || "养车客提示",width: b || a,issure: true,callback: f || $empty,zIndex: 601,isAlert: true,opacity: 0.4,def: "alert"})
};
lunzi.util.tips = function() {
    var a = arguments[1] ? arguments[1].length * 12 > 360 ? 360 : arguments[1].length * 12 + 40 : 60;
    lunzi.util.core({bgel: $chk($(arguments[0])) ? $(arguments[0]) : document.body,content: arguments[1],isFlag: false,width: arguments[2] || a,def: arguments[3] ? arguments[3] : "tips",point: arguments[4] || "down",callback: arguments[5] || $empty(),zindex: arguments[6] ? arguments[4] : 300,ishide: arguments[7] || 1,isEsc: arguments[8] || false,size: arguments[9] || 15})
};
lunzi.util.popo = function(e, d, c, a, b, g) {
    d = $(d) ? $(d).getElement(".none").get("html") : d;
    var f = function(h, i) {
        if (b && typeof b == "function") {
            b(h, i, a, g)
        } else {
            lunzi.util.tips(h, d, c, i, a, g)
        }
    };
    e.each(function(h) {
        h.addEvents({mouseenter: function() {
                this.store("isher", true);
                (function() {
                    if (this.retrieve("isher") != null) {
                        var i = e.indexOf(this);
                        if (lunzi.util.container["tips_" + i]) {
                            lunzi.util.container["tips_" + i].isAttach = true
                        } else {
                            f(this, "tips_" + i)
                        }
                    }
                }).delay(200, this)
            },mouseleave: function() {
                var i = e.indexOf(this);
                this.store("isher", null);
                if (lunzi.util.container["tips_" + i]) {
                    lunzi.util.container["tips_" + i].isAttach = false;
                    lunzi.util.container["tips_" + i].disposeTips.delay(120, ["tips_" + i])
                }
            }})
    })
};
lunzi.util.container = new Hash();
lunzi.util.core = function(i) {
    var e = i.def || "default";
    var j = i.recreate || true;
    if (lunzi.util.container[e] && $defined(lunzi.util.container[e]) && lunzi.util.container[e].coreDialog) {
        lunzi.util.container[e].show(e);
        return false
    }
    var d = {};
    lunzi.util.container[e] = d;
    d.options = $extend({def: "default",content: "",bgel: document.body,isFlag: true,ishide: true,border: 1,width: 360,title: "",bgcolor: "#fff",zIndex: 300,issrue: false,callback: $empty,cancelCallback: $empty,initCallback: $empty,sureBt: "确定",cancelBt: "取消",isConfirm: false,isAlert: false,point: "up",opacity: 0.4,tipsBorderColor: "#999",tipsBgColor: "#fff",tipsPtImg: "css/home/opt.png",ietipsPtImg: "css/home/opt.gif?v=000",allowmax: 960,dialogBgcolor: "#aaa",isEsc: false,isPin: false}, i || {});
    d.coreDialog = {};
    d.options.bgel = $(d.options.bgel);
    if (d.options.bgel && d.options.bgel.match("body")) {
        d.p = d.options.bgel.getScrollSize()
    } else {
        d.p = d.options.bgel.getDimensions()
    }
    d.pos = d.options.bgel.getPosition();
    d.coreDialog = new Element("div", {styles: {width: "auto",display: "inline-block",height: "auto",opacity: 0,position: "absolute",top: 0,"z-index": d.options.zIndex + 1}}).inject(document.body);
    d.coreDialog.set("id", "self" + d.options.def);
    d.isAttach = true;
    d.coreTable = new Element("table", {cellspacing: "0",cellpadding: "0",border: "0",width: "100%"}).addClass("tableLayer").inject(d.coreDialog);
    d.coreTbody = new Element("tbody").inject(d.coreTable);
    d.coreTR = new Element("tr").inject(d.coreTbody);
    new Element("td").addClass("t_l").inject(d.coreTR);
    new Element("td").addClass("t_c").inject(d.coreTR);
    new Element("td").addClass("t_r").inject(d.coreTR);
    d.coreTR = new Element("tr").inject(d.coreTbody);
    new Element("td").addClass("m_l").inject(d.coreTR);
    d.coreTD = new Element("td", {styles: {padding: 1,background: d.options.dialogBgcolor}}).addClass("m_c").inject(d.coreTR);
    new Element("td").addClass("m_r").inject(d.coreTR);
    d.coreTR = new Element("tr").inject(d.coreTbody);
    new Element("td").addClass("b_l").inject(d.coreTR);
    new Element("td").addClass("b_c").inject(d.coreTR);
    new Element("td").addClass("b_r").inject(d.coreTR);
    if (d.options.isFlag) {
        if (d.options.isEsc) {
            if ($("dailogCoreDisable")) {
                $("dailogCoreDisable").setStyles({width: d.p.x + "px",height: d.p.y + "px",top: d.pos.y + "px",left: d.pos.x + "px","background-color": d.options.dialogBgcolor,"z-index": d.options.zIndex}).show()
            } else {
                new Element("div", {id: "dailogCoreDisable",styles: {position: "absolute",width: d.p.x + "px",height: d.p.y + "px",top: d.pos.y + "px",left: d.pos.x + "px","z-indent": "9",opacity: d.options.opacity,"background-color": d.options.dialogBgcolor,"z-index": d.options.zIndex}}).inject(document.body)
            }
        } else {
            oldStyle = {styles: {position: "absolute",width: d.p.x + "px",height: d.p.y + "px",top: d.pos.y + "px",left: d.pos.x + "px","z-indent": "9",opacity: d.options.opacity,"background-color": d.options.dialogBgcolor,"z-index": d.options.zIndex}};
            newStyle = {styles: {position: "fixed",width: "100%",height: "100%",top: 0,left: 0,"z-indent": "9",opacity: d.options.opacity,"background-color": d.options.dialogBgcolor,"z-index": d.options.zIndex,"overflow-y": "scroll"}};
            d.coreDisable = new Element("div", oldStyle).inject(document.body);
            d.coreDisable.set("id", "parent" + d.options.def)
        }
    } else {
        d.tapImg = silunzi.util.basePath + d.options.tipsPtImg;
        d.ietipsPtImg = silunzi.util.basePath + d.options.ietipsPtImg;
        d.los = new Element("div", {styles: {height: (d.options.point == "up" || d.options.point == "down") ? "15px" : "33px",width: (d.options.point == "up" || d.options.point == "down") ? "33px" : "15px",overflow: "hidden",position: "absolute",background: "url(" + (!Browser.ie6 ? d.tapImg : d.ietipsPtImg) + ") no-repeat"}}).inject(d.coreDialog);
        if (d.options.ishide && d.options.ishide == 1) {
            d.coreDialog.addEvents({mouseenter: function() {
                    d.isAttach = true;
                    if (d.options.callback) {
                        d.options.callback()
                    }
                },mouseleave: function() {
                    d.isAttach = false;
                    if (d.options.callback) {
                        d.options.callback()
                    }
                    d.disposeTips.delay(120, [e])
                }})
        } else {
            if (d.options.callback) {
                d.options.callback()
            }
        }
    }
    if (d.options.title) {
        new Element("h2", {text: d.options.title ? d.options.title : "养车客生活网提示",styles: {height: "42px","line-height": "42px","text-indent": "10px","font-size": "13px","font-weight": "bold",background: "#f0f0f0",width: "100%",display: "block",color: "#333"}}).inject(d.options.isFlag ? d.coreTD : d.coreDialog);
        if (!d.options.isConfirm && !d.options.isAlert) {
            new Element("span", {styles: {position: "absolute",top: "14px",right: "16px",cursor: "pointer",display: "block",height: "23px",width: "23px",background: "url(" + silunzi.util.icon + ") 0 -142px no-repeat"}}).addEvents({click: function() {
                    d.options.cancelCallback.call();
                    d.dispose(e)
                },mouseenter: function() {
                    this.setStyle("background-position", "-23px -142px")
                },mouseleave: function() {
                    this.setStyle("background-position", "0 -142px")
                }}).inject(d.options.isFlag ? d.coreTD : d.coreDialog)
        }
    }
    d.content = new Element("div", {styles: {padding: d.options.isEsc ? "" : "10px",width: "auto","line-height": "22px",color: "#666","font-size": "12px","font-weight": "normal","background-color": d.options.isFlag ? d.options.bgcolor : d.options.tipsBgColor,height: "auto",overflow: "hidden"}}).inject(d.coreTD);
    if ($(d.options.content)) {
        $(d.options.content).show().setStyle("opacity", 1).inject(d.content)
    } else {
        d.content.innerHTML = d.options.content ? d.options.content : "哦，出错了..."
    }
    d.show = function() {
        var k = arguments[0] ? arguments[0] : "default";
        if (lunzi.util.container[k]) {
            lunzi.util.show(lunzi.util.container[k].coreDialog, function() {
                if (lunzi.util.container[k].coreDisable) {
                    lunzi.util.container[k].coreDisable.show()
                }
            })
        }
    };
    d.getPositionSettings = function(k) {
        var l = d.options.isFlag ? 0 : d.options.size || 15;
        var m = d.options.isFlag ? "center" : d.options.point;
        switch (m) {
            case "left":
            case 8:
            case 9:
            case 10:
                return {edge: {x: "left",y: "top"},position: {x: "right",y: "top"},offset: {x: l,y: -l}};
            case "right":
            case 2:
            case 3:
            case 4:
                return {edge: {x: "right",y: "top"},position: {x: "left",y: "top"},offset: {x: -l,y: -l}};
            case "up":
            case 11:
            case 12:
            case 1:
                return {edge: {x: k ? k : "left",y: "bottom"},position: {x: k ? k : "left",y: "top"},offset: {y: -l,x: (!k) ? (-l) : l + 10}};
            case "down":
            case 5:
            case 6:
            case 7:
                return {edge: {x: k ? k : "left",y: "top"},position: {x: k ? k : "left",y: "bottom"},offset: {y: l,x: (!k) ? (-l - 5) : l + 10}};
            case "center":
                return {edge: {x: "center",y: "center"},position: {x: "center",y: "center"},offset: {y: 0,x: 0}}
        }
    };
    d.hide = function() {
        var k = arguments[0] ? arguments[0] : "default";
        if (!lunzi.util.container[k]) {
            return
        }
        if (lunzi.util.container[k]) {
            d.morph(lunzi.util.container[k], function() {
                if (lunzi.util.container[k]) {
                    lunzi.util.container[k].coreDisable.hide()
                }
            })
        }
    };
    d.dispose = function() {
        var k = arguments[0] ? arguments[0] : "default", l = arguments[1];
        if (!lunzi.util.container[k]) {
            return
        }
        if (lunzi.util.container[k]) {
            d.morph(lunzi.util.container[k], function() {
                if (lunzi.util.container[k] && $(lunzi.util.container[k].options.content)) {
                    if (l) {
                        $(lunzi.util.container[k].options.content).dispose()
                    } else {
                        $(lunzi.util.container[k].options.content).hide().inject(document.body)
                    }
                }
                if (lunzi.util.container[k] && lunzi.util.container[k].coreDialog) {
                    lunzi.util.container[k].coreDialog.dispose()
                }
                if ($("dailogCoreDisable") && lunzi.util.container[k].options.isEsc) {
                    $("dailogCoreDisable").hide()
                } else {
                    if (lunzi.util.container[k] && lunzi.util.container[k].coreDisable) {
                        lunzi.util.container[k].coreDisable.dispose()
                    }
                }
                lunzi.util.container.erase(k)
            })
        }
    };
    d.morph = function(n, l) {
        if (!n) {
            return
        }
        if (n.coreDialog) {
            var q = n.coreDialog.getPosition(), o = window.getScroll(), p = n.coreDialog.getDimensions();
            var k = n.coreFloor.retrieve("key");
            if (k) {
                if (!n.options.bgel.match("body")) {
                    q.x = q.x == 0 ? k.l : q.x + o.x;
                    q.y = q.y == 0 ? k.t : q.y + o.y
                }
                if (!d.options.isFlag) {
                    var m = d.options.bgel.retrieve("vp")
                }
                n.coreDialog.setStyle("overflow", "hidden");
                n.coreDialog.set("morph", {duration: d.options.isFlag ? 260 : 200,transition: Fx.Transitions.linear,link: "cancel",onComplete: function() {
                        if (l && typeof l == "function") {
                            l()
                        }
                    }}).morph({opacity: [1, 0],width: [p.width, 0],height: [p.height, 0],top: [d.options.isFlag ? q.y : m.top - d.coreDialog.h / 2, (!d.options.isFlag) ? m.top : p.height / 2 + q.y],left: [d.options.isFlag ? q.x : m.left - d.coreDialog.w / 2, (!d.options.isFlag) ? m.left : p.width / 2 + q.x],"font-size": [12, 4]});
                if (n.coreDialog.getElement("table")) {
                    n.coreDialog.getElement("table").set("morph", {duration: 300,transition: Fx.Transitions.linear,link: "cancel"}).morph({"margin-left": [0, -p.width / 5],"margin-top": [0, -p.height / 5],width: [p.width, p.width / 5],height: [p.height, p.height / 5],"font-size": [12, 4]})
                }
            } else {
                l()
            }
        }
    };
    d.disposeTips = function() {
        if (lunzi.util.container[this] && !lunzi.util.container[this].isAttach) {
            d.dispose(this, true)
        }
    };
    d.sanim = function() {
        var m = arguments[0], l = arguments[1];
        d.options.counter = {count: l};
        var k = (function() {
            if (this.count == 0) {
                if (d.options.callback) {
                    d.options.callback()
                }
                d.dispose(e);
                clearInterval(k)
            }
            m.setStyle("width", "80px");
            m.value = d.options.sureBt + "(" + this.count + ")";
            this.count--
        }).periodical(1000, d.options.counter)
    };
    if (d.options.issure) {
        d.buttonBox = new Element("div", {styles: {width: "94%",height: "100%",overflow: "hidden"}}).inject(new Element("div", {styles: {height: "32px",padding: "0 0 15px 0",width: "100%",background: "#fff",overflow: "hidden"}}).inject(d.options.isFlag ? d.coreTD : d.coreDialog));
        if (!d.options.isAlert) {
            new Element("input", {type: "button",value: d.options.cancelBt}).addEvents({click: function() {
                    d.options.cancelCallback.call();
                    d.dispose(e)
                }}).inject(new Element("label", {styles: {"float": "right",margin: "0 0 0 15px"}}).addClass("bigWhiteBt bigBt button").addEvents({mouseenter: function() {
                    this.addClass("bg_hover")
                },mouseleave: function() {
                    this.removeClass("bg_hover")
                }}).inject(d.buttonBox))
        }
        d.cancel = new Element("input", {type: "button",value: d.options.sureBt}).addEvents({click: function() {
                if (d.options.isConfirm && d.options.callback) {
                    d.options.callback();
                    d.dispose(e)
                } else {
                    if (d.options.counter) {
                        d.options.counter.count = 0
                    } else {
                        if (d.options.callback) {
                            d.options.callback()
                        }
                    }
                }
            }}).inject(new Element("label", {styles: {"float": "right"}}).addClass("button redBt bigBt").addEvents({mouseenter: function() {
                this.addClass("bg_hover")
            },mouseleave: function() {
                this.removeClass("bg_hover")
            }}).inject(d.buttonBox));
        if (d.options.isAlert || d.options.isConfirm) {
            d.content.setStyles({padding: "20px 20px 20px 60px","background-image": "url(" + silunzi.util.icon + ")","background-repeat": "no-repeat","font-size": "13px","background-position": d.options.isAlert ? "6px -742px" : "6px -447px"})
        }
        if (d.options.isAlert) {
            d.sanim(d.cancel, 4)
        }
    }
    d.coreDialog.w = d.options.width ? d.options.width : d.coreDialog.clientWidth > 360 ? 360 : d.coreDialog.clientWidth;
    d.coreDialog.h = d.coreDialog.offsetHeight;
    var a = "";
    if (!d.options.isFlag) {
        a = d.options.tipsBgColor
    } else {
        if (d.options.isAlert || d.options.isConfirm) {
            a = "#fff"
        } else {
            a = d.options.bgcolor
        }
    }
    var b = "";
    if (d.options.point == "up" || d.options.point == "down") {
        var h = d.options.bgel.getPosition(), f = d.options.bgel.getDimensions(), g = (window.getSize().x - d.options.allowmax) / 2;
        if ((h.x + f.width + d.coreDialog.w) > (g + d.options.allowmax)) {
            b = "right"
        }
    }
    d.coreFloor = new Element("div", {styles: {border: "1px solid #dcdcdc",width: 1,height: 1,position: "absolute",overflow: "hidden","background-image": (!d.options.isAlert || !d.options.isConfirm) ? "" : "url(" + silunzi.util.cdnPath + "css/images/loading.gif)","background-position": "center center","background-repeat": "no-repeat","background-color": a,"z-index": d.options.zIndex}}).inject(document.body).position($extend({relativeTo: d.options.bgel}, d.getPositionSettings(b)));
    d.coreDialog.l = d.coreFloor.getPosition().x;
    d.coreDialog.t = d.coreFloor.getPosition().y;
    if (d.coreFloor.retrieve("key") == null) {
        d.coreFloor.store("key", {x: d.coreDialog.w,y: d.coreDialog.h,t: d.coreDialog.t,l: d.coreDialog.l})
    }
    d.coreDialog.setStyle("width", d.coreDialog.w);
    d.coreFloor.set("morph", {duration: d.options.isFlag ? 260 : 200,transition: Fx.Transitions.linear,link: "cancel",onComplete: function() {
            try {
                d.coreDialog.setStyles({opacity: 1});
                d.coreDialog.position($extend({relativeTo: d.options.bgel}, d.getPositionSettings(b)));
                if (d.options.bgel == document.body && !d.options.isPin && !navigator.userAgent.match(/Windows NT 6.1/i) && !navigator.userAgent.match(/rv:11/i)) {
                    d.coreDialog.pin()
                }
                d.coreFloor.dispose();
                if (navigator.userAgent.match(/Windows NT 6.1/i) && navigator.userAgent.match(/rv:11/i)) {
                    (function() {
                        d.coreDialog.setStyles({top: d.coreDialog.t - d.coreDialog.h / 2,left: d.coreDialog.l - d.coreDialog.w / 2})
                    }).delay(10)
                }
                if (d.options.isFlag && (d.options.isEsc || d.options.isAlert || d.options.isConfirm)) {
                    document.addEvent("keypress", function(l) {
                        if (l.key == "esc") {
                            d.dispose(e, true)
                        }
                        if (l.key == "enter") {
                            if (d.options.isConfirm && d.options.callback) {
                                d.options.callback();
                                d.dispose(e)
                            } else {
                                if (d.options.counter) {
                                    d.options.counter.count = 0
                                } else {
                                    if (d.options.callback) {
                                        d.options.callback()
                                    }
                                }
                            }
                        }
                        document.removeEvent("keypress", arguments.callee)
                    })
                }
                d.options.initCallback.call()
            } catch (k) {
            }
        }});
    if (d.options.isFlag) {
        d.coreFloor.morph({opacity: [0, 1],width: [0, d.options.width ? d.options.width : d.coreDialog.clientWidth > 360 ? 360 : d.coreDialog.clientWidth],height: [0, d.coreDialog.offsetHeight],left: [d.coreDialog.l, d.coreDialog.l - d.coreDialog.w / 2],top: [d.coreDialog.t, d.coreDialog.t - d.coreDialog.h / 2]})
    } else {
        var c = {};
        c.chlid = d.options.bgel.getDimensions();
        if (d.options.point == "left") {
            c.left = d.coreDialog.l + d.coreDialog.w / 2 + 10;
            c.top = d.coreDialog.t + d.coreDialog.h / 2;
            d.los.setStyles({left: "-9px",top: "12px","background-position": "0 -11px"})
        } else {
            if (d.options.point == "right") {
                c.left = d.coreDialog.l - d.coreDialog.w / 2 - 10;
                c.top = d.coreDialog.t + d.coreDialog.h / 2;
                d.los.setStyles({right: "-9px",top: "12px","background-position": "-33px -11px"})
            } else {
                if (d.options.point == "up") {
                    if (b == "") {
                        d.los.setStyles({bottom: "-9px",left: "20px","background-position": "-9px -32px"});
                        c.left = d.coreDialog.l + d.coreDialog.w / 2
                    } else {
                        d.los.setStyles({bottom: "-9px",right: "20px","background-position": "-9px -32px"});
                        c.left = d.coreDialog.l - d.coreDialog.w / 2
                    }
                    c.top = d.coreDialog.t - d.coreDialog.h / 2 + f.y / 2
                } else {
                    if (b == "") {
                        d.los.setStyles({top: "-9px",left: "20px","background-position": "-13px 0"});
                        c.left = d.coreDialog.l + d.coreDialog.w / 2
                    } else {
                        d.los.setStyles({top: "-9px",right: "10px","background-position": "-13px 0"});
                        c.left = d.coreDialog.l - d.coreDialog.w / 2
                    }
                    c.top = d.coreDialog.t + d.coreDialog.h / 2 + 10
                }
            }
        }
        d.options.bgel.store("vp", c);
        d.coreFloor.morph({width: [0, d.options.width ? d.options.width : d.coreDialog.clientWidth > 360 ? 360 : d.coreDialog.clientWidth],height: [0, d.coreDialog.offsetHeight],left: [c.left, c.left - d.coreDialog.w / 2],top: [c.top, c.top - d.coreDialog.h / 2]})
    }
};
lunzi.util.mask = function(a) {
    this.options = $extend({mid: "mskid_defined_",table: "",content: "",title: "",element: document.body,opacity: "0.2",zindex: 600}, a || {});
    if ($(this.options.element)) {
        this.options.element = $(this.options.element)
    } else {
        this.options.element = document.body
    }
    this.dialog = new Element("div", {styles: {width: "130px",height: "30px",position: "absolute","z-index": this.options.zindex + 1,background: "#eee",padding: "2px",border: "1px solid #aaa"}}).inject(document.body);
    this.dialog.set("id", this.options.mid + "maskDialog");
    this.dialog.position({relativeTo: this.options.element,position: "center",edge: "center"});
    this.winSize = this.options.element.getScrollSize();
    this.winfacebox = new Element("div", {styles: {position: "absolute",width: this.winSize.x + "px",height: this.winSize.y + "px",top: "0",left: "0","z-indent": "9",opacity: this.options.opacity,"background-color": "#fff","z-index": this.options.zindex}}).inject($(document.body));
    this.winfacebox.set("id", this.options.mid + "winfacebox");
    silunzi.util.toCenter(this.winfacebox, this.options.element);
    this.loadUrl = silunzi.util.cdnPath + "css/home/load.gif";
    new Element("h2", {text: this.options.title ? this.options.title : "请稍等...",styles: {height: "22px",width: "100%","line-height": "22px",color: "#333","font-size": "12px","font-weight": "normal","text-indent": "8px",background: "#eee",display: "block"}}).inject(this.dialog);
    new Element("div", {styles: {height: "8px",width: "100%",background: "#eee url(" + this.loadUrl + ") center center no-repeat"}}).inject(this.dialog)
};
lunzi.util.clearMask = function() {
    var b = arguments[0] && $defined(arguments[0]) ? arguments[0] : "mskid_defined_", c = b + "maskDialog", a = b + "winfacebox";
    if ($(c) && $(a)) {
        $(c).set("tween", {duration: 1000,onComplete: function() {
                document.getElements("*[id=" + a + "]").dispose();
                document.getElements("*[id=" + c + "]").dispose()
            }}).tween("opacity", "0")
    }
};
lunzi.util.popoFlag = function(b) {
    b = new Event(b);
    var a = this[0], c = this[1];
    if (a != b.target && !a.hasChild(b.target) && !c.hasChild(b.target) && c != b.target) {
        if (this[3]) {
            this[3]()
        }
        document.removeEvents(this[2], this[4])
    }
};
lunzi.util.loadData = function() {
    var a = "T" + Date.now();
    var b = arguments[0] ? arguments[0] : "";
    silunziUtil.mask(b, a);
    silunzi.util.sendLoad(arguments[0], arguments[1], arguments[2], function() {
        silunziUtil.unmask(a);
        this(arguments[0])
    }.bind(arguments[3] && typeof (arguments[3]) == "function" ? arguments[3] : $empty), arguments[4])
};
lunzi.util.dispose = function() {
    lunzi.util.hide(arguments[0], function() {
        this.dispose()
    }.bind($(arguments[0])))
};
lunzi.util.hide = function() {
    var b = $(arguments[0]);
    if (b.retrieve("fx") == null) {
        var a = new Fx.Reveal(b, {duration: 500,transition: "linear",onComplete: function() {
                if (typeof (this) == "function") {
                    this()
                }
            }.bind(arguments[1] ? arguments[1] : this)});
        b.store("fx", a);
        a.dissolve()
    } else {
        b.retrieve("fx").dissolve()
    }
};
lunzi.util.show = function() {
    var b = $(arguments[0]);
    if (b.retrieve("fx") == null) {
        var a = new Fx.Reveal(b, {duration: 500,transition: "linear",onComplete: function() {
                if (typeof (this) == "function") {
                    this()
                }
            }.bind(arguments[1] ? arguments[1] : this)});
        b.store("fx", a);
        a.reveal()
    } else {
        b.retrieve("fx").reveal()
    }
};
lunzi.util.shutOpen = function(e, c, b, f) {
    var d = $(e), a = c, b = $(b), h = "收起", g = "展开";
    if (d) {
        if (b) {
            if (b.hasClass("shut")) {
                b.removeClass("shut");
                b.set("text", b.get("text").replace(h, g));
                $(d).tween("height", f);
                return
            } else {
                b.addClass("shut");
                b.set("text", b.get("text").replace(g, h))
            }
        }
        $(d).tween("height", a)
    }
};
var HoverGroup = new Class({Implements: [Options, Events],Binds: ["enter", "leave", "remain"],options: {elements: [],delay: 300,start: ["mouseenter"],remain: [],end: ["mouseleave"]},initialize: function(a) {
        this.setOptions(a);
        this.attachTo(this.options.elements);
        this.addEvents({leave: function() {
                this.active = false
            },enter: function() {
                this.active = true
            }})
    },elements: [],attachTo: function(d, e) {
        var b = {}, c = {}, a = {};
        this.options.start.each(function(f) {
            b[f] = this.enter
        }, this);
        this.options.end.each(function(f) {
            a[f] = this.leave
        }, this);
        this.options.remain.each(function(f) {
            c[f] = this.remain
        }, this);
        if (e) {
            d.each(function(f) {
                f.removeEvents(b).removeEvents(a).removeEvents(c);
                this.elements.erase(f)
            })
        } else {
            d.each(function(f) {
                f.addEvents(b).addEvents(a).addEvents(c)
            });
            this.elements.combine(d)
        }
        return this
    },detachFrom: function(a) {
        this.attachTo(a, true)
    },enter: function(a) {
        this.isMoused = true;
        this.assert(a)
    },leave: function(a) {
        this.isMoused = false;
        this.assert(a)
    },remain: function(a) {
        if (this.active) {
            this.enter(a)
        }
    },assert: function(a) {
        $clear(this.assertion);
        this.assertion = (function() {
            if (!this.isMoused && this.active) {
                this.fireEvent("leave", a)
            } else {
                if (this.isMoused && !this.active) {
                    this.fireEvent("enter", a)
                }
            }
        }).delay(this.options.delay, this)
    }});
var dwCheckboxes = new Class({Implements: [Options],options: {elements: "input[type=checkbox]",mode: "toggle",relativ: ""},initialize: function(a) {
        this.setOptions(a);
        document.ondragstart = function() {
            return false
        };
        this.options.elements = $$(this.options.elements);
        this.manage()
    },manage: function() {
        var a = 0;
        this.options.elements.each(function(c) {
            c.addEvents({mousedown: function(d) {
                    d.stop();
                    a = 1;
                    c.checked = !c.checked
                },mouseenter: function(d) {
                    if (a === 1) {
                        c.checked = ("toggle" == this.options.mode ? !c.checked : "check" == this.options.mode)
                    }
                    this.allManager()
                }.bind(this),click: function(d) {
                    c.checked = !c.checked;
                    a = 0;
                    this.allManager()
                }.bind(this)});
            var b = $$("label[for=" + c.get("id") + "]");
            if (b.length) {
                b[0].addEvent("click", function() {
                    c.checked = !c.checked
                })
            }
        }.bind(this));
        window.addEvent("mouseup", function() {
            a = 0;
            this.allManager()
        }.bind(this))
    },allManager: function() {
        if (this.options.relativ) {
            if (this.options.elements.filter(function(a) {
                return a.checked
            }).length == this.options.elements.length) {
                this.options.relativ.checked = true
            } else {
                this.options.relativ.checked = false
            }
        }
    }});
String.implement({equals: function(a) {
        return (this == a || JSON.encode(this) == JSON.encode(a))
    }});
Element.implement({click: function(a) {
        return this.addEvent("click", a)
    },hasEvent: function(a, b) {
        var c = this.retrieve("events");
        return c && c[a] && (b == undefined || c[a].keys.contains(b))
    },definedHight: function(a) {
        if (this.retrieve("height") == null) {
            this.store("height", this.getDimensions().y)
        }
        this.setStyles({height: 0,opacity: 0,display: "block"});
        if (this.retrieve("fx") == null) {
            this.set("morph", {duration: 240,transition: Fx.Transitions.linear,link: "cancel",onComplete: function() {
                    if (a && typeof a == "function") {
                        a()
                    }
                }}).morph({height: this.retrieve("height"),opacity: 1});
            this.store("fx", true)
        } else {
            this.morph({height: this.retrieve("height"),opacity: 1})
        }
    },zeroHight: function() {
        this.morph({height: 0,opacity: 0})
    },hasProperty: function(a) {
        return this.getProperty(a) ? true : false
    },toggleDisplay: function() {
        if (this.getStyle("display") == "none") {
            this.show()
        } else {
            this.hide()
        }
    },PlayPicture: function(a, g, h, e) {
        var c = {}, b = this.getElement(".selected"), i = this, d = this.getElements(".selected");
        if ($defined(a) && this.retrieve(a) == null) {
            var f = new Element("img", {src: "/css/images/loading3.gif",styles: {top: "46%",left: "46%"}}).inject(this);
            c.img = Asset.image(a, {styles: {opacity: 0},onLoad: function() {
                    if (this.width > g || this.height > h) {
                        rateWidth = this.width / g;
                        rateHeight = this.height / h;
                        if (rateWidth > rateHeight) {
                            c.width = g;
                            c.height = this.height / rateWidth
                        } else {
                            c.width = this.width / rateHeight;
                            c.height = h
                        }
                    } else {
                        c.width = this.width;
                        c.height = this.height
                    }
                    c.left = (g - c.width) / 2;
                    c.top = (h - c.height) / 2;
                    if (b != null && b != this) {
                        if (lunzi.util.container.pic) {
                            lunzi.util.container.pic.dispose("pic")
                        }
                        d.removeClass("selected");
                        b.morph({height: 0,width: 0,opacity: 0,left: b.width / 2,top: b.height / 2})
                    }
                    f.dispose();
                    this.setStyles({height: 0,width: 0,left: c.width / 2,top: c.height / 2});
                    this.addClass("selected").morph({height: c.height,opacity: 1,width: c.width,left: 0,top: 0});
                    i.morph({height: c.height,width: c.width,"margin-left": c.left,"margin-top": c.top});
                    if (typeof (e) == "function") {
                        e(true)
                    }
                }}).inject(this);
            this.store(a, c)
        } else {
            var c = this.retrieve(a);
            b.morph({height: 0,width: 0,opacity: 0,left: b.width / 2,top: b.height / 2});
            if (c != null && $defined(a)) {
                if (lunzi.util.container.pic) {
                    lunzi.util.container.pic.dispose("pic")
                }
                d.removeClass("selected");
                c.img.addClass("selected").morph({height: c.height,opacity: 1,width: c.width,left: 0,top: 0});
                i.morph({height: c.height,width: c.width,"margin-left": c.left,"margin-top": c.top})
            } else {
                if (!lunzi.util.container.pic) {
                    lunzi.util.maskContent(i, "没有图片了...", "", 220, "pic")
                }
            }
            if (typeof (e) == "function") {
                e(true)
            }
        }
    },hover: function(b, d, a, e, f) {
        if (!$(b)) {
            return null
        }
        b = $(b);
        if (b.retrieve("hover") == null) {
            var c = new HoverGroup({elements: [this, b],delay: $defined(f) ? f : 300,onEnter: function() {
                    if (a && typeof a == "function") {
                        a()
                    }
                    b.definedHight(d)
                },onLeave: function() {
                    b.zeroHight();
                    if (e && typeof e == "function") {
                        e()
                    }
                }});
            b.store("hover", c)
        }
    },mousehover: function(b, a) {
        return this.addEvents({mouseenter: function(c) {
                b.attempt(c, this)
            },mouseleave: function(c) {
                a.attempt(c, this)
            }})
    },toPos: function(c, b, a, d) {
        a = $defined(a) ? a : 0;
        d = $defined(d) ? d : 10;
        this.position({relativeTo: c,position: b,offset: {x: a,y: d}})
    },autoTips: function(a) {
        a = a || {};
        if (document.body.retrieve("autotips") == null) {
            var b = {};
            b.child = {};
            b.child.width = a.width;
            b.ispoint = a.ispoint || false;
            b.child.height = window.getSize().y;
            b.o = this.getPosition();
            b.point = "upperRight";
            a.border = a.border || "#cdcdcd";
            b.inject = new Element("div", {styles: {width: b.child.width,height: b.child.height,position: "fixed",bottom: 0,left: 0,opacity: 0,overflow: "hidden",background: a.bgColor,"z-index": 100,"border-left": "1px solid " + a.border}}).inject(document.body);
            b.html = new Element("div", {styles: {width: b.child.width - 1,height: "100%",overflow: "hidden","border-left": "1px solid #ffffff"}}).inject(b.inject);
            if (!b.ispoint) {
                b.pl = new Element("div", {styles: {width: "16px",height: a.ch || "22px","border-width": "1px 0","border-style": "solid","border-color": a.plborder || a.border,position: "absolute","z-index": a.plIndex || 101,display: "none",background: a.plBgcolor || a.bgColor}}).inject(document.body)
            }
            window.addEvents({scroll: function() {
                    var c = document.getScroll().y, d = window.getSize().y;
                    if (!window.XMLHttpRequest) {
                        b.inject.setStyles({top: c,position: "absolute"})
                    }
                },resize: function() {
                    b.child.height = window.getSize().y;
                    b.inject.setStyle("height", window.getSize().y)
                }});
            b.property = {};
            b.property.content = function(d, c, e) {
                b.html.innerHTML = $(d) ? $(d).innerHTML : d;
                b.property.go(c);
                if (e && typeof e == "function") {
                    e()
                }
            };
            b.pos = b.inject.getPosition();
            b.isAttach = false;
            b.property.go = function(d) {
                a.el = d;
                var c = !b.ispoint ? 10 : 0;
                b.inject.setStyle("left", d.getPosition().x + d.getDimensions().x + c);
                if (!b.ispoint) {
                    b.pl.position({relativeTo: d,position: b.point,offset: {x: -5,y: 0}})
                }
            };
            b.isHide = function() {
                return b.isAttach
            };
            b.inject.addEvents({mouseenter: function() {
                    b.isAttach = true;
                    if (a.clazz && a.el) {
                        a.el.addClass(a.clazz)
                    }
                },mouseleave: function() {
                    b.isAttach = false;
                    b.hide.delay(120, [a.clazz])
                }});
            b.show = function() {
                b.inject.morph({width: b.child.width,opacity: 1,onComplete: function() {
                        b.isAttach = true;
                        if (document.getElements("select").length > 0 && !window.XMLHttpRequest) {
                            document.getElements("select").hide()
                        }
                        if (!b.ispoint) {
                            b.pl.show()
                        }
                        if (a.clazz && a.el) {
                            a.el.addClass(a.clazz)
                        }
                    }.bind(b.inject)})
            };
            b.hide = function() {
                if (!b.isAttach) {
                    if (!b.ispoint) {
                        b.pl.hide()
                    }
                    b.inject.morph({width: 0,opacity: 0,onComplete: function() {
                            b.isAttach = false;
                            if (document.getElements("select").length > 0 && !window.XMLHttpRequest) {
                                document.getElements("select").show()
                            }
                            if (a.clazz && a.el) {
                                a.el.removeClass(a.clazz)
                            }
                        }.bind(b.inject)})
                }
            };
            document.body.store("autotips", b);
            return b
        } else {
            return document.body.retrieve("autotips")
        }
    }});
var Widget = new Class({Implements: [Class.Occlude],initialize: function(a) {
        if (this.occlude("widget", a)) {
            return this.occluded
        }
    }});
var Collapsable = new Class({Extends: Fx.Reveal,initialize: function(b, e, d, a, c) {
        this.clicker = $(b);
        this.section = $(e);
        this.f = a;
        this.parent(c);
        this.obj = d;
        this.addEvents()
    },addEvents: function() {
        this.clicker.addEvent("click", function(b) {
            var a = $(b) ? $(b) : $(b.target);
            if (!a.hasClass("AC")) {
                a = a.getParent(".AC")
            }
            if ($defined(this.obj) && this.obj != null) {
                checkLogin(true, function() {
                    var c = this.obj.elements.indexOf(a);
                    this.obj.options.count = c;
                    this.element = this.obj.loadElements[c];
                    this.obj.replay();
                    if (a.retrieve(a.get("lang")) == null) {
                        this.obj.getReplay(a, this.obj.loadElements[c].getElement("ul").getNext("._replayList"), a.get("id"))
                    }
                    if (typeof (this.f) == "function") {
                        this.f()
                    }
                    this.toggle()
                }.bind(this))
            } else {
                this.element = this.section;
                if (typeof (this.f) == "function") {
                    this.f()
                }
                this.toggle()
            }
        }.bind(this))
    }});
var modifyDefiend = new Class({Extends: Fx.Reveal,initialize: function(a, b) {
        this.selectSwitchDis = $$("select" + a);
        this.radioSwitchDis = $$("input" + a);
        this.parent(this.section, b);
        if (this.options.address && $(this.options.address)) {
            this.address = $(this.options.address)
        }
        this.elementTo = $(this.options.to);
        this.cookieCitycode = this.options.cookieCitycode;
        this.select();
        this.radio()
    },addEvents: function(b, a) {
        if (b.get("lang") == null || b.get("lang") == "") {
            if (this.elementTo.getElement("div")) {
                this.elementTo.getElement("div").show()
            }
            this.elementTo.getElement('input[type="radio"]').checked = true;
            if ($defined(this.dialog) && this.dialog != null) {
                this.hide();
                this.clearChoice()
            }
        } else {
            this.elementPlugs(b);
            this.element = this.dialog;
            lunzi.util.mask({element: this.elementTo,title: "正在加载,请稍候..."});
            this.selection(b, a);
            this.update(b.get("lang"), function() {
                this.loadElement.getElements("input[type='text']").each(function(e) {
                    if (!$("myScript" + e.get("name"))) {
                        var c = this, d = new Date();
                        new Asset.javascript(silunzi.util.basePath + "getConstAllRelated.xhtml?citycode=" + this.cookieCitycode + "&tag=" + b.get("lang") + "&v=" + d.getMilliseconds(), {id: "myScript" + e.get("name"),onLoad: function() {
                                c.autoChoice(b, e)
                            }})
                    } else {
                        this.autoChoice(b, e)
                    }
                }.bind(this))
            }.bind(this));
            this.reveal()
        }
        if (this.choice && this.elementTo) {
            this.choice.store("relatedid", null);
            this.choice.store("categoryid", null);
            this.elementTo.store("relatedid", null);
            this.elementTo.store("categoryid", null)
        }
        OverText.update()
    },autoChoice: function(filter, item) {
        var tokens = eval(filter.get("lang") + item.get("lang"));
        new Autocompleter.Local(item, tokens, {delay: 100,maxChoices: 10,ipt: item,relatedFun: this.objectRelated.bind(this),filter: function() {
                var values = this.queryValue.split(/ +/);
                return this.tokens.filter(function(token) {
                    var result = values.every(function(v) {
                        var reg = new RegExp(v.escapeRegExp(), "i");
                        return reg.test(token.skey)
                    });
                    return result
                })
            },injectChoice: function(choice) {
                modifyPlug(this, choice, item.get("name"), item.get("lang"))
            },addChoiceEvents: function(el) {
                return el.addEvents({mouseover: this.choiceOver.bind(this, [el]),click: this.choiceSelect.bind(this, [el])})
            }})
    },selection: function(b, a) {
        this.elementTo.getElement("div").hide();
        this.clearChoice();
        this.elementTo.getElements('input[type="radio"]').each(function(c) {
            this.showChoice.show();
            if (c.value.trim() == b.get("lang").trim()) {
                c.checked = true;
                new Element("span", {text: "请选择关联的" + c.get("title"),styles: {"padding-right": "8px",cursor: "pointer"}}).inject(new Element("span").addClass("releBt releHover").addEvent("click", function() {
                    this.addEvents(c, false);
                    this.dialog.show()
                }.bind(this)).inject(this.showChoice));
                if (!a) {
                    new Element("img", {src: silunzi.util.cdnPath + "css/images/blank.gif"}).addEvent("click", function() {
                        this.elementTo.getElement('input[type="radio"]').checked = true;
                        this.elementTo.getElement("div").show();
                        this.dialog.hide();
                        this.clearChoice();
                        if (this.address) {
                            this.address.value = "";
                            this.address.fireEvent("blur", [this.address])
                        }
                        c.checked = "";
                        OverText.update()
                    }.bind(this)).inject(new Element("span", {text: c.getParent().get("text")}).inject(new Element("span", {"class": "releBt releHover"}).inject(this.showChoice, "top")))
                }
                silunziUtil.unmask()
            } else {
                c.checked = ""
            }
        }.bind(this));
        OverText.update()
    },create: function(b) {
        this.dialog = new Element("div", {"class": "plugpanel",styles: {width: "600px",display: "none",visibility: "visible"}}).inject(document.body);
        this.inner = new Element("div", {"class": "inner"}).inject(this.dialog);
        new Element("img", {src: silunzi.util.cdnPath + "css/home/min_pt.gif",styles: {position: "absolute",top: "-5px",left: "20px"}}).inject(this.inner);
        this.close = new Element("span", {"class": "more",styles: {background: "url(" + silunzi.util.cdnPath + "css/home/del.gif) no-repeat",width: "10px",height: "10px",display: "inline-block",top: "10px",cursor: "pointer"}}).addEvent("click", function() {
            this.dialog.hide();
            this.choice.empty();
            if (Browser.ie6) {
                document.getElements("select").fade(1)
            }
        }.bind(this)).inject(this.inner);
        this.loadElement = new Element("div").inject(this.inner);
        new Element("span", {"class": "gr-r"}).inject(new Element("span", {"class": "gr-l"}).inject(new Element("div", {"class": "line mt10"}).inject(this.inner)), "after");
        this.choice = new Element("dd").inject(new Element("dl", {"class": "ui_80 clear relePlugs mt10"}).inject(this.inner));
        new Element("b", {text: "你已选择"}).inject(new Element("dt").inject(this.choice, "before"));
        this.footer = new Element("div", {"class": "plugFooter mt10"}).inject(this.inner);
        this.sure = new Element("label", {"class": "button redBt minBt ml20"}).addEvents({mouseenter: function() {
                this.addClass("hover")
            },mouseleave: function() {
                this.removeClass("hover")
            },click: function() {
                this.confirmChoice("relatedid", "categoryid")
            }.bind(this)}).inject(this.footer);
        new Element("input", {type: "button",value: "确认，添加"}).inject(this.sure);
        this.cancel = new Element("label", {"class": "button whiteBt minBt ml10"}).addEvents({mouseenter: function() {
                this.addClass("hover")
            },mouseleave: function() {
                this.removeClass("hover")
            },click: function() {
                this.choice.empty();
                this.dialog.hide();
                if (Browser.ie6) {
                    document.getElements("select").fade(1)
                }
            }.bind(this)}).inject(this.footer);
        new Element("input", {type: "button",value: "取消"}).inject(this.cancel);
        this.dialog.toPos(this.elementTo, "bottomLeft", 0, 0);
        var a = {dialog: this.dialog,close: this.close,loadEm: this.loadElement,choice: this.choice,sure: this.sure,cancel: this.cancel};
        this.dialog.store(b.get("lang"), a)
    },elementPlugs: function(a) {
        if (!$defined(this.dialog) && this.dialog == null) {
            this.create(a)
        } else {
            if (this.dialog.retrieve(a.get("lang")) != null) {
                var b = this.dialog.retrieve(a.get("lang"));
                this.dialog = b.dialog;
                this.close = b.close.addEvent("click", function() {
                    this.dialog.hide()
                }.bind(this));
                this.loadElement = b.loadEm;
                this.choice = b.choice;
                this.sure = b.sure.addEvent("click", function() {
                    this.confirmChoice("relatedid", "categoryid")
                }.bind(this));
                this.cancel = this.cancel.addEvent("click", function() {
                    this.dialog.hide()
                }.bind(this))
            } else {
                this.create(a)
            }
        }
    },select: function() {
        this.selectSwitchDis.addEvent("change", function(a) {
            if (this.dialog) {
                this.dialog.hide()
            }
            this.addEvents($(a.target).getElements("option").filter(function(b) {
                return b.get("selected")
            })[0], true)
        }.bind(this))
    },radio: function() {
        this.radioSwitchDis.addEvent("click", function(a) {
            if ($(a.target).checked = true) {
                this.addEvents($(a.target), false)
            }
        }.bind(this))
    },clearChoice: function() {
        if (this.elementTo.getElements("div.relePlugs").length > 0) {
            this.showChoice = this.elementTo.getElement("div.relePlugs");
            this.showChoice.hide().empty()
        } else {
            this.showChoice = new Element("div", {"class": "relePlugs clear"}).inject(this.elementTo, "bottom")
        }
        if (Browser.ie6) {
            document.getElements("select").fade(0)
        }
    },update: function(d, c) {
        var b = silunzi.util.basePath + "ajaxLoadUserFav.xhtml";
        var a = {tag: d,citycode: this.cookieCitycode};
        if (this.loadElement.retrieve(d) == null) {
            silunziUtil.sendLoad(this.loadElement, b, a, function() {
                c();
                this.loadElement.store(d, this.loadElement.get("html"));
                this.switchobject();
                lunziUtil.textOver(".text")
            }.bind(this))
        } else {
            this.loadElement.innerHTML = this.loadElement.retrieve(d);
            c();
            this.switchobject();
            lunziUtil.textOver(".text")
        }
    },switchobject: function() {
        var a = this;
        this.loadElement.getElements("a").addEvent("click", function(b) {
            b.preventDefault();
            var c = {rel: this.get("rel"),id: this.get("id"),name: this.get("name"),text: this.get("text"),address: this.get("config") ? this.get("config") : ""};
            a.objectRelated(c)
        })
    },objectRelated: function(c, f, b) {
        if (!this.choice) {
            return
        }
        var i = this;
        if (this.choice.retrieve(c.rel) == null) {
            var h = new Element("span").addClass("releBt releHover _plugC").inject(f ? this.showChoice : this.choice);
            if (i.address && c.address != "" && c.address != null) {
                i.address.value = c.address;
                i.address.fireEvent("focus", [i.address])
            }
            var a = new Element("input", {type: "hidden",name: c.rel,value: c.id}).inject(new Element("img", {src: silunzi.util.cdnPath + "css/images/blank.gif"}).addEvent("click", function() {
                if (i.address && c.rel == "relatedid") {
                    i.address.value = "";
                    i.address.fireEvent("blur", [i.address])
                }
                i.choice.store(c.rel, null);
                i.elementTo.store(c.rel, null);
                if (b == "" && i.showChoice.getElements("._plugC").length < 2) {
                    i.elementTo.getElement('input[type="radio"]').checked = true;
                    i.elementTo.getElement("div").show();
                    i.dialog.hide();
                    OverText.update();
                    i.clearChoice()
                }
                this.getParent(".releBt").dispose();
                if (i.elementTo.retrieve("relatedid") == null && i.elementTo.retrieve("categoryid") == null) {
                    i.showChoice.getLast().show()
                }
            }).inject(new Element("span", {text: c.text}).inject(h)), "before");
            if (c.rel == "categoryid") {
                new Element("input", {type: "hidden",name: "category",value: c.name}).inject(a, "before")
            }
            i.choice.store(c.rel, h);
            if (f) {
                i.elementTo.getElement(".releBt").hide();
                i.elementTo.store(c.rel, h)
            }
        } else {
            var g = i.choice.retrieve(c.rel).getElement("span"), e = g.getElements("input"), d = e.getNext();
            g.set("text", c.text);
            e.each(function(j) {
                if (j.name == "category") {
                    j.value = c.name
                } else {
                    if (j.name == "categoryid") {
                        j.value = c.id
                    } else {
                        j.value = c.id
                    }
                }
                j.inject(g)
            });
            d.inject(g)
        }
    },confirmChoice: function(b, a) {
        var d = $("plugChoose"), c = $("plug_show");
        this.elementTo.store(b, this.choice.retrieve(b));
        this.elementTo.store(a, this.choice.retrieve(a));
        if (this.choice) {
            this.choice.getElements("._plugC").inject(this.showChoice.getElement(".releBt"), "after")
        }
        if (this.elementTo.retrieve(b) == null && this.elementTo.retrieve(a) == null) {
            this.showChoice.getLast().show()
        } else {
            this.showChoice.getLast().hide()
        }
        this.dialog.hide();
        if (Browser.ie6) {
            document.getElements("select").fade(1)
        }
    },reset: function(a) {
        if (a.lang != "") {
            this.selection(a, true);
            this.create(a)
        }
        var b = {rel: a.rel,id: a.id,name: a.name,text: a.text,address: a.get("config")};
        this.objectRelated(b, true, a.lang)
    }});
lunzi.util.removeBodyClick = function(b, a, c) {
    b = $(b);
    document.addEvent("click", function(f) {
        var d = $(f.target);
        if (d != b && !b.contains(d) && d != a && !a.contains(d)) {
            document.removeEvent("click", arguments.callee);
            b.hide();
            if (c) {
                c()
            }
        }
    })
};
(function() {
    var b = function(e, c, d, h) {
        var f = e[c];
        var g = [];
        while (f) {
            if (f.nodeType == 1) {
                if (!d || Element.match(f, d)) {
                    break
                } else {
                    g.push(f)
                }
            }
            f = f[c]
        }
        return new Elements(g, {ddup: false,cash: !h})
    };
    var a = function(e, c, f) {
        var d = 0;
        var g = [];
        while (d < f) {
            g.push(e.getElements(c)[d]);
            d++
        }
        return new Elements(g, {ddup: false})
    };
    Element.implement({getAllPreviousUntil: function(c, d) {
            return b(this, "previousSibling", c, d)
        },getAllNextUntil: function(c, d) {
            return b(this, "nextSibling", c, d)
        },getParentsUntil: function(c, d) {
            return b(this, "parentNode", c, d)
        },getElementsByCount: function(c, d) {
            return a(this, c, d)
        }})
})();
Fx.implement({initStyles: function() {
        this.init = {};
        $A(arguments).each(function(b) {
            if (b == "opacity") {
                this.init.opacity = this.element.get("opacity")
            } else {
                (this.element.getStyle(b).test("px")) ? this.init[b] = this.element.getStyle(b).toInt() : this.init[b] = this.element.getStyle(b)
            }
        }, this);
        return this
    },removeAuto: function() {
        if (!this.init) {
            this.init = {}
        }
        $A(arguments).each(function(b) {
            if (this.element.getStyle(b) == "auto") {
                this.element.setStyle(b, "0px");
                this.init[b] = 0
            }
        }, this);
        return this
    },setPosition: function() {
        if (this.element.getStyle("position") == "static") {
            this.element.setStyle("position", "relative")
        }
        return this
    }});
Fx.Toggle = new Class({Extends: Fx.Tween,initialize: function(b, a) {
        this.parent(b, a);
        this.initStyles("height", "width", "opacity");
        this.element.setStyle("overflow", "hidden")
    },toggleHeight: function(d, c) {
        var b = this.element.getChildren().getDimensions(), a = this.init.height;
        d = d || 0;
        if (a == d && b.length > 0) {
            b.each(function(e) {
                a = e.y + a
            })
        }
        a = a == "auto" ? d : a;
        (this.element.getStyle("height").toInt() > d) ? this.start("height", d) : this.start("height", a);
        if (c && typeof (c) == "function") {
            c()
        }
        return this
    },toggleHeightValue: function(a) {
        a = a || 0;
        this.start("height", a);
        return this
    },toggleWidth: function() {
        (this.element.getStyle("width").toInt() > 0) ? this.start("width", 0) : this.start("width", this.init.width);
        return this
    },toggleOpacity: function() {
        (this.element.getStyle("opacity").toInt() > 0) ? this.start("opacity", 0) : this.start("opacity", this.init.opacity);
        return this
    },toggleDisplay: function() {
        this.toggleProperty("display", "none", "block");
        return this
    },toggleVisibility: function() {
        this.toggleProperty("visibility", "hidden", "visible");
        return this
    },toggleStyle: function() {
    },toggleProperty: function(b, d, c, a) {
        if ($string(d) && $string(c)) {
            if (!a) {
                (this.element.getStyle(b) == d.toLowerCase()) ? this.element.setStyle(b, c) : this.element.setStyle(b, d)
            } else {
                (this.element.getStyle(b) == d.toLowerCase()) ? this.start(b, c) : this.start(b, d)
            }
        } else {
            if ($int(d) && $int(c)) {
                if (!a) {
                    (this.element.getStyle(b).toInt() == d) ? this.set(b, c) : this.set(b, d)
                } else {
                    (this.element.getStyle(b).toInt() == d) ? this.start(b, c) : this.start(b, d)
                }
            }
        }
        return this
    },toggle: function(a) {
        switch (a) {
            case "height":
                this.toggleHeight();
                break;
            case "width":
                this.toggleWidth();
                break;
            case "opacity":
                this.toggleOpacity();
                break;
            case "display":
                this.toggleDisplay();
                break;
            case "visibility":
                this.toggleVisibility();
                break
        }
        return this
    }});
Fx.Grow = new Class({Extends: Fx.Morph,initialize: function(c, b, a) {
        this.parent(c, b);
        this.values = a || {height: 200,width: 200,fontsize: 10};
        this.element.setStyle("overflow", "hidden")
    },start: function(b) {
        var b = b || this.values, a = this.element.getDimensions().x, c = this.element.getDimensions().y;
        this.parent({top: (c > 0) ? [(this.element.getParent().clientHeight - this.values.height) / 2, this.values.height / 2] : [this.values.height / 2, (this.element.getParent().clientHeight - this.values.height) / 2],left: (a > 0) ? [(this.element.getParent().clientWidth - this.values.width) / 2, this.element.getParent().clientWidth - this.values.width / 2] : [this.values.width / 2, (this.element.getParent().clientWidth - this.values.width) / 2],height: (c > 0) ? [this.values.height, 0] : [0, this.values.height],width: (a > 0) ? [this.values.width, 0] : [0, this.values.width],opacity: (c > 0 && a > 0) ? [1, 0] : [0, 1]})
    }});
lunzi.util.pagePos = function(b) {
    var a;
    if (b) {
        a = $(b)
    } else {
        var c = lunzi.util.getRequestParams("topos");
        a = $(c.trim())
    }
    if (a) {
        $(window).scrollTo(0, a.getPosition().y)
    }
};
lunzi.util.getRequestParams = function(b, e) {
    var a = window.location.search || e;
    if (a && a.indexOf(b) > 0) {
        var c = new RegExp("(^|&)" + b + "=([^&]*)(&|$)", "i"), d = a.substr(1).match(c);
        return (d != null) ? d[2] : ""
    } else {
        return ""
    }
};
lunzi.util.getUrlParams = function(c) {
    var b = window.location.search || c;
    if (b) {
        array = b.substr(1).split("&");
        var a = {};
        if (array) {
            array.each(function(e) {
                keyValue = e.split("=");
                var d = keyValue[0];
                if ($chk(d)) {
                    a[d] = keyValue[1] ? keyValue[1] : ""
                }
            })
        }
        return a
    } else {
        return {}
    }
};
lunzi.util.setInterval = function() {
};
var Icon = new Class({Implements: [Options, Events],options: {icon: new Object(),path: silunziUtil.cdnPath + "/img/minFace/"},initialize: function(a) {
        this.setOptions(a);
        this.getIconTitle()
    },getIconTitle: function() {
        this.options.icon = {"01": "害羞","02": "可爱","03": "呵呵","04": "花心","05": "嘻嘻","06": "亲亲","07": "噢耶","08": "懒得理你","09": "抱抱","010": "鄙视","011": "汗","012": "晕","013": "泪","014": "悲伤","015": "闭嘴","016": "吃惊","017": "酷","018": "哈哈","019": "困","020": "花","021": "伤心","022": "邮件","023": "电话","024": "干杯","025": "调谢","026": "握手","027": "good","028": "唱歌","029": "得意","030": "疑问","031": "便便","032": "呆","033": "河蟹","034": "囧","035": "咖啡","036": "礼花","037": "礼物","038": "篮球","039": "骷髅","040": "闪电","041": "弱","042": "怒","043": "衰","044": "失望","045": "生病","046": "睡觉","047": "太阳","048": "下雨","049": "心","050": "星","051": "药","052": "月亮","053": "钟","054": "抓狂","055": "足球"}
    },innerHTML: function(d, a) {
        d = $(d);
        a = $(a);
        var c = "";
        Object.each(this.options.icon, function(f, e) {
            c += this.replaceHTML(e, f)
        }.bind(this));
        var b = new Element("div", {html: c,"class": "dalogIcon uidialog clear",id: "uidialog"});
        lunzi.util.tips(d, b, 396, "icon", "", function() {
            b.getElements("a").addEvent("click", function(f) {
                f.preventDefault();
                try {
                    a.focus();
                    if (a.hasEvent("focus") && Browser.ie) {
                        a.fireEvent("focus")
                    }
                    a.insertAtCursor(this.get("rel"))
                } catch (f) {
                }
            });
            document.addEvent("click", function(h) {
                var g = $(h.target), f = lunzi.util.container.icon;
                if (g != f.coreDialog && !f.coreDialog.contains(g) && g != d && !d.contains(g)) {
                    document.removeEvent("click", arguments.callee);
                    f.dispose(["icon"], true)
                }
            })
        }, "", "0")
    },replaceHTML: function(a, b) {
        return "<a href='' rel='[$3]'><img src='$1' width='20' height='20' title='$2'/></a>".replace(/\$1|\$2|\$3/g, function(c) {
            if (c == "$1") {
                return c = this.options.path + a + ".gif"
            } else {
                if (c == "$3") {
                    return c = a
                } else {
                    return c = b
                }
            }
        }.bind(this))
    }});
lunzi.util.makeRelation = function(b, a) {
    checkLogin(true, function() {
        a = $(a);
        silunziUtil.sendRequest(silunziUtil.basePath + "wala/addMicroAttention.xhtml", {memberid: b}, function(d) {
            if (d.success) {
                a.hide();
                var c = new Element("span", {text: "|",styles: {background: "#EFEFEF",border: "1px solid #cccccc",display: "inline-block",height: "22px","line-height": "22px",padding: "0 8px","float": "left"}}).inject(a, "before");
                new Element("span", {text: "取消",styles: {color: "#C03B0C","margin-left": "5px",cursor: "pointer"}}).addEvent("click", function() {
                    lunziUtil.cancelRelation(b, this.getParent(), a)
                }).inject(c);
                new Element("span", {text: "已关注",styles: {color: "#666666","margin-right": "5px"}}).inject(c, "top")
            } else {
                lunziUtil.alert(d.msg)
            }
        })
    })
};
lunzi.util.cancelRelation = function(c, a, b) {
    checkLogin(true, function() {
        if ($(a)) {
            a = $(a)
        }
        silunziUtil.sendRequest(silunziUtil.basePath + "wala/cancelAttention.xhtml", {memberid: c}, function(d) {
            if (d.success) {
                lunziUtil.alert("取消成功！", function() {
                    if ($(a)) {
                        a.dispose()
                    }
                    if ($(b)) {
                        $(b).show();
                        $(b).removeClass("none")
                    }
                })
            } else {
                lunziUtil.alert(d.msg)
            }
        }, "get")
    })
};
lunzi.util.dialogSingleUpdate = function(c, a, b) {
    c = {id: $(c)};
    if (c.id.retrieve("iframe") == null) {
        c.html = new Element("div", {styles: {display: "none"}}).inject(document.body);
        new Element("iframe", {src: "blank.html",name: "iframe_async_upload",id: "iframe_async_upload",styles: {display: "none"}}).inject(c.html);
        c.form = new Element("form", {action: silunziUtil.basePath + "common/uploadPicture.xhtml",method: "post",target: "iframe_async_upload"}).inject(c.html);
        if (Browser.ie6 || Browser.ie7) {
            c.form.setAttribute("encoding", "multipart/form-data")
        } else {
            c.form.setAttribute("enctype", "multipart/form-data")
        }
        new Element("input", {type: "hidden",name: "callback",value: b}).inject(c.form);
        new Element("input", {type: "hidden",name: "callbackUrl",value: silunziUtil.basePath + "common/afterUploadPicture.xhtml?uploadtag=micro&callbackf=lunzi.util.updateCallback"}).inject(c.form);
        c.t = new Element("div", {text: "支持上传 .gif .jpg .png 格式图片，最大不超过2M。",styles: {width: "100%",height: "22px",overflow: "hidden","text-indent": "10px",color: "#999"}}).inject(c.form);
        c.pic = new Element("div", {id: "async_upload",styles: {width: "290px",height: "120px",overflow: "hidden",position: "relative","margin-top": "10px"}}).inject(c.form);
        c.tl = new Element("div", {id: "async_upload_file",styles: {width: "76px",height: "24px",overflow: "hidden",position: "absolute",left: "95px",top: "49px"}}).inject(c.pic);
        c.input = new Element("input", {type: "file",name: "headlogo",id: "file_async_upload",styles: {background: "transparent",outline: "none","hide-focus": "expression(this.hideFocus=true)",opacity: 0,position: "absolute","z-index": 2,left: "-60px",width: 150,top: "-2px","font-size": "20px",visibility: "visible",cursor: "pointer"}}).addEvent("change", function() {
            checkLogin(true, function() {
                c.form.submit()
            })
        }).inject(c.tl);
        new Element("span", {text: "上传图片"}).inject(new Element("a", {"for": "file_async_upload","class": "button minBt redBt",href: "javascript:void(0);"}).addEvent("click", function() {
            c.input.fireEvent("focus")
        }).inject(c.tl), "top");
        c.id.store("iframe", c.html)
    } else {
        c.html = c.id.retrieve("iframe")
    }
    lunzi.util.tips(c.id, c.html, 320, "dailogpic", "", function() {
        document.addEvent("click", function(g) {
            var f = $(g.target), d = lunzi.util.container.dailogpic;
            if (f != d.coreDialog && !d.coreDialog.contains(f) && f != c.id && !c.id.contains(f)) {
                document.removeEvent("click", arguments.callee);
                d.dispose(["dailogpic"], true)
            }
        })
    }, "", "0")
};
lunzi.util.updateCallback = function(b) {
    var a = {};
    a.img = Asset.image(silunziUtil.cdnPath + b.picpath, {onLoad: function() {
            if (this.width > 290 || this.height > 120) {
                rateWidth = this.width / 290;
                rateHeight = this.height / 120;
                if (rateWidth > rateHeight) {
                    this.width = 290;
                    this.height = this.height / rateWidth
                } else {
                    this.width = this.width / rateHeight;
                    this.height = 120
                }
                this.setStyles({"margin-left": (290 - this.width) / 2,"margin-top": (120 - this.height) / 2})
            }
        }}).inject("async_upload");
    $("async_upload_file").hide();
    a.input = new Element("input", {type: "hidden",name: "bodypic",id: "bodypic",value: b.picpath}).inject(b.callback, "before");
    $(b.callback).value = $(b.callback).value + "分享图片";
    if ($("wala_defV")) {
        $("wala_defV").hide()
    }
    new Element("span", {text: "删除图片",styles: {display: "inline-block",background: "#fff","border-radius": "3px",height: "20px","line-height": "20px",padding: "0 6px",cursor: "pointer",color: "#DD9966",border: "1px solid #ddd",position: "absolute","*line-height": "21px",left: 115,top: 49,"z-index": 1}}).addEvent("click", function() {
        silunziUtil.sendRequest(silunziUtil.basePath + "wala/delMicroBlogPic.xhtml", {picpath: b.picpath}, function(c) {
            this.dispose();
            a.img.dispose();
            a.input.dispose();
            $("async_upload_file").show()
        }.bind(this))
    }).inject("async_upload")
};
lunzi.util.replay = new Class({Implements: [Options, Events],options: {},initialize: function(a) {
        this.setOptions(a)
    },createMessageDialog: function(i) {
        if (i.id.contains("img")) {
            i.id = i.id.substring(3);
            c = "搭话";
            var e = this
        } else {
            var e = this, b = (i._this.get("lang") == "f") ? true : false, c = b ? "转发" : "搭话"
        }
        if (i.element.retrieve("dom") == null) {
            var a = new Element("dl", {"class": "isFirstNode"}).inject(i.element, "top");
            new Element("img", {"class": "picmin",src: (silunziUtil.basePath + (silunziUtil.member.headUrl != "" ? silunziUtil.member.headUrl : "cw30h30/img/default_head.png")),width: 30,height: 30}).inject(new Element("span", {"class": "picmin"})).inject(new Element("dt").inject(a));
            var g = new Element("dd").inject(a);
            var h = new Date().getTime() + i.id;
            i.replayBt = new Element("button", {html: c,"class": "button"}).addEvent("click", function() {
                if (i.textarea.value.trim() == "") {
                    i.textarea.highlight("#ffcc99", "#fff")
                } else {
                    e.datas = this.getParent("dd").toQueryString().parseQueryString();
                    e.datas.commentid = i.id;
                    if (c == "评论") {
                        e.datas.type = "albumcomment"
                    }
                    e.criteDom = new Element("div").hide().inject(a, "after");
                    checkLogin(true, function() {
                        if (e.datas.type == "r" || e.datas.type == "albumcomment") {
                            silunziUtil.sendLoad(e.criteDom, silunziUtil.basePath + "home/sns/replyComment.xhtml", e.datas, function(j) {
                                if (j.success) {
                                    i.textarea.value = "";
                                    e.criteDom.reveal()
                                } else {
                                    lunziUtil.alert(j.json.msg)
                                }
                            })
                        } else {
                            silunziUtil.sendRequest(silunziUtil.basePath + "home/sns/replyComment.xhtml", e.datas, function(j) {
                                i.textarea.value = "";
                                if (j.success) {
                                    lunziUtil.alert("转发成功")
                                } else {
                                    lunziUtil.alert(j.msg)
                                }
                            }, "get")
                        }
                    })
                }
            }).inject(g);
            var f = new Element("div", {"class": "review"}).inject(g);
            new Element("input", {type: "checkbox",checked: b ? "checked" : "",name: "isMicro",id: h,styles: {"margin-right": "3px"}}).addEvent("click", function() {
                if (b) {
                    this.checked = b
                }
            }).inject(new Element("label", {html: "转发到我的养车客","class": "left ui_wala_rzf","for": h}).inject(f), "top");
            new Element("input", {type: "hidden",name: "type",value: b ? "f" : "r"}).inject(g);
            var d = new Element("b", {html: 140,styles: {"float": "right","font-family": "Constantia,Georgia","font-size": "13px",color: "#CC3300","margin-right": "70px"}}).inject(f);
            i.textarea = new Element("textarea", {name: "body",id: "body",root: "text",alt: "请输入" + c + "内容...",styles: {color: "#666"}}).inject(g, "top");
            i.textarea.addEvent("focus", function() {
                this.addClass("onFocus")
            });
            i.textarea.addEvent("blur", function() {
                this.removeClass("onFocus")
            });
            i.textarea.addEvent("keyup", function() {
                this.value = this.value.replace(/\n/g, "");
                if (this.value.length > 0) {
                    i.replayBt.addClass("onButton")
                } else {
                    i.replayBt.removeClass("onButton")
                }
                if (140 - this.value.length >= 0) {
                    e.values = this.value;
                    d.innerHTML = 140 - this.value.length;
                    this.setStyle("height", this.getScrollSize().y)
                } else {
                    this.value = e.values;
                    d.innerHTML = 0;
                    this.highlight("#ffcc99", "#fff")
                }
            }).inject(g, "top");
            if (i._this.hasProperty("form")) {
                i.textarea.set("value", (i._this.hasProperty("form")) ? i._this.get("form") : "")
            }
            new Element("em", {"class": "dmore"}).inject(new Element("span", {"class": "iserm",text: "表情"}).addEvent("click", function() {
                i.icon.innerHTML(this, i.textarea)
            }).inject(f, "top"));
            if (typeof i.callback == "function") {
                i.callback.run()
            }
            i.element.store("dom", a)
        } else {
            i.node = i.element.retrieve("dom");
            i.type = i.node.getElement("input[type=hidden]");
            i.button = i.node.getElement("button");
            i.textArea = i.node.getElement("textArea");
            i.checkbox = i.node.getElement("input[type=checkbox]");
            i.textArea.value = "";
            i.checkbox.removeEvents("click");
            if (b) {
                i.type.value = "f";
                i.button.set("text", "转发");
                i.textArea.set("alt", "请输入转发的内容...");
                i.checkbox.checked = true;
                i.checkbox.addEvent("click", function() {
                    this.checked = true
                })
            } else {
                i.button.checked = "";
                i.button.set("text", "搭话");
                i.type.value = "r";
                i.checkbox.checked = "";
                if (i._this.hasProperty("form")) {
                    i.textArea.value = i._this.get("form")
                } else {
                    i.textArea.set("alt", "请输入搭话的内容...")
                }
            }
            if (typeof i.callback == "function") {
                i.callback.run()
            }
        }
    }});
function logout() {
    var a = silunziUtil.basePath + "auth/logout.action?ptn=smp";
    new Request({url: a,method: "get",onComplete: function() {
            lunziUtil.alert("成功退出！", refreshPage)
        }}).send()
}
lunzi.util.messageInit = function() {
    var a = {};
    a.tgs = document.getElements("*[lang=r],*[lang=f]");
    if (a.tgs.length > 0) {
        if (!$("walasCss")) {
            Asset.css(silunziUtil.basePath + "css/readwala.css", {id: "walasCss"})
        }
        a.replay = new lunzi.util.replay();
        a.icon = new Icon();
        a.tgs.addEvent("click", function(b) {
            b.preventDefault();
            a.url = this.get("rel");
            a.element = this.getParent("*[data=isvalid] div[root=replay]");
            a.id = this.id;
            a._this = this;
            a.replay.createMessageDialog(a)
        })
    }
};
var RatingGroup = new Class({initialize: function(d, f, a, e, b, h) {
        this.groupId = d;
        this.itemList = $(d).getElements("li");
        this.rating = f.toInt();
        this.tag = a;
        this.relatedid = e;
        this.desc = $(this.groupId + "Desc");
        this.group_id = $(this.groupId + "Point");
        this.marks = $defined(b) && typeof (b) == "object" ? b : false;
        this.callback = h || "";
        var c = 1;
        var g = this;
        this.starList = [];
        if (this.rating == 0 && this.marks) {
            this.marks[this.groupId] = 0
        }
        this.itemList.each(function(j, i) {
            if (i % 2 != 0) {
                j.set("class", "no")
            }
            if (i < this.rating) {
                if (i % 2 != 0) {
                    j.set("class", "on")
                } else {
                    j.set("class", "half")
                }
                this.desc.set("text", j.get("lang"));
                if (this.group_id) {
                    this.group_id.set("text", j.id + ".0")
                }
                if (this.marks) {
                    this.marks[this.groupId] = j.id
                }
            }
            this.starList[i] = j.get("class");
            j.addEvents({mouseover: function() {
                    this.showStatus(j.id);
                    this.desc.set("text", j.get("lang"));
                    if (this.group_id) {
                        this.group_id.set("text", j.id + ".0")
                    }
                }.bind(this),mouseout: function() {
                    this.resetStatus()
                }.bind(this),click: function() {
                    this.vote(j)
                }.bind(this)});
            c++
        }.bind(this))
    },resetStatus: function() {
        var a = 1;
        this.itemList.each(function(c, b) {
            if (this.starList[b] == "on" || this.starList[b] == "half") {
                this.desc.set("text", c.get("lang"));
                if (this.group_id) {
                    this.group_id.set("text", c.id + ".0")
                }
                if (b % 2 != 0) {
                    c.set("class", "on")
                } else {
                    c.set("class", "half")
                }
            } else {
                if (c.hasClass("on") || b % 2 != 0) {
                    c.set("class", "no")
                } else {
                    c.set("class", "")
                }
            }
            a++
        }.bind(this));
        if (!this.itemList.some(function(b) {
            return (b.hasClass("on") || b.hasClass("half"))
        })) {
            $(this.groupId + "Desc").set("text", "");
            if (this.group_id) {
                this.group_id.set("text", "")
            }
        }
    },showStatus: function(b) {
        var a = 1;
        this.itemList.each(function(d, c) {
            if (a <= b) {
                if (c % 2 != 0 || d.hasClass("on")) {
                    d.set("class", "on")
                } else {
                    d.set("class", "half")
                }
            } else {
                if (d.hasClass("on") || c % 2 != 0) {
                    d.set("class", "no")
                } else {
                    d.set("class", "")
                }
            }
            a++
        }.bind(this))
    },vote: function(a) {
        checkLogin(true, function() {
            var d = this.groupId;
            var e = this;
            this.showStatus(a.id);
            if (this.marks) {
                this.marks[this.groupId] = a.id;
                this.rating = a.id;
                this.itemList.each(function(g, f) {
                    this.starList[f] = g.get("class")
                }.bind(this));
                if (this.callback && typeof this.callback == "function") {
                    this.callback()
                } else {
                    if (typeof (showMovieMark) == "function" && this.groupId == "generalmark") {
                        showMovieMark()
                    }
                }
            } else {
                var c = silunziUtil.basePath + "ajax/common/addComment.xhtml", b = {tag: this.tag,relatedid: this.relatedid,marks: d + "=" + a.id};
                silunziUtil.sendRequest(c, b, function(f) {
                    if (f.success) {
                        this.rating = a.id;
                        this.itemList.each(function(h, g) {
                            this.starList[g] = h.get("class")
                        }.bind(this));
                        if (typeof (showMovieMark) == "function" && this.groupId == "generalmark") {
                            showMovieMark()
                        }
                    } else {
                        lunziUtil.alert(f.msg)
                    }
                }.bind(this))
            }
        }.bind(this))
    },fixStar: function(a) {
        this.itemList.each(function(b) {
            b.removeEvents("mouseover");
            b.removeEvents("mouseout");
            b.removeEvents("click")
        })
    }});
lunzi.util.deleteReComment = function(a) {
    checkLogin(true, function() {
        lunziUtil.confirm("确认要删除吗?", function() {
            var c = silunziUtil.basePath + "home/sns/deleteMicroReComment.xhtml?r=" + silunziUtil.rtime();
            var b = {mid: a};
            silunziUtil.sendRequest(c, b, function(d) {
                if (d.success) {
                    document.getElement("div[id=" + a + "]").set("dissolve", {duration: "long",onComplete: function() {
                            this.dispose()
                        }.bind(document.getElement("div[id=" + a + "]"))}).dissolve()
                } else {
                    lunziUtil.alert(d.json.msg)
                }
            })
        })
    })
};
lunzi.util.affix = function(b) {
    var a = function(c) {
        var g = c.getPosition().y, i = c.getStyle("position"), f = c.getDimensions().y, e = $$(".index_wrap")[0], d = $$(".index_wrap")[0].getDimensions().y, h = $$(".index_wrap")[0].getPosition().y;
        window.addEvent("scroll", function() {
            var j = this.getScroll().y;
            if (j > g) {
                if (window.XMLHttpRequest) {
                    c.setStyles({position: "fixed",top: 0})
                } else {
                    c.setStyles({top: j})
                }
            } else {
                c.setStyles({position: "absolute",top: g})
            }
            if (e) {
                if (f + Document.getScrollTop() >= d + h) {
                    e.setStyles({position: "relative"});
                    c.setStyles({position: "absolute",bottom: "0",top: ""})
                } else {
                    e.setStyles({position: "static"})
                }
            }
        })
    };
    if ($type(b) === "array") {
        return b.each(function(c) {
            a(c)
        })
    } else {
        if ($type(b) === "element") {
            a(b)
        }
    }
};
var lunziOverText = new Class({Implements: [Options, Events, Class.Occlude],Binds: ["reposition", "assert", "focus", "hide", "keypress"],options: {element: "label",labelClass: "overTxtLabel",positionOptions: {position: "upperLeft",edge: "upperLeft",offset: {x: 4,y: 2}},poll: false,pollInterval: 250,wrap: false},property: "lunziOverText",initialize: function(b, a) {
        b = this.element = document.id(b);
        if (this.occlude()) {
            return this.occluded
        }
        this.setOptions(a);
        this.attach(b);
        lunziOverText.instances.push(this);
        if (this.options.poll) {
            this.poll()
        }
    },toElement: function() {
        return this.element
    },attach: function() {
        var b = this.element, a = this.options, c = a.textOverride || b.get("alt") || b.get("title");
        if (!c) {
            return this
        }
        var d = this.text = Element(a.element, {"class": a.labelClass,styles: {lineHeight: this.element.getDimensions().y,height: this.element.getDimensions().y,position: "absolute",cursor: "text",color: "#ccc",width: this.element.getDimensions().x,"text-indent": 6},html: c,events: {click: function() {
                    this.element.focus()
                }.bind(this)}}).inject(b, "after");
        if (a.element == "label") {
            if (!b.get("id")) {
                b.set("id", "input_" + String.uniqueID())
            }
            d.set("for", b.get("id"))
        }
        if (a.wrap) {
            this.textHolder = new Element("div.overTxtWrapper", {styles: {lineHeight: "normal",position: "relative"}}).grab(d).inject(b, "before")
        }
        return this.enable()
    },destroy: function() {
        this.element.eliminate(this.property);
        this.disable();
        if (this.text) {
            this.text.destroy()
        }
        if (this.textHolder) {
            this.textHolder.destroy()
        }
        return this
    },disable: function() {
        this.element.removeEvents({focus: this.focus,blur: this.assert,keypress: this.keypress,keyup: this.assert,change: this.assert});
        window.removeEvent("resize", this.reposition);
        this.hide(true, true);
        return this
    },enable: function() {
        this.element.addEvents({focus: this.focus,blur: this.assert,keypress: this.keypress,keyup: this.assert,change: this.assert});
        window.addEvent("resize", this.reposition);
        this.reposition();
        return this
    },wrap: function() {
        if (this.options.element == "label") {
            if (!this.element.get("id")) {
                this.element.set("id", "input_" + String.uniqueID())
            }
            this.text.set("for", this.element.get("id"))
        }
    },startPolling: function() {
        this.pollingPaused = false;
        return this.poll()
    },poll: function(a) {
        if (this.poller && !a) {
            return this
        }
        if (a) {
            clearInterval(this.poller)
        } else {
            this.poller = (function() {
                if (!this.pollingPaused) {
                    this.assert(true)
                }
            }).periodical(this.options.pollInterval, this)
        }
        return this
    },stopPolling: function() {
        this.pollingPaused = true;
        return this.poll(true)
    },focus: function() {
        this.text.setStyle("color", "#dedede");
        return this
    },hide: function(c, a) {
        if (this.text && (this.text.isDisplayed() && (!this.element.get("disabled") || a))) {
            this.text.hide();
            this.fireEvent("textHide", [this.text, this.element]);
            this.pollingPaused = true;
            if (!c) {
                try {
                    this.element.fireEvent("focus");
                    this.element.focus()
                } catch (b) {
                }
            }
        }
        return this
    },show: function() {
        if (this.text && !this.text.isDisplayed()) {
            this.text.show();
            this.reposition();
            this.fireEvent("textShow", [this.text, this.element]);
            this.pollingPaused = false
        }
        return this
    },test: function() {
        return !this.element.get("value")
    },keypress: function() {
        return this["hide"](true)
    },assert: function(a) {
        this.text.setStyle("color", "#ccc");
        return this[this.test() ? "show" : "hide"](a)
    },reposition: function() {
        this.assert(true);
        if (!this.element.isVisible()) {
            return this.stopPolling().hide()
        }
        if (this.text && this.test()) {
            this.text.position(Object.merge({position: "upperLeft",edge: "upperLeft",offset: {x: 0,y: 1}}, {relativeTo: this.element}))
        }
        return this
    }});
lunziOverText.instances = [];
Object.append(lunziOverText, {each: function(a) {
        return lunziOverText.instances.each(function(c, b) {
            if (c.element && c.text) {
                a.call(lunziOverText, c, b)
            }
        })
    },update: function() {
        return lunziOverText.each(function(a) {
            return a.reposition()
        })
    },hideAll: function() {
        return lunziOverText.each(function(a) {
            return a.hide(true, true)
        })
    },showAll: function() {
        return lunziOverText.each(function(a) {
            return a.show()
        })
    }});
lunzi.util.textOver = function(b, a) {
    try {
        if ($$("input" + b + " ,textarea" + b).length > 0) {
            b = $$("input" + b + " ,textarea" + b)
        } else {
            return
        }
        b.each(function(f, e) {
            var d = f.getPosition();
            if (f.hasProperty("alt") && d.x > 0 && d.y > 0 && f.value == "") {
                (function() {
                    if (f.retrieve("label") == null) {
                        var g = new lunziOverText(f);
                        f.store("label", g)
                    } else {
                        lunziOverText.update()
                    }
                }).delay(500)
            }
        })
    } catch (c) {
    }
};
lunzi.util.fixIE = function() {
    if (Browser.ie && 9 > parseInt(Browser.version, 10)) {
        var b = function() {
            1300 > (document.documentElement.clientWidth || document.body.clientWidth) ? document.body.addClass("wrap_mini") : document.body.removeClass("wrap_mini")
        };
        b()
    }
};
var evengo = new Class({Implements: [Options, Events],options: {element: ".eventses",flag: true,fx: "",np: "left",right: 0,times: 3,width: 98,allwidth: 490,parent: "",auto: false,clear: $empty,control: true},initialize: function(b) {
        this.setOptions(b);
        this.element = $(this.options.parent);
        this.options.element = this.element.getElements(".eventses");
        this.elements = this.element.getElements("li");
        var a = this;
        if (this.elements.length > 5 || this.options.auto || this.options.flag) {
            var c = a.element.getElement("ul"), d = c.getElements("li").length * this.options.width;
            this.options.right = c.getStyle("right");
            if (this.elements.length < 10) {
                this.elements.each(function(e) {
                    e.clone().inject(c)
                });
                d = c.getElements("li").length * this.options.width
            }
            c.setStyle("width", d + "px");
            this.options.element.each(function(e) {
                e.addEvent("click", function() {
                    if (a.options.flag) {
                        a.options.flag = false;
                        if (this.getNext()) {
                            a.options.np = "right";
                            var g = -d.toInt() + a.options.allwidth + a.options.times * a.options.width;
                            var f = 0;
                            while (f < a.options.times) {
                                c.getLast().inject(c, "top");
                                f++
                            }
                            c.setStyles({left: "auto",right: g + "px"});
                            a.options.fx.start("right", g, g - a.options.times * a.options.width)
                        } else {
                            a.options.np = "left";
                            a.options.fx.start("left", 0, -a.options.times * a.options.width)
                        }
                    }
                })
            });
            this.options.fx = new Fx.Tween(this.element.getElement("ul"), {duration: 1000,onComplete: function() {
                    var f = this.element.getElement("ul");
                    this.options.flag = true;
                    if (this.options.np == "left") {
                        var e = 0;
                        while (e < this.options.times) {
                            f.getFirst().inject(f);
                            e++
                        }
                    }
                    f.setStyle("left", "0");
                    $clear(this.options.clear);
                    if (this.options.control && this.options.auto) {
                        this.auto()
                    }
                }.bind(this)})
        }
        if (this.options.auto) {
            this.auto();
            this.element.addEvents({mouseenter: function() {
                    a.options.control = false;
                    $clear(a.options.clear)
                },mouseleave: function() {
                    a.options.control = true;
                    a.auto()
                }})
        }
    },auto: function() {
        this.options.clear = this.play.periodical(3000, this)
    },play: function() {
        this.options.np = "left";
        this.options.fx.start("left", 0, -this.options.times * this.options.width)
    }});
var marquee = new Class({Implements: [Options, Events],options: {transition: "fade",autointerval: 5000,items: ".items",tween: {duration: 1000},me: "",autotimer: 0,flag: true,fx: ""},initialize: function(b, a) {
        this.setOptions(a);
        this.element = $(b);
        this.initmarquee();
        this.auto()
    },initmarquee: function() {
        var a = this, b = this.element.getElements(this.options.items);
        b.each(function(d, c) {
            var e = {};
            e.h = d.getDimensions().y;
            e.fx = new Fx.Morph(d, {wait: false,duration: 1000,transition: Fx.Transitions.linear,onComplete: function() {
                    if (this.element.getChildren()) {
                        this.element.getChildren().fade("in")
                    }
                    a.readymarquee()
                }});
            d.store("obj", e);
            if (c == (b.length - 1)) {
                this.readymarquee()
            }
        }.bind(this))
    },readymarquee: function() {
        var a = this.element.getElements(this.options.items).getLast();
        a.setStyles({height: "0px",overflow: "hidden",visibility: "hidden",position: "relative"});
        a.hide();
        a.inject(this.element, "top");
        if (a.getChildren()) {
            a.getChildren().fade("out")
        }
    },show: function() {
        if (this.options.flag) {
            var a = this.element.getElement(this.options.items);
            if (a.retrieve("obj") != null) {
                var b = a.retrieve("obj");
                a.show();
                b.fx.start({height: [0, b.h],opacity: [0, 1]});
                this.options.fx = b.fx
            } else {
                return
            }
        }
    },stop: function() {
        $(this.element.parentNode).addEvents({mouseenter: function() {
                if (this.options.fx) {
                    this.options.fx.pause()
                }
                this.options.flag = false
            }.bind(this),mouseleave: function() {
                if (this.options.fx) {
                    this.options.fx.resume()
                }
                this.options.flag = true
            }.bind(this)})
    },auto: function() {
        this.options.autotimer = this.show.periodical(this.options.autointerval, this);
        this.stop()
    }});
var objectSolid = new Class({Implements: [Options, Events],options: {autointerval: 5000,pr: 162,width: 50,nav: ".choiceNave"},initialize: function(a, c, d, b) {
        this.setOptions(b);
        this.container = $(a);
        this.objWoher = $(c);
        this.objWohin = $(d);
        this.objMouse();
        this.defiend();
        this.cur = this.container.getElement("img");
        this.choice = this.objWoher.getFirst();
        this.textFx();
        this.autotimer = this.autoExecute.periodical(this.options.autointerval, this)
    },defiend: function() {
        this.objWoher.setStyle("width", this.objWoher.getElements("li").length * this.options.width + 10);
        this.options.pr = (this.objWoher.getElements("li").length - 1) * this.options.width + 12;
        $$(this.options.nav).setStyle("right", Browser.Engine.version != 4 ? this.options.pr : this.options.pr - 4)
    },objMouse: function() {
        var a = this;
        this.objWoher.getElements("li").each(function(c, b) {
            if (this.container.retrieve(c.get("lang")) == null) {
                this.container.store(c.get("lang"), new Element("img", {src: c.get("lang"),"class": "choiceImg",styles: {opacity: 0}}).inject(new Element("a", {href: c.getElement("a").get("href"),target: "_blank"}).inject(this.container)))
            }
            c.addEvent("mouseenter", function() {
                a.ansin(this, b)
            })
        }.bind(this));
        this.objWoher.addEvents({mouseenter: function() {
                $clear(this.autotimer)
            }.bind(this),mouseleave: function() {
                this.autotimer = this.autoExecute.periodical(this.options.autointerval, this)
            }.bind(this)})
    },autoExecute: function() {
        if (this.choice.getNext()) {
            var a = this.objWoher.getElements("li").indexOf(this.choice.getNext());
            this.ansin(this.choice.getNext(), a)
        } else {
            this.choice = this.objWoher.getFirst();
            this.ansin(this.choice, 0)
        }
    },ansin: function(c, b) {
        this.choice = c;
        this.cur.morph({opacity: 0,width: 85,height: 35,left: 340,top: 140});
        if (this.container.retrieve(c.get("lang")) != null) {
            this.container.retrieve(c.get("lang")).morph({height: 280,width: 680,opacity: 1,left: 0,top: 0});
            var a = Browser.Engine.version != 4 ? this.options.pr : this.options.pr - 4;
            $$(this.options.nav).tween("right", a - this.options.width * b);
            this.objWohin.innerHTML = this.choice.innerHTML;
            this.myFx.start("opacity", 0, 1);
            this.cur = this.container.retrieve(c.get("lang"))
        }
    },textFx: function() {
        this.myFx = new Fx.Tween(this.objWohin, {duration: "2000",transition: "bounce:out",link: "cancel",onComplete: function() {
                this.container.getElements("img").each(function(a) {
                    if (a != this.cur) {
                        a.setStyles({width: 680,height: 280,left: 680,top: 0})
                    }
                }.bind(this))
            }.bind(this)})
    }});
var adSoild = new Class({Implements: [Options, Events],options: {autointerval: 5000,nav: ".nav",choice: "choice",width: 16,margin: 5,position: {x: 660,y: 80}},initialize: function(a, c, b) {
        this.setOptions(b);
        this.container = $(a);
        this.obj = $(c);
        this.defiend()
    },defiend: function() {
        this.width = this.obj.getDimensions().x;
        this.obj.setStyle("width", this.width);
        this.obj.getElements(this.options.nav).each(function(d, c) {
            if (this.container.retrieve(d.get("name")) == null) {
                var b = new Element("a", {href: d.get("href"),title: d.get("title"),target: "_blank"});
                var a = new Element("img", {src: d.get("name"),styles: {opacity: 0}}).inject(b.inject(this.container));
                if (d.get("config")) {
                    new Element("img", {src: d.get("config"),style: {width: "1px",height: "1px",position: "absolute"}}).inject(b)
                }
                this.container.store(d.get("name"), a);
                if (this.obj.getElements(this.options.nav).length > 1) {
                    d.addEvent("mouseenter", function() {
                        this.ansin(a, c);
                        this.choice = d
                    }.bind(this))
                }
            }
        }.bind(this));
        if (this.obj.getElements(this.options.nav).length > 1) {
            this.choice = this.obj.getFirst();
            this.createFx();
            this.ansin(this.container.retrieve(this.obj.getElement(".nav").get("name")), 0);
            this.autotimer = this.autoExecute.periodical(this.options.autointerval, this);
            this.objMouse()
        } else {
            this.container.getElement("img").setStyle("opacity", 1);
            $("navControl").addClass("none")
        }
    },objMouse: function() {
        this.container.getParent().addEvents({mouseenter: function() {
                $clear(this.autotimer)
            }.bind(this),mouseleave: function() {
                this.autotimer = this.autoExecute.periodical(this.options.autointerval, this)
            }.bind(this)})
    },autoExecute: function() {
        if (this.choice.getNext()) {
            var a = this.obj.getElements(this.options.nav).indexOf(this.choice.getNext());
            this.choice = this.choice.getNext();
            this.ansin(this.container.retrieve(this.choice.get("name")), a)
        } else {
            this.choice = this.obj.getFirst();
            this.ansin(this.container.retrieve(this.choice.get("name")), 0)
        }
    },ansin: function(b, a) {
        this.myFx.start("right", this.width - this.options.width * (a + 1) - this.options.margin * a);
        this.container.getElements("img").each(function(c) {
            if (c != b) {
                c.morph({opacity: 0,width: this.options.position.x / 2,height: this.options.position.y / 2,left: this.options.position.x / 4,top: this.options.position.y / 4})
            }
        }.bind(this));
        b.morph({opacity: 1});
        this.container.getElements("img").setStyles({width: this.options.position.x,height: this.options.position.y,left: 0,top: 0})
    },createFx: function() {
        this.myFx = new Fx.Tween(new Element("span", {styles: {right: this.width - this.options.width}}).addClass(this.options.choice).inject(this.container.getParent()), {duration: "500",transition: Fx.Transitions.Sine,link: "cancel"})
    }});
var fackLayout = new Class({Implements: [Options, Events],options: {clazz: ["off", "on"],annal: ""},initialize: function(c, b, a) {
        this.setOptions(a);
        this.elements = $(c).getElements(b);
        this.options.annal = this.elements.getLast().addClass("on");
        this.build()
    },build: function() {
        var a = this;
        this.elements.addEvent("mouseenter", function() {
            a.options.annal.removeClass("on");
            this.addClass("on");
            a.options.annal = this
        })
    }});
var JUSlideShow8 = new Class({Implements: [Options, Events],options: {right: 0,slider: true},initialize: function(a) {
        this.setOptions(a);
        this.juSlide8Bg = $$(this.options.juSlide8Bg);
        this.juSlide8Menu = $$(this.options.juSlide8Menu);
        this.juSlide8Info = $$(this.options.juSlide8Info);
        this.juSlideMenuImg = $$(this.options.juSlideMenuImg);
        this.juSlide = $(this.options.juSlide);
        this.maxIter = this.juSlide8Bg.length;
        this.currentIter = 0;
        this.constructElement();
        this.isEeven = true;
        this.count = this.options.count;
        this.butPre = $$(this.options.butPre)[0];
        this.butNext = $$(this.options.butNext)[0];
        this.width = this.options.width || this.juSlide8Bg[0].getDimensions().x;
        this.nextIter = 0;
        this.juSlideMenuImg[0].getParent().setStyle("width", this.juSlideMenuImg.length * this.juSlideMenuImg[0].getDimensions().x);
        if (this.juSlideMenuImg[0].getParent(".ju-group")) {
            this.juSlideMenuImg[0].getParent(".ju-group").setStyle("width", 627)
        }
        if (this.juSlideMenuImg.length > 0) {
            [this.butPre, this.butNext].each(function(b) {
                b.addEvents({mouseleave: function(c) {
                        this.fade(1)
                    },mouseenter: function(c) {
                        this.fade(0.5)
                    },click: function(c) {
                        if (this.isEeven) {
                            if ($(c.target) == this.butPre) {
                                this.previous(true)
                            } else {
                                this.next(true)
                            }
                        } else {
                            this.isEeven = false
                        }
                    }.bind(this)})
            }.bind(this))
        } else {
            this.butPre.hide();
            this.butNext.hide()
        }
        this.juSlide.addEvents({mouseleave: function() {
                this.clearTimer();
                this.prepareTimer()
            }.bind(this),mouseenter: function() {
                this.clearTimer()
            }.bind(this)});
        this.juSlide.removeClass("loading");
        this.juSlide8Menu.each(function(c, b) {
            c.addEvents({click: function(d) {
                    d = new Event(d);
                    d.stop();
                    this.goToByClick(b);
                    this.nextIter = b
                }.bind(this)})
        }.bind(this));
        this.juSlide8Info[0].morph({opacity: 1,duration: 200});
        this.juSlideMenuImg[0].addClass("select");
        this.prepareTimer()
    },constructElement: function() {
        this.juSlide8Bg.each(function(b, a) {
            b.setStyles({position: "absolute",left: 0});
            b.setStyle("opacity", 0)
        }.bind(this));
        this.juSlide8Info.each(function(b, a) {
            b.setStyle("opacity", 0)
        }.bind(this));
        this.juSlide8Bg[0].setStyle("opacity", 1);
        this.currInter = -1
    },clearTimer: function() {
        $clear(this.timer)
    },prepareTimer: function() {
        this.timer = this.next.periodical(this.options.transaction, this)
    },previous: function(a) {
        this.nextIter = this.currentIter - 1;
        if (this.nextIter <= -1) {
            this.nextIter = this.maxIter - 1
        }
        if (a) {
            this.clearTimer();
            this.changeItem(this.nextIter, -1);
            return
        }
        this.goTo(this.nextIter)
    },next: function(a) {
        this.nextIter = this.currentIter + 1;
        if (this.nextIter >= this.maxIter) {
            this.nextIter = 0
        }
        if (a) {
            this.clearTimer();
            this.changeItem(this.nextIter);
            return
        }
        this.goTo(this.nextIter)
    },goToByClick: function(a) {
        if (a != this.currentIter) {
            this.clearTimer();
            this.changeItem(a);
            this.prepareTimer()
        }
    },goTo: function(a) {
        this.clearTimer();
        this.changeItem(a);
        this.prepareTimer()
    },slidCousor: function(b, a) {
        if (this.juSlideMenuImg.length <= (this.width / this.juSlideMenuImg[0].getDimensions().x).toInt()) {
            return
        }
        if ((this.juSlideMenuImg.length / this.count).toInt() == 1 || this.count == 1) {
            this.left = this.juSlideMenuImg[0].getDimensions().x * ((this.count == 1) ? (-((b > (this.juSlideMenuImg.length - this.width / this.juSlideMenuImg[0].getDimensions().x).toInt()) ? ((this.juSlideMenuImg.length - this.width / this.juSlideMenuImg[0].getDimensions().x).toInt() + 1) : b)) : ((b >= this.count) ? (-(this.juSlideMenuImg.length % this.count)) : 0));
            this.juSlideMenuImg[0].getParent().tween("margin-left", this.left)
        } else {
            if (((a) ? (b + 1) : b) % this.count == 0 && ((a) ? (b + 1) : b) + ((this.juSlideMenuImg.length % this.count == 0) ? this.count : (this.juSlideMenuImg.length % this.count)) == this.juSlideMenuImg.length) {
                this.left = this.juSlideMenuImg[0].getDimensions().x * (-(((a) ? (b - 1) : b) - this.count + this.juSlideMenuImg.length % this.count));
                this.juSlideMenuImg[0].getParent().tween("margin-left", this.left)
            } else {
                if (((a) ? (b + 1) : b) % this.count == 0) {
                    this.left = this.juSlideMenuImg[0].getDimensions().x * (-((a) ? ((b + 1) / this.count - 1) : b));
                    this.juSlideMenuImg[0].getParent().tween("margin-left", this.left)
                }
            }
        }
    },changeItem: function(c, b) {
        if (this.currentIter != c) {
            if (this.juSlide8Info[c].retrieve("key") == null) {
                this.juSlide8Info[c].store("key", this.juSlide8Info[c].getDimensions())
            }
            if (this.juSlide8Bg[this.currentIter].retrieve("key") == null) {
                this.juSlide8Bg[this.currentIter].store("key", this.juSlide8Bg[this.currentIter].getDimensions())
            }
            if (this.juSlide8Bg[c].retrieve("key") == null) {
                this.juSlide8Bg[c].store("key", this.juSlide8Bg[c].getDimensions())
            }
            var e = this.juSlide8Info[c].retrieve("key");
            var d = this.juSlide8Bg[this.currentIter].retrieve("key");
            var a = this.juSlide8Bg[c].retrieve("key");
            this.juSlide8Bg[c].setStyles({left: 0,top: 0,width: a.x,height: a.y});
            if (this.juSlide8Info.length > 0) {
                this.juSlide8Info[this.currentIter].hide()
            }
            this.juSlide8Bg[this.currentIter].morph({opacity: 0,left: this.options.slider ? d.x : 0,link: "cancel",transition: Fx.Transitions.Sine.easeOut,onComplete: function() {
                    if (this.juSlideMenuImg.length > 0) {
                        this.juSlideMenuImg[this.currentIter].removeClass("select");
                        this.juSlideMenuImg[c].addClass("select");
                        this.slidCousor(c, b)
                    }
                    if (this.juSlide8Info.length > 0) {
                        this.juSlide8Info[c].setStyles({opacity: 1,right: -this.width,width: e.x,height: e.y,bottom: 40}).show();
                        this.juSlide8Info[c].morph({right: this.options.right});
                        this.isEeven = true
                    }
                }.bind(this)});
            this.juSlide8Bg[c].morph({opacity: 1,duration: "long",onComplete: function() {
                    this.juSlide8Bg[this.currentIter].setStyles({left: 0,top: 0,width: d.x,height: d.y})
                }.bind(this)});
            this.currentIter = c
        }
    }});
var slide_3d = new Class({Implements: [Options, Events],options: {w: 150,h: 200,mw: 96,mh: 128,showCount: 0,clear: $empty,autofor: "next",time: 5000},initialize: function(c, b, a) {
        this.element = $(c);
        this.clint = this.element.getDimensions();
        this.loadding = new Element("div", {styles: {width: this.clint.x,height: this.clint.y,background: "url(/css/images/loading3.gif) center center no-repeat",position: "absolute",left: 0,top: 0}}).inject(this.element);
        if (b && $$(b).length > 0) {
            this.dataList = $$(b)
        } else {
            return
        }
        this.init()
    },init: function() {
        new Element("span").addClass("moveLeft moveCursor").addEvent("click", function() {
            this.play("pre", true)
        }.bind(this)).inject(this.element.getParent());
        new Element("span").addClass("moveRight moveCursor").addEvent("click", function() {
            this.play("next", true)
        }.bind(this)).inject(this.element.getParent());
        var b = this.options.showCount;
        this.dataList.each(function(e, d) {
            if (d != 0) {
                e.getParent("div[data-role=3d]").fade(0)
            }
            this.loadImg(e, d == this.options.showCount ? true : false, function() {
                if (d > b + 1) {
                    this.fade(0)
                }
            })
        }.bind(this));
        var c = this.dataList[this.options.showCount].getParent("div[data-role=3d]"), a = c.getDimensions().y;
        c.getParent().setStyle("height", a);
        c.fade(1);
        this.element.getParent().addEvents({mouseenter: function() {
                $$(".moveCursor").fade(1);
                $clear(this.options.clear)
            }.bind(this),mouseleave: function() {
                $$(".moveCursor").fade(0);
                this.autoPlay()
            }.bind(this)});
        this.autoPlay()
    },autoPlay: function() {
        this.options.clear = this.play.periodical(this.options.time, this)
    },play: function(d, b) {
        if (!d) {
            d = this.options.autofor
        }
        var f = this.element.getElements("img"), a = this.element.getElement(".select"), c = f.indexOf(a), e = [];
        if (d === "next") {
            if (b) {
                $$(".moveLeft").fade(1)
            }
            e[0] = this.getPre(f, c, 0, 0);
            e[1] = a;
            e[2] = this.getNex(f, c, 0, 0);
            e[3] = this.getNex(f, c, 1, 0);
            if (e[2]) {
                this.switchContent(e[2], f, c)
            }
            if (!e[3]) {
                if (b) {
                    $$(".moveRight").fade(0)
                }
                this.options.autofor = "pre"
            }
            e.each(function(h, g) {
                if (h && e[2]) {
                    this.resizePicture(h, g == 2 ? true : false, g < 2 ? true : false, function() {
                        if (e[0]) {
                            e[0].fade(0)
                        }
                        e[1].removeClass("select")
                    })
                }
            }.bind(this))
        } else {
            if (b) {
                $$(".moveRight").fade(1)
            }
            e[0] = this.getPre(f, c, 1, 0);
            e[1] = this.getPre(f, c, 0, 0);
            e[2] = a;
            e[3] = this.getNex(f, c, 0, 0);
            if (e[1]) {
                this.switchContent(e[1], f, c)
            }
            if (!e[0]) {
                if (b) {
                    $$(".moveLeft").fade(0)
                }
                this.options.autofor = "next"
            }
            e.each(function(h, g) {
                if (h && e[1]) {
                    this.resizePicture(h, g == 1 ? true : false, g > 0 ? false : true, function() {
                        if (e[3]) {
                            e[3].fade(0)
                        }
                        e[2].removeClass("select")
                    })
                }
            }.bind(this))
        }
    },switchContent: function(e, c, b) {
        this.dataList[b].getParent("div[data-role=3d]").fade(0);
        var a = this.dataList[c.indexOf(e)].getParent("div[data-role=3d]"), d = a.getDimensions().y;
        a.fade(1);
        a.getParent().morph({height: d})
    },getPre: function(e, c, b, a) {
        var d = null;
        while (e[c--] && a <= b) {
            d = e[c];
            a++
        }
        return d
    },getNex: function(e, d, c, a) {
        var b = null;
        while (e[d++] && a <= c) {
            b = e[d];
            a++
        }
        return b
    },resizePicture: function(d, a, b, g) {
        var f = {};
        if (d.width > a ? this.options.w : this.options.mw || d.height > a ? this.options.h : this.options.mh) {
            var e = a ? this.options.w : this.options.mw, c = a ? this.options.h : this.options.mh;
            rateWidth = d.width / e;
            rateHeight = d.height / c;
            if (rateWidth > rateHeight) {
                f.width = a ? this.options.w : this.options.mw;
                f.height = d.height / rateWidth
            } else {
                f.width = d.width / rateHeight;
                f.height = a ? this.options.h : this.options.mh
            }
        } else {
            f.width = d.width;
            f.height = d.height
        }
        if (b) {
            f.left = 0
        } else {
            f.left = this.clint.x - f.width
        }
        if (a) {
            f.left = (this.clint.x - f.width) / 2
        }
        f.top = (this.clint.y - f.height) / 2;
        d.fade(1);
        d.morph({left: f.left,top: f.top,width: f.width,height: f.height,"z-index": a ? 2 : 1,opacity: 1,duration: 50,onComplete: function() {
                if (a) {
                    this.addClass("select")
                }
                g.call(this)
            }.bind(d)})
    },loadImg: function(c, a, d) {
        var b = this;
        Asset.image(c.get("lazeImg"), {styles: {opacity: 0},onLoad: function() {
                b.loadding.fade("out");
                b.resizePicture(this, a, false, d)
            }}).inject(new Element("a", {href: c.get("href") ? c.get("href") : "",title: c.get("text"),target: "_blank"}).inject(this.element))
    }});
var sigleLeep = new Class({Implements: [Options, Events],options: {leepNode: "*[config=isleep]",orientation: ".orientation",isNode: "li",disable: "disable",selector: "select",point: "horizontal",count: 0,size: 0,length: 5,screen: 0,callback: $empty,isrelative: {id: "",hasclass: ".isrelative",event: "mouseenter",callback: $empty}},initialize: function(b, c, a) {
        this.setOptions(a);
        this.element = $(b);
        this.fxNode = $(c);
        this.orientation = this.element.getElements(this.options.orientation);
        this.leepNode = this.fxNode.getElements(this.options.isNode);
        this.screen = this.options.screen != 0 ? this.options.screen : (this.options.point == "vertical" ? this.leepNode[0].getDimensions().y : this.leepNode[0].getDimensions().x);
        this.coreFx();
        this.setPoint();
        this.orientationEventDrive()
    },setPoint: function() {
        this.orientation[0].addClass("disable");
        this.pos = (this.options.point == "vertical") ? (function() {
            return "top"
        })() : (function() {
            this.fxNode.setStyle("width", this.options.size * this.leepNode.length);
            return "left"
        }.bind(this))();
        this.storage = 0;
        this.count = 0;
        this.storagePos = 0;
        this.isFlag = true;
        this.screenCount = (this.screen / this.options.size).toInt();
        this.sigleCount = this.leepNode.length % this.screenCount;
        this.screenfianelCount = (this.leepNode.length / this.screenCount).toInt()
    },orientationEventDrive: function() {
        var a = this;
        if (this.leepNode.length <= this.options.length) {
            this.orientation.hide()
        }
        this.orientation.addEvent("click", function() {
            a.options.callback.apply(a);
            if (this.hasClass("disable") || !a.isFlag) {
                return
            }
            a.isFlag = false;
            if (a.orientation[0] == this) {
                a.count--
            } else {
                a.count++
            }
            a.skipNode(this)
        });
        if ($(this.options.isrelative.id)) {
            this.leepNode.filter(function(b) {
                return b.hasProperty("relative")
            }).addEvent(this.options.isrelative.event, function(b) {
                if (document.getElement("*[isrelative=" + this.get("relative") + "]")) {
                    $(a.options.isrelative.id).getElements(a.options.isrelative.hasclass).hide();
                    document.getElement("*[isrelative=" + this.get("relative") + "]").show()
                } else {
                    a.options.isrelative.callback(this)
                }
                a.leepNode.removeClass("select");
                this.addClass("select")
            })
        }
    },skipNode: function(a) {
        if (this.leepNode[this.count] && $defined(this.leepNode[this.count])) {
            this.coreExecute()
        } else {
            a.addClass("disable");
            this.count = this.storage
        }
    },coreExecute: function() {
        this.options.point == "vertical" ? (function() {
            if (this.screenCount == 1) {
                this.fx.start({top: [this.storagePos, -(this.options.size) * this.count]})
            } else {
                if ((this.screenfianelCount == 1 && this.count == 0) || (this.count == 0 && this.sigleCount != 0)) {
                    this.fx.start({top: [(((this.screenfianelCount == 1) ? 0 : this.storagePos) - this.sigleCount * this.options.size), 0]});
                    return
                }
                if (this.screenfianelCount == this.count) {
                    if (this.screenfianelCount == 1) {
                        this.fx.start({top: [0, -(this.sigleCount * this.options.size)]})
                    } else {
                        this.fx.start({top: [this.storagePos, this.storagePos - this.sigleCount * this.options.size]})
                    }
                } else {
                    this.fx.start({top: [this.storagePos, -(this.screen * this.count)]})
                }
            }
        }.bind(this)()) : (function() {
            if (this.screenCount == 1) {
                this.fx.start({left: [this.storagePos, -(this.options.size) * this.count]})
            } else {
                if ((this.screenfianelCount == 1 && this.count == 0) || (this.count == 0 && this.sigleCount != 0)) {
                    this.fx.start({left: [(((this.screenfianelCount == 1) ? 0 : this.storagePos) - this.sigleCount * this.options.size), 0]});
                    return
                }
                if (this.screenfianelCount == this.count) {
                    if (this.screenfianelCount == 1) {
                        this.fx.start({left: [0, -(this.sigleCount * this.options.size)]})
                    } else {
                        this.fx.start({left: [this.storagePos, this.storagePos - this.sigleCount * this.options.size]})
                    }
                } else {
                    this.fx.start({left: [this.storagePos, -(this.screen * this.count)]})
                }
            }
        }.bind(this)())
    },coreFx: function() {
        if (this.leepNode.length > this.options.length) {
            this.fx = new Fx.Morph(this.fxNode, {duration: "long",transition: Fx.Transitions.Sine.easeOut,onComplete: function() {
                    if (this.storage) {
                        this.orientation.removeClass("disable")
                    }
                    this.storage = this.count;
                    this.storagePos = this.fxNode.getStyle((this.options.point == "vertical") ? "top" : "left").toInt();
                    if (((this.screenCount == 1) ? this.options.length : 0) + this.count >= this.screenfianelCount && this.orientation[1]) {
                        this.orientation[1].addClass("disable")
                    } else {
                        this.orientation[1].removeClass("disable")
                    }
                    if (this.count == 0 && this.orientation[0]) {
                        this.orientation[0].addClass("disable")
                    } else {
                        this.orientation[0].removeClass("disable")
                    }
                    this.isFlag = true;
                    if ($(this.options.isrelative.id) && this.screenCount == 1) {
                        if (document.getElement("*[isrelative=" + this.leepNode[this.count].get("relative") + "]")) {
                            $(this.options.isrelative.id).getElements(this.options.isrelative.hasclass).hide();
                            document.getElement("*[isrelative=" + this.leepNode[this.count].get("relative") + "]").show()
                        } else {
                            this.options.isrelative.callback(this.leepNode[this.count])
                        }
                        this.leepNode.removeClass("select");
                        this.leepNode[this.count].addClass("select")
                    }
                }.bind(this)})
        } else {
            return
        }
    }});
var slideGallery = new Class({Implements: [Options, Events],options: {holder: ".opiList",elementsParent: "ul",elements: "li",nextItem: ".next",prevItem: ".prev",stop: ".stop",start: ".start",speed: 600,duration: 3000,steps: 1,current: 0,transition: "sine:in:out",direction: "horizontal",mode: "callback",currentClass: "current",nextDisableClass: "next-disable",prevDisableClass: "prev-disable",paging: false,pagingEvent: "click",pagingHolder: ".paging",random: false,autoplay: false,autoplayOpposite: false,stopOnHover: true},initialize: function(a, b) {
        if (a.length == null) {
            this.gallery = a
        } else {
            this.gallery = a[0]
        }
        if (!this.gallery) {
            return false
        }
        this.setOptions(b);
        this.holder = this.gallery.getElement(this.options.holder);
        this.itemsParent = this.holder.getElement(this.options.elementsParent);
        this.items = this.itemsParent.getElements(this.options.elements);
        this.next = this.gallery.getElement(this.options.nextItem);
        this.prev = this.gallery.getElement(this.options.prevItem);
        this.stop = this.gallery.getElement(this.options.stop);
        this.start = this.gallery.getElement(this.options.start);
        this.current = this.options.current;
        this.bound = {rotate: this.rotate.bind(this)};
        if (this.options.direction == "horizontal") {
            this.direction = "margin-left";
            this.size = this.items[0].getWidth();
            this.visible = Math.round(this.holder.getWidth() / this.size)
        } else {
            this.direction = "margin-top";
            this.size = this.items[0].getHeight();
            this.visible = Math.round(this.holder.getHeight() / this.size)
        }
        if (this.items.length <= this.visible) {
            if (this.next) {
                this.next.addClass(this.options.nextDisableClass).addEvent("click", function() {
                    return false
                })
            }
            if (this.prev) {
                this.prev.addClass(this.options.prevDisableClass).addEvent("click", function() {
                    return false
                })
            }
            if (this.stop) {
                this.stop.addEvent("click", function() {
                    return false
                })
            }
            if (this.start) {
                this.start.addEvent("click", function() {
                    return false
                })
            }
            this.gallery.addClass("stopped no-active");
            this.fireEvent("start", this.current, this.visible, this.items.length, this.items[this.current]);
            return false
        }
        this.options.steps = this.options.steps > this.visible ? this.visible : this.options.steps;
        this.options.duration = this.options.duration < 1000 ? 1000 : this.options.duration;
        this.options.speed = this.options.speed > 6000 ? 6000 : this.options.speed;
        if (this.options.speed > this.options.duration) {
            this.options.speed = this.options.duration
        }
        this.fx = new Fx.Tween(this.itemsParent, {property: this.direction,duration: this.options.speed,transition: this.options.transition,link: "cancel",fps: 100,onCancel: function() {
                if (!this.callChain()) {
                    this.fireEvent("chainComplete", this.subject)
                }
                return this
            }});
        if (this.options.random) {
            this.shuffle()
        }
        this.getInitialCurrent();
        if (this.options.mode == "circle") {
            while (this.items.length < this.options.steps + this.visible) {
                this.itemsParent.innerHTML += this.itemsParent.innerHTML;
                this.items = this.itemsParent.getElements(this.options.elements)
            }
            for (var c = 0; c < this.current; c++) {
                this.items[c].inject(this.itemsParent, "bottom")
            }
            this.options.paging = false
        } else {
            if (this.options.paging) {
                this.createPaging()
            }
            this.play(false)
        }
        if (this.next) {
            this.next.addEvent("click", function() {
                this.nextSlide();
                return false
            }.bind(this))
        }
        if (this.prev) {
            this.prev.addEvent("click", function() {
                this.prevSlide();
                return false
            }.bind(this))
        }
        if (this.options.autoplay || this.options.autoplayOpposite) {
            this.timer = this.bound.rotate.delay(this.options.duration)
        } else {
            this.gallery.addClass("stopped")
        }
        if (this.start) {
            this.start.addEvent("click", function() {
                clearTimeout(this.timer);
                this.gallery.removeClass("stopped");
                this.timer = this.bound.rotate.delay(this.options.duration);
                return false
            }.bind(this))
        }
        if (this.stop) {
            this.stop.addEvent("click", function() {
                this.gallery.addClass("stopped");
                clearTimeout(this.timer);
                return false
            }.bind(this))
        }
        if (this.options.stopOnHover) {
            this.gallery.addEvent("mouseenter", function() {
                clearTimeout(this.timer)
            }.bind(this));
            this.gallery.addEvent("mouseleave", function() {
                if (!this.gallery.hasClass("stopped")) {
                    clearTimeout(this.timer);
                    this.timer = this.bound.rotate.delay(this.options.duration)
                }
            }.bind(this))
        }
        this.fireEvent("start", this.current, this.visible, this.items.length, this.items[this.current])
    },getInitialCurrent: function() {
        var a = this.items.get("class").indexOf(this.options.currentClass);
        if (a != -1) {
            this.current = a
        } else {
            if (this.current > this.items.length - 1) {
                this.current = this.items.length - 1
            } else {
                if (this.current < 0) {
                    this.current = 0
                }
            }
        }
        if (this.options.mode != "circle" && this.visible + this.current >= this.items.length) {
            this.current = this.items.length - this.visible
        }
        return this
    },rotate: function() {
        if (!this.options.autoplayOpposite) {
            this.nextSlide()
        } else {
            this.prevSlide()
        }
        this.timer = this.bound.rotate.delay(this.options.duration);
        return this
    },play: function(a) {
        if (this.options.mode == "line") {
            this.sidesChecking()
        }
        if (a) {
            this.fx.start(-this.current * this.size)
        } else {
            this.fx.set(-this.current * this.size)
        }
        if (this.options.paging) {
            this.setActivePage()
        }
        this.fireEvent("play", this.current, this.visible, this.items.length, this.items[this.current]);
        return this
    },nextSlide: function() {
        if (this.options.mode != "circle") {
            if (this.visible + this.current >= this.items.length) {
                if (this.options.mode == "callback") {
                    this.current = 0
                }
            } else {
                if (this.visible + this.current + this.options.steps >= this.items.length) {
                    this.current = this.items.length - this.visible
                } else {
                    this.current += this.options.steps
                }
            }
            this.play(true)
        } else {
            var a = this.current;
            if ((this.current += this.options.steps) >= this.items.length) {
                this.current -= this.items.length
            }
            this.fx.start(-this.size * this.options.steps).chain(function() {
                for (var b = 0; b < this.options.steps; b++) {
                    if (a >= this.items.length) {
                        a = 0
                    }
                    this.items[a++].inject(this.itemsParent, "bottom")
                }
                this.fx.set(0)
            }.bind(this));
            this.fireEvent("play", this.current, this.visible, this.items.length, this.items[this.current])
        }
        return this
    },prevSlide: function() {
        if (this.options.mode != "circle") {
            if (this.current <= 0) {
                if (this.options.mode == "callback") {
                    this.current = this.items.length - this.visible
                }
            } else {
                if (this.current - this.options.steps <= 0) {
                    this.current = 0
                } else {
                    this.current -= this.options.steps
                }
            }
            this.play(true)
        } else {
            for (var a = 0; a < this.options.steps; a++) {
                if (this.current - 1 < 0) {
                    this.current = this.items.length
                }
                this.items[--this.current].inject(this.itemsParent, "top")
            }
            this.fx.set(-this.size * this.options.steps).start(0);
            this.fireEvent("play", this.current, this.visible, this.items.length, this.items[this.current])
        }
        return this
    },sidesChecking: function() {
        this.next.removeClass(this.options.nextDisableClass);
        this.prev.removeClass(this.options.prevDisableClass);
        if (this.visible + this.current >= this.items.length) {
            this.next.addClass(this.options.nextDisableClass)
        } else {
            if (this.current == 0) {
                this.prev.addClass(this.options.prevDisableClass)
            }
        }
        return this
    },createPaging: function() {
        this.paging = new Element("ul");
        var c = this.gallery.getElement(this.options.pagingHolder);
        if (c != null) {
            this.paging.inject(c)
        } else {
            this.paging.inject(this.gallery).addClass("paging")
        }
        var b = Math.ceil((this.items.length - this.visible) / this.options.steps) + 1;
        var d = "";
        for (var a = 0; a < b; a++) {
            d += '<li><a href="#">' + parseInt(a + 1) + "</a></li>"
        }
        this.paging = this.paging.set("html", d).getElements("a");
        this.paging.each(function(f, e) {
            f.addEvent(this.options.pagingEvent, function() {
                if (e < b - 1) {
                    this.current = e * this.options.steps
                } else {
                    this.current = this.items.length - this.visible
                }
                this.play(true);
                return false
            }.bind(this))
        }.bind(this));
        return this
    },setActivePage: function() {
        this.paging.removeClass("active")[Math.ceil(this.current / this.options.steps)].addClass("active");
        return this
    },shuffle: function() {
        var a = "";
        this.items.sort(function() {
            return 0.5 - Math.random()
        }).each(function(b) {
            a += new Element("div").adopt(b).get("html")
        });
        this.items = this.itemsParent.set("html", a).getElements(this.options.elements);
        return this
    }});
var fadeGallery = new Class({Extends: slideGallery,initialize: function(a, b) {
        if (b.mode == "circle") {
            b.mode = "callback"
        }
        this.parent(a, b);
        this.fxFade = [];
        this.items.each(function(d, c) {
            this.fxFade[c] = new Fx.Tween(d, {property: "opacity",duration: this.options.speed,transition: this.options.transition,link: "cancel"});
            this.fxFade[c].set(0)
        }.bind(this));
        this.play(false)
    },play: function(a) {
        if (this.previous == null) {
            this.previous = 0;
            return false
        }
        if (this.options.mode == "line") {
            this.sidesChecking()
        }
        if (a) {
            this.fxFade[this.previous].start(0);
            this.fxFade[this.current].start(1)
        } else {
            this.fxFade[this.previous].set(0);
            this.fxFade[this.current].set(1)
        }
        this.previous = this.current;
        if (this.options.paging) {
            this.setActivePage()
        }
        this.fireEvent("play", this.current, this.visible, this.items.length, this.items[this.current])
    }});
var scrollNav = new Class({Implements: [Options, Events],options: {wrapper: window,activeClass: "select",disActiveClass: "disable",managerNode: {manager: "dl",panel: "dt",node: "dt label"},isFlag: false},position: 0,oldposition: 0,managerHeight: 0,oldmanagerHeight: 0,initialize: function(b, a) {
        this.setOptions(a);
        this.wrapper = this.options.wrapper;
        this.nav = this.element = document.id(b);
        this.elements = [];
        this.offset = this.nav.getPosition().y;
        this.isFlag = this.options.isFlag;
        this.manager = this.nav.getElements(this.options.managerNode.manager);
        this.panel = this.nav.getElements(this.options.managerNode.panel);
        this.node = this.nav.getElements(this.options.managerNode.node);
        this.createManager();
        this.attach();
        this.scrolla = new Fx.Scroll(window, {duration: 1000,wait: false,link: "cancel",onComplete: function() {
            }.bind(this),onCancel: function() {
            }.bind(this)})
    },attach: function() {
        if (!this.boundScroll) {
            this.boundScroll = this.scroll.bind(this)
        }
        this.wrapper.addEvent("scroll", this.boundScroll)
    },scroll: function() {
        this.position = this.wrapper.getScroll().y;
        if ((this.position - this.oldposition).abs() < 30) {
            return
        }
        this.oldposition = this.position;
        footH = $$(".ui_footer")[0] ? $$(".ui_footer")[0].getDimensions().y + 40 : 0;
        var c = this.wrapper.getScroll().y, a, b = this.wrapper == window ? document.body : this.wrapper;
        if ((window.getScrollSize().y - footH) <= (this.wrapper.getScroll().y + this.nav.getDimensions().y)) {
            this.nav.setStyles({top: window.getScrollSize().y - footH - this.nav.getDimensions().y,position: "absolute"})
        } else {
            this.nav.removeProperty("style")
        }
        if (!this.isFlag && c > this.offset) {
            this.nav.removeClass("fix_top").addClass("fix_nav");
            this.isFlag = true
        }
        if (this.isFlag && c <= this.offset) {
            this.nav.removeClass("fix_nav").addClass("fix_top");
            this.isFlag = false
        }
        if (this.wrapper.getScroll().y < document.getElement('div[data*="movieBox"]').getDimensions().y) {
            if ($("movieAc")) {
                $("movieAc").addClass("none")
            }
        }
        this.autoScroll()
    },createManager: function() {
        var a = this;
        this.node.addEvent("click", function(d) {
            var b = this.getParent("dl");
            var c = document.getElement("div[data=" + this.get("rel") + "]");
            if (c) {
                if (b.hasClass("select")) {
                    a.scrolla.toElement(c)
                } else {
                    a.scrolla.toElement(c);
                    (function() {
                        a.goWalk(b)
                    }).delay(1000)
                }
            }
        })
    },goWalk: function(a) {
        if (a.retrieve("loadLeftMenuAd") == null) {
            silunziUtil.sendLoad($(a.get("data-news")), "/ajax/loadLeftMenuAd.xhtml", {tag: a.get("data-tag")}, function(c) {
            });
            a.store("loadLeftMenuAd", true)
        }
        this.manager.removeClass("select");
        if (a.get("rel") == "movieBox") {
            if ($("movieAc")) {
                $("movieAc").addClass("none")
            }
        }
        if (a.getPrevious()) {
            a.getAllPrevious().addClass("disable")
        }
        if (a.getNext()) {
            a.getAllNext().removeClass("disable")
        }
        a.removeClass("disable");
        a.addClass("select");
        var b = a.getDimensions().y;
        this.toggleSlide(a, b)
    },autoScroll: function() {
        var a = this;
        this.manager.each(function(b) {
            var c = document.getElement("div[data=" + b.get("rel") + "]");
            if (c) {
                if (a.wrapper.getScroll().y >= c.getCoordinates().top - 200 && a.wrapper.getScroll().y + 500 < (c.getCoordinates().top) + (c.getCoordinates().height)) {
                    a.goWalk(b)
                }
            }
        })
    },toggleSlide: function(a, b) {
        var a = $(a);
        this.manager.each(function(c) {
            if (a.get("rel") == "movieBox") {
                if ($("movieAc")) {
                    $("movieAc").removeClass("none")
                }
            } else {
                if (c != a) {
                    c.setStyle("height", "auto")
                }
            }
        })
    }});
var noobSlide = new Class({initialize: function(d) {
        this.items = d.items;
        this.mode = d.mode || "horizontal";
        this.modes = {horizontal: ["left", "width"],vertical: ["top", "height"]};
        this.size = d.size || 240;
        this.box = d.box.setStyle(this.modes[this.mode][1], (this.size * this.items.length) + "px");
        this.button_event = d.button_event || "click";
        this.handle_event = d.handle_event || "click";
        this.onWalk = d.onWalk || null;
        this.currentIndex = null;
        this.previousIndex = null;
        this.nextIndex = null;
        this.interval = d.interval || 5000;
        this.autoPlay = d.autoPlay || false;
        this._play = null;
        this.handles = d.handles || null;
        if (this.handles) {
            this.addHandleButtons(this.handles)
        }
        this.buttons = {previous: [],next: [],play: [],playback: [],stop: []};
        if (d.addButtons) {
            for (var c in d.addButtons) {
                this.addActionButtons(c, $type(d.addButtons[c]) == "array" ? d.addButtons[c] : [d.addButtons[c]])
            }
        }
        this.fx = new Fx.Tween(this.box, $extend((d.fxOptions || {duration: 500,wait: false}), {property: this.modes[this.mode][0]}));
        this.walk((d.startItem || 0), true, true)
    },addHandleButtons: function(b) {
        for (var c = 0; 
        c < b.length; c++) {
            b[c].addEvent(this.handle_event, this.walk.pass([c, true], this))
        }
    },addActionButtons: function(d, c) {
        for (var e = 0; e < c.length; e++) {
            switch (d) {
                case "previous":
                    c[e].addEvent(this.button_event, this.previous.pass([true], this));
                    break;
                case "next":
                    c[e].addEvent(this.button_event, this.next.pass([true], this));
                    break;
                case "play":
                    c[e].addEvent(this.button_event, this.play.pass([this.interval, "next", false], this));
                    break;
                case "playback":
                    c[e].addEvent(this.button_event, this.play.pass([this.interval, "previous", false], this));
                    break;
                case "stop":
                    c[e].addEvent(this.button_event, this.stop.create({bind: this}));
                    break
            }
            this.buttons[d].push(c[e])
        }
    },previous: function(b) {
        this.walk((this.currentIndex > 0 ? this.currentIndex - 1 : this.items.length - 1), b)
    },next: function(b) {
        this.walk((this.currentIndex < this.items.length - 1 ? this.currentIndex + 1 : 0), b)
    },play: function(e, d, f) {
        this.stop();
        if (!f) {
            this[d](false)
        }
        this._play = this[d].periodical(e, this, [false])
    },stop: function() {
        $clear(this._play)
    },walk: function(e, d, f) {
        if (e != this.currentIndex) {
            this.currentIndex = e;
            this.previousIndex = this.currentIndex + (this.currentIndex > 0 ? -1 : this.items.length - 1);
            this.nextIndex = this.currentIndex + (this.currentIndex < this.items.length - 1 ? 1 : 1 - this.items.length);
            if (d) {
                this.stop()
            }
            if (f) {
                this.fx.cancel().set((this.size * -this.currentIndex) + "px")
            } else {
                this.fx.start(this.size * -this.currentIndex)
            }
            if (d && this.autoPlay) {
                this.play(this.interval, "next", true)
            }
            if (this.onWalk) {
                this.onWalk((this.items[this.currentIndex] || null), (this.handles && this.handles[this.currentIndex] ? this.handles[this.currentIndex] : null))
            }
        }
    }});
var activity = {};
activity.tab = new Class({Implements: [Events, Options],options: {switchType: ".",switchCase: "switchCase",switchContent: "switchContent",switchTo: -1,switchDelay: 300,switchSelect: "select",switchEvent: "click",preventDefault: false,switchCallback: $empty,switchTrigger: $empty},initialize: function() {
        var a = Array.link(arguments, {options: Object.type,element: $defined});
        this.element = $(a.element) || document.body;
        this.setOptions(a.options || {});
        this.group = {navs: null,contents: null};
        this.triggers = $$(this.options.switchType + this.options.switchCase);
        if (this.options.switchTo == -1) {
            this.switchTo = 0
        } else {
            this.switchTo = this.options.switchTo
        }
        this.isDelay = true;
        this.bindGroup();
        this.init();
        this.initTrigger()
    },init: function() {
        if (this.element.retrieve("tab") == null) {
            if (this.group.contents.length) {
                this.group.navs[this.switchTo].addClass(this.options.switchSelect);
                this.exCall($(this.group.navs[this.switchTo]))
            }
            this.attach();
            this.element.store("tab", this)
        } else {
            return null
        }
    },initTrigger: function() {
        this.activeTrigger = (this.triggers.filter(function(a) {
            return a.hasClass("active")
        }))[0]
    },attach: function() {
        var a = this;
        this.group.navs.addEvent(this.options.switchEvent, function(b) {
            if ($defined(b)) {
                b.preventDefault()
            }
            if (this.hasClass(a.options.switchSelect)) {
                return
            }
            if (a.isDelay && a.options.switchEvent == "click") {
                a.isDelay = false;
                a.switchSelection(this)
            } else {
                this.store("isDelay", true);
                (function() {
                    if (this.retrieve("isDelay") == null) {
                        return
                    }
                    a.switchSelection(this)
                }.bind(this)).delay(a.options.switchDelay)
            }
        }).addEvent("mouseleave", function() {
            this.store("isDelay", null)
        });
        this.options.switchCallback && this.options.switchCallback.call(this)
    },exCall: function(a) {
        var b = this;
        if (!a || !a.retrieve("target")) {
            return
        }
        a.addClass("switchCasePass");
        a.retrieve("target").reveal({duration: 150,onComplete: function() {
                if (a.hasClass("switchCasePass")) {
                    a.removeClass("switchCasePass");
                    var c = a.retrieve("callback");
                    if (c != null) {
                        if (!c.singleRun) {
                            a.store("runback", null)
                        }
                        if (a.retrieve("runback") == null) {
                            c.callback.run(b);
                            a.store("runback", true)
                        }
                    }
                    b.isDelay = true
                }
            }})
    },detach: function() {
        this.group.navs.removeEvent(this.options.switchEvent, arguments.callee);
        return this
    },bindGroup: function() {
        this.group.navs = this.element.getElements(this.checkSwitch(this.options.switchCase));
        this.group.contents = this.element.getElements(this.checkSwitch(this.options.switchContent));
        for (var a = 0; a < this.group.navs.length; a++) {
            this.group.navs[a].store("target", this.group.contents[a])
        }
    },switchSelection: function(a) {
        this.tempNode = this.group.navs.filter(function(b) {
            return b.retrieve("target") != null && b.retrieve("target").getStyle("display") != "none"
        });
        if (this.tempNode.length > 0) {
            this.tempNode.retrieve("target").dissolve({duration: 150})
        }
        this.group.navs.removeClass(this.options.switchSelect);
        a.addClass(this.options.switchSelect);
        this.activeTrigger = a;
        this.exCall(a)
    },checkSwitch: function(a) {
        return (".".test(this.options.switchType)) ? (this.options.switchType + a) : (a + this.options.prototype)
    }});
activity.create = new Class({Implements: [Options, Events],options: {edits: "*[even=save]",panel: "*[data-type=panel]",requestUrl: ""},initialize: function(b, a) {
        this.setOptions(a);
        this.element = document.id(b);
        this.boundEvent(this.element)
    },boundEvent: function(a) {
        var b = this;
        a.getElements(this.options.edits).addEvent("click", function(c) {
            c.preventDefault();
            b[this.get("even")].run({node: this,fun: b})
        })
    },save: function(c) {
        var b = {};
        var a = silunziUtil.getValues(c.fun.element);
        b.jsonStr = JSON.encode(a);
        silunzi.util.sendRequest(c.fun.options.requestUrl, a, function(d) {
            if (d.success) {
                lunziUtil.alert("创建活动成功，5秒后跳转到编辑页面！", function() {
                    gotoURL(d.url)
                })
            } else {
                lunziUtil.alert(d.msg)
            }
        })
    }});
activity.edit = new Class({Implements: [Options, Events],options: {edits: [{even: "save",trigger: "click"}, {even: "cancel",trigger: "click"}, {even: "edit",trigger: "click"}, {even: "price_easy",trigger: "blur"}, {even: "price_setup",trigger: "click"}, {even: "price_save",trigger: "click"}, {even: "price_cancel",trigger: "click"}, {even: "price_edit",trigger: "click"}, {even: "price_del",trigger: "click"}, {even: "price_limited",trigger: "click"}, {even: "member_save",trigger: "blur"}],panel: "*[data-type=panel]",saveUrl: "",priceSaveUrl: "",priceDelUrl: "",objectId: ""},initialize: function(b, a) {
        this.setOptions(a);
        this.element = document.id(b);
        this.boundEvent(this.element)
    },boundEvent: function(a) {
        var b = this;
        this.options.edits.each(function(c) {
            a.getElements("*[even=" + c.even + "]").removeEvents();
            a.addEvent(c.trigger + ":relay(*[even=" + c.even + "])", function(d) {
                b[this.get("even")].run({node: this,fun: b});
                return false
            })
        })
    },overText: function() {
        lunziOverText.update()
    },show: function(a) {
        if (a) {
            if (a.hasProperty("style")) {
                a.removeProperty("style")
            } else {
                a.show()
            }
        }
    },validate: function(b) {
        var a = true;
        for (var c = 0; c < b.length; c++) {
            if (!$chk(b[c].get("value")) && b[c].isDisplayed()) {
                silunziUtil.showValidateErr(b[c], b[c].get("alt"));
                a = false;
                break
            }
        }
        return a
    },save: function(c) {
        c.fun.currPanel = c.node.getParent(c.fun.options.panel);
        c.fun.otherPanel = c.fun.currPanel.getSiblings(c.fun.options.panel);
        var b = {}, a;
        if (!c.fun.validate(c.fun.currPanel.getElements("input[type=text][validate]"))) {
            return
        }
        a = silunziUtil.getValues(c.fun.currPanel, ",");
        if ($defined(a.contentdetail)) {
            a.contentdetail = activity.editor.getData()
        }
        b.jsonStr = JSON.encode(a);
        b.mode = a.mode;
        b.activityId = c.fun.options.objectId;
        silunzi.util.sendRequest(c.fun.options.saveUrl, b, function(d) {
            if (d.success) {
                if (b.mode == "addressMode") {
                    setAddress(d.retval)
                }
                d.retval && c.fun.otherPanel.getFirst().set("html", d.retval);
                if (c.node.getSiblings(".acCancel").length && c.node.getSiblings(".acCancel")[0].hasProperty("even")) {
                    c.fun.cancel.run(c)
                }
            } else {
                lunziUtil.alert(d.msg)
            }
        })
    },edit: function(a) {
        a.fun.currPanel = a.node.getParent(a.fun.options.panel);
        a.fun.otherPanel = a.fun.currPanel.getSiblings(a.fun.options.panel);
        a.fun.currPanel.hide();
        a.fun.show(a.fun.otherPanel);
        lunziOverText.update()
    },cancel: function(a) {
        a.fun.currPanel = a.node.getParent(a.fun.options.panel);
        a.fun.otherPanel = a.fun.currPanel.getSiblings(a.fun.options.panel);
        a.fun.currPanel.hide();
        a.fun.show(a.fun.otherPanel);
        lunziOverText.update()
    },member_save: function(a) {
        a.fun.save(a)
    },price_easy: function(a) {
        a.fun.save(a)
    },price_setup: function(a) {
        $("ticketPrices").toggleClass("none")
    },price_save: function(b) {
        b.fun.currPanel = b.node.getParent(b.fun.options.panel);
        var a = {};
        if (!b.fun.validate(b.fun.currPanel.getElements("input[type=text]"))) {
            return
        }
        a = silunziUtil.getValues(b.fun.currPanel, ",");
        a.activityId = b.fun.options.objectId;
        !a.isLimited && (a.isLimited = "", a.limitCount = "");
        silunzi.util.sendRequest(b.fun.options.priceSaveUrl, a, function(c) {
            if (c.success) {
                if (a.feeId) {
                    lunziUtil.alert("修改费用成功！", function() {
                        $$("*[feeId=" + a.feeId + "]").getParent().set("html", c.retval);
                        b.fun.price_cancel.run(b)
                    })
                } else {
                    lunziUtil.alert("添加费用成功！", function() {
                        new Element("tbody", {"class": "h55","data-type": "panel",html: c.retval}).inject(b.fun.element.getElement("thead"), "after");
                        b.fun.price_cancel.run(b)
                    })
                }
            } else {
                lunziUtil.alert(c.msg)
            }
        })
    },price_edit: function(d) {
        d.fun.currPanel = d.node.getParent(d.fun.options.panel);
        d.fun.lastPanel = d.fun.currPanel.getParent().getLast(d.fun.options.panel);
        var a = d.fun.lastPanel.getElements("input");
        for (var b = 0; b < a.length; b++) {
            var c = d.fun.currPanel.getElement("tr").get(a[b].get("name"));
            if (a[b].get("name") == "isLimited") {
                a[b].set("checked", !!c)
            } else {
                if (a[b].get("name") == "limitCount") {
                    !!c ? a[b].show() : a[b].hide()
                }
                c && a[b].set("value", c)
            }
        }
        lunziOverText.update()
    },price_cancel: function(a) {
        a.fun.currPanel = a.node.getParent(a.fun.options.panel);
        a.fun.currPanel.getElements("input[type=text]").set("value", "");
        a.fun.currPanel.getElements("input[name=feeId]").set("value", "");
        a.fun.currPanel.getElements("input[type=checkbox]").each(function(b) {
            b.get("checked") && b.click()
        });
        lunziOverText.update()
    },price_del: function(b) {
        var a = b.node.getParent(b.fun.options.panel);
        lunziUtil.confirm("确定要删除吗？", function() {
            silunzi.util.sendRequest(b.fun.options.priceDelUrl, {activityId: b.fun.options.objectId,feeId: b.node.get("feeId")}, function(c) {
                if (c.success) {
                    lunziUtil.alert(c.retval || c.msg, function() {
                        a.dispose();
                        lunziOverText.update()
                    })
                } else {
                    lunziUtil.alert(c.msg)
                }
            })
        })
    },price_limited: function(b) {
        var a = $(b.node.get("for")) || b.node;
        if (a.get("checked")) {
            $$("input[name=limitCount]").show()
        } else {
            $$("input[name=limitCount]").hide()
        }
        lunziOverText.update()
    },price_focus: function() {
    }});
activity.selectBar = new Class({Implements: [Options, Events],parameter: {},options: {source: "",more: true,moreTrigger: ".plugIn_tabs_more",moreContent: "plugIn_tabs_special",simulate: false,simulateSelect: ".simulate_select",activeSelect: "selected",callback: $empty},initialize: function(a, b) {
        if (!$(a)) {
            return
        } else {
            this.container = $(a)
        }
        b && this.setOptions(b);
        this.content = $(this.options.content);
        this.url = this.options.source;
        this.simulateData = $(this.options.simulateData);
        this.init()
    },init: function() {
        this.bindBar()
    },getParameter: function() {
        this.parameter = silunziUtil.getValues(this.container);
        return this.parameter
    },setFocus: function(a) {
        if (!a) {
            return
        }
        a.getParent("label").getSiblings().removeClass(this.options.activeSelect);
        a.getParent("label").addClass(this.options.activeSelect)
    },clearValues: function() {
        var a = this;
        a.container.getElements('input[type="radio"][name!="hasLogo"]').each(function(b) {
            b.set("checked", false);
            b.getParent("label").removeClass(a.options.activeSelect)
        });
        a.container.getElements("input[type=checkbox]").set("checked", false);
        a.container.getElements("select").set("value", "")
    },clearValue: function(a) {
        var c = 'input[name=="' + a + '"]';
        var b = this;
        b.container.getElements(c).each(function(d) {
            d.set("checked", false);
            d.getParent("label").removeClass(b.options.activeSelect)
        })
    },bindBar: function() {
        var a = this;
        a.container.getElements("input[name]").addEvent("click", function() {
            a.setFocus(this);
            if (this.get("name") == "hasLogo") {
                a.doAllParameter()
            } else {
                a.clearValue("hasLogo");
                a.doParameter()
            }
        });
        a.container.getElements("select").addEvent("change", function() {
            a.doParameter()
        });
        if (a.options.more) {
            a.more = new Fx.Reveal($(a.options.moreContent), {duration: 150});
            if (a.more) {
                $$(a.options.moreTrigger).addEvent("click", function() {
                    a.more.toggle()
                })
            }
        }
        if (a.options.simulate) {
            var a = this;
            this.simulateSelect = $$(this.options.simulateSelect);
            this.simulateSelect.each(function(b) {
                b.addEvent("click", function() {
                    b.getNext().toggle()
                });
                b.getParent().addEvent("mouseleave", function() {
                    b.getNext().hide()
                });
                b.getNext().addEvent("click:relay(a)", function() {
                    if (b.getElement(".simulate_value").get("value") != this.get("data")) {
                        b.getElement(".select_value").set("html", this.get("html"));
                        b.getElement(".simulate_value").set("value", this.get("data"));
                        a.doParameter();
                        b.getNext().hide()
                    }
                })
            })
        }
    },doParameter: function() {
        values = this.getParameter();
        values.hasLogo = false;
        values.keyWord = "";
        if ($("keyWord")) {
            $("keyWord").value = ""
        }
        this.options.callback && this.options.callback.call(this, values)
    },doAllParameter: function() {
        values = this.parameter;
        Object.each(values, function(b, a, d) {
            if (a != "tag") {
                if (values[a] != "special") {
                    values[a] = ""
                }
            }
        });
        values.hasLogo = false;
        values.sign = "";
        values.keyWord = "";
        if ($("keyWord")) {
            $("keyWord").value = ""
        }
        this.options.callback && this.options.callback.call(this, values)
    }});
activity.applyManage = new Class({Implements: [Options, Events],searchBar: "searchBar",sxForm: "sxForm",options: {table: "applyManage_tbl",buttons: {stopBtn: "stopBtn",downloadBtn: "downloadBtn",notifyBtn: "notifyBtn"},urls: {search: "",del: "",send: "",stop: ""},callback: $empty},initialize: function(a) {
        a && this.setOptions(a);
        this.table = $(this.options.table);
        if (!this.table) {
            return
        }
        this.stopBtn = $(this.options.buttons.stopBtn);
        this.downloadBtn = $(this.options.buttons.downloadBtn);
        this.notifyBtn = $(this.options.buttons.notifyBtn);
        this.searchBar = $(this.searchBar);
        this.sxForm = $(this.sxForm);
        this.bindEvent();
        if (this.options.urls.search) {
            this.doSearch(this.options.urls.search, this.table.getProperties("activityId", "isFee"))
        }
    },bindEvent: function() {
        this.stopBtn && this.eventStop();
        this.downloadBtn && this.eventDownload();
        this.notifyBtn && this.eventNotify();
        this.searchBar && this.eventSearch();
        this.eventDelete();
        this.eventSend()
    },eventStop: function() {
        var a = this;
        a.stopBtn.addEvent("click", function() {
            silunzi.util.sendRequest(a.options.urls.stop, {activityId: a.table.get("activityId")}, function(b) {
                if (b.success) {
                    lunziUtil.alert("修改报名状态成功！");
                    a.stopBtn.getFirst().set("text", b.retval)
                } else {
                    lunziUtil.alert(b.retval)
                }
            })
        })
    },eventDownload: function() {
    },eventNotify: function() {
        var a = this;
        a.nicknames = [];
        a.checkboxLength = 0;
        a.table.addEvent("click:relay(thead a)", function() {
            var b = a.table.getElements("tbody tr td:last-child input[type=checkbox]");
            if (b.get("checked").contains(false)) {
                b.set("checked", true)
            } else {
                b.set("checked", false)
            }
            a.updateCheckbox()
        });
        a.table.addEvent("click:relay(tbody input[type=checkbox])", function() {
            a.updateCheckbox()
        });
        a.table.addEvent("click:relay(tbody a.iNote)", function() {
            a.nicknames = [];
            a.nicknames.push(this.getParent("tr").get("nickname"));
            a.memberidList = [];
            a.memberidList.push(this.getParent("tr").get("memberid"));
            a.pushMaillist(a.nicknames, a.memberidList)
        });
        a.notifyBtn.addEvent("click", function() {
            a.nicknames = [];
            a.checkboxChecked.each(function(c, b) {
                a.nicknames.push(c.getParent("tr").get("nickname"))
            });
            a.memberidList = [];
            a.checkboxChecked.each(function(c, b) {
                a.memberidList.push(c.getParent("tr").get("memberid"))
            });
            a.pushMaillist(a.nicknames, a.memberidList)
        })
    },updateCheckbox: function() {
        var a = this;
        a.checkbox = a.table.getElements("tbody tr td:last-child input[type=checkbox]");
        a.checkboxChecked = a.table.getElements("tbody tr td:last-child input[type=checkbox]:checked");
        a.checkboxUnChecked = a.checkbox;
        a.checkboxChecked.each(function(c, b) {
            a.checkboxUnChecked.erase(c)
        });
        if (a.checkboxChecked.length >= 10) {
            a.checkboxUnChecked.set("disabled", true)
        } else {
            a.checkboxUnChecked.set("disabled", false)
        }
    },pushMaillist: function() {
        var a = this;
        if ($("messageDiv").hasClass("none")) {
            $("messageDiv").removeClass("none")
        }
        new Fx.Scroll(window).toElement("messageDiv");
        a.nicknames = a.nicknames.unique();
        a.memberidList = a.memberidList.unique();
        if (a.sxForm && a.nicknames.length && a.memberidList.length && a.sxForm.getElement('input[name="memberidList"]') && a.sxForm.getElement('input[name="userKey"]')) {
            a.sxForm.getElement('input[name="memberidList"]').set("value", a.memberidList.join(","));
            a.sxForm.getElement('input[name="userKey"]').set("value", a.nicknames.join(","));
            a.sxForm.getElement('input[name="subject"]').focus()
        }
    },eventDelete: function() {
        var a = this;
        a.table.addEvent("click:relay(tbody a.iDet)", function() {
            var b = this.getParent("tr");
            lunzi.util.confirm("确定要删除吗？", function() {
                silunzi.util.sendRequest(a.options.urls.del, {applyJoinId: b.get("applyJoinId")}, function() {
                    a.deleteRow(b);
                    a.styleZebra();
                    a.updateCheckbox()
                })
            })
        })
    },eventSearch: function() {
        var a = this;
        a.searchBar.getFirst(".button").addEvent("click", function() {
            a.searchBar.data = {};
            Object.merge(a.searchBar.data, a.table.getProperties("activityId", "isFee"));
            a.searchBar.getElements("input,select").each(function(c, b) {
                Object.merge(a.searchBar.data, JSON.decode('{"' + c.get("name") + '":"' + c.get("value") + '"}'))
            });
            a.doSearch(a.options.urls.search, a.searchBar.data)
        });
        a.table.addEvent("click:relay(tfoot a)", function(b, c) {
            b.preventDefault();
            a.doSearch(this.get("href"), {})
        })
    },doSearch: function(b, c) {
        var a = this;
        silunzi.util.sendRequest(b, c, function(d) {
            if (d.success) {
                a.table.set("html", d.retval);
                a.styleZebra();
                a.updateCheckbox();
                if (a.options.callback) {
                    a.options.callback.apply(a)
                }
            }
        })
    },eventSend: function() {
        var a = this;
        var g = a.sxForm.getElement('input[name="memberidList"]');
        var d = a.sxForm.getElement('input[name="subject"]');
        var f = a.sxForm.getElement('textarea[name="content"]');
        var e = a.sxForm.getElement('input[name="captchaId"]');
        var b = a.sxForm.getElement('input[name="captcha"]');
        var c = a.sxForm.getElement(".button");
        c.addEvent("click", function() {
            if (!$chk(d.get("value"))) {
                silunziUtil.showValidateErr("subject", "标题不能为空！");
                return
            }
            if (!$chk(f.get("value"))) {
                silunziUtil.showValidateErr("content", "通知内容不能为空！");
                return
            }
            silunzi.util.sendRequest(a.options.urls.send, {memberidList: g.get("value"),subject: d.get("value"),content: f.get("value"),captchaId: e.get("value"),captcha: b.get("value")}, function(h) {
                if (h.success) {
                    lunziUtil.alert(h.retval || "发送成功！", function() {
                        $("messageDiv").addClass("none")
                    })
                } else {
                    refreshActivityCaptcha("activityCaptcha");
                    lunziUtil.alert(h.msg)
                }
            })
        })
    },styleZebra: function() {
        var a = this;
        a.table.getElements("tbody tr:even").addClass("zebra");
        a.table.getElements("tbody tr:odd").removeClass("zebra")
    },deleteRow: function(a) {
        a && a.dispose()
    }});
activity.even = new Class({Implements: [Options, Events],options: {container: "",events: [{name: "",url: "",event: ""}],objectId: ""},initialize: function(a) {
        this.setOptions(a);
        this.bindEvent();
        this.container = $(this.options.container) || document.body
    },bindEvent: function() {
        var a = this;
        a.options.events.each(function(b) {
            a.el = $$("*[even=" + b.name + "]");
            if (a.el.length > 0) {
                a.el.store("name", b.name);
                b.url && a.el.store("cleanUrl", b.url);
                b.url && a.el.store("url", b.url + "?activityId=" + a.options.objectId);
                a.el.store("event", b.event);
                a.el.each(function(c) {
                    c.addEvent(c.retrieve("event"), function() {
                        var d = this;
                        checkLogin(true, function() {
                            a[d.get("even")] && a[d.get("even")].call(this, d, a)
                        })
                    })
                })
            }
        })
    },createAc: function(b, a) {
        lunzi.util.maskContent("", a.options.container, "发起新活动", 582, a.options.container, "", "", "", false, "", function() {
            lunzi.util.textOver(".acText,.dateTips");
            lunziOverText.update()
        }, true)
    },saveAc: function(e, b) {
        var c = e.retrieve("url");
        var d = {};
        var a = silunziUtil.getValues(b.container);
        d.jsonStr = JSON.encode(a);
        silunzi.util.sendRequest(c, a, function(f) {
            if (f.success) {
                gotoURL(f.url)
            } else {
                if (f.msg == "unbindmobile") {
                    lunzi.util.confirm("发起活动需要绑定手机验证，请先绑定手机！", function() {
                        silunziUtil.openwin("http://www.silunzi.com/home/acct/bindMobile.xhtml", "_blank")
                    })
                } else {
                    var g = f.msg;
                    if (g == "1") {
                        lunziUtil.alert("您的发表体验机会已用完，完善账户信息就可以使用养车客、站内信、活动、知道、论坛的所有功能啦！", function() {
                            gotoURL("http://www.silunzi.com/home/acct/safetyCenter.xhtml")
                        })
                    } else {
                        if (g == "7") {
                            lunziUtil.alert("您的发表体验机会已用完，确认您的邮件地址就可以使用养车客、站内信、活动、知道、论坛的所有功能啦！", function() {
                                gotoURL("http://www.silunzi.com/home/acct/safetyCenter.xhtml")
                            })
                        } else {
                            if (g == "0") {
                                lunziUtil.alert("非法请求！")
                            } else {
                                if (g == "51") {
                                    lunziUtil.alert("操作过于频繁！")
                                }
                            }
                        }
                    }
                    if (g == "1" || g == "7" || g == "0" || g == "51") {
                        return
                    }
                    lunziUtil.alert(g)
                }
            }
        })
    },copyAc: function(c, a) {
        var b = c.retrieve("url");
        lunzi.util.issure("", "copyAcAlert", "", 490, "copyConfirm", function() {
            lunzi.util.container.copyConfirm.dispose("copyConfirm");
            silunzi.util.sendRequest(b, "", function(d) {
                if (d.success) {
                    gotoURL(d.url)
                } else {
                    lunziUtil.alert(d.msg)
                }
            })
        })
    },deleteAc: function(c, a) {
        var b = c.retrieve("url");
        lunziUtil.confirm("确定要删除吗？", function() {
            silunzi.util.sendRequest(b, "", function(d) {
                if (d.success) {
                    gotoURL(d.url)
                } else {
                    lunziUtil.alert(d.msg)
                }
            })
        })
    },publishAc: function(f, a) {
        var c = f.retrieve("cleanUrl");
        var b = {};
        b.jsonStr = {};
        var e = document.getElements("*[data-type=savedata]");
        var d = {};
        document.getElements("*[data-type=price]").each(function(h, g) {
            d[g] = JSON.encode(silunziUtil.getValues(h))
        });
        e.each(function(h, g) {
            if (h.name == "activityId") {
                b[h.get("name")] = h.get("value")
            } else {
                if (h.type == "radio") {
                    if (h.checked) {
                        b.jsonStr[h.get("name")] = h.get("value")
                    }
                } else {
                    b.jsonStr[h.get("name")] = (h.match("textArea")) ? (activity.editor.getData()) : h.get("value")
                }
            }
        });
        b.allFee = JSON.encode(d);
        b.jsonStr = JSON.encode(b.jsonStr);
        silunzi.util.sendRequest(c, b, function(g) {
            if (g.success) {
                if (g.retval.contains("http")) {
                    gotoURL(g.retval)
                } else {
                    gotoURL(silunziUtil.basePath + g.retval)
                }
            } else {
                lunziUtil.alert(g.msg)
            }
        })
    },joinAc: function(c, a) {
        var b = c.retrieve("url");
        if (a.toggle) {
            return
        }
        a.toggle = true;
        if ($("joinDialog")) {
            lunzi.util.issure("", "joinDialog", "活动报名", 420, "keys", function() {
                if (!silunziUtil.baseValidForm("joinDialog")) {
                    return false
                }
                lunzi.util.container.keys.dispose("keys");
                var e = silunziUtil.getValues("joinDialog");
                var g = $("joinJsonData").getElements("input[type=text]");
                var f = "{";
                g.each(function(i, h) {
                    if (i.get("value") != "") {
                        f += '"' + i.get("lang") + '":"' + i.get("value") + '",'
                    }
                });
                f += "}";
                var d = JSON.decode(f);
                e.jsonString = JSON.encode(d);
                silunzi.util.sendRequest(b, e, function(h) {
                    a.toggle = false;
                    if (h.success) {
                        var i = a.getShareHtml();
                        lunzi.util.maskContent("", i, "报名提醒", 560, "keys", "", "", "", true, function() {
                            refreshPage()
                        }, function() {
                            if ($("superShare")) {
                                $("bdshare").inject("superShare");
                                $("bdshare").removeProperty("style")
                            }
                        })
                    } else {
                        lunziUtil.alert(h.msg)
                    }
                })
            }, "填写好了，确认", function() {
                a.toggle = false
            })
        } else {
            silunzi.util.sendRequest(b, "", function(d) {
                a.toggle = false;
                if (d.success) {
                    var e = a.getShareHtml();
                    lunzi.util.maskContent("", e, "报名提醒", 560, "keys", "", "", "", true, function() {
                        refreshPage()
                    }, function() {
                        if ($("superShare")) {
                            $("bdshare").inject("superShare");
                            $("bdshare").removeProperty("style")
                        }
                    })
                } else {
                    lunziUtil.alert(d.msg)
                }
            })
        }
    },getShareHtml: function() {
        var a = '<div style="width:80%;margin:0 auto;height:100px;overflow:hidden;line-height:100px;font-size:28px;font-weight:bold;margin-top:10px;"><img height="100" style="float:left;" src="http://img5.silunzi.com/css/home/register_succ.png">恭喜，已报名成功！</div>';
        if (_bd_share_config && _bd_share_config.common.bdText) {
            a += '<div style="width: 80%; margin: 10px auto 0;"><div style="font-size: 16px; padding: 0px 0px 20px; line-height: 23px;"><div style="height:auto;background:#f9f9f9;border:1px solid #bbb;padding:15px;outline:none;" id="editShareDesc">' + _bd_share_config.common.bdText + '</div><div style="margin-top:10px;">把内容分享到：</div>';
            a += '<div class="superShare" id="superShare" style="margin-top:5px;"></div></div></div>'
        }
        return a
    },quitAc: function(c, a) {
        var b = c.retrieve("url");
        silunzi.util.sendRequest(b, "", function(d) {
            if (d.success) {
                refreshPage()
            } else {
                lunziUtil.alert(d.msg)
            }
        })
    },remindAc: function(c, a) {
        var b = c.retrieve("url");
        silunzi.util.sendRequest(b, "", function(d) {
            if (d.success) {
                $("agendaid").value = d.agendaid;
                lunzi.util.issure("", "agenda", "设置短信提醒", 310, "agenda", function() {
                    if ($("agendamobile").value != "") {
                        values = {agendaid: $("agendaid").value,sendtime: $("sendtime").value,mobile: $("agendamobile").value};
                        silunzi.util.sendRequest("/exchange/subject/saveAgenda.xhtml", values, function(e) {
                            if (e.success) {
                                lunziUtil.container.agenda.dispose("agenda");
                                lunziUtil.alert("提交成功！你可以在<a href='/home/sns/myLifePlans.xhtml' target='_blank' class='brown'>生活安排</a>查看或修改内容。", "", "", 310)
                            } else {
                                lunziUtil.alert(e.msg, "", "", 310)
                            }
                        })
                    } else {
                        lunziUtil.alert("请填写短信通知的手机号码！", "", "", 310);
                        return false
                    }
                })
            } else {
                if (d.errorMap) {
                    lunziUtil.alert('你已设置提醒，请到<a href="/home/sns/myLifePlans.xhtml" target="_blank">生活安排</a>中查看或修改内容。', "", "", 330)
                } else {
                    lunziUtil.alert(d.msg, "", "", 310)
                }
            }
        })
    },spreadAc: function(d, b) {
        var c = d.retrieve("url");
        var a = silunziUtil.getValues("isWb_content");
        var e = $("Wb");
        if (e) {
            if (e.get("checked")) {
                silunzi.util.sendRequest(c, a, function(f) {
                    if (f.success) {
                        lunziUtil.alert("发布到微博成功！")
                    } else {
                        lunziUtil.alert(f.msg)
                    }
                })
            } else {
                lunziUtil.alert("请先绑定微博！", function() {
                    e.focus()
                })
            }
        } else {
            silunzi.util.sendRequest(c, a, function(f) {
                if (f.success) {
                    lunziUtil.alert("邀请成功！")
                } else {
                    lunziUtil.alert(f.msg)
                }
            })
        }
    }});
activity.countDown = new Class({Implements: [Options, Events],options: {activityId: "",url: "",timer: "timerAc",joinType: "joinType"},initialize: function(a) {
        this.setOptions(a);
        this.timer = this.options.timer;
        this.joinType = this.options.joinType;
        this.activityId = this.options.activityId;
        this.url = this.options.url;
        this.getTime()
    },getTime: function() {
        var a = this;
        silunzi.util.sendRequest(a.url, {activityId: a.activityId}, function(b) {
            if (b.success) {
                a.remain = b.retval * 1;
                if (a.remain <= 0) {
                    $(a.timer) && $(a.timer).dispose();
                    $(a.joinType) && $(a.joinType).show()
                } else {
                    $(a.timer) && $(a.timer).show();
                    $(a.joinType) && $(a.joinType).hide();
                    a.pfun = a.setTime.periodical(1000, {countDown: a})
                }
            } else {
            }
        })
    },setTime: function() {
        var a = this.countDown;
        var e = Math.floor(a.remain / (1000 * 60 * 60 * 24)) % 30;
        var c = Math.floor(a.remain / (1000 * 60 * 60)) % 24;
        var d = Math.floor(a.remain / (1000 * 60)) % 60;
        var b = Math.floor(a.remain / 1000) % 60;
        $("RemainD").innerHTML = (e < 10 ? "0" : "") + e;
        $("RemainH").innerHTML = (c < 10 ? "0" : "") + c;
        $("RemainM").innerHTML = (d < 10 ? "0" : "") + d;
        $("RemainS").innerHTML = (b < 10 ? "0" : "") + b;
        a.remain -= 1000;
        if (((a.remain / 1000).toInt() * 1000) % 60000 == 0) {
            $clear(a.pfun);
            a.getTime && a.getTime.call(a)
        }
        if (a.remain < 0) {
            $clear(a.pfun);
            return
        }
    }});
activity.layout = new Class({Implements: [Options, Events],options: {bindFixed: [],menus: {},toggle: "sideTags"},fixedT: null,catchFixed: {},menu: null,menuMaxTop: 67,menuFx: null,toggleCatch: false,autoToggle: false,loading: [],initialize: function(a) {
        this.setOptions(a);
        window.addEvents({scroll: function() {
                this.scroll()
            }.bind(this),resize: function() {
                this.resize()
            }.bind(this)});
        this.resize();
        this.createMenu()
    },createMenu: function() {
        this.menu = new Element("div", {"class": "superMore"}).inject(document.body);
        new Element("em").addEvent("click", function() {
            if (!this.menu.retrieve("key")) {
                this.toggleMenu();
                this.menu.store("key", true)
            } else {
                this.doToggleMenu()
            }
        }.bind(this)).inject(this.menu);
        document.addEvent("click", function(b) {
            var a = $(b.target);
            if (a != this.menu && !this.menu.contains(a)) {
                this.doToggleMenu(true)
            }
        }.bind(this))
    },toggleMenu: function() {
        if (!this.options.menus) {
            return
        }
        this.meunToggleFlag = true;
        this.menuUl = new Element("ul").inject(this.menu);
        this.menuFx = new Fx.Morph(this.menuUl, {duration: 400,link: "cancel",onComplete: function() {
                this.meunToggleFlag = !this.meunToggleFlag
            }.bind(this)});
        var a = Object.values(this.options.menus);
        Object.keys(this.options.menus).each(function(f, c) {
            if (f == "handle") {
                new Element("li", {html: a[c],"class": "headle"}).addEvent("click", function() {
                    this.doToggleMenu()
                }.bind(this)).inject(this.menuUl)
            } else {
                if (f == "typeMenu") {
                    var d = Object.values(a[c]), e = new Element("li", {"class": "typeMenu clear"}).inject(this.menuUl);
                    Object.keys(a[c]).each(function(h, j) {
                        new Element("a", {href: h,html: d[j]}).inject(e)
                    })
                } else {
                    if (f == "spreadMenu") {
                        var g = Object.values(a[c]), b = new Element("li", {"class": "spreadMenu clear"}).inject(this.menuUl);
                        Object.keys(a[c]).each(function(h, j) {
                            new Element("a", {href: h,html: g[j]}).inject(b)
                        })
                    } else {
                        if (f == "selector") {
                            this.menuUl.getElement("a:contains(" + a[c] + ")").addClass("select")
                        } else {
                            new Element("a", {href: f,title: a[c],html: a[c]}).inject(new Element("li").inject(this.menuUl))
                        }
                    }
                }
            }
        }.bind(this));
        this.menuH = this.menuUl.getDimensions().y - 2;
        this.doToggleMenu()
    },doToggleMenu: function(a) {
        if (this.meunToggleFlag && !a) {
            this.menuFx.start({opacity: [0, 1],width: [0, 200],height: [0, this.menuH]})
        } else {
            if (!this.menuFx || this.menuFx && this.menuFx.element.getDimensions().height < 50) {
                return
            }
            this.menuFx.start({opacity: [1, 0],width: [200, 0],height: [this.menuH, 0]})
        }
    },resize: function() {
        this.scrollX = window.getScroll().x;
        if (document.getWidth() < 1024) {
            if (this.fixedT) {
                this.fixedT.setStyles({width: 1024,left: -this.scrollX});
                this.fixedT.getElements(".superInnerPlugs").addClass("superChangePlugs")
            }
            if (Browser.ie) {
                $("_body").addClass("superLayout_ie")
            }
        } else {
            if (this.fixedT) {
                this.fixedT.setStyles({width: "100%",left: 0});
                this.fixedT.getElements(".superInnerPlugs").removeClass("superChangePlugs")
            }
            if (Browser.ie) {
                $("_body").removeClass("superLayout_ie")
            }
        }
    },scroll: function() {
        if (Browser.ie6) {
            return
        }
        this.initHtml();
        this.scrollY = window.getScroll().y;
        if (this.fixedT && this.scrollY >= $("footPlace").getPosition().y - this.fixedT.getDimensions().height) {
            this.fixedT.setStyle("top", $("footPlace").getPosition().y - this.fixedT.getDimensions().height - this.scrollY);
            return
        } else {
            this.fixedT.setStyle("top", 0)
        }
        this.options.bindFixed.each(function(a) {
            if (this.scrollY > Object.values(a)[0].getPosition().y - 100) {
                if (this.catchFixed[Object.keys(a)[0]]) {
                    return
                }
                this[Object.keys(a)[0]]("big", Object.values(a)[0]);
                this.catchFixed[Object.keys(a)[0]] = true
            } else {
                if (!this.catchFixed[Object.keys(a)[0]]) {
                    return
                }
                this[Object.keys(a)[0]]("min", Object.values(a)[0]);
                this.catchFixed[Object.keys(a)[0]] = null
            }
        }.bind(this));
        if (this.scrollY > this.getBottomY() - 80) {
            this.fixedT.setStyle("top", this.getBottomY() - this.scrollY - 80)
        }
        this.resize();
        if (this.scrollY <= this.menuMaxTop) {
            if (this.menu) {
                this.menu.setStyle("top", this.menuMaxTop)
            }
        } else {
            if (this.menu) {
                this.menu.setStyle("top", "23px")
            }
        }
    },titleCallback: function(b, a) {
        if (b == "big") {
            if (this.fixedT) {
                this.fixedT.show();
                this.fixedT.store("title", $("superTitle").getParent())
            }
            if (!this.fixedT.getElement("superTitle")) {
                $("superTitle").inject(this.fixedT.getElement("dl[data-type=inside]"))
            }
        } else {
            if (this.fixedT) {
                $("superTitle").inject(this.fixedT.retrieve("title"));
                this.fixedT.hide()
            }
        }
    },walaCallback: function(b, a) {
        if (!this.fixedT) {
            return
        }
        if ($("wala_listing_content")) {
            if (b == "big") {
                if (!this.fixedT.retrieve("walaText")) {
                    this.fixedT.store("walaTitle", $("walaBt").getParent())
                }
                $("walaBt").inject(this.fixedT.getElement("div[data-type=wala]"));
                this.fixedT.store("walaText", $("wala_listing_content").getParent());
                $("wala_listing_content").inject(this.fixedT.getElement("div[data-type=wala]"))
            } else {
                $("walaBt").inject(this.fixedT.retrieve("walaTitle"), "top");
                $("wala_listing_content").inject(this.fixedT.retrieve("walaText"), "top")
            }
        }
    },footerCallback: function(b, a) {
        if (!this.fixedT) {
            return
        }
        if (a) {
            this.loading = $$(".ui_loading");
            if (this.loading.length > 0) {
                if (!this.footer) {
                    this.footer = $("footerContaner")
                }
                if (this.loading[this.loading.length - 1].getPosition().y < this.footer.getPosition().y) {
                    return
                }
                this.floor = document.getElement("div[data-id=footerCallback]");
                if (!this.footer && !this.floor) {
                    return
                }
                if (b == "big") {
                    this.floor.setStyle("background", "#fff").inject(new Element("dd").inject(this.fixedT.getElement("dl[data-type=inside]"), "bottom"))
                } else {
                    this.floor.inject("generalSuperPanel", "bottom")
                }
            } else {
                return
            }
        }
    },initHtml: function() {
        if (this.fixedT) {
            return
        }
        this.fixedT = new Element("div", {"class": "superTitle_fixed",html: '<div class="sf_inner clear"><div class="sf_left"><dl class="superTop_fixed clear" data-type="inside"></dl></div><div class="superWalaFixed" id="superWalaFixed"><div class="superWalaFixedInner"><div class="ui_wala ui_wala_isRightWala" data-type="wala"></div></div></div></div>'}).inject(document.body)
    },getBottomY: function() {
        return $("superFooter").getPosition().y
    }});
(function(h, e) {
    var b = new Date(), l = [b.getFullYear(), b.getMonth(), b.getDate()].join("-"), f = new Date(b.getFullYear(), b.getMonth(), b.getDate()), k = h.document;
    function c(d) {
        this.version = "1.5";
        this.isOpen = false;
        this.focus = false;
        this.id = null;
        this.container = null;
        this.element = null;
        this.selectedDate = null;
        this.opts = {year: new Date().getFullYear(),month: new Date().getMonth(),dayNames: ["日", "一", "二", "三", "四", "五", "六"],dayNamesFull: ["日", "一", "二", "三", "四", "五", "六"],monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],monthNamesFull: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],startDay: 0,weekNumbers: false,selectOtherMonths: false,showOtherMonths: true,showNavigation: true,hasTimeSelector: false,months: 1,rel: null,inline: false,disablePast: false,dateFormat: "Y-m-d",position: "bottom",offerset: {x: 0,y: 0},minDate: null,maxDate: null,selectorTime: false,onBeforeOpen: function() {
            },onBeforeClose: function() {
            },onOpen: function() {
            },onClose: function() {
            },onSelect: function() {
            },onBeforeShowDay: function() {
                return [true, ""]
            }};
        for (var o in d) {
            if (d.hasOwnProperty(o)) {
                this.opts[o] = d[o]
            }
        }
        this.init.call(this)
    }
    c.Util = {addClass: function(o, d) {
            if (o && !this.hasClass(o, d)) {
                o.className += o.className.length > 0 ? " " + d : d
            }
        },hasClass: function(o, d) {
            if (o && typeof o.className != "undefined" && typeof o.nodeType != "undefined" && o.nodeType === 1) {
                return o.className.match(new RegExp("(\\s|^)" + d + "(\\s|$)"))
            }
            return false
        },removeClass: function(p, d) {
            if (this.hasClass(p, d)) {
                var o = new RegExp("(\\s|^)" + d + "(\\s|$)");
                p.className = p.className.replace(o, " ")
            }
        },addEvent: function(p, o, d) {
            $(p).addEvent(o, d)
        },getElementsByClass: function(s, o, v) {
            var u = [];
            if (o === null) {
                o = k
            }
            if (v === null) {
                v = "*"
            }
            var q = o.getElementsByTagName(v);
            var d = q.length;
            var t = new RegExp("(^|\\s)" + s + "(\\s|$)");
            for (var r = 0, p = 0; r < d; r++) {
                if (t.test(q[r].className)) {
                    u[p] = q[r];
                    p++
                }
            }
            return u
        },getEventTarget: function(o) {
            var d;
            if (!o) {
                o = h.event
            }
            if (o.target) {
                d = o.target
            } else {
                if (o.srcElement) {
                    d = o.srcElement
                }
            }
            if (d.nodeType == 3) {
                d = d.parentNode
            }
            return d
        }};
    function m(o) {
        var p, d, q = o ? 8 : 7, r = k.createElement("tr");
        for (p = 0; 
        p < q; p++) {
            d = k.createElement("td");
            c.Util.addClass(d, "bcal-empty");
            r.appendChild(d)
        }
        return r
    }
    function j(o) {
        var p = 0, d = 0;
        if (o.offsetParent) {
            do {
                p += o.offsetLeft;
                d += o.offsetTop
            } while (o = o.offsetParent);
            return [p, d]
        }
    }
    function a(o, d) {
        if (o > 0 && o < d - 1) {
            return 0
        } else {
            if (o > 0 && o === d - 1) {
                return 2
            } else {
                if (o === 0 && o === d - 1) {
                    return 3
                } else {
                    if (o === 0 && o < d - 1) {
                        return 1
                    }
                }
            }
        }
    }
    function n(u, p) {
        function t(v) {
            return (v + "").length === 2 ? v : "0" + v
        }
        var q, d, s, o = [], r = new Date(p);
        for (q = 0, d = u.length; q < d; q++) {
            s = u.charAt(q);
            switch (s) {
                case "Y":
                    o.push(r.getFullYear());
                    break;
                case "y":
                    o.push((r.getFullYear() + "").slice(-2));
                    break;
                case "m":
                    o.push(t(r.getMonth() + 1));
                    break;
                case "n":
                    o.push(r.getMonth() + 1);
                    break;
                case "F":
                    o.push(this.opts.monthNamesFull[r.getMonth()]);
                    break;
                case "M":
                    o.push(this.opts.monthNames[r.getMonth()]);
                    break;
                case "d":
                    o.push(t(r.getDate()));
                    break;
                case "j":
                    o.push(r.getDate());
                    break;
                case "D":
                    o.push(this.opts.dayNamesFull[r.getDay()].slice(0, 3));
                    break;
                case "l":
                    o.push(this.opts.dayNamesFull[r.getDay()]);
                    break;
                default:
                    o.push(s)
            }
        }
        return o.join("")
    }
    function g(d, o) {
        var p = Object.prototype.toString.call(o).slice(8, -1);
        return o !== e && o !== null && p === d
    }
    c.prototype = {init: function() {
            var d = this, p = 0, q;
            d.element = k.getElementById(d.opts.element), div = null;
            if (!d.element) {
                return
            }
            if (d.element.nodeType === 1 && d.element.nodeName == "INPUT" && d.element.value.length > 0) {
                var o = new Date(Date.parse(d.element.value));
                d.selectedDate = new Date(o.getUTCFullYear(), o.getUTCMonth(), o.getUTCDate());
                d.opts.year = d.selectedDate.getFullYear();
                d.opts.month = d.selectedDate.getMonth()
            }
            d.element.style.cursor = "pointer";
            if (!d.opts.inline && $(d.element).retrieve("key") == null) {
                $(d.element).store("key", true);
                c.Util.addEvent(d.element, "focus", function(r) {
                    div = d.creatCalendarNode();
                    if (d.isOpen) {
                        d.close()
                    } else {
                        d.open()
                    }
                });
                c.Util.addEvent(d.element, "blur", function(r) {
                    if (d.isOpen && !d.focus) {
                        d.close()
                    }
                });
                c.Util.addEvent(d.element, "keydown", function(s) {
                    div = d.creatCalendarNode();
                    var r = s.charCode ? s.charCode : s.keyCode ? s.keyCode : 0;
                    switch (r) {
                        case 9:
                            d.close();
                            break;
                        case 27:
                            d.close();
                            break
                    }
                });
                document.addEvent("mousedown", function(t) {
                    div = d.creatCalendarNode();
                    var s = c.Util.getEventTarget(t), r = $(d.container);
                    s = $(s);
                    if (s != r && !r.contains(s) && s != $(d.element)) {
                        d.close.call(d)
                    }
                })
            } else {
                d.element.appendChild(div)
            }
            return d
        },creatCalendarNode: function() {
            if (!this.container) {
                var q = k.createElement("div"), o = k.getElementsByTagName("body")[0];
                this.id = Math.floor(Math.random() * 9999999);
                q.setAttribute("id", ["bcal-container", this.id].join("-"));
                c.Util.addClass(q, "bcal-container");
                q.style.display = "none";
                q.style.position = "absolute";
                this.container = q;
                o.appendChild(q);
                var p = this.opts.year, d = this.opts.month;
                for (i = 0; i < this.opts.months; i++) {
                    this.draw(p, d + i, a(i, this.opts.months))
                }
                if (this.opts.hasTimeSelector) {
                    this.setSelectorTimeBox()
                }
                if (this.opts.rel) {
                    this.element.getParent(".dateTextIcon").hide()
                }
                return q
            } else {
                return this.container
            }
        },setSelectorTimeBox: function() {
            var p = this.element.getParent(".dateTextIcon");
            var s = new Element("label", {"class": "_selectorTimes"}).inject(p ? p : this.element, "after"), q = this;
            var r = "";
            if (this.element.value != "") {
                r = this.element.value
            }
            if (this.element.get("data-init")) {
                r = r + " " + this.element.get("data-init")
            } else {
                s.addClass("_selectorDisabel")
            }
            var d = new Element("input", {type: "hidden",name: this.element.get("name"),id: "hidden" + this.id,value: r,"data-type": this.element.get("data-type") ? this.element.get("data-type") : ""}).inject(s, "before");
            this.element.store("id", d);
            this.element.removeProperties("name", "data-type");
            var o = new Element("input", {type: "text",id: "rele" + this.id,value: this.element.get("data-init") ? this.element.get("data-init") : "00:00",readonly: "readonly"}).addEvent("focus", function() {
                if (q.element.value == "") {
                    if (!q.opts.rel) {
                        q.element.focus();
                        return
                    }
                }
                if (q.opts.rel) {
                    q.element.value = q.opts.rel.element.value
                }
                if ($("selector" + q.id)) {
                    q.refresh.call(q);
                    if (q.element.retrieve("time")) {
                        q.selectorUpdate(q.element.retrieve("time"))
                    }
                    $("selector" + q.id).position({relativeTo: "rele" + q.id,position: "leftBottom",offset: {x: -4,y: 6}}).show()
                } else {
                    s.removeClass("_selectorDisabel");
                    q.selectorEver(s);
                    document.addEvent("mousedown", function(u) {
                        var t = $(u.target);
                        if (t != o && t != $("selector" + q.id) && !$("selector" + q.id).contains(t)) {
                            $("selector" + q.id).hide()
                        }
                    })
                }
            }).inject(s);
            this.element.store("for", o)
        },selectorEver: function(s) {
            var u = new Element("div", {id: "selector" + this.id,"class": "_timeOptions","data-type": "selector",styles: {width: 88,"z-index": 99,background: "#fff",height: 136,overflow: "hidden","overflow-y": "auto",border: "1px solid #CCCCCC",position: "absolute"}}).inject(s, "after");
            var q = s.getElement("input"), o = this;
            var d = new Element("ul").inject(u);
            var r = new Fx.Scroll(u, {duration: 0,wait: false});
            d.store("fx", r);
            var p = this.element.value, t = this.selectorTimes();
            if (this.element.value != "") {
                $("hidden" + o.id).value = this.element.value + " " + $("rele" + this.id).value
            }
            t.each(function(w, v) {
                new Element("li", {"data-type": p + " " + w,text: w,"class": w == q.value ? "selected" : ""}).addEvents({click: function() {
                        q.value = this.innerHTML;
                        if ($("hidden" + o.id)) {
                            $("hidden" + o.id).value = this.get("data-type")
                        }
                        if ($("selector" + o.id)) {
                            $("selector" + o.id).getElements("li").removeClass("selected");
                            this.addClass("selected");
                            $("selector" + o.id).hide()
                        }
                    },mouseenter: function() {
                        this.addClass("hover")
                    },mouseleave: function() {
                        this.removeClass("hover")
                    }}).inject(d)
            });
            u.position({relativeTo: s,position: "leftBottom",offset: {x: 0,y: -1}});
            r.toElement(d.getElements("li")[19], "y");
            this.element.store("time", d)
        },selectorUpdate: function(p) {
            p.innerHTML = "";
            var o = this.element.value, q = this.selectorTimes(), d = this.id;
            if (this.element.value != "") {
                $("hidden" + d).value = this.element.value + " " + $("rele" + d).value
            }
            q.each(function(r) {
                new Element("li", {"data-type": o + " " + r,text: r,"class": $("rele" + this.id).value == r ? "selected" : ""}).addEvents({click: function() {
                        if ($("rele" + d)) {
                            $("rele" + d).value = this.innerHTML
                        }
                        if ($("hidden" + d)) {
                            $("hidden" + d).value = this.get("data-type")
                        }
                        if ($("selector" + d)) {
                            $("selector" + d).getElements("li").removeClass("selected");
                            this.addClass("selected");
                            $("selector" + d).hide()
                        }
                    },mouseenter: function() {
                        this.addClass("hover")
                    },mouseleave: function() {
                        this.removeClass("hover")
                    }}).inject(p)
            }.bind(this))
        },selectorTimes: function() {
            return ["00:00", "00:30", "01:00", "01:30", "02:00", "02:30", "03:00", "03:30", "04:00", "04:30", "05:00", "05:30", "06:00", "06:30", "07:00", "07:30", "08:00", "08:30", "09:00", "09:30", "10:00", "10:30", "11:00", "11:30", "12:00", "12:30", "13:00", "13:30", "14:00", "14:30", "15:00", "15:30", "16:00", "16:30", "17:00", "17:30", "18:00", "18:30", "19:00", "19:30", "20:00", "20:30", "21:00", "21:30", "22:00", "22:30", "23:00", "23:30"]
        },setPramasMinDate: function(d, o) {
            this.opts.minDate = d;
            this.refresh.call(this);
            if (!this.opts.hasTimeSelector && o) {
                $(this.element).focus()
            }
            return this
        },setParamasMaxDate: function(d) {
            this.opts.maxDate = d;
            this.refresh.call(this);
            if (!this.opts.hasTimeSelector) {
                $(this.element).focus()
            }
            return this
        },setOptionsRel: function(d) {
            this.opts.rel = d;
            return this
        },autoTips: function(p, o) {
            if ($("hidden" + p.id) && $("hidden" + o.id)) {
                var r = new Date(Date.parse($("hidden" + p.id).value)), q = new Date(Date.parse($("hidden" + o.id).value));
                if (r > q) {
                    var d = new Element("div", {text: "开始时间不能大于结束时间哦！",styles: {position: "absolute","z-index": 9999,background: "#FFBB99",width: "245px","text-align": "center",height: "30px","line-height": "30px"}}).position({relativeTo: p.element.getParent(),position: "leftBottom",offset: {x: 0,y: 1}}).inject(document.body);
                    (function() {
                        d.dispose()
                    }).delay(2000)
                }
            }
        },formatDate: function() {
            return n.apply(this, arguments)
        },cf: function() {
            var d = {c0101: "春节",c0115: "元宵",c0505: "端午",c0707: "七夕",c0715: "中元",c0815: "中秋",c0909: "重阳",c1208: "腊八",c1224: "小年",c0100: "除夕"};
            return d
        },wf: function() {
            var d = {w0101: "元旦",w0214: "情人",w0308: "妇女",w0312: "植树",w0401: "愚人",w0501: "五一",w0504: "青年",w0520: "母亲",w0601: "儿童",w0808: "父亲",w0910: "教师",w1001: "国庆",w1111: "单身",w1212: "狂购",w1224: "平安",w1225: "圣诞"};
            return d
        },getLunarInfo: function() {
            var d = new Array(19416, 19168, 42352, 21717, 53856, 55632, 91476, 22176, 39632, 21970, 19168, 42422, 42192, 53840, 119381, 46400, 54944, 44450, 38320, 84343, 18800, 42160, 46261, 27216, 27968, 109396, 11104, 38256, 21234, 18800, 25958, 54432, 59984, 28309, 23248, 11104, 100067, 37600, 116951, 51536, 54432, 120998, 46416, 22176, 107956, 9680, 37584, 53938, 43344, 46423, 27808, 46416, 86869, 19872, 42448, 83315, 21200, 43432, 59728, 27296, 44710, 43856, 19296, 43748, 42352, 21088, 62051, 55632, 23383, 22176, 38608, 19925, 19152, 42192, 54484, 53840, 54616, 46400, 46496, 103846, 38320, 18864, 43380, 42160, 45690, 27216, 27968, 44870, 43872, 38256, 19189, 18800, 25776, 29859, 59984, 27480, 21952, 43872, 38613, 37600, 51552, 55636, 54432, 55888, 30034, 22176, 43959, 9680, 37584, 51893, 43344, 46240, 47780, 44368, 21977, 19360, 42416, 86390, 21168, 43312, 31060, 27296, 44368, 23378, 19296, 42726, 42208, 53856, 60005, 54576, 23200, 30371, 38608, 19415, 19152, 42192, 118966, 53840, 54560, 56645, 46496, 22224, 21938, 18864, 42359, 42160, 43600, 111189, 27936, 44448);
            return d
        },lYearDays: function(p) {
            var d, o = 348;
            for (d = 32768; d > 8; d >>= 1) {
                o += (this.getLunarInfo()[p - 1900] & d) ? 1 : 0
            }
            return (o + this.leapDays(p))
        },leapDays: function(d) {
            if (this.leapMonth(d)) {
                return ((this.getLunarInfo()[d - 1900] & 65536) ? 30 : 29)
            } else {
                return (0)
            }
        },leapMonth: function(d) {
            return (this.getLunarInfo()[d - 1900] & 15)
        },monthDays: function(o, d) {
            return ((this.getLunarInfo()[o - 1900] & (65536 >> d)) ? 30 : 29)
        },Lunar: function(x) {
            var r, d = 0, z = 0;
            var o = new Date(1900, 0, 31);
            var q = (x - o) / 86400000;
            var s = q + 40;
            var y = 14;
            for (r = 1900; r < 2050 && q > 0; r++) {
                z = this.lYearDays(r);
                q -= z;
                s += 12
            }
            if (q < 0) {
                q += z;
                r--;
                s -= 12
            }
            var u = r;
            var p = r - 1864;
            d = this.leapMonth(r);
            var w = false;
            for (r = 1; r < 13 && q > 0; r++) {
                if (d > 0 && r == (d + 1) && w == false) {
                    --r;
                    w = true;
                    z = this.leapDays(u)
                } else {
                    z = this.monthDays(u, r)
                }
                if (w == true && r == (d + 1)) {
                    w = false
                }
                q -= z;
                if (w == false) {
                    s++
                }
            }
            if (q == 0 && d > 0 && r == d + 1) {
                if (w) {
                    w = false
                } else {
                    w = true;
                    --r;
                    --s
                }
            }
            if (q < 0) {
                q += z;
                --r;
                --s
            }
            var t = r;
            var v = q + 1;
            return [t, v]
        },draw: function(q, d, L, M) {
            var u = this, T = typeof M === "undefined" ? Math.floor(Math.random() * 9999999) : M, v = new Date(q, d, 1), s = new Date(q, d + 1, 0).getDate(), B = new Date(q, d, 0).getDate(), X = v.getUTCDay(), w = v.getDay(), P, G, R, S = 0, y = u.opts.weekNumbers ? 8 : 7, C = k.createElement("table"), H = k.createElement("thead"), O = k.createElement("tbody"), x, J, I, Y, W, t, D, z, Q, A, K, r = false;
            u.container.innerHTML = "";
            if (u.opts.minDate !== null) {
                r = true
            }
            x = k.createElement("tr");
            c.Util.addClass(x, "bcal-hcall");
            J = k.createElement("th");
            if (u.opts.showNavigation && (L === 1 || L === 3)) {
                c.Util.addEvent(J, "click", function(Z) {
                    u.container.innerHTML = "";
                    for (P = 0; P < u.opts.months; P++) {
                        u.draw(q, d - u.opts.months + P, a(P, u.opts.months));
                        if (P === 0) {
                            u.opts.year = q;
                            u.opts.month = d - u.opts.months
                        }
                    }
                });
                J.style.cursor = "pointer";
                J.style.backgroundPosition = "center -30px";
                c.Util.addClass(J, "bcal-nav");
                I = k.createTextNode("<");
                J.appendChild(I)
            } else {
                c.Util.addClass(J, "bcal-navi")
            }
            x.appendChild(J);
            J = k.createElement("th");
            J.colSpan = (y === 7) ? 5 : 6;
            c.Util.addClass(J, "bcal-month");
            J.appendChild(k.createTextNode(v.getFullYear() + "年  " + u.opts.monthNamesFull[v.getMonth()]));
            x.appendChild(J);
            J = k.createElement("th");
            if (u.opts.showNavigation && (L === 2 || L === 3)) {
                J.style.cursor = "pointer";
                c.Util.addClass(J, "bcal-nav");
                I = k.createTextNode(">");
                J.style.backgroundPosition = "center -2px";
                c.Util.addEvent(J, "click", function(Z) {
                    u.container.innerHTML = "";
                    for (P = 0; P < u.opts.months; P++) {
                        u.draw(q, d + P + 1, a(P, u.opts.months));
                        if (P === 0) {
                            u.opts.month = d + 1;
                            u.opts.year = q
                        }
                    }
                });
                J.appendChild(I)
            } else {
                c.Util.addClass(J, "bcal-navi")
            }
            x.appendChild(J);
            H.appendChild(x);
            x = k.createElement("tr");
            if (u.opts.weekNumbers) {
                J = k.createElement("th");
                J.appendChild(k.createTextNode("wk"));
                c.Util.addClass(J, "bcal-wnum");
                x.appendChild(J)
            }
            for (P = 0; P < 7; P++) {
                J = k.createElement("th");
                I = k.createTextNode(u.opts.dayNames[(u.opts.startDay + P) % 7]);
                c.Util.addClass(J, "bcal-wday");
                J.appendChild(I);
                x.appendChild(J)
            }
            H.appendChild(x);
            C.appendChild(H);
            G = u.opts.startDay + 1 - w;
            while (G > 1) {
                G -= 7
            }
            while (G <= s) {
                t = new Date(q, d, G + X);
                x = k.createElement("tr");
                if (u.opts.weekNumbers) {
                    J = k.createElement("td");
                    c.Util.addClass(J, "bcal-week");
                    Y = new Date(t.getFullYear(), t.getMonth(), t.getDate() - (t.getDay() || 7) + 3);
                    W = new Date(Y.getFullYear(), 0, 4);
                    J.appendChild(k.createTextNode(1 + Math.round((Y - W) / 86400000 / 7)));
                    x.appendChild(J)
                }
                for (P = 0; P < 7; P++) {
                    J = k.createElement("td");
                    if (G > 0 && G <= s) {
                        D = new Date(q, d, G);
                        J.setAttribute("bcal-date", D.getTime());
                        c.Util.addClass(J, "bcal-date");
                        if (D.getMonth() !== u.currMonthCatch || u.currDay > 29) {
                            u.currMonthCatch = D.getMonth();
                            var U = u.Lunar(D);
                            u.currDay = U[1];
                            u.currMonth = U[0]
                        } else {
                            u.currDay++
                        }
                        var N = D.getMonth() + 1;
                        var p = "c" + (u.currMonth < 10 ? (0 + "" + u.currMonth) : u.currMonth) + "" + (u.currDay < 10 ? (0 + "" + u.currDay) : u.currDay), V = "w" + (N < 10 ? (0 + "" + N) : N) + "" + (D.getDate() < 10 ? (0 + "" + D.getDate()) : D.getDate());
                        if (l === [D.getFullYear(), D.getMonth(), D.getDate()].join("-")) {
                            c.Util.addClass(J, "bcal-today");
                            I = k.createTextNode("今天")
                        } else {
                            if (u.wf()[V] !== e) {
                                c.Util.addClass(J, "bcal-festival");
                                I = k.createTextNode(u.wf()[V])
                            } else {
                                if (u.cf()[p] !== e) {
                                    c.Util.addClass(J, "bcal-festival");
                                    I = k.createTextNode(u.cf()[p])
                                } else {
                                    I = k.createTextNode(G)
                                }
                            }
                        }
                        J.appendChild(I);
                        J.setAttribute("title", D.format("%Y-%m-%d"));
                        z = u.opts.onBeforeShowDay.apply(u, [D]);
                        if (u.opts.disablePast === true && D < f) {
                            c.Util.addClass(J, "bcal-past")
                        } else {
                            if (r && D < u.opts.minDate || u.opts.maxDate && D > u.opts.maxDate) {
                                c.Util.addClass(J, "bcal-past")
                            } else {
                                if (z[0] === false) {
                                    c.Util.addClass(J, z[1])
                                } else {
                                    u.bind.call(u, J)
                                }
                            }
                        }
                    } else {
                        if (u.opts.showOtherMonths) {
                            var F = G > 0 ? G - s : B + G, o = G > 0 ? d + 1 : d - 1;
                            D = new Date(q, o, F);
                            if (D.getMonth() !== u.currMonthCatch || u.currDay > 29) {
                                u.currMonthCatch = D.getMonth();
                                var U = u.Lunar(D);
                                u.currDay = U[1];
                                u.currMonth = U[0]
                            } else {
                                u.currDay++
                            }
                            var N = D.getMonth() + 1;
                            var p = "c" + (u.currMonth < 10 ? (0 + "" + u.currMonth) : u.currMonth) + "" + (u.currDay < 10 ? (0 + "" + u.currDay) : u.currDay), V = "w" + (N < 10 ? (0 + "" + N) : N) + "" + (D.getDate() < 10 ? (0 + "" + D.getDate()) : D.getDate());
                            if (u.wf()[V] !== e) {
                                c.Util.addClass(J, "bcal-festival");
                                I = k.createTextNode(u.wf()[V])
                            } else {
                                if (u.cf()[p] !== e) {
                                    c.Util.addClass(J, "bcal-festival");
                                    I = k.createTextNode(u.cf()[p])
                                } else {
                                    I = k.createTextNode(F)
                                }
                            }
                            J.appendChild(I);
                            J.setAttribute("bcal-date", D.getTime());
                            J.setAttribute("title", D.format("%Y-%m-%d"));
                            if (u.opts.selectOtherMonths) {
                                u.bind.call(u, J)
                            }
                            if (f < D) {
                                if (r && D < u.opts.minDate || u.opts.maxDate && D > u.opts.maxDate) {
                                    c.Util.addClass(J, "bcal-empty")
                                } else {
                                    c.Util.addClass(J, "bcal-date");
                                    u.bind.call(u, J)
                                }
                            } else {
                                c.Util.addClass(J, "bcal-empty")
                            }
                        }
                    }
                    if (u.selectedDate !== null && u.selectedDate.getTime() === D.getTime() && u.opts.month === d) {
                        c.Util.addClass(J, "bcal-selected")
                    }
                    x.appendChild(J);
                    O.appendChild(x);
                    G++
                }
                S++
            }
            if (S === 5) {
                O.appendChild(m(u.opts.weekNumbers))
            } else {
                if (S === 4) {
                    O.appendChild(m(u.opts.weekNumbers));
                    O.appendChild(m(u.opts.weekNumbers))
                }
            }
            c.Util.addClass(C, "bcal-table");
            C.setAttribute("id", ["bcal-table", T].join("-"));
            C.appendChild(O);
            c.Util.addEvent(C, "click", function(Z) {
                u.focus = true
            });
            var E = k.getElementById(["bcal-table", T].join("-"));
            if (E) {
                u.container.removeChild(E)
            }
            u.container.appendChild(C)
        },bind: function(d) {
            var o = this, r, p, q;
            c.Util.addEvent(d, "click", (function(t, s) {
                return function() {
                    r = c.Util.getElementsByClass("bcal-selected", t.container, "td");
                    for (p = 0, q = r.length; p < q; p++) {
                        c.Util.removeClass(r[p], "bcal-selected")
                    }
                    c.Util.addClass(s, "bcal-selected");
                    var u = parseInt(s.getAttribute("bcal-date"), 10);
                    t.selectedDate = new Date(u);
                    t.opts.year = t.selectedDate.getFullYear();
                    t.opts.month = t.selectedDate.getMonth();
                    if (t.opts.element && !t.opts.inline) {
                        t.close();
                        t.element.value = t.formatDate(t.opts.dateFormat, u)
                    }
                    t.opts.onSelect.apply(t, [t.element, t.formatDate(t.opts.dateFormat, u), u, s]);
                    t.refresh.call(t)
                }
            })(o, d))
        },open: function() {
            var o = this, p = j(o.element), d;
            d = o.opts.onBeforeOpen.apply(o, []);
            if (d === false) {
                return o
            }
            switch (o.opts.position) {
                case "bottom":
                    o.container.style.top = (p[1] + o.element.offsetHeight + o.opts.offerset.y) + "px";
                    break;
                case "top":
                    o.container.style.display = "";
                    o.container.style.top = (p[1] - o.container.offsetHeight - o.opts.offerset.y) + "px";
                    break
            }
            o.container.style.left = p[0] - o.opts.offerset.x + "px";
            o.container.style.display = "";
            o.opts.onOpen.apply(o, [o.element]);
            o.isOpen = true;
            o.focus = true;
            return o
        },close: function() {
            var o = this, d;
            d = o.opts.onBeforeClose.apply(o, []);
            if (d === false) {
                return o
            }
            o.container.style.display = "none";
            o.opts.onClose.apply(o, []);
            o.isOpen = false;
            o.focus = false;
            return o
        },detach: function() {
            var d = this;
            d.element.style.cursor = "text";
            d.container.parentNode.removeChild(d.container);
            return d.element
        },option: function(p) {
            var o = this;
            switch (arguments.length) {
                case 1:
                    if (g("String", p) && o.opts[p]) {
                        return o.opts[p]
                    } else {
                        if (g("Object", p)) {
                            for (var d in p) {
                                if (p.hasOwnProperty(d)) {
                                    o.opts[d] = p[d]
                                }
                            }
                        }
                    }
                    break;
                case 2:
                    if (o.opts[p]) {
                        o.opts[p] = arguments[1]
                    }
                    break
            }
            return o
        },refresh: function() {
            var o = this;
            o.container.innerHTML = "";
            var p = o.opts.year, d = o.opts.month;
            for (i = 0; i < o.opts.months; i++) {
                o.draw(p, d + i, a(i, o.opts.months))
            }
            return o
        }};
    return (h.Calendar = c)
})(window);
var amTips = new Class({Implements: [Options, Events],options: {position: "right",fixed: false,center: true,content: "title",html: false,isHover: false,balloon: true,arrowSize: 16,arrowOffset: 12,distance: 8,motion: 6,motionOnShow: true,motionOnHide: true,showOn: "mouseenter",hideOn: "mouseleave",showDelay: 0,hideDelay: 0,callback: $empty,className: "plugs_tips",borderColor: "#ffa463",bgColor: "#ffffe1",color: "#333",width: "auto",offset: {x: 0,y: 0},automove: false,ispointer: true,delay: 3000,isFly: false,fx: {duration: "short"},mouseBandCallback: "",ajax: false},initialize: function(c, a) {
        this.setOptions(a);
        var b = this;
        this.boundShow = (function(d) {
            this.store("isHover", true);
            if (b.options.isHover) {
                (function() {
                    if (this.retrieve("isHover")) {
                        b.doAttach.apply(this, [b])
                    } else {
                        return
                    }
                }.bind(this)).delay(600)
            } else {
                b.doAttach.apply(this, [b])
            }
        });
        this.boundHide = (function() {
            this.store("isHover", null);
            this.store("isLeave", null);
            if (b.options.automove) {
                (function() {
                    if (this.retrieve("isLeave") == null) {
                        b.hide(this)
                    }
                }.bind(this)).delay(400)
            } else {
                b.hide(this)
            }
        });
        if (!["top", "right", "bottom", "left", "inside"].contains(this.options.position)) {
            this.options.position = "top"
        }
        if (c) {
            this.attach(c)
        }
        return this
    },doAttach: function(a) {
        if (!a.options.ajax) {
            this.store("isLeave", true);
            if (a.options.mouseBandCallback) {
                if (typeof a.options.mouseBandCallback == "function") {
                    a.options.mouseBandCallback.run({_this: a})
                }
            } else {
                a.show(this)
            }
        } else {
            if (typeof a.options.mouseBandCallback == "function") {
                a.options.mouseBandCallback.apply(a, [this])
            }
        }
    },attach: function(b) {
        var a = this;
        $$(b).each(function(c) {
            if (!a.options.isFly) {
                if (c.retrieve("hasevent")) {
                    return
                }
                evs = {};
                evs[a.options.showOn] = a.boundShow;
                evs[a.options.hideOn] = a.boundHide;
                c.addEvents(evs);
                c.store("hasevent", true)
            }
            c.store("object", a)
        });
        return this
    },detach: function(c) {
        var b = this;
        var a = {};
        a[this.options.showOn] = this.boundShow;
        a[this.options.hideOn] = this.boundHide;
        $$(c).each(function(d) {
            b.hide(d);
            d.removeEvents(a);
            d.eliminate("hasevent");
            d.eliminate("object")
        });
        return this
    },show: function(b) {
        var a = b.retrieve("_tips");
        if (a) {
            if (a.getStyle("opacity") == 1) {
                clearTimeout(a.retrieve("timeout"));
                return this
            }
        }
        var c = this._create(b);
        if (c == null) {
            return this
        }
        b.store("_tips", c);
        this._animate(c, "in");
        b.store("visible", true);
        this.fireEvent("show", [c, b]);
        return this
    },hide: function(a) {
        var b = a.retrieve("_tips");
        if (!b) {
            return this
        }
        this._animate(b, "out");
        a.store("visible", false);
        this.fireEvent("hide", [b, a]);
        return this
    },toggle: function(a) {
        if (a.retrieve("visible")) {
            return this.hide(a)
        } else {
            return this.show(a)
        }
    },_create: function(d) {
        var e = this.options;
        e.c = e.content;
        e.opos = e.position;
        if (e.c == "title") {
            e.c = "plugs-tips";
            if (!d.get("plugs-tips")) {
                d.setProperty("plugs-tips", d.get("title"))
            }
            d.set("title", "")
        }
        if (!e.center) {
            if (e.position == "left" || e.position == "right") {
                e.offset.y = -e.arrowSize / 2
            } else {
                e.offset.x = -e.arrowSize / 2
            }
        }
        e.cnt = (typeof (e.c) == "string" ? d.get(e.c) : e.c(d));
        e.cwr = new Element("div").addClass(e.className).setStyles({margin: 0,border: "1px solid " + e.borderColor,padding: "1px 10px 3px",background: e.bgColor,"border-radius": "3px","z-index": 999,color: e.color});
        if (!e.isFly) {
            var c = {};
            c[e.showOn] = function() {
                d.store("isLeave", true)
            };
            c[e.hideOn] = this.boundHide.bind(d);
            e.cwr.addEvents(c)
        }
        e.tip = new Element("div").addClass(e.className + "-wrapper").setStyles({margin: 0,padding: 0,"z-index": e.cwr.getStyle("z-index") > 100 ? e.cwr.getStyle("z-index") : 100}).adopt(e.cwr);
        if (!Browser.ie) {
            e.tip.setStyle("max-width", e.width)
        } else {
            e.tip.setStyle("width", e.width)
        }
        if (e.cnt) {
            if ($(e.cnt)) {
                if (e.adoptdom) {
                    e.cwr.adopt(e.cnt)
                } else {
                    e.cwr.set("html", typeof (e.cnt) == "string" ? e.cnt : e.cnt.get("html"))
                }
            } else {
                e.cwr.set("html", e.cnt)
            }
        } else {
            return null
        }
        e.tip.setStyles({position: (e.fixed ? "fixed" : "absolute"),opacity: 0,top: 0,left: 0}).inject(document.body);
        if (e.balloon && e.ispointer ? (!e.isFly) : (!e.ispointer)) {
            var a = new Element("div").addClass(e.className + "-triangle").setStyles({margin: 0,padding: 0});
            e.tipborder = new Element("i", {html: "◆",styles: {"z-index": 1,color: e.borderColor}}).inject(a);
            e.tipbg = new Element("i", {html: "◆",styles: {"z-index": 9,color: e.bgColor}}).inject(a);
            e.ccstyle = {width: e.arrowSize,height: e.arrowSize,display: "block","font-family": "SimSun",position: "absolute","font-style": "normal"};
            e.tipborder.setStyles(e.ccstyle);
            e.tipbg.setStyles(e.ccstyle);
            e.borderStyle = {};
            var b = {width: e.arrowSize,height: e.arrowSize,"line-height": e.arrowSize,overflow: "hidden",position: "absolute","z-index": 3,"font-size": "1.2em"};
            switch (e.opos) {
                case "inside":
                case "top":
                    b.top = "auto";
                    b.bottom = -8;
                    e.borderStyle.bottom = -1;
                    break;
                case "right":
                    e.borderStyle.left = -1;
                    b.left = 10;
                    e.cwr.setStyle("margin-left", e.arrowSize);
                    break;
                case "bottom":
                    b.top = -7;
                    if (Browser.ie6) {
                        b.top = -5
                    }
                    if (Browser.ie6) {
                        b.bottom = -10
                    }
                    e.borderStyle.top = -1;
                    break;
                case "left":
                    b.right = 8;
                    e.borderStyle.right = -1;
                    if (Browser.ie7) {
                        b.position = "absolute";
                        b.right = 8
                    } else {
                        b["float"] = "right"
                    }
                    e.cwr.setStyle("margin-right", e.arrowSize);
                    break
            }
            switch (e.opos) {
                case "inside":
                case "top":
                case "bottom":
                    b["margin-left"] = e.center ? ((e.tip.getSize().x / 2 > e.arrowSize) ? (e.tip.getSize().x / 2 + e.arrowSize / 2) - e.arrowSize : 5) : e.arrowOffset;
                    break;
                case "left":
                case "right":
                    b["margin-top"] = e.center ? ((e.tip.getSize().y / 2 > e.arrowSize) ? (e.tip.getSize().y / 2 + e.arrowSize / 2) - e.arrowSize : 5) : e.arrowOffset;
                    break
            }
            e.tipborder.setStyles(e.borderStyle);
            a.setStyles(b).inject(e.tip, (e.opos == "top" || e.opos == "inside") ? "bottom" : "top")
        }
        e.tipSz = e.tip.getSize();
        e.trgC = d.getCoordinates();
        e.offsetOption = ("function" === typeof (e.offset) ? Object.merge({x: 0,y: 0}, e.offset(d)) : e.offset);
        e.pos = {x: e.trgC.left + e.offsetOption.x,y: e.trgC.top + e.offsetOption.y};
        if (e.opos == "inside") {
            e.tip.setStyles({width: e.tip.getStyle("width"),height: e.tip.getStyle("height")});
            d.setStyle("position", "relative").adopt(e.tip);
            e.pos = {x: e.offset.x,y: e.offset.y}
        } else {
            switch (e.opos) {
                case "top":
                    e.pos.y -= e.tipSz.y + e.distance;
                    break;
                case "right":
                    e.pos.x += e.trgC.width + e.distance;
                    break;
                case "bottom":
                    e.pos.y += e.trgC.height + e.distance;
                    break;
                case "left":
                    e.pos.x -= e.tipSz.x + e.distance;
                    break
            }
        }
        if (e.center) {
            switch (e.opos) {
                case "top":
                case "bottom":
                    e.pos.x += (e.trgC.width / 2 - e.tipSz.x / 2);
                    break;
                case "left":
                case "right":
                    e.pos.y += (e.trgC.height / 2 - e.tipSz.y / 2);
                    break;
                case "inside":
                    e.pos.x += (e.trgC.width / 2 - e.tipSz.x / 2);
                    e.pos.y += (e.trgC.height / 2 - e.tipSz.y / 2);
                    break
            }
        }
        e.pos.y = (d == $(document.body)) ? 0 : e.pos.y;
        e.pos.x = (d == $(document.body)) ? e.pos.x * 2 : e.pos.x;
        if (d.match("body")) {
            e.pos.y = 15;
            e.pos.x = e.pos.x - $(document.body).getSize().x / 2 + e.tip.getSize().x / 2;
            e.tip.getElement("div").setStyle("padding", "1px 50px")
        }
        d.store("tips", e.tip);
        e.tip.set("morph", e.fx).store("position", e.pos);
        e.tip.setStyles({top: e.pos.y,left: e.pos.x});
        return e.tip
    },_animate: function(a, b) {
        var c = this;
        clearTimeout(a.retrieve("timeout"));
        a.store("timeout", (function(e) {
            var g = this.options, f = (b == "in");
            var d = {opacity: f ? 1 : 0};
            if ((g.motionOnShow && f) || (g.motionOnHide && !f)) {
                var h = e.retrieve("position");
                if (!h) {
                    return
                }
                switch (g.position) {
                    case "inside":
                    case "top":
                        d.top = f ? [h.y - g.motion, h.y] : h.y - g.motion;
                        break;
                    case "right":
                        d.left = f ? [h.x + g.motion, h.x] : h.x + g.motion;
                        break;
                    case "bottom":
                        d.top = f ? [h.y + g.motion, h.y] : h.y + g.motion;
                        break;
                    case "left":
                        d.left = f ? [h.x - g.motion, h.x] : h.x - g.motion;
                        break
                }
            }
            e.morph(d);
            if (!f) {
                e.get("morph").chain(function() {
                    c.options.callback.call(c);
                    this.dispose()
                }.bind(e))
            }
        }).delay((b == "in") ? this.options.showDelay : this.options.hideDelay, this, a));
        return this
    }});
Element.implement({amTips: function(a) {
        new amTips(this, a);
        return this
    },amTipsShow: function(a) {
        var c = this;
        var b = this.retrieve("object");
        if (b) {
            b.show(this)
        }
        if (b.options.isFly || a) {
            this.amTipsHide.delay(b.options.delay, [this])
        }
        return this
    },amTipsHide: function() {
        var b = this;
        if (typeof this == "object") {
            b = this[0]
        } else {
            b = this
        }
        var a = b.retrieve("object");
        if (a) {
            a.hide(b)
        }
        return b
    },amTipsToggle: function() {
        var a = this.retrieve("object");
        if (a) {
            a.toggle(this)
        }
        return this
    }});
Element.Properties.amTips = {get: function() {
        return this.retrieve("object")
    }};
