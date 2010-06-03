/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;
import hxevents.js.core.BaseMouseDispatcher;
import hxevents.js.core.EventType;
import hxevents.js.core.IMouseWheelEvent;
import hxevents.js.core.MouseWheelEvent;
import js.Dom;

class MouseWheel extends BaseMouseDispatcher<IMouseWheelEvent>
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.MouseWheel);
	}
	
	override function createEvent() : Dynamic
	{
		return new MouseWheelEvent();
	}
}