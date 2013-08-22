<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html lang="ko">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>jsTree example demo1</title>







<script type="text/javascript" src="/jstree/_lib/jquery.js"></script>

<script type="text/javascript" src="/jstree/_lib/jquery.cookie.js"></script>

<script type="text/javascript" src="/jstree/_lib/jquery.hotkeys.js"></script>

<script type="text/javascript" src="/jstree/jquery.jstree.js"></script>




</head>




<body class="nosidebar">
<div id="mmenu" style="height:30px; overflow:auto;">
<input type="button" id="add_folder" value="add folder" style="display:block; float:left;"/>
<input type="button" id="add_default" value="add file" style="display:block; float:left;"/>
<input type="button" id="rename" value="rename" style="display:block; float:left;"/>
<input type="button" id="remove" value="remove" style="display:block; float:left;"/>
<input type="button" id="cut" value="cut" style="display:block; float:left;"/>
<input type="button" id="copy" value="copy" style="display:block; float:left;"/>
<input type="button" id="paste" value="paste" style="display:block; float:left;"/>
<input type="button" id="clear_search" value="clear" style="display:block; float:right;"/>
<input type="button" id="search" value="search" style="display:block; float:right;"/>
<input type="text" id="text" value="" style="display:block; float:right;" />
</div>
<div>
	<table border="1">
		<tr>
			<td colspan="3">문서 카테고리 설정</td>
		</tr>
		<tr>
			<td>명칭</td>
			<td><input type="text" id="cat_nm"/></td>
			<td><input type="button" value="확인" onclick="test();"/></td>
		</tr>
		<tr>
			<td>설명</td>
			<td colspan="2"><input type="text"/></td>
		</tr>
		<tr>
			<td>부서지정</td>
			<td colspan="2"></td>
		</tr>
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td><input type="button" value="저장"/></td>
		</tr>
	</table>
</div>
  <div id="treeMsg" style="width: 50%;display:none" align="center"></div>         
  <div id="demo" class="treeViewDiv" style="width: 50%"></div>
  <script> 

  $(function () {
	  $("#demo").jstree({ 
	  		// List of active plugins
	  		"plugins" : [ 
	  			"themes","json_data","ui","crrm","dnd",,"types","hotkeys" 
	  		],

	  		// I usually configure the plugin that handles the data first
	  		// This example uses JSON as it is most common
	  		"json_data" : { 
	  			// This tree is ajax enabled - as this is most common, and maybe a bit more complex
	  			// All the options are almost the same as jQuery's AJAX (read the docs)
	  			"ajax" : {
	  				// the URL to fetch the data
	  				"url" : "/com/tree.do",
	  				// the `data` function is executed in the instance's scope
	  				// the parameter is the node being loaded 
	  				// (may be -1, 0, or undefined when loading the root nodes)
	  				"data" : function (n) { 
	  					// the result is fed to the AJAX request `data` option
	  					return { 
	  						"operation" : "get_children", 
	  						"id" : n.attr ? n.attr("id").replace("node_","") : 1 
	  					}; 
	  				}
	  			}
	  		},
	  		// Using types - most of the time this is an overkill
	  		// read the docs carefully to decide whether you need types
	  		"types" : {
	  			// I set both options to -2, as I do not need depth and children count checking
	  			// Those two checks may slow jstree a lot, so use only when needed
	  			"max_depth" : -2,
	  			"max_children" : -2,
	  			// I want only `drive` nodes to be root nodes 
	  			// This will prevent moving or creating any other type as a root node
	  			"types" : {
	  				// The default type
	  				"default" : {
	  					// I want this type to have no children (so only leaf nodes)
	  					// In my case - those are files
	  					//"valid_children" : "none",
	  					// If we specify an icon for the default type it WILL OVERRIDE the theme icons
	  					"icon" : {
	  						"image" : "/jstree/_demo/folder.png"
	  					}
	  				},
	  				 // The `folder` type  

	  				               "folder" : {  

	  				                  // can have files and other folders inside of it, but NOT `drive` nodes  

	  				                   "valid_children" : [ "default", "folder" ],  

	  				                     "icon" : {  

	  				                        "image" : "/jstree/_demo/folder.png" 

	  				                   }  

	  			               } 

	  			}
	  		},
	  		// UI & core - the nodes to initially select and open will be overwritten by the cookie plugin

	  		// the UI plugin - it handles selecting/deselecting/hovering nodes
	  		//"ui" : {
	  			// this makes the node with ID node_4 selected onload
	  			//"initially_select" : [ "node_4" ]
	  		//},
	  		// the core plugin - not many options here
	  		//"core" : { 
	  			// just open those two nodes up
	  			// as this is an AJAX enabled tree, both will be downloaded from the server
	  			//"initially_open" : [ "node_2" , "node_3" ] 
	  		//}
	  	})
	  	.bind("select_node.jstree",function(e, data){
	  		//alert(data.rslt.obj.attr("id"));
	  		$("#cat_nm").val(data.rslt.obj.attr("id"));
	  	})
	  	.bind("create.jstree", function (e, data) {
	  		alert(data.rslt.parent.attr("id").replace("node_",""));
	  		alert(data.rslt.position);
	  		alert(data.rslt.name);
	  		var parcat = data.rslt.parent.attr("id").replace("node_","");
	  		$.post(
	  			"/com/saveTree.do", 
	  			{ 
	  				"operation" : "create_node", 
	  				"id" : parcat, 
	  				"position" : data.rslt.position,
	  				"title" : data.rslt.name,
	  				//"type" : data.rslt.obj.attr("rel")
	  			}, 
	  			function (r) {
	  				if(r.status) {
	  					$(data.rslt.obj).attr("id", "node_" + r.id);
	  				}
	  				else {
	  					$.jstree.rollback(data.rlbk);
	  				}
	  			}
	  		);
	  	})
	  	.bind("remove.jstree", function (e, data) {
	  		data.rslt.obj.each(function () {
	  			$.ajax({
	  				async : false,
	  				type: 'POST',
	  				url: "/com/tree.do",
	  				data : { 
	  					"operation" : "remove_node", 
	  					"id" : this.id.replace("node_","")
	  				}, 
	  				success : function (r) {
	  					if(!r.status) {
	  						data.inst.refresh();
	  					}
	  				}
	  			});
	  		});
	  	})
	  	.bind("rename.jstree", function (e, data) {
	  		alert(data.rslt.obj.attr("id").replace("node_",""));
	  		alert(data.rslt.new_name);
	  		$.post(
	  			"/com/saveTree.do", 
	  			{ 
	  				"operation" : "rename_node", 
	  				"id" : data.rslt.obj.attr("id").replace("node_",""),
	  				"title" : data.rslt.new_name
	  			}, 
	  			function (r) {
	  				if(!r.status) {
	  					$.jstree.rollback(data.rlbk);
	  				}
	  				$('#demo').jstree('refresh',-1);
	  			}
	  		);
	  	})
	  	.bind("move_node.jstree", function (e, data) {
	  		data.rslt.o.each(function (i) {
	  			$.ajax({
	  				async : false,
	  				type: 'POST',
	  				url: "/com/tree.do",
	  				data : { 
	  					"operation" : "move_node", 
	  					"id" : $(this).attr("id").replace("node_",""), 
	  					"ref" : data.rslt.cr === -1 ? 1 : data.rslt.np.attr("id").replace("node_",""), 
	  					"position" : data.rslt.cp + i,
	  					"title" : data.rslt.name,
	  					"copy" : data.rslt.cy ? 1 : 0
	  				},
	  				success : function (r) {
	  					if(!r.status) {
	  						$.jstree.rollback(data.rlbk);
	  					}
	  					else {
	  						$(data.rslt.oc).attr("id", "node_" + r.id);
	  						if(data.rslt.cy && $(data.rslt.oc).children("UL").length) {
	  							data.inst.refresh(data.inst._get_parent(data.rslt.oc));
	  						}
	  					}
	  					$("#analyze").click();
	  				}
	  			});
	  		});
	  	});

	  });
//Code for the menu buttons
  $(function () { 
  	$("#mmenu input").click(function () {
  		switch(this.id) {
  			case "add_default":
  			case "add_folder":
//  				$("#demo").jstree("create");
  				$("#demo").jstree("create", null, "last","새 카테고리");
  				break;
  			case "text": break;
  			default:
  				$("#demo").jstree(this.id);
  				break;
  		}
  	});
  });
  function test(){
	  var json = jQuery.jstree._reference('#demo').get_json();
		alert(json);
		var jsonString = JSON.stringify(json);
		alert(jsonString);
  }
  </script>

</body>

</html>
