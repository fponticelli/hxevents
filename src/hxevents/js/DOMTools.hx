package boo.js;

import js.Dom;
import js.Lib;

class DOMTools
{
	inline public static function setSize(s : Style, w : Float, h : Float)
	{
		s.width  = Math.round(w) + "px";
		s.height = Math.round(h) + "px";
	}
	
	inline public static function setPos(s : Style, x : Float, y : Float)
	{
		s.left = Math.round(x) + "px";
		s.top  = Math.round(y) + "px";
	}
	
	public static function getPos(el : HtmlDom)
	{
		var left = 0;
		var top = 0;
		do {
			left += el.offsetLeft;
			top += el.offsetTop;
		} while (null != (el = el.offsetParent));
		return {
			left : left,
			top : top,
		};
	}
	
	public static function domCleanup(el : HtmlDom)
	{
		if (Lib.isIE)
		{
			el.style.display = "none";
			var r = null;
			r = function()
			{
				if (4 == untyped el.readyState)
				{
					if (null == el) return;
					for (field in Reflect.fields(el))
					{
						if (Reflect.isFunction(Reflect.field(el, field)))
							Reflect.setField(el, field, null);
					}
					while (el.hasChildNodes())
					{
						domCleanup(el.firstChild);
					}
					el.parentNode.removeChild(el);
					el = null;
				} else {
					haxe.Timer.delay(r, 10);
				}
			};
			r();
		} else {
			el.parentNode.removeChild(el);
		}
	}
}