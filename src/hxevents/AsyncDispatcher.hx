/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import hxevents.Async;

class AsyncDispatcher<T>
{
	private var handlers : Array<T -> Async -> Void>;

	public function new() {
		handlers = [];
	}

	public function addAsyncOnce(h : T -> Async -> Void) : T -> Async -> Void {
		var me = this;
		var f = null;
		f = function(e, async) {
			me.remove(f);
			h(e, async);
		};
		addAsync(f);
		return f;
	}
	
	public function addOnce(h : T -> Void) : T -> Async -> Void {
		var me = this;
		var f = null;
		f = function(e, async : Async) {
			me.remove(f);
			h(e);
			async.completed();
		};
		addAsync(f);
		return f;
	}

	public function remove(h : T -> Async -> Void) : T -> Async -> Void {
		for(i in 0...handlers.length)
			if(Reflect.compareMethods(handlers[i], h))
				return handlers.splice(i, 1)[0];
		return null;
	}

	public function clear() {
		handlers = [];
	}

	public function has(?h : T -> Async -> Void) {
		if(null == h)
			return handlers.length > 0;
		else {
			for (handler in handlers)
				if (h == handler)
					return true;
			return false;
		}
	}

	public function add(h : T -> Void) : T -> Async -> Void
	{
		var f = function(e, async : Async) {
			h(e);
			async.completed();
		};
		handlers.push(f);
		return f;
	}
	
	public function addAsync(h : T -> Async -> Void)
	{
		handlers.push(h);
		return h;
	}
	
	public function dispatch(e : T, handler : Void -> Void)
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
			l(e, async);
		}
	}
}