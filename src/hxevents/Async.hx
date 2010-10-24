/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

class Async
{
	var _canceled : Bool;
	var _handler : Void -> Void;
	public function new(handler : Void -> Void)
	{
		_canceled = false;
		_handler = handler;
	}
	
	public function cancel()
	{
		if (_canceled)
			throw "operation has already been canceled";
		_canceled = true;
	}
	
	public function isCanceled()
	{
		return _canceled;
	}
	
	public function completed()
	{
		_handler();
	}
}