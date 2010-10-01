package hxevents.js;

import js.Lib;

class DOMUnload
{
	static var instance : DOMUnload;
	
	dynamic public static function add(handler : Void -> Void)
	{
		if (null == instance)
			instance = new DOMUnload();
		instance._addHandler(handler);
	}
	
	var _list : Array<Void -> Void>;
	
	function new()
	{
		_list = [];

		// wire _dispatch (mozilla, opera, safari, chrome browsers)
		if (untyped Lib.document.addEventListener)
		{
			untyped Lib.window.addEventListener("unload", _dispatch, false );
		}
		// wire _dispatch (IE)
		else if (untyped Lib.document.attachEvent)
		{
			untyped Lib.window.attachEvent("unload", _dispatch, false );
		}
	}
	
	function _addHandler(handler : Void -> Void) : Void
	{
		_list.push(handler);
	}
	
	function _dispatch()
	{
		for (handler in _list)
			handler();
		_list = [];
		// remove instance ...
		instance = null;
		// ... and prevent further uses
		add = null;
	}
}