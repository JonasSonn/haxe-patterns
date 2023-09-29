package;
import utest.Runner;
import utest.ui.Report;

import testpatterns.strategy.TestStrategy;
import testpatterns.strategy.TestStrategyGuruExample;
class RunAll {
    public static function main() {
        var runner = new Runner();
        runner.addCase(new TestStrategy());
        runner.addCase(new TestStrategyGuruExample());
        Report.create(runner);
        runner.run();
    }
}