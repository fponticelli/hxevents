package hxevents;

class Dispatcher<T> {

	private var handlers : Array<T -> Void>;

	public function new() {
		handlers = new Array();
	}

	public dynamic function add(h : T -> Void) : T -> Void {
		handlers.push(h);
		return h;
	}

	public function addOnce(h : T -> Void) : T -> Void {
		var me = this;
		var _h = null;
		_h = function(v : T) {
			me.remove(_h);
			h(v);
		};
		add(_h);
		return _h;
	}

	public function remove(h : T -> Void) : T -> Void {
		for(i in 0...handlers.length)
			if(Reflect.compareMethods(handlers[i], h))
				return handlers.splice(i, 1)[0];
		return null;
	}

	public function clear() {
		handlers = new Array();
	}

	public function dispatch(e : T) {
		// prevents problems with self removing events
		var list = handlers.copy();
		for( l in list )
		{
			if(_stop == true)
			{
				_stop = false;
				break;
			}
			l(e);
		}
	}

	public function dispatchAndAutomate(e : T)
	{
		dispatch(e);
		handlers = [];
		add = function(h : T -> Void)
		{
			h(e);
			return h;
		};
	}

	public function has(?h : T -> Void) {
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
	public function stop() {
		_stop = true;
	}
}