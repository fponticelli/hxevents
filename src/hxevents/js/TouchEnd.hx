/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;
import hxevents.js.core.BaseTouchDispatcher;
import hxevents.js.core.EventType;
import js.Dom;

class TouchEnd extends BaseTouchDispatcher
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.TouchEnd);
	}
}