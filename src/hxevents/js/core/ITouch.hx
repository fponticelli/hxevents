/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;

interface ITouch
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : IPosition;
	public var local(default, null) : IPosition;
	public var screen(default, null) : IPosition;
	public function setTouch(e : NativeTouch) : ITouch;
}