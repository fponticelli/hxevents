/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

class ButtonMouseDispatcher extends BaseMouseDispatcher<IMouseButtonEvent>
{
	override function createEvent() : Dynamic
	{
		return new MouseButtonEvent();
	}
}