/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

class BaseTouchDispatcher extends DomEventDispatcher<ITouchEvent>
{
	var _event : Dynamic;
	public function new(target : HtmlDom, type : EventType)
	{
		super(target, type);
		_event = createEvent();
	}
	
	function createEvent() : Dynamic
	{
		return new TouchEvent();
	}
	
	override function _dispatch(e : Event)
	{
		_event.setEvent(e);
		dispatch(_event);
	}
}