/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;

typedef NativeGestureEvent = {
	public var target : HtmlDom;
	public var rotation : Float;
	public var scale : Float;
	public var touches : Array<Touch>;
	public function preventDefault() : Void;
}