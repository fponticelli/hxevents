/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents.js.core;

enum EventType
{
	Click;
	DoubleClick;
	MouseDown;
	MouseMove;
	MouseOut;
	MouseOver;
	MouseUp;
	MouseWheel; // DOMMouseScroll
	TouchStart;
	TouchEnd;
	TouchCancel;
	TouchMove;
	GestureStart;
	GestureEnd;
	GestureChange;
	Resize;
	Custom(name : String);
}