/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;
import closer.geom.ReadonlyPoint;

interface ITouch
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : ReadonlyPoint;
	public var local(default, null) : ReadonlyPoint;
	public var screen(default, null) : ReadonlyPoint;
	public function setTouch(e : NativeTouch) : ITouch;
}