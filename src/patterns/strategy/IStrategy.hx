package patterns.strategy;

interface IStrategy<I, O> {
    public function execute(input : I) : O;
}