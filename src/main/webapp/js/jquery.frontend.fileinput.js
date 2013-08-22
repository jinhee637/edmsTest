/*
jQuery Custom Input File
V0.1
Author: Front.end

This is an extension to the plugin "jquery.fileinput.js" developed by by Ge.tt (included in this file with some modifications).
changeFn 추가! by 강현식

USAGE:
$('#input_file').customInputFile();
$('.inputFile').customInputFile({'label':'yourLabel','cssClass':'yourCssClass'});


OPTIONS:
label - button text label
cssClass - CSS class applied to the main "SPAN";
			Default CSS class: 'customInput';
			CSS class on MouseOver: '<cssClass>MouseOver';
			File path CSS class: 'inputPath';
			Button CSS class: 'inputButton'.

CSS Example:
.customInput {
	display: inline-block;
	font-size: 12px;
}

.customInput .inputPath {
	width: 150px;
	padding: 4px;
	display: inline-block;
	border: 1px solid #ABADB3;
	background-color: #FFF;
	overflow: hidden;
	vertical-align: bottom;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow:    ellipsis;
}

.customInput .inputButton {
	display: inline-block;
	padding: 4px;
	border: 1px solid #ABADB3;
	background-color: #CCC;
	vertical-align: bottom;
}
*/

/*
## License (MIT)

Copyright (C) 2011 by Ge.tt, Front-End Multimedia (http://www.frontend.pt)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

(function( $ ){
	$.fn.customInputFile = function (options)
	{
		this.each(function() {
			var el = $(this);
			var id = null;
			var name = el.attr('name');
			var cssClass = (!options?'customInput':(options.cssClass?options.cssClass:'customInput'));
			var label = (!options?'Browse...':(options.label?options.label:'Browse...'));
			var changeFn = (!options?null:(options.changeFn?options.changeFn:null));
			el.hide();

			if(!el.attr('id')){el.attr('id', 'custom_input_file_'+(new Date().getTime())+Math.floor(Math.random()*100000));}
			id = el.attr('id');

			el.after('<span id="'+id+'_custom_input" class="'+cssClass+'"><span class="inputPath" id="'+id+'_custom_input_path">&nbsp;</span><span class="inputButton">'+label+'</span></span>');

			$('#'+id+'_custom_input').file(function(inp) {
				inp.id = id;
				inp.name = name;
				$('#'+id).replaceWith(inp);
				$('#'+id).removeAttr('style').hide();
				$('#'+id+'_custom_input_path').html($('#'+id).val().replace(/\\/g, '/').replace( /.*\//, '' ));
			}, changeFn, cssClass);
		});
	}
})( jQuery );


jQuery.fn.file = function(fn, changeFn, cssClass) {
	return this.each(function() {
		var el = $(this);
		var holder = $('<div></div>').appendTo(el).css({
			position:'absolute',
			overflow:'hidden',
			'-moz-opacity':'0',
			filter:'alpha(opacity: 0)',
			opacity:'0',
			zoom:'1',
			width:el.outerWidth()+'px',
			height:el.outerHeight()+'px',
			'z-index':1
		});

		var wid = 0;
		var inp;

		var addInput = function() {
			var current = inp = holder.html('<input '+(window.FormData ? 'multiple ' : '')+'type="file" style="border:none; position:absolute">').find('input');

			wid = wid || current.width();

			current.change(function() {
				current.unbind('change');

				addInput();
				fn(current[0]);
				if( changeFn != null )
					changeFn();
			});
		};
		var position = function(e) {
			holder.offset(el.offset());
			if (e) {
				inp.offset({left:e.pageX-wid+25, top:e.pageY-10});
				addMouseOver();
			}
		};

		var addMouseOver =  function () {
			el.addClass(cssClass+'MouseOver');
		};

		var removeMouseOver =  function () {
			el.removeClass(cssClass+'MouseOver');
		};

		addInput();

		el.mouseover(position);
		el.mousemove(position);
		el.mouseout(removeMouseOver);
		position();
	});
};