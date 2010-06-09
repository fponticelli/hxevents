/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;
import closer.geom.ReadonlyPoint;
import closer.geom.EditablePoint;

class Touch implements ITouch
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : ReadonlyPoint;
	public var globalPosition(default, null) : EditablePoint;
	public var local(default, null) : ReadonlyPoint;
	public var localPosition(default, null) : EditablePoint;
	public var screen(default, null) : ReadonlyPoint;
	public var screenPosition(default, null) : EditablePoint;
	
	public function new()
	{
		globalPosition = new EditablePoint();
		global = globalPosition;
		localPosition = new EditablePoint();
		local = localPosition;
		screenPosition = new EditablePoint();
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