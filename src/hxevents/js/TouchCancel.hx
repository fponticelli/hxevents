/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;
import hxevents.js.core.BaseTouchDispatcher;
import hxevents.js.core.EventType;
import js.Dom;

class TouchCancel extends BaseTouchDispatcher
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.TouchCancel);
	}
}