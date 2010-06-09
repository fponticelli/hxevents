/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import closer.geom.ReadonlyPoint;
import js.Dom;

interface IMouseEvent
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : ReadonlyPoint;
	public var local(default, null) : ReadonlyPoint;
	public var altKey(default, null) : Bool;
	public var ctrlKey(default, null) : Bool;
	public var shiftKey(default, null) : Bool;
	public var keyCode(default, null) : Int;
	
	public function preventDefault() : Void;
}