/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import closer.geom.EditablePoint;
import js.Dom;
import closer.geom.ReadonlyPoint;

class GestureEvent implements IGestureEvent
{

	public function new()
	{
//		centerPosition = new EditablePoint();
//		center = centerPosition;
	}
	
//	public var center(default, null) : ReadonlyPoint;
	public var centerPosition(default, null) : EditablePoint;
	public var target(default, null) : HtmlDom;
	public var rotation(default, null) : Float;
	public var scale(default, null) : Float;
	
	var _e : NativeGestureEvent;
	
	public function setEvent(e : NativeGestureEvent)
	{
		_e = e;
		target = e.target;
		rotation = e.rotation;
		scale = e.scale;
		/*
		var x = 0.0, y = 0.0;
		for (touch in e.touches)
		{
			x += touch.global.x;
			y += touch.global.y;
		}
		centerPosition.set(x / e.touches.length, y / e.touches.length);
		*/
	}
	
	public function preventDefault()
	{
		_e.preventDefault();
	}
	
	public function toString()
	{
		return Utils.className(this) + " [" + Utils.targetID(target) + ", rotation:" + rotation + ", scale:" + scale + "]";
	}
}