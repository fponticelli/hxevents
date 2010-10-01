/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

class BaseGestureDispatcher extends DomEventDispatcher<IGestureEvent>
{
	var _event : Dynamic;
	public function new(target : HtmlDom, type : EventType)
	{
		super(target, type);
		_event = createEvent();
	}
	
	function createEvent() : Dynamic
	{
		return new GestureEvent();
	}
	
	override function _dispatch(e : Event)
	{
		_event.setEvent(e);
		dispatch(_event);
	}
}