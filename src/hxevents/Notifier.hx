package hxevents;

class Notifier {

	private var handlers : Array<Void -> Void>;

	public function new() {
		handlers = new Array();
	}

	dynamic public function add(h : Void -> Void) : Void -> Void {
		handlers.push(h);
		return h;
	}

	public function addOnce(h : Void -> Void) : Void -> Void {
		var me = this;
		var _h = null;
		_h = function() {
			me.remove(_h);
			h();
		};
		add(_h);
		return _h;
	}

	public function remove(h : Void -> Void) : Void -> Void {
		for(i in 0...handlers.length)
			if(Reflect.compareMethods(handlers[i], h))
				return handlers.splice(i, 1)[0];
		return null;
	}

	public function clear() {
		handlers = new Array();
	}

	public function dispatch() {
		// prevents problems with self removing events
		var list = handlers.copy();
		for( l in list )
		{
			if(_stop == true)
			{
				_stop = false;
				break;
			}
			l();
		}
	}

	public function dispatchAndAutomate()
	{
		dispatch();
		handlers = [];
		add = function(h : Void -> Void)
		{
			h();
			return h;
		};
	}

	public function has(?h : Void -> Void) {
		if(null == h)
			return handlers.length > 0;
		else {
			for (handler in handlers)
				if (h == handler)
					return true;
			return false;
		}
	}

	var _stop : Bool;
	public static function stop() {
		_stop = true;
	}
}