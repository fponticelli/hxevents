/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

typedef NativeGestureEvent = {
	public var target : HtmlDom;
	public var rotation : Float;
	public var scale : Float;
	public function preventDefault() : Void;
}