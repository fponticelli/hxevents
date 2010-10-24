/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import hxevents.Async;

class AsyncNotifier
{
	private var handlers : Array<Async -> Void>;

	public function new() {
		handlers = [];
	}

	public function addAsyncOnce(h : Async -> Void) : Async -> Void {
		var me = this;
		var f = null;
		f = function(async) {
			me.remove(f);
			h(async);
		};
		addAsync(f);
		return f;
	}
	
	public function addOnce(h : Void -> Void) : Async -> Void {
		var me = this;
		var f = null;
		f = function(async : Async) {
			me.remove(f);
			h();
			async.completed();
		};
		addAsync(f);
		return f;
	}

	public function remove(h : Async -> Void) : Async -> Void {
		for(i in 0...handlers.length)
			if(Reflect.compareMethods(handlers[i], h))
				return handlers.splice(i, 1)[0];
		return null;
	}

	public function clear() {
		handlers = [];
	}

	public function has(?h : Async -> Void) {
		if(null == h)
			return handlers.length > 0;
		else {
			for (handler in handlers)
				if (h == handler)
					return true;
			return false;
		}
	}

	public function add(h : Void -> Void) : Async -> Void
	{
		var f = function(async : Async) {
			h();
			async.completed();
		};
		handlers.push(f);
		return f;
	}
	
	public function addAsync(h : Async -> Void)
	{
		handlers.push(h);
		return h;
	}
	
	public function dispatch(handler : Void -> Void)
	{
		var list = handlers.copy();
		
		var size = list.length;
		var count = 0;
		
		var cb = function()
		{
			if (++count == size)
				handler();
			else if(count > size)
				throw "the Async instance has been invoked too many times (expected " + size + " times)";
		};
		
		var async = new Async(cb);
		for ( l in list )
		{
			if (async.isCanceled())
				break;
			l(async);
		}
	}
}