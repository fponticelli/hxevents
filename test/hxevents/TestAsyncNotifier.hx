/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import utest.Assert;
import utest.Runner;
import utest.ui.Report;
import hxevents.AsyncNotifier;

class TestAsyncNotifier
{
	public function testAsyncNotifier()
	{
		var notifier = new AsyncNotifier();
		var test = false;
		notifier.addAsync(function(async : Async) {
			haxe.Timer.delay(function() {
				test = true;
				async.completed();
			}, 40);
		});
		
		var fn = Assert.createAsync(function() {
			Assert.isTrue(test);
		}, 300);
		notifier.dispatch(fn);
	}
	
	public function testMultipleHandlers()
	{
		var notifier = new AsyncNotifier();
		var test = [];
		notifier.addAsync(function(async : Async) {
			haxe.Timer.delay(function() {
				test.push(1);
				async.completed();
			}, 40);
		});
		
		notifier.addAsync(function(async : Async) {
			haxe.Timer.delay(function() {
				test.push(2);
				async.completed();
			}, 20);
		});
		
		notifier.addAsync(function(async : Async) {
			haxe.Timer.delay(function() {
				test.push(3);
				async.completed();
			}, 0);
		});
		
		var fn = Assert.createAsync(function() {
			Assert.equals(3, test.length);
			Assert.contains(1, test);
			Assert.contains(2, test);
			Assert.contains(3, test);
		}, 300);
		notifier.dispatch(fn);
	}
	
	
	public static function addTests(runner : Runner)
	{
		runner.addCase(new TestAsyncNotifier());
	}
	
	public static function main()
	{
		var runner = new Runner();
		addTests(runner);
		Report.create(runner);
		runner.run();
	}
	
	public function new();
}