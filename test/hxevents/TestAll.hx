/**
 * ...
 * @author Franco Ponticelli
 */

package hxevents;

import utest.Assert;
import utest.Runner;
import utest.ui.Report;

class TestAll
{
	public static function addTests(runner : Runner)
	{
		runner.addCase(new TestAsyncDispatcher());
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