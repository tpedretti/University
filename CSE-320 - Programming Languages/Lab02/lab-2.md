# Lab 2: Functions

In this lab, we will discuss functions, the core of functional programming. In particular, we will
explore the ideas of __anonymous functions__ (also called __lambdas__), __currying__, __partial application__,
and __higher-order functions__.

## Anonymous Functions

Functions do not have to have names. Functions that don't have names are unsurprisingly called "anonymous functions."
You may also seem them called "lambdas," which comes from the _lambda calculus_, a fundamental model of computing.

In Racket, anonymous functions can be written like so:

```racket
; This is an anonymous function that squares a number.
(lambda (x) (* x x))
```

The full documentation on lambdas can be found here: https://docs.racket-lang.org/guide/lambda.html
The Racket guide also has a handy explanation, found here: https://docs.racket-lang.org/guide/syntax-overview.html#%28part._.Anonymous_.Functions_with_lambda%29

## Closures

A closure is a function plus an environment (remember that an environment is a mapping of names to values).
Let's look at some code:

```racket
(define (make-adder x) (lambda (y) (+ x y)))
(let ([two-adder (make-adder 2)]
      [ten-adder (make-adder 10)])
     ; This line prints "6"
     (print (two-adder 4))
     ; This line prints "110"
     (print (ten-adder 100)))
```

In the above code, the internal `lambda` returned by `make-adder` is a closure, because it has an environment
storing the value of `x` from when `make-adder` was called. For `two-adder`, the value of `x` is `2`. For
`ten-adder`, the value of `x` is `10`. 

## Currying

Currying is the process of converting a function with many parameters into a series of nested functions each
with one parameter. In C++, that would mean the following:

```cpp
int example(int x, int y, int z) {
    // ...
}

int curried_example(int x) {
    return [](int y) {
        return [](int z) {
            // ...
        }
    }
}
```

In Racket, you can curry a function like so:

```racket
(define (multiply x y) (* x y))
((curry multiply) 2)
; => #<procedure:curried>
(((curry multiply) 2) 3)
; => 6
```

## Partial Application

_Partial application_ often gets confused with currying. Partial application means that a function can be passed fewer
arguments than it requires, and it will return itself with the provided parameters filled in. Partial application is
made possible by currying, but the difference is that currying is the transformation of an `n`-parameter function into
`n` single-parameter functions, while partial application is what happens when you pass fewer than `n` parameters to
a curried function.

Using the same code from above:

```racket
(define (multiply x y) (* x y))
(define curried_multiply (curry multiply))
(curried_multiply)
; => #<procedure:curried>
((curried_multiply) 2)
; => #<procedure:curried>
; This is the partial application, because curried_multiply is passed
; 1 argument instead of 2, but rather than failing, returns a function
; accepting the remaining 1 argument.
(((curried_multiply) 2) 3)
```

## Higher-Order Functions

There are two forms of higher-order functions:

- Functions that take other functions as parameters.
- Function that return other functions.

Here's an example of a function taking another function as a parameter.

```racket
(define (do-twice f x) (f (f x)))
(define (square n) (* n n))
(do-twice square 2)
; This results in (square (square 2))
; Which becomes (square 4)
; Which becomes 16
; => 16
```

And here's an example of returning a function from a function (you've actually seen this
multiple times already):

```racket
(define (make-adder x) (lambda (y) (+ x y)))
(define two-adder (make-adder 2))
```

## Why These Are Useful

The key idea is that collectively these capabilities make functions really flexible! For example, you
can write functions to do stuff like this:

```racket
(define (plus-one n) (+ n 1))
(map plus-one '(1 2 3 4))
; => '(2 3 4 5)
(filter positive? '(1 -2 3 4 -5))
; => '(1 3 4)
(member 2 (list 1 2 3 4))
; => '(2 3 4)
```

## Conclusion

For this lab, write code which fulfills the following requirements, and email it to the professor as a single `.rkt` file:

- Write 5 examples of anonymous functions.
- Write 5 examples of closures.
- Write 5 examples of currying.
- Write 5 examples of partial application.
- Write 5 functions taking functions as parameters.
- Write 5 functions returning functions.
