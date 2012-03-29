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

	public function dispatch(e : T, ?handler : Void -> Void, ?error : Dynamic -> Void)
	{
		var list = handlers.copy();

		var haserror = false;
		var size = list.length;
		var count = 0;

		var after = function()
		{
			if (haserror)
				return;
			if (++count == size)
			{
				if(null != handler)
					handler();
			} else if (count > size)
			{
				var msg = "the Async instance has been invoked too many times (expected " + size + " times)";
				if(null != error)
					error(msg);
				else
					throw msg;
			}
		};

		if (0 == size)
		{
			if(null != handler)
				handler();
			return;
		}

		var async = new Async(after, function(e) {
			haserror = true;
			error(e);
		});
		for ( l in list )
			l(e, async);
	}
}