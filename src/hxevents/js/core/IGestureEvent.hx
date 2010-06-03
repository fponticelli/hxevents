/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

interface IGestureEvent
{
	public var target(default, null) : HtmlDom;
	public var rotation(default, null) : Float;
	public var scale(default, null) : Float;
	public function preventDefault() : Void;
}