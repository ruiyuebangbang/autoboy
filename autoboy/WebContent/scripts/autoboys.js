var Observer = new Class({Implements: [Options, Events],options: {periodical: false,delay: 1000},initialize: function(c, a, b) {
        this.element = $(c) || $$(c);
        this.addEvent("onFired", a);
        this.setOptions(b);
        this.bound = this.changed.bind(this);
        this.resume()
    },changed: function() {
        var a = this.element.get("value");
        if ($equals(this.value, a)) {
            return
        }
        this.clear();
        this.value = a;
        this.timeout = this.onFired.delay(this.options.delay, this)
    },setValue: function(a) {
        this.value = a;
        this.element.set("value", a);
        return this.clear()
    },onFired: function() {
        this.fireEvent("onFired", [this.value, this.element])
    },clear: function() {
        $clear(this.timeout || null);
        return this
    },pause: function() {
        if (this.timer) {
            $clear(this.timer)
        } else {
            this.element.removeEvent("keyup", this.bound)
        }
        return this.clear()
    },resume: function() {
        this.value = this.element.get("value");
        if (this.options.periodical) {
            this.timer = this.changed.periodical(this.options.periodical, this)
        } else {
            this.element.addEvent("keyup", this.bound)
        }
        return this
    }});
var $equals = function(b, a) {
    return (b == a || JSON.encode(b) == JSON.encode(a))
};
var Autocompleter = new Class({Implements: [Options, Events],options: {forceRefresh: false,relatedFun: "",minLength: 1,markQuery: true,width: "inherit",maxChoices: 10,injectChoice: null,customChoices: null,emptyChoices: null,visibleChoices: true,className: "autocompleter-choices",zIndex: 100,delay: 400,observerOptions: {},fxOptions: {},src: "",autoSubmit: false,overflow: false,overflowMargin: 25,selectFirst: false,filter: null,filterCase: false,filterSubset: false,forceSelect: false,selectMode: true,choicesMatch: null,classW: "",requestid: "",multiple: false,separator: ", ",separatorSplit: /\s*[,;]\s*/,autoTrim: false,allowDupes: false,unselect: "hideChoices",select: "choiceSelect",cache: true,relative: false,autoPos: true},initialize: function(b, a) {
        this.element = $(b);
        this.setOptions(a);
        this.build();
        this.observer = new Observer(this.element, this.prefetch.bind(this), $merge({delay: this.options.delay}, this.options.observerOptions));
        this.queryValue = null;
        if (this.options.filter) {
            this.filter = this.options.filter.bind(this)
        }
        var c = this.options.selectMode;
        this.typeAhead = (c == "type-ahead");
        this.selectMode = (c === true) ? "selection" : c;
        this.cached = []
    },build: function() {
        if ($(this.options.customChoices)) {
            this.choices = this.options.customChoices
        } else {
            this.choices = new Element("ul", {"class": this.options.classW ? this.options.classW : this.options.className,styles: {zIndex: this.options.zIndex,top: 0,left: 0}}).inject(document.body);
            this.relative = false;
            if (this.options.relative) {
                this.choices.inject(this.element, "after");
                this.relative = this.element.getOffsetParent()
            }
            this.fix = new OverlayFix(this.choices)
        }
        if (!this.options.separator.test(this.options.separatorSplit)) {
            this.options.separatorSplit = this.options.separator
        }
        this.fx = (!this.options.fxOptions) ? null : new Fx.Tween(this.choices, $merge({property: "opacity",link: "cancel",duration: 200}, this.options.fxOptions)).addEvent("onStart", Chain.prototype.clearChain).set(0);
        this.element.setProperty("autocomplete", "off").addEvent((Browser.Engine.trident || Browser.Engine.webkit) ? "keydown" : "keypress", this.onCommand.bind(this)).addEvent("mouseover", this.onCommand.bind(this, [false])).addEvent("click", this.onCommand.bind(this, [false])).addEvent("focus", this.toggleFocus.create({bind: this,arguments: true,delay: 100})).addEvent("blur", this.toggleFocus.create({bind: this,arguments: false,delay: 100}))
    },destroy: function() {
        if (this.fix) {
            this.fix.destroy()
        }
        this.choices = this.selected = this.choices.destroy()
    },toggleFocus: function(a) {
        this.focussed = a;
        if (!a) {
            this.hideChoices(true)
        }
        this.fireEvent((a) ? "onFocus" : "onBlur", [this.element]);
        this.element.removeClass(this.options.select);
        this.element.addClass(this.options.unselect)
    },onCommand: function(b) {
        if (!b && this.focussed) {
            return this.prefetch()
        }
        if (b && b.key && !b.shift) {
            switch (b.key) {
                case "enter":
                    if (!$defined(this.opted)) {
                        this.choiceSelect(this.selected)
                    }
                    if (this.element.value != this.opted) {
                        return true
                    }
                    if (this.selected && this.visible) {
                        if (this.selected.getElement("a")) {
                            if ($chk(this.selected.getElement("a").href) && this.options.relatedFun == "") {
                                window.location = this.selected.getElement("a").href
                            }
                        }
                        this.choiceSelect(this.selected);
                        return !!(this.options.autoSubmit)
                    }
                    break;
                case "up":
                case "down":
                    if (!this.prefetch() && this.queryValue !== null) {
                        var a = (b.key == "up");
                        this.choiceOver((this.selected || this.choices)[(this.selected) ? ((a) ? "getPrevious" : "getNext") : ((a) ? "getLast" : "getFirst")](this.options.choicesMatch), true)
                    }
                    return false;
                case "esc":
                case "tab":
                    this.hideChoices(true);
                    break
            }
        }
        return true
    },setSelection: function(h) {
        try {
            var i = this.selected.inputValue, j = i;
            if ($defined(i)) {
                var a = this.queryValue.length, c = i.length;
                if (i.substr(0, a).toLowerCase() != this.queryValue.toLowerCase()) {
                    a = 0
                }
                if (this.options.multiple) {
                    var g = this.options.separatorSplit;
                    j = this.element.value;
                    a += this.queryIndex;
                    c += this.queryIndex;
                    var b = j.substr(this.queryIndex).split(g, 1)[0];
                    j = j.substr(0, this.queryIndex) + i + j.substr(this.queryIndex + b.length);
                    if (h) {
                        var f = j.split(this.options.separatorSplit).filter(function(e) {
                            return this.test(e)
                        }, /[^\s,]+/);
                        if (!this.options.allowDupes) {
                            f = [].combine(f)
                        }
                        var k = this.options.separator;
                        j = f.join(k) + k;
                        c = j.length
                    }
                }
                this.observer.setValue(j);
                this.opted = j;
                if (h || this.selectMode == "pick") {
                    a = c
                }
                this.element.selectRange(a, c)
            } else {
                i = this.selected.innerHTML;
                j = i;
                if (!$defined(h)) {
                    this.observer.element.value = this.observer.element.value
                } else {
                    this.observer.setValue((!$defined(h)) ? (j.split("@")[0]) : j)
                }
            }
            this.fireEvent("onSelection", [this.element, this.selected, j, i])
        } catch (d) {
        }
    },showChoices: function() {
        var c = this.options.choicesMatch, b = this.choices.getFirst(c);
        this.selected = this.selectedValue = null;
        if (this.fix && this.options.autoPos) {
            var e = this.element.getCoordinates(this.relative), a = this.options.width || "auto";
            if (Browser.Engine.gecko) {
                this.choices.setStyles({left: e.left + 1,top: e.bottom,width: (a === true || a == "inherit") ? e.width - 2 : a - 2})
            } else {
                this.choices.setStyles({left: e.left,top: e.bottom,width: (a === true || a == "inherit") ? e.width - 2 : a - 2})
            }
            this.element.removeClass(this.options.unselect);
            this.element.addClass(this.options.select)
        }
        if (!b) {
            return
        }
        if (!this.visible) {
            this.visible = true;
            this.choices.setStyle("display", "");
            if (this.fx) {
                this.fx.start(1)
            }
            this.fireEvent("onShow", [this.element, this.choices])
        }
        if (this.options.selectFirst || this.typeAhead || b.inputValue == this.queryValue) {
            this.choiceOver(b, this.typeAhead)
        }
        var d = this.choices.getChildren(c), f = this.options.maxChoices;
        var i = {overflowY: "hidden",height: ""};
        this.overflown = false;
        if (d.length > f) {
            var j = d[f - 1];
            i.overflowY = "scroll";
            i.height = j.getCoordinates(this.choices).bottom;
            this.overflown = true
        }
        this.choices.setStyles(i);
        if (this.fix) {
            this.fix.show()
        }
        if (this.options.visibleChoices) {
            var h = document.getScroll(), k = document.getSize(), g = this.choices.getCoordinates();
            if (g.right > h.x + k.x) {
                h.x = g.right - k.x
            }
            if (g.bottom > h.y + k.y) {
                h.y = g.bottom - k.y
            }
            window.scrollTo(Math.min(h.x, g.left), Math.min(h.y, g.top))
        }
    },hideChoices: function(a) {
        if (a) {
            var c = this.element.value;
            if (this.options.forceSelect) {
                c = this.opted
            }
            if (this.options.autoTrim) {
                c = c.split(this.options.separatorSplit).filter($arguments(0)).join(this.options.separator)
            }
            this.observer.setValue(c)
        }
        if (!this.visible) {
            return
        }
        this.visible = false;
        if (this.selected) {
            this.selected.removeClass("autocompleter-selected")
        }
        this.observer.clear();
        var b = function() {
            this.choices.setStyle("display", "none");
            if (this.fix) {
                this.fix.hide()
            }
        }.bind(this);
        if (this.fx) {
            this.fx.start(0).chain(b)
        } else {
            b()
        }
        this.fireEvent("onHide", [this.element, this.choices])
    },refresh: function() {
        this.forceRefresh = true
    },prefetch: function() {
        var f = this.element.value, e = f;
        if (this.options.multiple) {
            var c = this.options.separatorSplit;
            var a = f.split(c);
            var b = this.element.getSelectedRange().start;
            var g = f.substr(0, b).split(c);
            var d = g.length - 1;
            b -= g[d].length;
            e = a[d]
        }
        if (e.length < this.options.minLength) {
            this.hideChoices()
        } else {
            if ((e === this.queryValue || (this.visible && e == this.selectedValue)) && !this.forceRefresh) {
                if (this.visible) {
                    return false
                }
                this.showChoices()
            } else {
                this.queryValue = e;
                this.queryIndex = b;
                this.forceRefresh = false;
                if (!this.fetchCached()) {
                    this.query()
                }
            }
        }
        return true
    },fetchCached: function() {
        return false;
        if (!this.options.cache || !this.cached || !this.cached.length || this.cached.length >= this.options.maxChoices || this.queryValue) {
            return false
        }
        this.update(this.filter(this.cached));
        return true
    },update: function(c) {
        this.choices.empty();
        this.cached = c;
        var b = c && $type(c);
        if (!b || (b == "array" && !c.length) || (b == "hash" && !c.getLength())) {
            (this.options.emptyChoices || this.hideChoices).call(this)
        } else {
            if (this.options.maxChoices < c.length && !this.options.overflow) {
                c.length = this.options.maxChoices
            }
            c.each(this.options.injectChoice || function(e) {
                var d = new Element("li", {html: e});
                d.inputValue = e;
                this.addChoiceEvents(d).inject(this.choices)
            }, this);
            this.showChoices()
        }
        if (!$defined(c)) {
            var a = new Element("li", {html: "没有找到项目"});
            a.injectInside(this.choices);
            this.showChoices()
        }
    },choiceOver: function(c, d) {
        if (!c || c == this.selected) {
            return
        }
        if (this.selected) {
            this.selected.removeClass("autocompleter-selected")
        }
        this.selected = c.addClass("autocompleter-selected");
        this.fireEvent("onSelect", [this.element, this.selected, d]);
        if (!this.selectMode) {
            this.opted = this.element.value
        }
        if (!d) {
            return
        }
        this.selectedValue = this.selected.inputValue;
        if (this.overflown) {
            var f = this.selected.getCoordinates(this.choices), e = this.options.overflowMargin, g = this.choices.scrollTop, a = this.choices.offsetHeight, b = g + a;
            if (f.top - e < g && g) {
                this.choices.scrollTop = Math.max(f.top - e, 0)
            } else {
                if (f.bottom + e > b) {
                    this.choices.scrollTop = Math.min(f.bottom - a + e, b)
                }
            }
        }
        if (this.selectMode) {
            this.setSelection()
        }
    },choogeStyle: function() {
        this.element.removeClass(this.options.select);
        this.element.addClass(this.options.unselect)
    },choiceSelect: function(b) {
        if (b) {
            this.choiceOver(b)
        }
        this.setSelection(true);
        this.queryValue = false;
        this.hideChoices();
        if (this.options.relatedFun != "") {
            var a = b.getChildren("a").length > 0 ? b.getChildren("a") : b;
            var c = {rel: a.get("rel"),id: a.get("id"),name: a.get("name"),text: a.get("text"),address: a.get("config"),dom: this.element};
            this.options.relatedFun(c)
        }
        if (this.options.form) {
            this.options.form.submit()
        }
        if (this.options.requestid) {
            $(this.options.requestid).value = b.getElement("a").get("rel")
        }
    },filter: function(a) {
        return (a || this.tokens).filter(function(b) {
            return this.test(b)
        }, new RegExp(((this.options.filterSubset) ? "" : "^") + this.queryValue.escapeRegExp(), (this.options.filterCase) ? "" : "i"))
    },addChoiceEvents: function(a) {
        return a.addEvents({mouseover: this.choiceOver.bind(this, [a]),click: this.choiceSelect.bind(this, [a])})
    }});
var OverlayFix = new Class({initialize: function(a) {
        if (Browser.Engine.trident) {
            this.element = $(a);
            this.relative = this.element.getOffsetParent();
            this.fix = new Element("iframe", {frameborder: "0",scrolling: "no",src: "javascript:false;",styles: {position: "absolute",border: "none",display: "none",filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=0)"}}).inject(this.element, "after")
        }
    },show: function() {
        if (this.fix) {
            var a = this.element.getCoordinates(this.relative);
            delete a.right;
            delete a.bottom;
            this.fix.setStyles($extend(a, {display: "",zIndex: (this.element.getStyle("zIndex") || 1) - 1}))
        }
        return this
    },hide: function() {
        if (this.fix) {
            this.fix.setStyle("display", "none")
        }
        return this
    },destroy: function() {
        if (this.fix) {
            this.fix = this.fix.destroy()
        }
    }});
Element.implement({getSelectedRange: function() {
        if (!Browser.Engine.trident) {
            return {start: this.selectionStart,end: this.selectionEnd}
        }
        var e = {start: 0,end: 0};
        var a = this.getDocument().selection.createRange();
        if (!a || a.parentElement() != this) {
            return e
        }
        var c = a.duplicate();
        if (this.type == "text") {
            e.start = 0 - c.moveStart("character", -100000);
            e.end = e.start + a.text.length
        } else {
            var b = this.value;
            var d = b.length - b.match(/[\n\r]*$/)[0].length;
            c.moveToElementText(this);
            c.setEndPoint("StartToEnd", a);
            e.end = d - c.text.length;
            c.setEndPoint("StartToStart", a);
            e.start = d - c.text.length
        }
        return e
    },selectRange: function(d, a) {
        if (Browser.Engine.trident) {
            var c = this.value.substr(d, a - d).replace(/\r/g, "").length;
            d = this.value.substr(0, d).replace(/\r/g, "").length;
            var b = this.createTextRange();
            b.collapse(true);
            b.moveEnd("character", d + c);
            b.moveStart("character", d);
            b.select()
        } else {
            this.focus();
            this.setSelectionRange(d, a)
        }
        return this
    }});
Autocompleter.Base = Autocompleter;
Autocompleter.Local = new Class({Extends: Autocompleter,options: {minLength: 0,delay: 200},initialize: function(b, c, a) {
        this.parent(b, a);
        this.tokens = c
    },query: function() {
        this.update(this.filter())
    }});
Autocompleter.Request = new Class({Extends: Autocompleter,options: {postData: {},ajaxOptions: {},postVar: "value"},query: function() {
        var c = $unlink(this.options.postData) || {};
        c[this.options.postVar] = this.queryValue;
        var b = $(this.options.indicator);
        if (b) {
            b.setStyle("display", "")
        }
        var a = this.options.indicatorClass;
        if (a) {
            this.element.addClass(a)
        }
        this.fireEvent("onRequest", [this.element, this.request, c, this.queryValue]);
        this.request.send({data: c})
    },queryResponse: function() {
        var b = $(this.options.indicator);
        if (b) {
            b.setStyle("display", "none")
        }
        var a = this.options.indicatorClass;
        if (a) {
            this.element.removeClass(a)
        }
        return this.fireEvent("onComplete", [this.element, this.request])
    }});
Autocompleter.Request.JSON = new Class({Extends: Autocompleter.Request,initialize: function(c, b, a) {
        this.parent(c, a);
        this.fn(b);
        this.request = new Request.JSON($merge({url: b,link: "cancel"}, this.options.ajaxOptions)).addEvent("onComplete", this.queryResponse.bind(this))
    },fn: function(a) {
        this.request = new Request.JSON($merge({url: a,link: "cancel"}, this.options.ajaxOptions)).addEvent("onComplete", this.queryResponse.bind(this))
    },queryResponse: function(a) {
        this.parent();
        this.update(a)
    }});
Autocompleter.Request.HTML = new Class({Extends: Autocompleter.Request,initialize: function(c, b, a) {
        this.parent(c, a);
        this.fc(b);
        this.request = new Request($merge({url: b,link: "cancel",update: this.choices}, this.options.ajaxOptions)).addEvent("onComplete", this.queryResponse.bind(this))
    },fc: function(a) {
        this.request = new Request($merge({url: a,link: "cancel",update: this.choices}, this.options.ajaxOptions)).addEvent("onComplete", this.queryResponse.bind(this))
    },queryResponse: function(responseText) {
        eval(responseText);
        this.parent();
        this.update(data.result)
    }});
Autocompleter.Ajax = {Base: Autocompleter.Request,Json: Autocompleter.Request.JSON,Xhtml: Autocompleter.Request.HTML};
function modifyPlug(h, d, b, g) {
    var e = d.skey.indexOf(",") > 0 ? d.skey.substring(0, d.skey.indexOf(",")) : d.skey;
    var c = new Element("a", {href: silunziUtil.basePath + b + "/" + d.id,html: e,rel: g,id: d.id,name: h.element.get("name"),config: d.address ? d.address : ""}).addEvent("click", function(a) {
        a.preventDefault()
    });
    var f = new Element("li").adopt(c);
    f.inputValue = e;
    h.addChoiceEvents(f).injectInside(h.choices)
}
function genChoice(i, f, c) {
    var g = f.skey;
    var e = new Element("a", {href: silunziUtil.basePath + c + f.id,html: g,"class": "left"});
    var d = (f.mk / 10 + ".0").substring(0, 3);
    var b = new Element("span", {"class": "pub-pf",html: d});
    var h = new Element("li").adopt(e);
    b.inject(h);
    h.inputValue = g;
    i.addChoiceEvents(h).injectInside(i.choices)
}
function genCinemaChoice(i, f, c) {
    var g = f.skey.substring(0, f.skey.indexOf(","));
    var e = new Element("a", {href: silunziUtil.basePath + c + f.id,html: g,"class": "left"});
    var d = (f.mk / 10 + ".0").substring(0, 3);
    var b = new Element("span", {"class": "pub-pf",html: d});
    var h = new Element("li").adopt(e);
    b.inject(h);
    h.inputValue = g;
    i.addChoiceEvents(h).injectInside(i.choices)
}
var select = new Class({Implements: [Options, Events],Binds: [],options: {flag: true,trigger: null,close: null,hid: null,triggerClass: "trigger-class",closeClass: "close-class",callback: false,goal: null,request: null,isCompleter: false,specialVal: "",unify: false},initialize: function(a) {
        this.setOptions(a);
        this.build();
        this.control();
        this.start()
    },build: function() {
        this.trigger = $(this.options.trigger);
        this.close = $(this.options.close);
        this.data = $(this.options.data);
        this.hid = $(this.options.hid);
        this.solid = new Fx.Slide(this.options.close).hide();
        this.request = $(this.options.request);
        this.alist = this.close.getElements("a")
    },start: function() {
        var a = this;
        this.trigger.addEvents({click: function() {
                a.setStyle();
                a.flag = true
            },mouseleave: function() {
                a.close.addEvents({mouseover: function() {
                        a.flag = false
                    },mouseleave: function() {
                        a.flag = true;
                        a.trigger.focus()
                    }})
            },blur: function() {
                a.getStyle()
            }})
    },update: function(b, d, c) {
        this.trigger.value = d;
        if (this.request) {
            this.request.value = (c ? c : "")
        }
        if (this.options.isCompleter) {
            var a = ("" + this.options.specialVal.value).trim();
            if (a == "null") {
                a = ""
            }
            c = (c + "").trim();
            if (c == "null") {
                c = ""
            }
            if (this.options.unify) {
                completer.fc(silunziUtil.basePath + "remote.xhtml?a=sport&countycode=" + a + "&servicetype=" + c)
            } else {
                completer.fc(silunziUtil.basePath + "remote.xhtml?a=sport&countycode=" + c + "&servicetype=" + a)
            }
            $(this.options.goal).focus();
            completer.refresh()
        }
        if (this.hid) {
            this.hid.value = b
        }
        if (this.options.callback) {
            completer.refresh();
            if (this.options.goal) {
                $(this.options.goal).focus()
            }
        }
        this.flag = true;
        this.getStyle()
    },getItem: function(b, a) {
        this.alist = b;
        this.hid = a;
        this.control()
    },control: function() {
        var a = this;
        this.alist.each(function(b) {
            b.addEvent("click", function(d) {
                if ($chk(this.get("rel"))) {
                    d.preventDefault();
                    var c = this.get("rel").trim();
                    a.update(c, this.get("text"), this.get("id"))
                }
            })
        })
    },setStyle: function() {
        this.trigger.getNext().setStyles({top: this.trigger.getTop() + 23,left: this.trigger.getLeft() - 1});
        this.trigger.getNext().show();
        this.trigger.removeClass("close-class");
        this.trigger.addClass("trigger-class");
        this.solid.slideIn()
    },getStyle: function() {
        if (this.flag) {
            this.trigger.removeClass("trigger-class");
            this.trigger.addClass("close-class");
            this.solid.hide();
            this.trigger.getNext().hide()
        }
    }});
var nav = {};
nav.getConfig = function() {
    var a = $("navigation");
    return function(c) {
        var b = a.getAttribute(c);
        return b ? b : ""
    }
}();
nav.movie = {"热映电影": "/movie/searchMovie.xhtml","即将上映": "/movie/futureMovie.xhtml","电影院": lunzi.util.cinemaCityPy,"快速购票": "/cinema/searchOpi.xhtml","电影活动": "/activity/activityList.xhtml?tag=cinema","电影资讯": "/news/cinema"};
nav.drama = {"话剧": "/drama/dramaList.xhtml?dramatype=drama","演唱会": "/drama/dramaList.xhtml?dramatype=concert","音乐会": "/drama/dramaList.xhtml?dramatype=musicale","体育赛事": "/drama/dramaList.xhtml?dramatype=race","儿童亲子": "/drama/dramaList.xhtml?dramatype=children","追剧团": "/drama/troupeIndex.xhtml","演出活动": "/activity/activityList.xhtml?tag=theatre"};
nav.sport = {"预订场馆": "/sport/sportList.xhtml","项目": "/sport/itemList.xhtml","心得": "/sport/itemDiaryList.xhtml","资讯": "/news/sport","活动": "/activity/activityList.xhtml?tag=sport"};
nav.gym = {"健身馆": "/gym/searchGym.xhtml","健身项目": "/gym/courseList.xhtml","教练": "/gym/coachList.xhtml","资讯": "/news/gym"};
nav.home = {"哇啦": "/home/sns/personIndex.xhtml","论坛": "/blog/","圈子": "/quan/","知道": "/qa/"};
nav.moreInfo = {"资讯": "/news/cinema","电影库": "/movie/searchMovieStore.xhtml","论坛": "/blog/"};
if (lunzi.util.cityType == 310000) {
    nav.activity = {"活动首页": "/activity/","电影&amp;话剧": "/activity/activityList.xhtml","运动&amp;健身": "/activity/activityList.xhtml?tag=sg","其他活动": "/activity/activityList.xhtml?tag=other","我的活动": "/activity/myActivityList.xhtml"}
} else {
    nav.activity = {"活动首页": "/activity/","我的活动": "/activity/myActivityList.xhtml"}
}
nav.login = function() {
    if (!$("nav-shortcut")) {
        return
    }
    var b = silunzi.util.rtime();
    var a = Number.random(100000, 999999);
    silunziUtil.sendLoad("nav-shortcut", silunziUtil.basePath + "ajax/common/loadHeader.action?tagNo=" + b + a, {head: "header"})
};

nav.closeTopNotice = function() {
    $("top_notice").dispose();
    $(document.html).setStyle("background-position", "0 50px");
    $(document.body).setStyle("background-position", "center 50px")
};
nav.getCityHtml = function(e, c, d) {
    if ($(e) && c.trim() && $chk(c.trim())) {
        var b = {};
        b.triger = new Element("b", {"class": "ui_cityChoose",html: d,title: "点击切换城市"}).inject(e, "top");
        b.parent = $("ui_city_plugs");
        if (b.parent) {
            b.parent.toPos(b.triger, "bottomLeft", 0, 7)
        }
        b.triger.addEvent("click", function() {
            b.parent.toPos(b.triger, "bottomLeft", 0, 7);
            b.triger.toggleClass("ui_cityChoice");
            b.parent.toggleClass("none");
            b.close = b.parent.getElement('span[class*="ui_close"]');
            b.close.addEvent("click", function() {
                b.parent.addClass("none");
                b.triger.removeClass("ui_cityChoice")
            });
            f(b.parent, this, function() {
                if ($("hotCitys")) {
                    $("hotCitys").fireEvent("click")
                }
            });
            a(b.parent, this)
        })
    }
    var f = function(h, g, i) {
        h = $(h);
        document.addEvent("click", function(k) {
            var j = $(k.target);
            if (j != h && !h.contains(j) && j != g) {
                document.removeEvent("click", arguments.callee);
                g.removeClass("ui_cityChoice");
                h.addClass("none");
                if (i) {
                    i()
                }
            }
        })
    };
    var a = function(h) {
        h = $(h);
        var g = h.getElements("dl");
        g.addEvents({mouseover: function() {
                g.each(function(i) {
                    i.removeClass("select")
                });
                this.addClass("select")
            },mouseout: function() {
                this.removeClass("select")
            }})
    }
};
nav.bindEvent = function() {
    nav.navpanel = document.getElements("ul[lang=ishover] li:not(li.isDisabled)");
    if (nav.navpanel.length == 0) {
        return
    }
    nav.navpanel.each(function(b, a) {
        nav["bgcolor" + a] = b.getParent("div[lang=bgcolor]").getStyle("background-color");
        nav["rgba" + a] = (nav["bgcolor" + a] == "transparent") ? "#ffffff".hexToRgb(true) : (nav["bgcolor" + a].hexToRgb(true));
        nav["parent" + a] = new Element("div", {"class": "doAccessKeys",styles: {border: "1px solid #dddddd","border-top": 0,background: "#fff",position: "absolute",top: 0,visibility: "hidden",width: b.getDimensions().x + 80,overflow: "hidden","z-index": 200}}).inject(document.body);
        nav["parent" + a].toPos(b, "bottomLeft", 0, (nav["bgcolor" + a] != "transparent") ? 0 : -1);
        nav["inner" + a] = new Element("div").inject(nav["parent" + a]);
        Object.each(nav[b.get("key")], function(c, d) {
            new Element("span", {html: d}).inject(new Element("a", {href: c}).inject(nav["inner" + a]))
        });
        b.hover(nav["parent" + a], null, function() {
            b.addClass("ishover");
            if (b.get("key") != null) {
                nav["parent" + a].toPos(b, "bottomLeft", 5, 0)
            } else {
                nav["parent" + a].addClass("none")
            }
        }, function() {
            b.removeClass("ishover")
        }, 0)
    })
};
nav.userInfo = function() {
    var a = $("global_user_infobox"), b = $("global_user_detail");
    a.hover(b, null, function() {
        a.addClass("hover");
        b.toPos(a, "bottomLeft", -1, 0);
        nav.userOrder()
    }, function() {
        a.removeClass("hover")
    })
};
nav.userOrder = function() {
    var b = $("global_userOrder"), c = $("golbal_orderDetail"), a = 0;
    b.hover(c, null, function() {
        if (this.retrieve("loadNavigationOrderList") == null) {
            var e = silunziUtil.basePath + "home/navigationOrderManageStatus.xhtml";
            var d = {};
            silunziUtil.sendLoad($("ajaxOrderListDetail"), e, d, function(f) {
                a = 4 + $("ajaxOrderListDetail").getDimensions().y;
                c.tween("height", [200, a])
            });
            this.store("loadNavigationOrderList", true)
        }
        c.tween("height", [a, a]);
        c.toPos(b, "topLeft", -315, 0)
    }, function() {
        b.removeClass("hover")
    }, 0)
};
nav.vdata = function() {
    $("skey").focus();
    if ($("skey").value === "") {
        return false
    } else {
        return true
    }
};
var cancleCall = null;
function checkUserName(a, b) {
    if ($(a).value.trim() == "") {
        lunzi.util.focusErroe(a, "请输入" + b + "！");
        return false
    }
    (function() {
        if (!(silunziUtil.isEmail($(a).value.trim())) && !silunziUtil.isMobile($(a).value.trim())) {
            lunzi.util.focusErroe(a, b + "格式错误！");
            return
        }
    }).delay(300)
}
function loginTo() {
    var e = $("loginname").value;
    var b = $("loginpassword").value;
    var a = $("dialogLoginCaptcha").value;
    var d = $("dialogLoginCaptchaInput").value;
    if (!$chk(e)) {
        $("loginname").focus();
        return
    } else {
        lunzi.util.remmoveError($("loginname"))
    }
    if (!$chk(b)) {
        $("loginpassword").focus();
        return
    } else {
        lunzi.util.remmoveError($("loginpassword"))
    }
    if (!$chk(d)) {
        $("dialogLoginCaptchaInput").focus();
        return
    } else {
        lunzi.util.remmoveError($("dialogLoginCaptchaInput"))
    }
    var c = "";
    if ($("rememberMe")) {
        c = $("rememberMe").value
    }
    silunziUtil.sendRequest(silunziUtil.basePath + "ajax/common/asynchLogin.dhtml", {username: $("loginname").value,password: $("loginpassword").value,captchaId: a,captcha: d,rememberMe: c}, function(f) {
        if (f.success) {
            silunziUtil.member.login = true;
            silunziUtil.member.memberid = f.id;
            silunziUtil.member.nickname = f.realname;
            silunziUtil.member.isMobile = f.isMobile;
            lunzi.util.container.logins.dispose("logins");
            if (loginCallback) {
                loginCallback()
            }
        } else {
            if (f.errorMap.j_password) {
                lunzi.util.focusErroe("loginpassword", f.errorMap.j_password);
                $("loginpassword").value = ""
            } else {
                if (f.errorMap.j_username) {
                    lunzi.util.focusErroe("loginname", f.errorMap.j_username)
                } else {
                    lunzi.util.focusErroe("dialogLoginCaptchaInput", f.errorMap.captcha)
                }
            }
            if ($("dialogLoginCaptcha")) {
                silunziUtil.refreshCaptcha("dialogLoginCaptcha")
            }
        }
    })
}
var cancleCall = null;
function showLogin(b, a) {
	if ($("logins")) {
        lunzi.util.maskContent("", "logins", "养车客", 600, "logins", "", "", "", false, "", function() {
            lunziUtil.textOver(".focusText");
            silunziUtil.refreshCaptcha("dialogLoginCaptcha")
        })
    }
    if ($("isMoreLogin")) {
        $("isMoreLogin").toPos($$(".isMoreLogin")[0], "upperRight", 5, -12)
    }
    if (b) {
        loginCallback = b
    } else {
        loginCallback = null
    }
    if (a) {
        cancleCall = a
    }
}
function chooseVehicle(b,a) {
	if ($("dialog_choose_car_model")) {
        lunzi.util.maskContent("", "dialog_choose_car_model", "选择车型", 748, "dialog_choose_car_model", "", "", "", false, "", function() {
            //lunziUtil.textOver(".focusText");
            //silunziUtil.refreshCaptcha("dialogLoginCaptcha")
        })
    }
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getBrands.action',{'fc':'1'});
	if (b) {
        loginCallback = b
    } else {
        loginCallback = null
    }
    if (a) {
        cancleCall = a
    }
}

function chooseBrand(url,values){
	//$('new_select_box_content').innerHTML = "<span>bobo</span>";
	silunziUtil.sendLoad($('dialog_choose_car_model'), url,values,function(result){});

}
function getVehicleBrand(fc){
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getBrands.action',{'fc':fc},function(result){});
}
function getVehicleSeries(){
	var pcode = this.getAttribute("brand_id");
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleSeries.action',{'pcode':pcode},function(result){});
}
function toStep2(brandCode){
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleSeries.action',{'pcode':brandCode},function(result){});
}

function getVehicleEmission(){
	var pcode = this.getAttribute("series_id");
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleEmission.action',{'pcode':pcode},function(result){});
}
function toStep3(seriesCode){
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleEmission.action',{'pcode':seriesCode},function(result){});
}
function getVehicleYear(){
	var pcode = this.getAttribute("emission_id");
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleYear.action',{'pcode':pcode},function(result){});
}
function getVehicleModel(){
	var scode = this.getAttribute("series_id");
	var ecode = this.getAttribute("emission_id");
	silunziUtil.sendLoad($('dialog_choose_car_model'), silunzi.util.basePath+'ajax/common/getVehicleModel.action',{'scode':scode,'ecode':ecode},function(result){});
}
function confirmVehicle(){
	var modelId = this.getAttribute("vehicle_id");
	silunziUtil.sendRequest(silunziUtil.basePath + "ajax/common/confirmVechicle.action", {vehicle_id:modelId}, function(f) {
        if (f.success) {
        	lunzi.util.container.dialog_choose_car_model.dispose("dialog_choose_car_model");
        	if (loginCallback) {
                loginCallback()
            }
        } 
	})
}

lunzi.util.focusErroe = function(d, e) {
    d = $(d).getParent();
    var c = d.getParent();
    if (!d.retrieve("error")) {
        d.setStyles({"border-color": "#DD4B39"});
        var b = c.getStyle("margin-bottom").toInt(), a = new Element("div", {html: e,styles: {color: "#dd4b39",margin: "-" + b + "px 0 8px 0","font-size": "13px","line-height": "22px"}}).inject(c, "after");
        d.store("error", a)
    } else {
        d.setStyles({"border-color": "#DD4B39"});
        d.retrieve("error").show().innerHTML = e
    }
};
lunzi.util.remmoveError = function(a) {
    a = $(a).getParent();
    if (!a.retrieve("error")) {
        return
    }
    a.retrieve("error").hide();
    a.setStyles({"border-color": "#CCCCCC","box-shadow": "none"})
};
nav.init = function() {
    nav.login();
    
};
