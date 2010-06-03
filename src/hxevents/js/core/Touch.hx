/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

class Touch implements ITouch
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : IPosition;
	public var globalPosition(default, null) : Position;
	public var local(default, null) : IPosition;
	public var localPosition(default, null) : Position;
	public var screen(default, null) : IPosition;
	public var screenPosition(default, null) : Position;
	
	public function new()
	{
		globalPosition = new Position();
		global = globalPosition;
		localPosition = new Position();
		local = localPosition;
		screenPosition = new Position();
		screen = screenPosition;
	}
	
	public function setTouch(e : NativeTouch) : ITouch
	{
		this.target = e.target;
		localPosition.set(e.clientX, e.clientY);
		globalPosition.set(e.pageX, e.pageY);
		screenPosition.set(e.screenX, e.screenY);
		return this;
	}
	
	function _id()
	{
		if (null == target)
			return "{noscope}";
		else if (null == target.id)
			return "[" + target.nodeName + "]";
		else
			return "#" + target.id;
	}
	
	public function toString()
	{
		return (Type.getClassName(Type.getClass(this)).split('.').pop()) + " [" + _id() + ", lx:" + local.x + ", ly:" + local.y + ", gx:" + global.x + ", gy:" + global.y + ", sx:" + screen.x + ", sy:" + screen.y + "]";
	}
}