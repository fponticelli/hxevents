/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js;
import hxevents.js.core.DomEventDispatcher;
import hxevents.js.core.ResizeEvent;
import hxevents.js.core.IResizeEvent;
import hxevents.js.core.EventType;

class WindowResize extends DomEventDispatcher<IResizeEvent>
{
	var _event : ResizeEvent;
	public function new()
	{
		super(cast js.Lib.window, EventType.Resize);
		_event = new ResizeEvent();
	}
	
	override function _dispatch(_)
	{
		setSize(_event);
		dispatch(_event);
	}
	
	dynamic function setSize(event : ResizeEvent)
	{
		untyped if (__js__("typeof(js.Lib.window.innerWidth) == 'number'"))
		{
			setSize = function(event : ResizeEvent)
			{
				event.set(js.Lib.window.innerWidth, js.Lib.window.innerHeight);
			};
		} else if( js.Lib.document.documentElement && ( js.Lib.document.documentElement.clientWidth || js.Lib.document.documentElement.clientHeight ) ) {
			setSize = function(event : ResizeEvent)
			{
				event.set(document.documentElement.clientWidth, document.documentElement.clientHeight);
			};
		} else if( js.Lib.document.body && ( js.Lib.document.body.clientWidth || js.Lib.document.body.clientHeight ) ) {
			setSize = function(event : ResizeEvent)
			{
				event.set(document.body.clientWidth, document.body.clientHeight);
			};
		} else {
			setSize = function(event : ResizeEvent)
			{
				// do nothing
			};
		}
		setSize(event);
	}
}