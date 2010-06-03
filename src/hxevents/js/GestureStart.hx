/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import hxevents.js.core.BaseGestureDispatcher;
import hxevents.js.core.EventType;
import js.Dom;

class GestureStart extends BaseGestureDispatcher
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.GestureStart);
	}
}