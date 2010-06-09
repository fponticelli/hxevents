/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;
import closer.geom.ReadonlyPoint;

interface IGestureEvent
{
//	public var center(default, null) : ReadonlyPoint;
	public var target(default, null) : HtmlDom;
	public var rotation(default, null) : Float;
	public var scale(default, null) : Float;
	public function preventDefault() : Void;
}