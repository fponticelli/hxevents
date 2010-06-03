/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import hxevents.js.core.BaseMouseDispatcher;
import hxevents.js.core.EventType;
import hxevents.js.core.IMouseEvent;
import js.Dom;

class MouseMove extends BaseMouseDispatcher<IMouseEvent>
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.MouseMove);
	}
}