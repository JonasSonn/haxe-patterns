package testpatterns.strategy;

import haxe.ds.Option;
import patterns.strategy.IStrategy;
import patterns.strategy.Context;
import utest.Assert;
import utest.Test;

class TestStrategyGuruExample extends Test {
    var ctx : Context<IntPair, Int>;
    public function setup() {
        ctx = new Context();
    }

    public function testAdd() {
        Assert.same(Some(2), simpleCalculator(1, 1, Add));
    }
    public function testSub() {
        Assert.same(Some(0), simpleCalculator(1, 1, Sub));
    }
    public function testMul() {
        Assert.same(Some(1), simpleCalculator(1, 1, Mul));
    }

    function simpleCalculator(a : Int, b: Int, action : CalcAction) : Option<Int> {
        switch (action){
            case Add: ctx.setStrategy(new ConcreteStrategyAdd());
            case Sub: ctx.setStrategy(new ConcreteStrategySub());
            case Mul: ctx.setStrategy(new ConcreteStrategyMul());
        }

        return ctx.executeStrategy({a:a, b:b});
    }
}


typedef CalcStrat = IStrategy<IntPair, Option<Int>>;

class ConcreteStrategyAdd implements CalcStrat {
    public function new() { }
    public function execute(input : IntPair) : Option<Int> {
        return Some(input.a + input.b);
    }
}

class ConcreteStrategySub implements CalcStrat {
    public function new() { }
    public function execute(input : IntPair) : Option<Int> {
        return Some(input.a - input.b);
    }
}

class ConcreteStrategyMul implements CalcStrat {
    public function new() { }
    public function execute(input : IntPair) : Option<Int> {
        return Some(input.a * input.b);
    }
}

typedef IntPair = { a : Int, b: Int };

enum CalcAction {
    Add;
    Sub;
    Mul;
}
