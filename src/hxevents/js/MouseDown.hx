/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import hxevents.js.core.ButtonMouseDispatcher;
import hxevents.js.core.EventType;
import js.Dom;

class MouseDown extends ButtonMouseDispatcher
{
	public function new(target : HtmlDom)
	{
		super(target, EventType.MouseDown);
	}
}