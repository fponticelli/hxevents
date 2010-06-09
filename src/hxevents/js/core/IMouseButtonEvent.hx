/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

interface IMouseButtonEvent implements IMouseEvent
{
	public var isRightButton(default, null) : Bool;
	public var isLeftButton(default, null) : Bool;
	public var isMiddleButton(default, null) : Bool;
}