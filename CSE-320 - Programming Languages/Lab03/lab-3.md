# Lab 3: Macros

Welcome to the final Racket lab. In this lab, we will be discussing macros, specifically:

- Quoting
- Unquoting
- Quasiquoting
- Pattern-Based Macros
- Procedural Macros
- Homoiconicity
- Macros vs. Functions

## Quoting

Quoting is a simple mechanism in Racket to transform some piece of Racket code which would otherwise be executed into a
"datum," which will not be executed. This transformation between code and data is common and useful.

### Quote

The `quote` function takes some Racket code and converts it into a "datum," which is the textual representation of that code.
This operation can also be performed with a shorthand, like so:

```racket
(quote (+ 1 2))
; => "(+ 1 2)"
'(+ 1 2)
; => "(+ 1 2)"
```

You can execute a datum like so:

```racket
(eval '(+ 1 2))
; => 3
```

### Quasiquote & Unquote

`quasiquote` is similar to `quote`, except you can explicitly exempt some contents of the quasiquoted item from being quoted,
using the `unquote` function.

```racket
(quasiquote (1 (unquote (+ 1 2)) 4))
; => '(1 3 4)
```

Like `quote`, `quasiquote` and `unquote` have a shorthand:

```racket
`(1 ,(+ 1 2) 4)
; => '(1 3 4)
```

## Macros

Macros are functions which run at compile time and have the type `syntax -> syntax` (meaning they take in some Racket syntax
and output some Racket syntax). They are used to generate code at compile time, usually to reduce the amount of code the
programmer has to write, or to create constructs which are difficult to express which run-time code.

### Pattern-Based Macros

Pattern-based macros are macros which work based on pattern matching. The macro defines some syntactic patterns to look for,
along with code to be generated if one of those patterns is found. Here is an example:

```racket
; Example from https://docs.racket-lang.org/guide/pattern-macros.html
(define-syntax rotate
  (syntax-rules ()
    [(rotate a) (void)]
    [(rotate a b c ...) (begin
                          (swap a b)
                          (rotate b c ...))]))
```

This defines a macro called `rotate` which takes in some number of values, and swaps them one by one, causing each value to
shift one spot to the left in the list. When only a single value is input, the output is a call to the `void` function, which
does nothing. When more inputs are given, the first two are swapped, and `rotate` is called on the inputs, excluding the
first input.

Here is a slightly better version:

```racket
; Example from https://docs.racket-lang.org/guide/pattern-macros.html
(define-syntax rotate
  (syntax-rules ()
    [(rotate a c ...)
     (shift-to (c ... a) (a c ...))]))
 
(define-syntax shift-to
  (syntax-rules ()
    [(shift-to (from0 from ...) (to0 to ...))
     (let ([tmp from0])
       (set! to from) ...
       (set! to0 tmp))]))
```

This does the same thing, but uses a helper macro called `shift-to`. Macros can call each other, and some macros — like
`rotate` in this example — may have only one pattern to match against.

There are more methods for defining pattern-based macros, which you can read about here: https://docs.racket-lang.org/guide/pattern-macros.html.

### Procedural Macros

Procedural macros are more powerful than pattern-based macros. While pattern-based macros simply define some pattern to match and new syntax to output, procedural macros can actually perform operations and based logic on the input provided.

First, it is important to know that procedural macros return syntax objects. Syntax objects are similar to the "datum" type from before, except they exist at compile time, not run time, and they carry metadata including the location and span of the syntax being represented.

```racket
(syntax (+ 1 2))
; => #<syntax:1:8 (+ 1 2)>
#'(+ 1 2)
; => #<syntax:1:8 (+ 1 2)>
```

You can convert between the `syntax` and `datum` types using the `syntax->datum` and `datum->syntax` functions.

Knowing that, let's look at a simple example of a procedural macro:

```racket
(define-syntax (self-as-string stx)
    (datum->syntax stx
                   (format "~s" (syntax->datum stx))))
```

This macro takes in a syntax objects, converts it into a datum, turns that datum into a string version of the same value,
and converts that new datum back into a syntax object. (The transform goes: `syntax -> datum (original type) ->
datum (string) -> syntax`).

Calling `(self-as-string (+ 1 2))` returns `"(self-as-string (+ 1 2))"`.

### Mixing the Two

Most interestingly, you can mix the two, like so:

```racket
; Example from https://docs.racket-lang.org/guide/syntax-case.html
(define-syntax (swap stx)
  (syntax-case stx ()
    [(swap x y)
     (if (and (identifier? #'x)
              (identifier? #'y))
         #'(let ([tmp x])
             (set! x y)
             (set! y tmp))
         (raise-syntax-error #f
                             "not an identifier"
                             stx
                             (if (identifier? #'x)
                                 #'y
                                 #'x)))]))
```

This code swaps two values, and uses some extra logic to provide helpful error messages if the inputs aren't identifiers!
This wouldn't be possible with just pattern-based macros, and describing the syntax to be captured would be tedious with
just procedural macros. This `syntax-case` form is the most common and often best way to create a macro.

## Concepts

### Homoiconicity

There is an idea underlying all of this, which is that in Racket, code can be treated as data, and data as code. In Racket's
case, this property arises because Racket's textual representation very closely matches its representation within the
interpreter and compiler.

### Macros vs. Functions

After all of this, it should be clear that macros are not functions. Unlike functions, macros:

- Run at compile-time.
- Always have type `syntax -> syntax`.

In general, you should prefer functions, and use macros only where a function can't be used.

```racket
; Example from https://beautifulracket.com/explainer/macros.html
(define-macro (add . XS) #'(apply + (list . XS))) ; no
(define (add . xs) (apply + xs)) ; yes
```

## Conclusion

Macros are compile-time functions that change or add new syntactic constructs. They can be pattern-based, procedural, or both, and they work well in Racket because Racket's syntax closely matches its representation.

For this lab, I want you to implement a `for-loop` construct in Racket, which looks like this when used:

```racket
(for-loop (variable-name initial-value end-value) body)
```

There is already `for` construct in Racket, found here: https://docs.racket-lang.org/guide/for.html

For full credit, your implementation should:

- Be defined using `syntax-case`.
- Provide an error message if `initial-value` is not an integer.
- Provide an error message if `end-value` is not an integer.

The lab will be due on Tuesday, October 10th, at 11:59pm, via email.
