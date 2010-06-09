/**
 * ...
 * @author Franco Ponticelli
 */

package closer.events.js.core;

import js.Dom;
import closer.geom.ReadonlyPoint;
import closer.geom.EditablePoint;

class MouseEvent implements IMouseEvent
{
	public var target(default, null) : HtmlDom;
	public var global(default, null) : ReadonlyPoint;
	public var globalPosition(default, null) : EditablePoint;
	public var local(default, null) : ReadonlyPoint;
	public var localPosition(default, null) : EditablePoint;
	
	public var altKey(default, null) : Bool;
	public var ctrlKey(default, null) : Bool;
	public var shiftKey(default, null) : Bool;
	public var keyCode(default, null) : Int;
	
	var _e : Event;
	
	public function new()
	{
		globalPosition = new EditablePoint();
		global = globalPosition;
		localPosition = new EditablePoint();
		local = localPosition;
	}
	
	public function setEvent(event : Event)
	{
		_e = event;
		this.target = event.target;
		populateLocalPosition(localPosition, event);
		populateGlobalPosition(globalPosition, event);
		
		altKey = event.altKey;
		ctrlKey = event.ctrlKey;
		shiftKey = event.shiftKey;
		keyCode = event.keyCode;
	}
	
	public function preventDefault() : Void
	{
		untyped if (_e.preventDefault != null)
		{
			_e.preventDefault();
		} else {
			_evant.returnValue = false;
		}
	}
	
	public function toString()
	{
		return Utils.className(this) + " [" + Utils.targetID(target) + ", lx:" + local.x + ", ly:" + local.y + ", gx:" + global.x + ", gy:" + global.y + "]";
	}
	
	dynamic function populateLocalPosition(position : EditablePoint, event : Event)
	{
		untyped {
			if (event.offsetX != null)
			{
				populateLocalPosition = function(position : EditablePoint, event : Event)
				{
					position.set(event.offsetX, event.offsetY);
				}
			} else if(event.layerX != null) {
				populateLocalPosition = function(position : EditablePoint, event : Event)
				{
					position.set(event.layerX, event.layerY);
				}
			} else {
				// unsupported browser
				populateLocalPosition = function(position : EditablePoint, event : Event)
				{
					// do nothing :(
				}
			}
		}
		populateLocalPosition(position, event);
	}
	
	dynamic function populateGlobalPosition(position : EditablePoint, event : Event)
	{
		untyped {
			if (event.pageX != null)
			{
				populateGlobalPosition = function(position : EditablePoint, event : Event)
				{
					position.set(event.pageX, event.pageY);
				}
			} else if(event.clientX != null) {
				populateGlobalPosition = function(position : EditablePoint, event : Event)
				{
					position.set(
						event.clientX + js.Lib.document.body.scrollLeft + js.Lib.document.documentElement.scrollLeft,
						event.clientY + js.Lib.document.body.scrollTop + js.Lib.document.documentElement.scrollTop);
				}
			} else {
				// unsupported browser
				populateGlobalPosition = function(position : EditablePoint, event : Event)
				{
					// do nothing :(
				}
			}
		}
		populateGlobalPosition(position, event);
	}
}