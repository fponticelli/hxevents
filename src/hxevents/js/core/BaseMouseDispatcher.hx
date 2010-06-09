/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;

class BaseMouseDispatcher<T : IMouseEvent> extends DomEventDispatcher<T>
{
	var _event : Dynamic;
	public function new(target : HtmlDom, type : EventType)
	{
		super(target, type);
		_event = createEvent();
	}
	
	function createEvent() : Dynamic
	{
		return new MouseEvent();
	}
	
	override function _dispatch(e : Event)
	{
		if (null == e)
			e = untyped window.event;
		if (null == e.target)
			e.target = untyped e.srcElement != null ? e.srcElement : target;
		if (e.target.nodeType == 3)
			e.target = e.target.parentNode;
		_event.setEvent(e);
		dispatch(_event);
	}
}