; CSE 240 -- Homework 4
; author: Gabriel Martinez
; This program is to show a basic knowledge of the List Processing language LISP
; In this file there is examples of Java code, and recursive LISP methods and more

; (2)
; This method foo takes two parameters
; Inside of the method, what it does is add the two arguments given together for the resulting return value
;
; JAVA EXAMPLE
; public static int foo(int x, int y) {
;   return x + y;                               // method returns the addition of two integers
; }
; // running f
; System.out.println(foo(10, 20));
; // running f again
; System.out.println(foo(30, 40));
; // runing f one more time
; System.out.println(foo(40, 50));

; (3)
; 
; this is a recursive function.. In a nutshell what it does is take in one parameter (for this programs inteded purposes a list) and prints out each element in the list
; Step 1. check that argument, l, is not empty
; Step 2. print first element in argument, l.
; Step 3. recrusively call myPrint func passing as an argument all elements but the first in argument, l
;
; JAVA EXAMPLE
; public static void myPrint(int[] arr) {
;   if(arr.length != 0) {                                 // if there is an array proceed
;     print arr[0];                                       // print the first element of the array
;     
;     int[arr.length - 1] newArray;                       // set up a new array one size smaller
;     for(int i = 1; i < arr.length; i++) {               // from the second element to the end element
;       for(int j = 0; j < (arr.length - 1); j++) {       // for each element in the smaller array
;         newArray[j] = arr[i];                           // insert all values from first (larger) array into smaller array
;       }
;     }
;   }
; }
; // running f
; myPrint([1,2,3,4,5])
; // running f again
; myprint([6,7,8,9,0])
; // for this function, we'd need to have one just like the one above but that accepts as an argument an array of chars
; // for brevity I'm not going to write another method where the only thing that changes is the type of array input

; (4)

(defun factorial1 (n)                   ; factorial method
    (setq sum 1)                        ; set variable sum equal to 1
    (do                                 ; do function in LISP is equivalent to for
        ((i 1                           ; assign i for do loop
        (1+ i)))                        ; for each iteration increment i by 1
        ((>= i n))                      ; condition for which to stop (do while i < n)
        (setq sum (* sum (1+ i)))       ; do this while i < n
    )
    sum                                 ; return sum
)


; (5)

(defun factorial2 (n)                   ; another factorial method (this one is recursive)
    (if (= n 1)                         ; base case n == 1
      1                                 ; if base case return 1
      (* n (factorial2 (- n 1)))        ; else n * recursive call to factorial2 with n decremented one
    )
)


; (6)
(defun amount (n)                              ; method to count the amount of times they symbol 'a' shows up in a list
  (setq count 0)                               ; set count equal to 0
  (dolist (x n)                                ; one way to iterate through a list n.. each iteration changes x to element in n
    (if (eq 'a x) (setq count (+ count 1)))    ; if this element in the list n is the symbol 'a', increment our counter
  )
  count                                        ; return the count
)

; (7)

(defun fib (n)                                      ; fibonacci sequence
  (cond                                             ; conditional works like switch statement in java
    ((= n 0) 0)                                     ; first base case, if argument is 0 return 0
    ((= n 1) 1)                                     ; second base case, if argument is 1 return 1
    ((> n 1) (+ (fib (- n 1)) (fib (- n 2))))       ; else for all other numbers recursive call to fibonacci sequence
  )                                                 ; cond returns the last expression executed in cond -> ((test-expression) expression)
)

;(8)

(defun big (m n)            ; return the bigger number of two arguments
  (cond                     ; second time we are seeing cond being used, check two test-expressions
    ((> m n) m)             ; if first argument is larger than second, return the first
    ((> n m) n)             ; if second argument is larger than the first, return the second
  )                         ; again, last expression executed is returned  ((test-expression) expression)
)

; (9)

(defun sum (n)              ; return the sum of the number plus each number under it until 1
  (setq x 0)                ; set x variable to 0
  (do                       ; again we see the do function
    ((i n                   ; assign i equal to n
    (1- i)))                ; decrement i by one after each iteration
    ((< i 1))               ; stop once i is less than 1
     (setq x (+ x i))       ; set x = x + i; i starts at n and works its way down to 0
  )
  x
)

(sum 5)

; (10)
;
; (setq x '(a b))         sets x to list (A B)
; (setq y '(a b c))       sets y to list (A B C)
; (print (car x))         outputs A to the screen
; (print (car y))         outputs A to the screen
; (print (cdr x))         returns everything except the first element in the list, which in this case is just (B)
; (print (cdr y))         returns everything except the first element in the list, which in this case is just (B C)
; (print (car (cdr x)))   gets all the elements except the first in x (so, (B)), and gets the first element in that list (i.e. B)
; (print (car (cdr y)))   gets all the elements except the first in x (so, (B C)), and gets the first element in that list (i.e. B)
; (print (cadr x))        short-hand for (car (cdr x)). takes all elements except first in x, and returns first element from that, B
; (print (cadr y))        short-hand for (car (cdr x)). takes all elements except first in y, and returns first element from that, B
; (print (append x y))    merges the two lists together, resulting in: (A B A B C)


; (TEST)

(defun test()
  (print "CSE 240 Assignment 4. Gabriel Martinez")
  (print (factorial1 100))
  (print (factorial2 100))
  (print (amount '(b c (a) a)))
  (print (fib 7))
  (print (big 5 7))
  (print (sum 5))
)

(test)