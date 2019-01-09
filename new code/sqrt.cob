* Author:: Kent Spence 0872780
* Email:: kspenc05@uoguelph.ca
* Course:: Assignment 3: cis*3190
* Software for Legacy Systems
* Date:: 26/03/2016 

Identification division.
Program-id. squareRoot.
Environment division.

Input-output section.
    File-control.
        Select input-file assign to "sqrt.dat"
        Organization is line sequential.
        Select standard-output assign to display.

Data division.

File section.
    Fd Input-file.
        01 Standard-input picture x(80).
    Fd Standard-output.
        01 out-line picture x(80).

Working-storage section.

* Thought these names would be better *
* Changed all variable names to increase readability *
77 diff     picture v9(5).
77 square   picture 9(11)v9(6).
77 guess    picture 9(11)v9(6).
77 root     picture 9(11)v9(6).
77 temp     picture 9(11)v9(6).

01 In-card.
    02 in-sq picture S9(11)v9(6).
    02 in-diff picture v9(5).
    02 filler picture x(58).

* changed x(26) to 'Square Root Approximations' *
* to increase readability of output *
01 Title-line.
    02 Filler picture x(9) value spaces.
    02 Filler picture x(26) value 'Square Root Approximations'.

01 Under-line.
    02 Filler picture x(44) value
    '--------------------------------------------'.

* changed x(6) and x(11) to 'Number' and 'Square Root' *
* so it's easier for the user to understand output *
01 Col-heads.
    02 Filler picture x(8) value spaces.
    02 Filler picture x(6) value 'Number'.
    02 Filler picture x(15) value spaces.
    02 Filler picture x(11) value 'Square Root'.

01 Underline-2.
    02 Filler picture x(20) value ' -------------------'.
    02 Filler picture x(5) value spaces.
    02 Filler picture x(19) value '------------------'.

01 Print-line.
    02 Filler picture x value space.
    02 out-sq picture z(11)9.9(6).
    02 Filler picture x(5) value spaces.
    02 out-root picture z(11)9.9(6).

01 Error-mess.
    02 Filler picture x value space.
    02 ot-sq picture -(11)9.9(6).
    02 Filler picture x(21) value ' Invalid input'.


* Abort-mess is no longer called within the code, *
* but I have kept it in case it's needed in the future *

01 Abort-mess.
    02 Filler picture x value space.
    02 outp-sq picture z(11)9.9(6).
    02 Filler picture x(37) value
    ' Attempt aborted,too many iterations'.
    
Procedure division.

* * block below creates main title with columns and headings * *

    Display "".

    Open input input-file, output Standard-output.
    Write out-line from Title-line after advancing 0 lines.
    Write out-line from Under-line after advancing 1 line.
    Write out-line from Col-heads after advancing 1 line.
    Write out-line from Underline-2 after advancing 1 line.    
    
getSqrtValues.

*   Note:: only reads one record in at a time, *
*   not entire file                            *   

    Read input-file into in-card
        AT END
            Close input-file, standard-output
            Stop run
    end-read.
 
    If in-sq is negative
        Move in-sq to ot-sq
        Write out-line from Error-mess after advancing 1 line        
        perform getSqrtValues
    end-if.
     
    Compute diff = in-diff.
    Compute square = in-sq.
    Compute guess rounded = square / 2.

    Call "calcRoot" using diff, square, guess, root.

*   Note:: out-sq contains the square value to be printed *
*   While out-root will contain the square root *

    Compute out-root = root.
    Compute out-sq = in-sq.

    Write out-line from Print-line after advancing 1 line.     
    display "".
    
    Perform getSqrtValues.

* Last line will cause it to loop forever until file is at end *
