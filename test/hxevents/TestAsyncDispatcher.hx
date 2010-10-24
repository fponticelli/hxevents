/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import utest.Assert;
import utest.Runner;
import utest.ui.Report;

class TestAsyncDispatcher
{
	public function testAsyncDispatcher()
	{
		var dispatcher = new AsyncDispatcher();
		dispatcher.addAsync(function(v, async) {
			haxe.Timer.delay(function() {
				v.push(1);
				async.completed();
			}, 45);
		});
		dispatcher.addAsync(function(v, async) {
			haxe.Timer.delay(function() {
				v.push(2);
				async.completed();
			}, 30);
		});
		dispatcher.addAsync(function(v, async) {
			haxe.Timer.delay(function() {
				v.push(3);
				async.completed();
			}, 15);
		});
		
		var values = [];
		var fn = Assert.createAsync(function() {
			Assert.equals(3, values.length);
			Assert.contains(1, values);
			Assert.contains(2, values);
			Assert.contains(3, values);
		}, 300);
		dispatcher.dispatch(values, fn);
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