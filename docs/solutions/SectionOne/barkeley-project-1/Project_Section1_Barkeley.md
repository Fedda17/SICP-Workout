# Blackjack project.  
## Rules of the game:  
Two Players wich purpose is getting at 21 through a set of cards  
Players are dealer and costumer  
For programming purpose, the cards are made by words  
Jack = j  
King = k  
Ace = a  
Queen = q  
Spades = s  
Hearts = h  
Clubs = c  
Diamonds = d  

Picture cards = 10p  
Ace = 1p or 11p  

Cards are reshuffled at each round

At each round at the start the players are dealt with two cards and one of the dealer's is facing up  
The dealer's rules are:  
if cards < 17 takes otherwise stops  
The costumer plays before the dealer.  
If costumer cards > 21 -> immediate lost  
If costumer's cards = dealer's cards -> tie  

Costumer's strategy = f(hand-so-far, dealers-faceup-card) -> true or false, instruct whether to take another card


hand-so-far = sentence of words  
dealers-faceup-card = words


library function: twenty-one, if I feed it "strategy" it plays a game with randomly shuffled cards and returns 0 or 1 or -1
if 1 the costumer won  
if 0 tie  
if -1 costumer lost   

My purpose of this program is to do some testing for to-do procedures indicated in the text using trace output and convince the reader that it works

Let's start by importing the library function to racket 

I have to define a procedure best-total with input a sentence of cards and output the total points
I should return the closest number less or equal to 21 when ace is in the sentence

Writing and test of the procedure:

procedure that returns a sentence of points ordered.
sum ordered points accounting for ace value


## Calculate the best possible points
 ``` racket
(define (best-total hand)
	(define (points-association card) 
			(let ((card-rank (bl card)))
				(cond ((and (number? card-rank) (< card-rank 11)) card-rank)
							((or (equal? card-rank 'J) (equal? card-rank 'Q) (equal? card-rank 'K)) 10)
							((equal? card-rank 'A) 11)
				)
			)
	)

	(define (sum-best-total ordered-points total) 
		(define MAX-POINTS 21)
		 (cond
						((empty? ordered-points) total)
						((and (= 11 (first ordered-points)) (> total (- MAX-POINTS 11))) (sum-best-total (bf ordered-points) (+ total 1)))
						(else (sum-best-total (bf ordered-points) (+ total (first ordered-points))))
		
		  )
	)

	(define (iter-points hand)
		(cond ((empty? hand) '())
			  (else (sentence (points-association (first hand)) (iter-points (bf hand))))
		) 
	)

	(sum-best-total (sort (iter-points hand) <) 0)
)
```

<details>
<summary> <b>Stack trace</b> </summary>
> (best-total '(ad 8s 5h))
14
>  (best-total '(ad as 9h))
21
>  (best-total '(ad as ac))
13
>  (best-total ’(9s as 9h))
. . ’: undefined;
 cannot reference an identifier before its definition
>  (best-total '(9s as 9h))
19
>  (best-total '(js as 9h))
20
> (best-total '(qs as 9h))
20
> (best-total '(ks as 9h))
20
> (best-total '(ms as 9h))
. . Argument to SENTENCE not a word or sentence: #<void>
</details>

## Strategy for stopping at 17 like the dealer
Part 2 I have to write a procedure that does the same but for the dealer, I expect to reuse a lot of code:

 ``` racket
(define (stop-at-17 customer-hand-so-far dealer-card-facing-up)
	(< (best-total  customer-hand-so-far) 17)
) 
 ```

<details>
<summary> <b>Stack trace</b> </summary>
> (stop-at-17 '(9s 8h as))
#f
> (stop-at-17 '(8s 8h as))
#f
> (stop-at-17 '(7s 8h as))
#t
> (stop-at-17 '(9s ah as))
#f
</details>

This stack should provide enough evidence that the procedure works, if there are any bugs anyway, the best-total and stop-at-17 definitions become
faulty as a consequence because they rely on the same definitions.


## Play the game n times
Now for play-n:

 ``` racket
(define (play-n strategy n)
		(if (> n 0) (+ (twenty-one strategy) (play-n strategy (- n 1))) 0)) 
 ```

	
## Choose the next move by seeing what's on the Dealer's hand
For the dealer sensitive strategy, there are two cases:
I return true when the dealer facing up card is 7 or 8 or 9 or 10 or ace or picture and the customer has less than 17
I return false when the dealer has 2 or 3 or 4 or 5 or 6 and the customer has less than 12

 ``` racket
(define (dealer-sensitive customer-hand-so-far dealer-card-facing-up)
		(cond ((> (best-total (sentence dealer-card-facing-up '())) 6) (< (best-total customer-hand-so-far) 17))
				(else (< (best-total customer-hand-so-far) 12)))
)
 ```


The stack trace provides:

<details>
<summary> <b>Stack trace</b> </summary>
(play-n dealer-sensitive 5)
>(dealer-sensitive '("AC" "7S") "KS") this is as expected
<#f
>(dealer-sensitive '("5S" "KS") "QC") this is as expected
<#t
>(dealer-sensitive '("5S" "KS" "3D") "QC") this is as expected
<#f
>(dealer-sensitive '("10H" "JD") "KS") this is as expected
<#f
>(dealer-sensitive '("8D" "6H") "QC") this is as expected
<#t
>(dealer-sensitive '("KH" "QC") "8D") this is as expected
<#f
-2
</details>


## Generalization of stopping at X points strategy
For stopping at strategy, should be pretty straightforward:

 ``` racket
(define (stop-at n)
	(lambda (customer-hand-so-far dealer-card-facing-up)
		(< (best-total  customer-hand-so-far) n))
 )
 ```

 
<details>
<summary> <b>Stack trace</b></summary>
> (play-n (stop-at 18) 1)
>(play-n #<procedure> 1)
> (twenty-one #<procedure>)
> >(stop-at '("KS" "QC") "5D")
< <#f
< 1
> (play-n #<procedure> 0)
< 0
<1
1
> (play-n (stop-at 18) 1)
>(play-n #<procedure> 1)
> (twenty-one #<procedure>)
> >(stop-at '("9S" "AC") "4D")
< <#f
< 1
> (play-n #<procedure> 0)
< 0
<1
1
> (play-n (stop-at 18) 1)
>(play-n #<procedure> 1)
> (twenty-one #<procedure>)
> >(stop-at '("7S" "AD") "3C")
< <#f
< -1
> (play-n #<procedure> 0)
< 0
<-1

> > >(play-n #<procedure> 1)
> > > (twenty-one #<procedure>)
> > > >(stop-at '("JD" "5H") "8S")
< < < <#t
< < < -1
> > > (play-n #<procedure> 0)
< < < 0
< < <-1
< < 0
< <-1
< 0
<-1
</details>


## Valentine's strategy: play more aggressive if you have a heart suit
Now for the valentine strategy:

 ``` racket
(define (valentine customer-hand-so-far dealer-card-facing-up)
	(define (contains-hearts? hand) 
		(let ((suit-card (lambda (card) (last card))))
			(cond
				((empty? hand) #f)
				((equal? (suit-card (first hand)) 'H) #t)
				(else (contains-hearts? (bf hand))))
		))
	(let ((aggressiveness (stop-at 19))
		  (normal (stop-at 17))) 
		((if (contains-hearts? customer-hand-so-far) aggressiveness 
											         normal) customer-hand-so-far '()))
)
```


<details>
<summary><b>Stack Trace</b></summary>
>(play-n #<procedure:valentine> 1)
> (twenty-one #<procedure:valentine>)
> >(contains-hearts? '("KC" "QH"))
> >(contains-hearts? '("QH"))
< <#t
> >(stop-at '("KC" "QH") '())
< <#f
< 0
> (play-n #<procedure:valentine> 0)
< 0
<0
>(play-n #<procedure:valentine> 1)
> (twenty-one #<procedure:valentine>)
> >(contains-hearts? '("KC" "QH"))
> >(contains-hearts? '("QH"))
< <#t
> >(stop-at '("KC" "QH") '())
< <#f
< 0
> (play-n #<procedure:valentine> 0)
< 0
<0
0
> (play-n valentine 1)
>(play-n #<procedure:valentine> 1)
> (twenty-one #<procedure:valentine>)
> >(contains-hearts? '("2D" "AH"))
> >(contains-hearts? '("AH"))
< <#t
> >(stop-at '("2D" "AH") '())
< <#t
> >(contains-hearts? '("2D" "AH" "2H"))
> >(contains-hearts? '("AH" "2H"))
< <#t
> >(stop-at '("2D" "AH" "2H") '())
< <#t
> >(contains-hearts? '("2D" "AH" "2H" "JD"))
> >(contains-hearts? '("AH" "2H" "JD"))
< <#t
> >(stop-at '("2D" "AH" "2H" "JD") '())
< <#t
> >(contains-hearts? '("2D" "AH" "2H" "JD" "5S"))
> >(contains-hearts? '("AH" "2H" "JD" "5S"))
< <#t
> >(stop-at '("2D" "AH" "2H" "JD" "5S") '())
< <#f
< -1
> (play-n #<procedure:valentine> 0)
< 0
<-1
-1

>(play-n #<procedure:valentine> 1)
> (twenty-one #<procedure:valentine>)
> >(contains-hearts? '("AC" "10S"))
> >(contains-hearts? '("10S"))
> >(contains-hearts? '())
< <#f
> >(stop-at '("AC" "10S") '())
< <#f
< 1
> (play-n #<procedure:valentine> 0)
< 0
<1
1
</details>


## Generalization of the suit strategy
Point 7 tells me to generalize the procedure "valentine" with a procedure of three arguments:
A suit, a normal strategy, and a tailored strategy for when the hand contains the suit.

 ``` racket
(define (suit-strategy suit tailored-strategy normal-strategy)
	(lambda (customer-hand-so-far dealer-card-facing-up)
		(trace-define (contains-suit? hand) 
		(let ((suit-card (lambda (card) (last card))))
			(cond
				((empty? hand) #f)
				((equal? (suit-card (first hand)) suit) #t)
				(else (contains-suit? (bf hand))))
		)) 
		((if (contains-suit? customer-hand-so-far) tailored-strategy 
											         normal-strategy) customer-hand-so-far '())
	)
)
 ```



by seeing the stack trace:

<details>
<summary><b>Stack Trace</b></summary>
(best-total '("6C" "9H"))
<15
>(contains-suit? '("6C" "9H"))
>(contains-suit? '("9H"))
<#t
>(best-total '("6C" "9H"))
<15
>(best-total '("6C" "9H" "3S"))
<18
>(contains-suit? '("6C" "9H" "3S"))
>(contains-suit? '("9H" "3S"))
<#t
>(best-total '("6C" "9H" "3S"))
<18
>(best-total '("6C" "9H" "3S" "4C"))
<22
-1
> (play-n valentine 1)
>(best-total '("KD" "10S"))
<20
>(contains-suit? '("KD" "10S"))
>(contains-suit? '("10S"))
>(contains-suit? '())
<#f
>(best-total '("KD" "10S"))
<20
>(best-total '("5C" "5H"))
<10
>(best-total '("5C" "5H"))
<10
>(best-total '("5C" "5H" "7C"))
<17
>(best-total '("5C" "5H" "7C"))
<17
>(best-total '("KD" "10S"))
<20
>(best-total '("5C" "5H" "7C"))
<17
>(best-total '("KD" "10S"))
<20
>(best-total '("5C" "5H" "7C"))
<17
1
</details>


## "Pick another card if 2 strategy give you the go" strategy
Part 8.

Procedure named majority.
Domain: three strategies (procedures)
Range: a strategy (procedure)
the result strategy returns true if 2 or 3 domain strategies do it

 ``` racket
(define (majority strategy1 strategy2 strategy3)
	(lambda (customers-cards-so-far dealers-card-facing-up)
		(let ((majority-tactic (lambda (strategy) (if (strategy customers-cards-so-far dealers-card-facing-up) 1 0))))
			(> (+ (majority-tactic strategy1) (majority-tactic strategy2) (majority-tactic strategy3)) 1))
	)
)
 ``` 

<details>
<summary><b>Stack Trace</b></summary>
>(majority '("9S" "6S") "4H")
<#f
1
> (play-n (majority (stop-at 10) dealer-sensitive (suit-strategy 'H (stop-at 10) (stop-at 21))) 1)
>(majority '("10C" "4S") "9H")
<#t
>(majority '("10C" "4S" "2H") "9H")
<#f
-1
> (play-n (majority (stop-at 10) dealer-sensitive (suit-strategy 'H (stop-at 10) (stop-at 21))) 1)
>(majority '("6D" "QC") "7H")
<#t
-1
> (play-n (majority (stop-at 10) dealer-sensitive (suit-strategy 'H (stop-at 10) (stop-at 21))) 1)
>(majority '("9S" "8C") "6H")
<#f
-1
> (play-n (majority (stop-at 10) dealer-sensitive (suit-strategy 'H (stop-at 10) (stop-at 21))) 1)
>(majority '("AD" "KH") "8D")
<#f
1
> 
</details>

## "Just one more card..." strategy
Part 9:
Procedure reckless:
Domain: strategy
Range: strategy
The returned strategy returns true after the input strategy is false once
<details>
<summary><b>Stack Trace</b></summary>
>(reckless '("AC" "3H") "5D")
<#t
>(reckless '("AC" "3H" "4D") "5D")
<#t
>(reckless '("AC" "3H" "4D" "7D") "5D")
<#f
-1
</details>

 ``` racket
(define (reckless strategy)
	(trace-lambda (customers-cards-so-far dealers-card-facing-up)
		 (strategy (bl customers-cards-so-far) dealers-card-facing-up)
	)
)
 ```


## Stack trace for the program with two Jokers in the deck
Joker Part Modification Stack trace:
<details>
<summary><b>Stack Trace</b></summary>
>(stop-at '("3D" JOKER1 "8H") "7C")
> (iter-points '("3D" JOKER1 "8H"))
> >(iter-points '(JOKER1 "8H"))
> > (iter-points '("8H"))
> > >(iter-points '())
< < <'()
< < '(8)
< <'(12 8)
< '(3 12 8)
> (sum-best-total '(3 8 12) 0)
> (sum-best-total '(8 12) 3)
> (sum-best-total '(12) 11)
> (sum-best-total '() 21)
< 21
<#f
</details>

## [Download the Joker Game](./joker.rkt)
## [Download the Strategies](./strategies.rkt)
## [Download the core game](./twenty-one.rkt)