/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

class Utils
{

	public static function targetID(target : HtmlDom)
	{
		if (null == target)
			return "{noscope}";
		else if (null == target.id || '' == target.id)
		{
			var cls = target.className != '' && target.className != null ? '.' + target.className : '';
			return target.nodeName + cls;
		} else
			return "#" + target.id;
	}
	
	public static function className(o : Dynamic)
	{
		return Type.getClassName(Type.getClass(o)).split('.').pop();
	}
}