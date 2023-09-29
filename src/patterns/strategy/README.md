# Strategy 

Based on: https://refactoring.guru/design-patterns/strategy

- Implement the interface IStrategy in concrete strategy classes. 
- Set your desired type parameters for I = Input and O = Output
- Create an instance of Context with same type parameters
    - set your desired strategy with setStrategy
    - execute strategy using executeStrategy
        - returns hx.ds.Option in the case the output is meaningless. 

See the unit tests for inspiration on how to use.

