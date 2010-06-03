/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import hxevents.js.core.BaseMouseDispatcher;
import hxevents.js.core.IMouseEvent;
import hxevents.js.core.EventType;
import js.Dom;

class DoubleClick extends BaseMouseDispatcher<IMouseEvent>
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.DoubleClick);
	}
}