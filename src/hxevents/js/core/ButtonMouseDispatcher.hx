/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

class ButtonMouseDispatcher extends BaseMouseDispatcher<IMouseButtonEvent>
{
	override function createEvent() : Dynamic
	{
		return new MouseButtonEvent();
	}
}