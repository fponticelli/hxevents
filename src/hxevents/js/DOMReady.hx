package hxevents.js;

import haxe.Timer;
import js.Lib;

/**
 * Tested on:
 * - Firefox 3.6.3
 * - Chrome
 * - Opera 10.53
 * - Safari 4.0.5
 * - Safari 3.1.3 (iPod Touch)
 * - Internet Explorer 6
 * - Internet Explorer 7
 * - Internet Explorer 8.0.6001
 *
 * Adapted from JQuery
 */
class DOMReady
{
	static var instance : DOMReady;
	
	public static function add(handler : Void -> Void)
	{
		if (null == instance)
			instance = new DOMReady();
		instance._addHandler(handler);
	}
	
	var _ready : Bool;
	var _list : Array<Void -> Void>;
	
	function new()
	{
		_ready = false;
		_list = [];
		
		// execute dispatch if the event already occurred
		if (untyped document.readyState == "complete")
		{
			_dispatch();
		}
		// wire _dispatch (mozilla, opera, safari, chrome browsers)
		else if (untyped Lib.document.addEventListener)
		{
			untyped Lib.document.addEventListener("DOMContentLoaded", _dispatch, false);
			// play safe
			untyped Lib.window.addEventListener("load", _dispatch, false );
		}
		// wire _dispatch (IE)
		else if (untyped Lib.document.attachEvent)
		{
			untyped Lib.document.attachEvent("onreadystatechange", _dispatch, false);
			// play safe
			untyped Lib.window.attachEvent("load", _dispatch, false );
			
			var toplevel = false;

			try
			{
				toplevel = untyped Lib.window.frameElement == null;
			} catch(e : Dynamic) {}

			if (untyped Lib.document.documentElement.doScroll && toplevel)
			{
				_scrollCheck();
			}
		}
	}
	
	function _scrollCheck()
	{
		if (_ready)
			return;
		try
		{
			untyped Lib.document.documentElement.doScroll("left");
		} catch (e : Dynamic) {
			Timer.delay(_scrollCheck, 1);
			return;
		}
		// and execute any waiting functions
		_dispatch();
	}
	
	function _addHandler(handler : Void -> Void) : Void
	{
		if (_ready) // no need to delay, execute and return immediately
		{
			handler();
			return;
		}
		_list.push(handler);
	}
	
	function _dispatch()
	{
		if (_ready)
			return;
		// make sure body exists; possible issue with IE
		if (untyped !Lib.document.body)
			Timer.delay(_dispatch, 13);

		_ready = true;
		for (handler in _list)
			handler();
		_list = [];
	}
}