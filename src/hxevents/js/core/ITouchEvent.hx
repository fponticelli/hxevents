/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

interface ITouchEvent
{
	public var touches(default, null) : Iterator<ITouch>;
	public var first(default, null) : ITouch;
	public var length(default, null) : Int;
	public function preventDefault() : Void;
}