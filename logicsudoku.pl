/**
L贸gica para Ciencias de la Computaci贸n 2017

Autor: GUTIERREZ, Nestor Gabriel LU: 91619

L贸gica en prolog para jugar una partida de sudoku.

Los predicados en prolog de este programa verifican que en cada fila, columna y
regi贸n sean las cifras del 1 al 9 sin repetirse. Esto se har谩 tanto para la
verificaci贸n de un tablero ya completo, como as铆 tambi茅n para la comprobaci贸n
de un tablero a completar. En un tablero a completar, se ir谩n asignando los
valores y luego se verificar谩n que estos sean correctos, de lo contrario se
asignan valores nuevos, y nuevamente se verifican. Esto sucesivamente hasta dar
con la soluci贸n correcta, en caso de existir se retorna la soluci贸n. En caso
contrario se muestra tal efecto.
*/

/**
metodo que comprueba si un tablero esta correctamente armado
verificando en cada fila columna y subdivision no se repitan
las cifras del 1 al 9

 input:
 	@Tablero: una lista de 81 componentes, que eventualmente
 	representa la matriz de 9x9 de un tablero de sudoku, esta
 	lista ingresa previamente cargada
 output:
 	True si la lista es correcta
 	False caso contrario
*/
comprobar(Tablero):-
	/*Establezco formato*/
	Tablero =[A1,A2,A3,  A4,A5,A6,  A7,A8,A9,
			B1,B2,B3,  B4,B5,B6,  B7,B8,B9,
			C1,C2,C3,  C4,C5,C6,  C7,C8,C9,

			D1,D2,D3,  D4,D5,D6,  D7,D8,D9,
			E1,E2,E3,  E4,E5,E6,  E7,E8,E9,
			F1,F2,F3,  F4,F5,F6,  F7,F8,F9,

			G1,G2,G3,  G4,G5,G6,  G7,G8,G9,
			H1,H2,H3,  H4,H5,H6,  H7,H8,H9,
			I1,I2,I3,  I4,I5,I6,  I7,I8,I9],

	/*comprobar las filas*/
	validar([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
	validar([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
	validar([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
	validar([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
	validar([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
	validar([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
	validar([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
	validar([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
	validar([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

	/*comprobar las columnas*/
	validar([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
	validar([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
	validar([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
	validar([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
	validar([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
	validar([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
	validar([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
	validar([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
	validar([A9,B9,C9,D9,E9,F9,G9,H9,I9]),

	/*comprobar las cuadriculas*/
	validar([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
	validar([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
	validar([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
	validar([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
	validar([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
	validar([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
	validar([G1,G2,G3,H1,H2,H3,I1,I2,I3]),
	validar([G4,G5,G6,H4,H5,H6,I4,I5,I6]),
	validar([G7,G8,G9,H7,H8,H9,I7,I8,I9]).

/**
predicado que resuelve un tablero de sudoku a partir de una par de cifras
ya cargadas, el metoco comprobar verifica que las cifras no posean conflito
y llamada al metodo lavelear/1 para que asigne valores a la lista, el proceso
funciona a fuerza bruta, probando combinaciones hasta dar con una que satisface
la condicion de comprobar/1.

input:
	@Tablero: lista de 81 coponentes con algunas de sus componentes completas el
	cual representa la matriz del sudoku a resolver
output:
	@salida: una lista de 81 componentes con, en caso de existir, la soluci髇 del
	al sudoku ingresados
	False: en caso de que el sudoku propuesto no posea soluci髇 alguna
*/
resolver(Tablero, Salida):-

	Salida=Tablero,
	comprobar(Salida),
	rellenar(Salida).
	/*comprobar(Salida).*/


/**
Predicado que verifica una lista corroborando que sus componentes sean todos
distintos, si bien este metodo podria no existir y usarse directaente el metodo
todosDiferentes/1, se conserva para no modificar la interfaz grafica en java que
ya se verifico su correcto funcionamiento.

input:
	@L: lista a la cual se debera corroborar que sus componentes sean distintas
output:
	True: si la lista posee todos sus componentes sos distitas
	False: caso contrario
*/
validar(L) :-
	todosDiferentes(L).

/**
Predicado para rellenar el tablero con elementos del uno al nueve

input:
	@[L|Ls]: Tablero con algunas de sus componentes sin instanciar.
ouput:
	Tablero con todas sus componentes instanciadas con n煤meros del 1 al 9.
*/
rellenar([]).
rellenar([L|Ls]):-
	miembro(L, [1,2,3,4,5,6,7,8,9]),
	rellenar(Ls).

/**
Predicado utilizado para que la primer componente se instancie con alguno
de los elementos de la lista del segundo par谩metro.

input:
	@X: Elemento a la cual se le va a instanciar un elemento de la lista
	@[Y|Ys]: Lista a la cual se quiere descomponer en elementos individuales.
output:
	True: Si X se puede instanciar con alg煤n elemento de la lista.
	False: Caso contrario, cuando la lista ingresada es vac韆.
*/
miembro(X, [Y|_]) :-
	X = Y.
miembro(X, [_|Ys]) :-
	miembro(X, Ys).



/**
predicado que verifica si dos metas-variables son distintas, este predicado hace uso del
predicado dif/2 de la libreria dif que se autocarga con prolog, estre predicado proporciona
una restricci贸n que indica que A y B son t茅rminos diferentes. Si A y B no pueden unificar,
dif/2 tiene 茅xito determinista. Si A y B son id茅nticos falla inmediatamente, y, por 煤ltimo,
si A y B se pueden unificar, las metas se retrasan, impidiendo a A y B a ser iguales.
Mas info: http://www.swi-prolog.org/pldoc/man?predicate=dif/2

imput:
	@X, @y: variables con las cuales se comprobara la igualdad y posterior restricci贸n
output:
	False: si ambas metas son iguales
	True: caso contrario
*/
diferentes(X,Y):-
	dif(X,Y).

/*
Predicado recursivo que verifica que todas las componentes de una lista sean distintos
en el caso base una lista es vacia, lo cual marca como verdader que cumple la condicion,
en el caso recursivo verifico que el primer elemento sea distitnto al resto de la lista
y luego verifico que el resto de la lista posea todas sus componentes distintas

input:
	@[] lista vacia
	@[L|Ls] lista donde L es la cabeza de la lista y Ls es el resto de la lista
output:
	True: si las componestes son todas distintas
	False: caso contrario
*/
todosDiferentes([]).
todosDiferentes([L|Ls]):-
	noPertenece(L,Ls),
	todosDiferentes(Ls).

noPertenece(_, []).
noPertenece(X, [Y|Ys]) :-
	diferentes(X,Y),
  noPertenece(X, Ys).


/**
Predicado recursivo que corrobora que un elemento dado no se encuentre en una list
tambien dada, en el caso base ferefico que un elemto y una lista vacias, lo cual marca
como verdadero cumpliendo la condicion, y en el caso recursivo se verifica la desigualdad
entre el elemento X dado y la cabeza Y de la lista, luego se verifica que el elemento dado
sea distinto al resto de la lista dada

input:
	@X: elemento dado que no deve existir en la lista
	@[L|Ls]: lista donde se realizara de prueva, L cabeza de la lista, Ls resto de la lista
	@_: elemento sin considerar contenido
	@[]: lista vacia
*/
diferentePrimero(_,[]).
diferentePrimero(X,[Y|Ls]):-
	diferentes(X,Y),
	diferentePrimero(X,Ls).
