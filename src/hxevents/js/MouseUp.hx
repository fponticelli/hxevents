/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import hxevents.js.core.ButtonMouseDispatcher;
import hxevents.js.core.EventType;
import js.Dom;

class MouseUp extends ButtonMouseDispatcher
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.MouseUp);
	}
}