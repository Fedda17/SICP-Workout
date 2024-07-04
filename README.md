1.3 Conclusione:
Dopo una serie di ragionamenti fuorvianti, ho risolto il problema annidando una serie di condizioni in modo da capire quali fossero i due numeri più grandi e ho sfruttato il potere del linguaggio per applicare le operazioni matematiche square e + al
risultato delle espressioni condizionali annidate. 

1.4, 1.5: Ragionamenti inclusi nei file.

1.6: L'ordine di calcolo applicativo seguito dall'interprete in Scheme calcola prima le espressioni della combinazione (new-if predicate then-clause else-clause) all'interno della procedura sqrt-iter, il che nasconde la forma speciale che il simbolo if e cond hanno nel linguaggio nelle quali il calcolo di un'espressione è determinato da un predicato.

1.7 Ho notato di come il computer abbia bisogno di sapere, indicato tramite un margine nella procedura, quando è sufficiente fermarsi attraverso una tolleranza stabilita matematicamente partendo dalle premesse dell'esercizio 1.6:
(- frazione molto piccola + guess) < (improve guess x) < (frazione molto piccola + guess)
