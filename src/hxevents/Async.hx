/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

class Async
{
	var _after : Void -> Void;
	var _error : Dynamic -> Void;
	public function new(after : Void -> Void, ?error : Dynamic -> Void)
	{
		_after = after;
		_error = error;
	}

	public function completed()
	{
		_after();
	}

	public function error(e : Dynamic)
	{
		if (null != _error)
			_error(e);
	}
}