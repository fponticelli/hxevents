package hxevents.js.core;

class ResizeEvent implements IResizeEvent
{
	public var width(default, null) : Int;
	public var height(default, null) : Int;
	
	public function new()
	{
		width = height = 0;
	}
	
	public function set(width : Int, height : Int)
	{
		this.width = width;
		this.height = height;
	}
	
	public function toString()
	{
		return Utils.className(this) + " [w:" + width + ", h:" + height + "]";
	}
}