/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;
import js.Dom;

class MouseWheelEvent extends MouseEvent, implements IMouseEvent
{
	public var delta(default, null) : Float;
	override function setEvent(event : Event)
	{
		super.setEvent(event);
		if (null == event)
			event = untyped window.event;
		delta = 0.0;
		untyped if (event.wheelDelta != null)
		{
			delta = event.wheelDelta / 120;
		} else if (event.detail != null) {
			delta = -event.detail / 3;
		}
	}
}