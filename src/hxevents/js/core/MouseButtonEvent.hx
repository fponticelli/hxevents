/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;
import js.Lib;
import js.Dom;

class MouseButtonEvent extends MouseEvent
{
	public var isRightButton(default, null) : Bool;
	public var isLeftButton(default, null) : Bool;
	public var isMiddleButton(default, null) : Bool;
	override function setEvent(event : Event)
	{
		super.setEvent(event);
		if (Lib.isIE)
		{
			isLeftButton = event.button == 1;
			isMiddleButton = event.button == 4;
			isRightButton = event.button == 2;
		} else {
			isLeftButton = event.button == 0;
			isMiddleButton = event.button == 1;
			isRightButton = event.button == 2;
		}
	}
}