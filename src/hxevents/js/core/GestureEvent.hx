/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

class GestureEvent implements IGestureEvent
{

	public function new();
	
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