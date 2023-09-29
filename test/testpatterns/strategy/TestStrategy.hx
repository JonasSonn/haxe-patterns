package testpatterns.strategy;
import haxe.ds.Option;


import patterns.strategy.IStrategy;
import patterns.strategy.Context;
import utest.Assert;
import utest.Test;

class TestStrategy extends Test {

    public function testSomething() {
        var ctx = new Context();
        ctx.setStrategy(new ExampleStrat());
        Assert.same(Some(true), ctx.executeStrategy("helo"));
        Assert.same(Some(false), ctx.executeStrategy("1"));
        Assert.same(None, ctx.executeStrategy(null));
    }


}

class ExampleStrat implements IStrategy<String, Option<Bool>> {
    public function new() {
        
    }
    public function execute(input : String) : Option<Bool> {
        try {
            if(input.length == 4) return Some(true);
            return Some(false);
        } catch (e) {
            return None;
        }
    }
}

