/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;

import js.Dom;
import hxevents.js.core.DomEventDispatcher;
import hxevents.js.core.EventType;
import hxevents.js.core.IResizeEvent;
import hxevents.js.core.ResizeEvent;

class Resize extends DomEventDispatcher<IResizeEvent>
{
	var _event : ResizeEvent;
	public function new(target : HtmlDom)
	{
		super(target, EventType.Resize);
		_event = new ResizeEvent();
	}
	
	override function _dispatch(_)
	{
		_event.set(target.offsetWidth, target.offsetHeight);
		dispatch(_event);
	}
}