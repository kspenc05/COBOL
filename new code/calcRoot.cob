* Author:: Kent Spence 0872780
* Email:: kspenc05@uoguelph.ca
* Course:: Assignment 3: cis*3190
* Date:: 22/03/2016

* * Module determines the square root of the value square
* * And then stores the result in the variable called root.

Identification division.
Program-id. calcRoot.
Environment division.
Data division.
Working-storage section.

77 temp     picture 9(11)v9(6).

Linkage section.
77 diff      picture v9(5).
77 square    picture 9(11)v9(6).
77 guess     picture 9(11)v9(6).
77 root      picture 9(11)v9(6).

Procedure division using diff, square, guess, root.

SquareRoot.
    Compute root rounded = 0.5 * (guess + square /guess).
    Compute temp =  root - guess.

    If temp is negative
        Compute temp = temp * - 1
    end-if.

    Move root to guess.
    Perform SquareRoot until (temp / (root + guess)) < diff. 
goback.
