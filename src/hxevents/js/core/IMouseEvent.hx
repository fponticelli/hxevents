/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

interface IMouseEvent
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : IPosition;
	public var local(default, null) : IPosition;
	public var altKey(default, null) : Bool;
	public var ctrlKey(default, null) : Bool;
	public var shiftKey(default, null) : Bool;
	public var keyCode(default, null) : Int;
	
	public function preventDefault() : Void;
}