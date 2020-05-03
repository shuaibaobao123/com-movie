/*---------------------------------------------------------------------------*\
|  Subject: JavaScript Framework
|  Author:  meizz
|  Created: 2005-02-27
|  Version: 2006-08-11
|-----------------------------------
|  MSN:huangfr@msn.com  QQ:112889082
|  http://www.meizz.com  Copyright (c) meizz   MIT-style license
|  The above copyright notice and this permission notice shall be
|  included in all copies or substantial portions of the Software
\*---------------------------------------------------------------------------*/

window.System = function(){this.setHashCode();}

System.debug=true; //false
System._codebase={};
try
{
  if (window!=parent && parent.System && parent.System._codebase)
    System._codebase = parent.System._codebase;
  else if ("undefined"!=typeof opener&&opener.System&&opener.System._codebase)
    System._codebase = opener.System._codebase;
  else if ("undefined"!=typeof dialogArguments && dialogArguments.System)
    System._codebase = dialogArguments.System._codebase;
}
catch(ex){}

System.MISSING_ARGUMENT="Missing argument";
System.ARGUMENT_PARSE_ERROR="The argument cannot be parsed";
System.NOT_SUPPORTED_XMLHTTP="Your browser do not support XMLHttp";
System.FILE_NOT_FOUND="File not found";
System.MISCODING="Maybe file encoding is not ANSI or UTF-8";
System.NAMESPACE_ERROR=" nonstandard namespace";

System.hashCounter=0;
System.currentVersion="20060811";
var t=document.getElementsByTagName("SCRIPT");
t=(System.scriptElement=t[t.length-1]).src.replace(/\\/g, "/");
System.incorporate=function(d,s){for(var i in s)d[i]=s[i];return d;};
System.path=(t.lastIndexOf("/")<0)?".":t.substring(0, t.lastIndexOf("/"));
System.getUniqueId=function(){return "mz_"+(System.hashCounter++).toString(36);};
System.toHashCode=function(e)
{
  if("undefined"!=typeof e.hashCode) return e.hashCode;
  return e.hashCode=System.getUniqueId();
};
System.supportsXmlHttp=function()
{
  return "object"==typeof(System._xmlHttp||(System._xmlHttp=new XMLHttpRequest()));
};
System._getPrototype=function(namespace, argu)
{
  if("undefined"==typeof System._prototypes[namespace])return new System();
  for(var a=[], i=0; i<argu.length; i++) a[i]="argu["+ i +"]";
  return eval("new (System._prototypes['"+namespace+"'])("+a.join(",")+")");
};
System.ie=navigator.userAgent.indexOf("MSIE")>0 && !window.opera;
System.ns=navigator.vendor=="Netscape";
System._alert=function(msg){if(System.debug)alert(msg);};
System._parseResponseText=function(s)
{
    if (null==s||"\uFFFD"==s.charAt(0)){System._alert(System.MISCODING);return "";}
    if ("\xef"==s.charAt(0))s=s.substr(3); //for firefox
    return s.replace(/(^|\n)\s*\/\/+\s*((Using|Import|Include)\((\"|\'))/g,"$1$2");
};

if(window.ActiveXObject && (System.ie || !window.XMLHttpRequest))
{
  window.XMLHttpRequest = function()
  {
    var msxmls=['MSXML3','MSXML2','Microsoft'], ex;
    for(var i=0;i<msxmls.length;i++)
      try{return new ActiveXObject(msxmls[i]+'.XMLHTTP')} catch(ex){}
    System._xmlHttp="mz"; throw new Error(System.NOT_SUPPORTED_XMLHTTP);
  }
}
System.load = function(namespace, path)
{
  try
  {
    if(System.supportsXmlHttp()){path=System._mapPath(namespace, path);
    var x=System._xmlHttp; x.open("GET",path,false); x.send(null);
    if (x.readyState==4)
    {
      if(x.status==0||/^file\:/i.test(path))
        return System._parseResponseText(x.responseText);
      else if(x.status==200)return System._parseResponseText(x.responseText);
      else if(x.status==404)System._alert(namespace+"\n"+System.FILE_NOT_FOUND);
      else throw new Error(x.status +": "+ x.statusText);}
    } else System._alert(System.NOT_SUPPORTED_XMLHTTP);
  }
  catch(ex){System._alert(namespace+"\n"+ex.message);}return "";
};
System._eval = function(namespace, path)
{
  //alert("System._eval(\""+namespace+"\")=\r\n"+System._codebase[namespace]);
  try{if(window.execScript)window.execScript(System._codebase[namespace]);else
  {
    var script=document.createElement("SCRIPT");script.type="text/javascript";
    script.innerHTML="eval(System._codebase['"+ namespace +"']);";
    document.getElementsByTagName("HEAD")[0].appendChild(script);
    setTimeout(function(){script.parentNode.removeChild(script)},99);
  }}catch(ex){/*System._alert("Syntax error on load "+ namespace);*/}
  System._existences[namespace]=System._mapPath(namespace, path);
};
System._exist = function(namespace, path)
{
  if("undefined"==typeof System._existences[namespace]) return false;
  return System._existences[namespace]==System._mapPath(namespace,path);
};
System._mapPath = function(namespace, path)
{
  if("string"==typeof path && path.length>3)return path.toLowerCase();
  var p=(System.path+"/"+namespace.replace(/\./g,"/")+".js").toLowerCase();
  return p +(("undefined"==typeof path||path) ? "" : "?t="+ Math.random());
};

window.Using = function(namespace, path, rename)
{
  if(System._exist(namespace, path)){
  var s=window[namespace.substr(namespace.lastIndexOf(".")+1)];
  if(s!=System._prototypes[namespace])s=System._prototypes[namespace];return}
  var code=namespace +"."; if(!/((^|\.)[\w\$]+)+$/.test(namespace))
  throw new Error(namespace+System.NAMESPACE_ERROR);
  for(var i=code.indexOf("."); i>-1; i=code.indexOf(".", i+1)){
  var e= code.substring(0,i), s=(e.indexOf(".")==-1) ? "window[\""+e+"\"]":e;
  if(e&&"undefined"==typeof(s)){
  eval(s+"=function(){return System._getPrototype(\""+e+"\", arguments)}");}}
  if("undefined"==typeof path &&"string"==typeof System._codebase[namespace])
  {
    System._eval(namespace, path);}else{if(code=System.load(namespace,path)){
    e = "$"+ System.getUniqueId() +"__id"+ new Date().getTime() +"$";
    s = "function "+e+"(){\r\n"+code+";\r\nSystem._prototypes['";
    code=namespace.substr(namespace.lastIndexOf(".")+1);
    s += namespace+"']=window['"+(rename||code)+"']="+code+";\r\n}"+e+"();";
    System._codebase[namespace]=s;s="";System._eval(namespace, path);}
  }
};
window.Import=function(namespace,path,rename){Using(namespace,path,rename)};
window.Instance=function(hashCode){return System._instances[hashCode]};
window.Include=function(namespace, path)
{
  if(System._exist(namespace, path)) return;
  var code;if(!/((^|\.)[\w\$]+)+$/.test(namespace))
  throw new Error(namespace + System.NAMESPACE_ERROR);
  if("undefined"==typeof path&&"string"==typeof(System._codebase[namespace]))
  {
    System._eval(namespace, path);}else if(System.supportsXmlHttp()){
    if(code=System.load(namespace, path)){System._codebase[namespace]=code;
    System._eval(namespace, path);}}else{
    var script=document.createElement("SCRIPT");script.type="text/javascript";
    script.src=System._existences[namespace]=System._mapPath(namespace,path);
    document.getElementsByTagName("HEAD")[0].appendChild(script);
    setTimeout(function(){script.parentNode.removeChild(script)},99);
  }
};

Function.READ=1;Function.WRITE=2;Function.READ_WRITE=3;
Function.prototype.addProperty=function(name,initValue,r_w)
{
  var capital=name.charAt(0).toUpperCase()+name.substr(1);
  r_w=r_w||Function.READ_WRITE; name="_"+name; var p=this.prototype;
  if("undefined"!=typeof initValue) p[name]=initValue;
  if(r_w&Function.READ) p["get"+ capital]=function(){return this[name];};
  if(r_w&Function.WRITE) p["set"+ capital]=function(v){this[name]=v;};
};
Function.prototype.Extends=function(SuperClass,ClassName)
{
  var op=this.prototype, i, p=this.prototype=new SuperClass();
  if(ClassName)p._className=ClassName; for(i in op)p[i]=op[i];
  if(p.hashCode)delete System._instances[p.hashCode];return p;
};
System._instances={};
System._prototypes=
{
  "System":System,
  "System.Object":System,
  "System.Event":System.Event
};
System._existences=
{
  "System":System._mapPath("System"),
  "System.Event":System._mapPath("System.Event"),
  "System.Object":System._mapPath("System.Object")
};
t=System.Extends(Object, "System"); System.Object = System;
t.decontrol=function(){var t;if(t=this.hashCode)delete System._instances[t]};
t.addEventListeners=function(type, handle)
{
  if("function"!=typeof handle)
    throw new Error(this+" addEventListener: "+handle+" is not a function");
  if(!this._listeners) this._listeners={};
  var id=System.toHashCode(handle), t=this._listeners; 
  if("object"!=typeof t[type]) t[type]={}; t[type][id]=handle;
};
t.removeEventListener=function(type, handle)
{
  if(!this._listeners)this._listeners={}; var t=this._listeners;
  if(!t[type]) return; var id=System.toHashCode(handle);
  if( t[type][id])delete t[type][id];if(t[type])delete t[type];
};
t.dispatchEvent=function(evt)
{
  if(!this._listeners)this._listeners={};
  var i, t =this._listeners, p =evt.type;
  evt.target=evt.srcElement=this; if(this[p])this[p](evt);
  if("object"==typeof t[p]) for(i in t[p]) t[p][i].call(this,evt);
  delete evt.target; delete evt.srcElement;return evt.returnValue;
};
t.setHashCode=function()
{
  System._instances[(this.hashCode=System.getUniqueId())]=this;
};
t.getHashCode=function()
{
  if(!this.hashCode)this.setHashCode(); return this.hashCode;
};
t.toString=function(){return "[object "+(this._className||"Object")+"]";};
System.Event=function(type){this.type=type;};
t=System.Event.Extends(System, "System.Event");
t.returnValue=true;
t.cancelBubble=false;
t.target=t.srcElement=null;
t.stopPropagation=function(){this.cancelBubble=true;};
t.preventDefault =function(){this.returnValue=false;};

if(System.ie && !System.debug) Include("System.Plugins.IE"); //IE UserData
if(window.opera) Include("System.Plugins.Opera"); //Opera support
Include("System.Global");





/****** Common Helper *****/
function Hashtable() 
{
  this._hash = {};
  this._count = 0;
  this.add = function(key, value) 
  {
      if (this._hash.hasOwnProperty(key)) return false;
      else { this._hash[key] = value; this._count++; return true; }
  }
  this.remove = function(key) { delete this._hash[key]; this._count--; }
  this.count = function() { return this._count; }
  this.items = function(key) { if (this.contains(key)) return this._hash[key]; }
  this.contains = function(key) { return this._hash.hasOwnProperty(key); }
  this.clear = function() { this._hash = {}; this._count = 0; }
}

String.prototype.trim = function() { return this.replace(/(^\s*)|(\s*$)/g, ""); }

//------For Statutory------
var hashArea = new Hashtable();
var hashRegion = new Hashtable();
var hashCountry = new Hashtable();
var hashCompany = new Hashtable();
var hashSelectedCompany = new Hashtable();
var hashSelectedNodes = new Hashtable();
//-------------------------

//------For Executive------
var hashCorp = new Hashtable();
var hashBV = new Hashtable();
var hashSelectedBV = new Hashtable();
var hashSelectedNodesBV = new Hashtable();
//-------------------------

//------For Vendor---------
var hashVendor = new Hashtable();
var hashContract = new Hashtable();
var hashSelectedCon = new Hashtable();
var hashSelectedNodesCon = new Hashtable();
//-------------------------

//------For Process--------
var hashTower = new Hashtable();
var hashProcess = new Hashtable();
var hashSelectedPro = new Hashtable();
var hashSelectedNodesPro = new Hashtable();
//-------------------------

function FillData(arrAreaRegion, arrRegionCountry, arrCountryCompany, arrSelectedCompany) {
    hashArea.clear();
    hashRegion.clear();
    hashCountry.clear();
    hashCompany.clear();
    hashSelectedCompany.clear();
    hashSelectedNodes.clear();
    
    var data = {};

    for (var i = 0; i < arrSelectedCompany.length; i++) {
        hashSelectedCompany.add(arrSelectedCompany[i], arrSelectedCompany[i]);
    }
    
    data["-1_Root"] = "text: Statuary;";

    //fill Area and Region
    for (var i = 0; i < arrAreaRegion.length - 1; i++) {
        if (arrAreaRegion[i] != "") {
            arrTmp = arrAreaRegion[i].split("`");
            if (arrTmp.length > 1) {
                var a = arrTmp[0].trim();
                var b = arrTmp[1].trim();
                if (!hashArea.contains(a)) {
                    hashArea.add(a, "Root");
                    data["Root_" + a] = "text:" + a + ";";//Area
                }
                if (!hashRegion.contains(b + "1")) {
                    hashRegion.add(b + "1", a);
                    data[a + "_" + b + "1"] = "text:" + b + ";";//Region
                }
            }
        }
    }

    //fill Country
    for (var j = 0; j < arrRegionCountry.length - 1; j++) {
        if (arrRegionCountry[j] != "") {
            arrTmp = arrRegionCountry[j].split("`");
            if (arrTmp.length > 1) {
                var a = arrTmp[0].trim();
                var b = arrTmp[1].trim();
                if (!hashCountry.contains(b + "11")) {
                    hashCountry.add(b + "11", a + "1");
                    data[a + "1_" + b + "11"] = "text:" + b + ";";//Country
                }
            }
        }
    }

    //fill Company
    var t;
    for (var l = 0; l < arrCountryCompany.length - 1; l++) {
        if (arrCountryCompany[l] != "") {
            arrTmp = arrCountryCompany[l].split("`");
            if (arrTmp.length > 1) {
                t = arrTmp[1].split(";#");
                if (t.length > 1) {
                    var a = arrTmp[0].trim();
                    var b = t[1].trim();
                    if (!hashCompany.contains(b)) {
                        hashCompany.add(b, a);
                        data[a + "11_" + t[0]] = "text:" + b + ";";
                        if (hashSelectedCompany.contains(b.split("-")[0])) {
                            data[a + "11_" + t[0]] += "checked:true;"; //CompandCode
                            hashSelectedNodes.add(a + "11", "");
                        }
                    }
                }
            }
        }
    }
    
    return data;
}

function FillDataExecutive(arr, arrSelected) {
    hashCorp.clear();
    hashBV.clear();
    hashSelectedBV.clear();
    hashSelectedNodesBV.clear();

    var data = {};

    for (var i = 0; i < arrSelected.length; i++) {
        hashSelectedBV.add(arrSelected[i], arrSelected[i]);
    }

    data["-1_Root"] = "text: Executive Function;";

    for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i] != "") {
            t = arr[i].indexOf("-");
            if (-1 != t) {
                tmp1 = arr[i].substring(0, t - 1);
                if (!hashCorp.contains(tmp1)) {
                    hashCorp.add(tmp1, "Root");
                    data["Root_" + tmp1] = "text:" + tmp1 + ";";
                }
                tmp2 = arr[i].substring(t + 1, arr[i].length);
                arrTmp = tmp2.split("`");
                if (arrTmp.length > 1) {
                    if (!hashBV.contains(arrTmp[0])) {
                        hashBV.add(arrTmp[0], tmp1);
                        data[tmp1 + "_" + arrTmp[1]] = "text:" + arrTmp[0] + ";";
                        t = arrTmp[0].split("-");
                        if (t.length > 1) {
                            if (hashSelectedBV.contains(t[0].trim())) {
                                data[tmp1 + "_" + arrTmp[1]] += "checked:true;";
                                hashSelectedNodesBV.add(tmp1, "");
                            }
                        }
                    }
                }
            }
        }
    }

    return data;
}

function FillDataVendor(arr, arrSelected) {
    hashVendor.clear();
    hashContract.clear();
    hashSelectedCon.clear();
    hashSelectedNodesCon.clear();

    var data = {};

    for (var i = 0; i < arrSelected.length; i++) {
        hashSelectedCon.add(arrSelected[i], arrSelected[i]);
    }

    data["-1_Root"] = "text: All;";

    for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i] != "") {
            t = arr[i].split("`");
            if (t.length > 2) {
                if (!hashVendor.contains(t[0])) {
                    hashVendor.add(t[0], "Root");
                    data["Root_" + t[0]] = "text:" + t[0] + ";";
                }
                if (!hashContract.contains(t[1])) {
                    hashContract.add(t[1], t[0]);
                    data[t[0] + "_" + t[2]] = "text:" + t[1] + ";";
                    if (hashSelectedCon.contains(t[2])) {
                        data[t[0] + "_" + t[2]] += "checked:true;";
                        hashSelectedNodesCon.add(t[0], "");
                    }
                }
            }
        }
    }

    return data;
}

function FillDataProcess(arr, arrSelected) {
    hashTower.clear();
    hashProcess.clear();
    hashSelectedPro.clear();
    hashSelectedNodesPro.clear();

    var data = {};

    for (var i = 0; i < arrSelected.length; i++) {
        hashSelectedPro.add(arrSelected[i], arrSelected[i]);
    }

    data["-1_Root"] = "text: All;";

    for (var i = 0; i < arr.length - 1; i++) {
        if (arr[i] != "") {
            t = arr[i].split("`");
            if (t.length > 2) {
                if (!hashTower.contains(t[0])) {
                    hashTower.add(t[0], "Root");
                    data["Root_" + t[0]] = "text:" + t[0] + ";";
                }
                if (!hashProcess.contains(t[1])) {
                    hashProcess.add(t[1], t[0]);
                    data[t[0] + "_" + t[2]] = "text:" + t[1] + ";";
                    if (hashSelectedPro.contains(t[2])) {
                        data[t[0] + "_" + t[2]] += "checked:true;";
                        hashSelectedNodesPro.add(t[0], "");
                    }
                }
            }
        }
    }

    return data;
}

function expandNodes(a) {
    if (hashSelectedNodes.count > hashCompany.count / 2) {
        a.expandAll("Root");
        return;
    }
    var _nodesCountry = new Hashtable();
    var _nodesRegion = new Hashtable();

    for (var i in hashSelectedNodes._hash) {
        if (hashCountry.contains(i)) {
            _nodesCountry.add(hashCountry.items(i), "");
        }
    }
    for (var j in _nodesCountry._hash) {
        if (hashRegion.contains(j)) {
            _nodesRegion.add(hashRegion.items(j), "");
        }
    }
    //expand region level
    for (var i in _nodesRegion._hash) {
        a.expand(i);
    }
    //expand country level
    for (var j in _nodesCountry._hash) {
        a.expand(j);
    }
    //expand company level
    for (var k in hashSelectedNodes._hash) {
        a.expand(k);
    }
}

function expandNodesExecutive(a) {
    if (hashSelectedNodesBV.count > hashBV.count / 2) {
        a.expandAll("Root");
        return;
    }
    var _nodesCorp = new Hashtable();

    for (var i in hashSelectedNodesBV._hash) {
        a.expand(i);
    }
}

function expandNodesVendor(a) {
    if (hashSelectedNodesCon.count > hashContract.count / 2) {
        a.expandAll("Root");
        return;
    }
    var _nodesContract = new Hashtable();

    for (var i in hashSelectedNodesCon._hash) {
        a.expand(i);
    }
}

function expandNodesProcess(a) {
    if (hashSelectedNodesPro.count > hashProcess.count / 2) {
        a.expandAll("Root");
        return;
    }
    var _nodesProcess = new Hashtable();

    for (var i in hashSelectedNodesPro._hash) {
        a.expand(i);
    }
}

function getChecked(a) {
    var rst = "";
    debugger;
    for (var i in a.nodes) {
        if (a.nodes[i].checked && !a.nodes[i].hasChild) rst += a.nodes[i].id + ",";
    }
    if (rst.length>0) rst = rst.substr(0, rst.length - 1);
    return rst;
}

function getCheckedNodesCompanyCodes(a) {
    var rst = "";
    for (var i in a.nodes) {
        if (a.nodes[i].checked && !a.nodes[i].hasChild) {
            var com = a.nodes[i].text.split('-');
            if (com.length > 0) {
                rst += com[0] + ",";
            }
        }
    }
    if (rst.length > 0) rst = rst.substr(0, rst.length - 1);
    return rst;
}