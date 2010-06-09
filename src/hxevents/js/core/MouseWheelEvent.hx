/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;
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
			delta = event.wheelDelta / 40;
		} else if (event.detail != null) {
			delta = -event.detail;
		}
	}
	
	override function toString()
	{
		return Utils.className(this) + " [" + Utils.targetID(target) + ", delta: " + delta + ", lx:" + local.x + ", ly:" + local.y + ", gx:" + global.x + ", gy:" + global.y + "]";
	}
}