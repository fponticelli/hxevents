/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

class TouchEvent
{
	var _touches : Array<Touch>;
	var _event : NativeTouchEvent;
	public function new()
	{
		_touches = [];
		for (i in 0...10)
			_touches.push(new Touch());
	}
	
	public function preventDefault()
	{
		_event.preventDefault();
	}
	
	public function setEvent(e : NativeTouchEvent)
	{
		_event = e;
		var t = [];
		length = e.touches.length;
		for (i in 0...e.touches.length)
		{
			t.push(_touches[i].setTouch(e.touches[i]));
		}
		first = t[0];
		touches = t.iterator();
	}
	
	public var touches(default, null) : Iterator<ITouch>;
	public var first(default, null) : ITouch;
	public var length(default, null) : Int;

	public function toString()
	{
		return Utils.className(this) + " [touches:" + length + "]";
	}
/*
	public var target(default, null) : HtmlDom;
	public var global(default, null) : IPosition;
	public var local(default, null) : IPosition;
*/
}