# Lab01

This is a “warm-up” and exploratory first CSE 330 lab. Work on the exercises in the order given, and see how far you get. If you manage to complete exercises 1-3, you are in good shape. Exercise 4 (the most interesting one) is left in case there is time left. There is a possibility that it will show up in an upcoming homework assignment.

## Exercise 1:
Write a C++ program that will take a positive integer N as input and then print out a matrix of the following sort:
For input 8:
1 _ _ _ _ _ _ _
_ 2 _ _ _ _ _ _
_ _ 3 _ _ _ _ _
_ _ _ 4 _ _ _ _
_ _ _ _ 5 _ _ _
_ _ _ _ _ 6 _ _
_ _ _ _ _ _ 7 _
_ _ _ _ _ _ _ 8

## Exercise 2:
If your solution to Exercise 1 is code that is wrapped within “one big main()”, unravel your program by having a function print out the matrix. Modify your main() function so that it uses the new function.

## Exercise 3:
Define and implement a class SquareNumber which represents only those numbers that are squares of integer values.

## Exercise 4:
Write a C++ program that determines the “maximal subsequence sum” of a vector of positive and negative integers. A “subsequence sum” is the sum of any number of contiguous integers in a vector. For example, a vector containing integers
5 -3 7 4 12 -6
… has among its numerous subsequences the sums
2 -- from: 5 – 3 = 1
20 -- from: -3 +7+4+12=20
10 -- from: 4 +12-6 = 10
Etc.
Among all possible subsequence sums, there is one that is maximal. Your program is to compute this value. Start by sketching out an algorithm (go with a simple, straightforward one), before you write any code.