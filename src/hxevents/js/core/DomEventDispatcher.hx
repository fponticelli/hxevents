/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

import js.Dom;
import hxevents.Dispatcher;

class DomEventDispatcher<T> extends Dispatcher<T>
{
	public var target(default, null) : HtmlDom;
	public var type(default, null) : EventType;
	
	public function new(target : HtmlDom, type : EventType)
	{
		super();
		this.target = target;
		this.type = type;
		_dispatchHandler = _dispatch;
	}
	
	function _dispatch(e : Event)
	{
		dispatch(cast e);
	}
	
	var _dispatchHandler : Event -> Void;
	
	override public function add(h : T -> Void) : T -> Void
	{
		if (handlers.length == 0)
			addEvent(_dispatchHandler);
		return super.add(h);
	}

	override public function remove(h : T -> Void) : T -> Void
	{
		h = super.remove(h);
		if (null == h) return null;
		if (handlers.length == 0)
		{
			removeEvent(_dispatchHandler);
		}
		return h;
	}

	override public function clear()
	{
		if (handlers.length == 0)
			return;
		removeEvent(_dispatchHandler);
		handlers = new Array();
	}
	
	dynamic function addEvent(handler : Event -> Void)
	{
		var target = this.target;
		untyped if (target.addEventListener != null)
		{
			var ntype = translateToDom2Type(type);
			addEvent = function(handler) {
				target.addEventListener(ntype, handler, false);
			};
		} else if (target.attachEvent != null ) {
			var ntype = translateToHtml4Type(type);
			addEvent = function(handler) {
				target.attachEvent(ntype, handler);
			};
		} else {
			var ntype = translateToHtml4Type(type);
			addEvent = function(handler) {
				Reflect.setField(target, ntype, handler);
			};
		}
		addEvent(handler);
	}
	
	dynamic function removeEvent(handler : Event -> Void)
	{
		var target = this.target;
		untyped if (target.removeEventListener != null)
		{
			var ntype = translateToDom2Type(type);
			removeEvent = function(handler) {
				target.removeEventListener(ntype, handler, false);
			};
		} else if (target.attachEvent != null ) {
			var ntype = translateToHtml4Type(type);
			removeEvent = function(handler) {
				target.detachEvent(ntype, handler);
			};
		} else {
			var ntype = translateToHtml4Type(type);
			removeEvent = function(handler) {
				Reflect.setField(target, ntype, null);
			};
		}
		removeEvent(handler);
	}
	
	static function translateToDom2Type(type : EventType)
	{
		return switch(type)
		{
			case Click, DoubleClick, MouseDown, MouseMove, MouseOver, MouseOut, MouseUp,
					TouchStart, TouchEnd, TouchMove, TouchCancel,
					GestureStart, GestureEnd, GestureChange,
					Resize:
				Std.string(type).toLowerCase();
			case MouseWheel:
				mouseWheelEventName().dom2;
			case Custom(name):
				name.toLowerCase();
		}
	}
	
	static function translateToHtml4Type(type : EventType)
	{
		return switch(type)
		{
			case Click, DoubleClick, MouseDown, MouseMove, MouseOver, MouseOut, MouseUp,
					TouchStart, TouchEnd, TouchMove, TouchCancel,
					GestureStart, GestureEnd, GestureChange,
					Resize:
				"on" + Std.string(type).toLowerCase();
			case MouseWheel:
				mouseWheelEventName().html4;
			case Custom(name):
				"on" + name.toLowerCase();
		}
	}
	
	static var __mouseWheelEventName : { html4 : String, dom2 : String };
	/**
	 * Grabbed from HSL
	 */
	static function mouseWheelEventName()
	{
		if (__mouseWheelEventName == null)
		{
			untyped
			{
				var useDOMMouseScroll = false;
				untyped
				{
					if( document.implementation.hasFeature('MouseEvents','2.0') )
					{
						try
						{
							var handle = null;
							handle = document.body.addEventListener( "DOMMouseScroll",
									function () {
										useDOMMouseScroll = true;
										document.removeEventListener("DOMMouseScroll", handle, false);
									},
								false );
							var evt = document.createEvent("MouseScrollEvents");
							evt.initMouseEvent("DOMMouseScroll", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
							document.body.dispatchEvent(evt);
						} catch (e:Dynamic) {}
					}
				}
				__mouseWheelEventName = useDOMMouseScroll ? { html4:"onmousewheel", dom2:"DOMMouseScroll" } : { html4:"onmousewheel", dom2:"mousewheel" };
			}
		}
		return __mouseWheelEventName;
	}
}