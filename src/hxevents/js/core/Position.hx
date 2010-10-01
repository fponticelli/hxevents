/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

class Position implements IPosition
{
	public var x(default, null) : Int;
	public var y(default, null) : Int;
	public function new(x = 0, y = 0)
	{
		this.x = x;
		this.y = y;
	}
	
	inline public function set(x : Int, y : Int)
	{
		this.x = x;
		this.y = y;
	}
	
	public function toString()
	{
		return "Position [x:" + x + ", y:" + y + "]";
	}
}