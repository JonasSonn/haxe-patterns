package patterns.strategy;

import haxe.ds.Option;

class Context<I, O> {
    var strategy : IStrategy<I, Option<O>>;

    public function new() {}

    public function setStrategy(strategy : IStrategy<I, Option<O>>) {
        this.strategy = strategy;
    }

    public function executeStrategy(input : I) : Option<O> {
        return strategy.execute(input);
    }
}