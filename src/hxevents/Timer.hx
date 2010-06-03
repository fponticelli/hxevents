/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import haxe.Timer;

class Timer extends Notifier
{
	var _t : haxe.Timer;
	var _delay : Int;
	
	public var autoStart : Bool;
	public var autoStop : Bool;
	
	public function new(delay : Int, autoStart = true, ?autoStop : Bool)
	{
		super();
		_delay = delay;
		if (null == autoStop)
			autoStop = autoStart;
		this.autoStart = autoStart;
		this.autoStop = autoStop;
	}
	
	public function start()
	{
		_t = new haxe.Timer(_delay);
		_t.run = _dispatch;
	}
	
	override public function add(h : Void -> Void) : Void -> Void {
		if (autoStart && _t == null && !has())
			start();
		return super.add(h);
	}
	
	override public function remove(h : Void -> Void) : Void -> Void {
		var r = super.remove(h);
		if (autoStop && _t != null && !has())
			stop();
		return r;
	}
	
	function _dispatch()
	{
		dispatch();
	}
	
	public function stop()
	{
		if (null != _t)
		{
			_t.stop();
			_t = null;
		}
	}
}