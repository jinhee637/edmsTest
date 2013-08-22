<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html lang="ko">
<head>
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 <title>jsTree v.1.0 - full featured demo</title>
<script type="text/javascript" src="/jstree/_lib/jquery.js"></script>

<script type="text/javascript" src="/jstree/_lib/jquery.cookie.js"></script>

<script type="text/javascript" src="/jstree/_lib/jquery.hotkeys.js"></script>

<script type="text/javascript" src="/jstree/jquery.jstree.js"></script>
 <style type="text/css">
 html, body { margin:0; padding:0; }
 body, td, th, pre, code, select, option, input, textarea { font-family:verdana,arial,sans-serif; font-size:10px; }
 .demo, .demo input, .jstree-dnd-helper, #vakata-contextmenu { font-size:10px; font-family:Verdana; }
 #container { width:780px; margin:10px auto; overflow:hidden; position:relative; }
 #demo { width:auto; height:400px; overflow:auto; border:1px solid gray; }

 #text { margin-top:1px; }

 #alog { font-size:9px !important; margin:5px; border:1px solid silver; }
 </style>
</head>

<body>
<div id="demo" class="demo"></div>
<div id="menu">
<button id="addFolder">add folder</button><br/>
<button id="addItem">add item</button><br/>
<button id="deleteItem">delete item</button><br/>
</div>

<script>
$(function () {
 $("#demo").jstree({ 
  "xml_data" : {
   "ajax" : {
    "url" : "test.xml"
   },
   "xsl" : "nest"
  },
  "plugins" : [ "themes", "xml_data","ui","crrm"],
  "ui" : {
   // this makes the node with ID node_4 selected onload
   "initially_select" : [ "pxml_6" ]
  }
 });
});

$(function(){
 $("#demo").bind("create.jstree", function (event, data) {
  data.rslt.obj.attr("id","testid");
  alert(data.rslt.obj.attr("id"));
 });
});

$(function(){
 $('#menu button').click(function(){
  switch(this.id){
  case "addFolder":
   //alert("addFolder");
   //$("#demo").jstree("create", null, "last", { "attr" : { "rel" : "folder" } });
   //$("#demo").jstree("create",-1,false,"CREATED NODE",false,true);
   $("#demo").jstree("create","#pxml_5","last","CREATED NODE",false,true);
   break;
  case "addItem":
   //alert("addItem");
   $("#demo").jstree("create", null, "last", { "attr" : { "rel" : "default" } });
   break;
  case "deleteItem":
   $("#demo").jstree("remove","#testid");
  default:
   break;
  }
 });
});
</script>
</body>
</html>


