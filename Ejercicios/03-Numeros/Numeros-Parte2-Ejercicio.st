!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:32:26'!
test07FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := Fraccion with: (Entero with: 7) over: (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:11:26'!
test08FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:32:09'!
test09AparentFraccionesAreEqual

	self assert: oneHalf equals: (Fraccion with: two over: four)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/19/2021 01:48:05'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:04'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Fraccion with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:11'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:21'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'AMV 10/22/2021 19:40:47'!
test27EnteroSubstractsEnteroCorrectly

	self assert: three - one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:47:15'!
* aMultiplier
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:47:24'!
+ anAdder
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:47:28'!
- aSubtrahend
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:47:32'!
/ aDivisor
	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:47:06'!
negated
	self subclassResponsibility ! !


!Numero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:47:44'!
isNegative
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:47:41'!
isOne
	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:47:49'!
isZero
	self subclassResponsibility ! !


!Numero methodsFor: 'printing' stamp: 'RV 10/19/2021 19:34:38'!
printOn: aStream
	self subclassResponsibility.
! !


!Numero methodsFor: 'comparing' stamp: 'RV 10/20/2021 21:26:39'!
= anObject
	self subclassResponsibility.! !

!Numero methodsFor: 'comparing' stamp: 'RV 10/20/2021 21:35:33'!
hash
	self subclassResponsibility.! !


!Numero methodsFor: 'private' stamp: 'RV 10/24/2021 17:48:02'!
invalidNumberType
	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de N�mero Inv�lido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'integerValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 19:15:14'!
beAddedToAFraccion: anAugend
	
	| newDenominator newNumerator |
	newNumerator := anAugend denominator * self + anAugend numerator.
	newDenominator := anAugend denominator.

	^newNumerator / newDenominator ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 18:37:59'!
beAddedToAnEntero: anAugend
	
	^Entero with: anAugend integerValue + self integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 15:59:22'!
beDividedToAFraccion: aDividend

	^(aDividend numerator ) / (aDividend denominator * self )! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:39:40'!
beDividedToAnEntero: aDividend

	^Fraccion with: aDividend over: self! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:40:35'!
beMultipliedToAFraccion: aMultiplier 

	^ (aMultiplier numerator * self) / aMultiplier denominator.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 20:19:08'!
beMultipliedToAnEntero: aMultiplier
	
	^ Entero with: aMultiplier integerValue * self integerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 20:19:30'!
beSubstractedToAFraccion: aMinuend
	
	| newNumerator newDenominator |
	newNumerator :=  aMinuend numerator - aMinuend denominator * self.
	newDenominator := aMinuend denominator .
	
	^newNumerator / newDenominator ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 19:46:50'!
beSubstractedToAnEntero: aMinuend

	| aSubtrahend |
	aSubtrahend := self integerValue.
	^Entero with: (aMinuend integerValue - aSubtrahend)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:38:22'!
fibonacci
	self subclassResponsibility.! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:45:47'!
initializeWith: aIntegerValue
	
	integerValue := aIntegerValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:41:22'!
negated
	^self * (self class with: -1).
		
	! !


!Entero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:49:09'!
* aMultiplicand 
	^aMultiplicand beMultipliedToAnEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:49:13'!
+ anAdder 
	^anAdder beAddedToAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:49:18'!
- aSubtrahend 
	^aSubtrahend beSubstractedToAnEntero: self
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 17:49:23'!
/ aDivisor 
	^aDivisor beDividedToAnEntero: self
	! !


!Entero methodsFor: 'comparing' stamp: 'RV 10/24/2021 17:50:49'!
= anObject
	^(anObject isKindOf: self class) and: [ integerValue = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'RV 10/24/2021 17:45:47'!
hash

	^integerValue hash! !


!Entero methodsFor: 'initialization' stamp: 'RV 10/24/2021 17:49:29'!
initalizeWith: aValue 	
	integerValue := aValue! !


!Entero methodsFor: 'accessing' stamp: 'RV 10/24/2021 17:45:47'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^integerValue! !


!Entero methodsFor: 'printing' stamp: 'RV 10/24/2021 17:45:47'!
printOn: aStream

	aStream print: integerValue ! !


!Entero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:45:47'!
isNegative
	
	^integerValue < 0! !

!Entero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:45:47'!
isOne
	
	^integerValue = 1! !

!Entero methodsFor: 'testing' stamp: 'RV 10/24/2021 17:45:47'!
isZero
	
	^integerValue = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'RV 10/24/2021 17:49:42'!
// aDivisor 
	^self class with: integerValue // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'RV 10/24/2021 17:50:35'!
greatestCommonDivisorWith: anEntero 	
	^self class with: (integerValue gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'RV 10/24/2021 17:35:28'!
with: aValue 
	| allSubclassesOfEntero classToBeIntanciated |
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].

	allSubclassesOfEntero := Entero subclasses .	
	classToBeIntanciated := allSubclassesOfEntero detect: [:eachClass |
		eachClass correspondsTo: aValue
		 ].
	
	^ classToBeIntanciated new initializeWith: aValue
	
	"----------------------------------------------------------------------------------------------------------------------------------------------------
	No borramos los comentarios por que nos gustaria recordar la historia de como fue evolucionando el codigo
	Gracias @jburella por ayudarnos a mejorar los pasos 2 y 3
	
	Paso 4
	allSubclassesOfEntero tenia el problema de que si se agregan clases hay que agregarlas manualmente. 
	Por eso se nos ocurrio buscar si existia el mensaje que devuelve las subclases de una clase
	Y resulto lo que nos quedo arriba
	
	Paso 3 
	Se observa codigo repetido entre los 4 if. Podemos usar la clase Colection para iterar ese mensaje entre las 4 subclases.
	
	allSubclassesOfEntero :={EnterosNegativos. EnterosMayoresAUno. Uno. Cero.}.	
	classToBeIntanciated := allSubclassesOfEntero detect: [:eachClass |
		eachClass correspondsTo: aValue
	].
	
	Paso 2
	Quien sabe responder mejor la pregunta sobre la condicion de value? La subclases asociadas.
	Por eso replanteamos las condiciones de esta manera con un mensaje polimorfico entre clases.
	Lo interesante es que este era un mensaje de clase y no de intancia.
	(Cero correspondsTo: aValue) ifTrue:[
		^Cero new initializeWith: aValue].
	(Uno correspondsTo: aValue) ifTrue:[
		^Uno new initializeWith: aValue].
	(EnterosNegativos correspondsTo: aValue) ifTrue:[
		^EnterosNegativos new initializeWith: aValue].
	(EnterosMayoresAUno correspondsTo: aValue) ifTrue:[
		^EnterosMayoresAUno new initializeWith: aValue].
	
	
	Paso 1
	Al quitar los if de fibonacci generamos 4 clases. Cada clase ahora resolvia una parte del codigo de fibonacci.
	El problema ahora paso a como sabia un entero de que tipo de subclase correspondia.
	El paso 1 nos permitio saber eso. 
	Notar que aprovechamos el uso del algoritmo de LookUp para que las subclases sepan todo lo de entero.
	Pero manteniamos el problema de tener los if.
	(aValue < 0) ifTrue: [^EnterosNegativos new initializeWith: aValue].
	(aValue = 0) ifTrue: [^Cero new initializeWith: aValue].
	(aValue = 1) ifTrue: [^Uno new initializeWith: aValue].
	(aValue > 1) ifTrue: [^EnterosMayoresAUno new initializeWith: aValue].
	"! !


!Entero class methodsFor: 'class matched' stamp: 'RV 10/24/2021 17:17:54'!
correspondsTo: aValue
	self subclassResponsibility.! !


!classDefinition: #Cero category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Cero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Cero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:36:29'!
* aMultiplicand 
	^self
	! !

!Cero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:37:18'!
+ anAdder 
	^anAdder! !

!Cero methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:38:22'!
fibonacci
	^ Entero with: 1! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cero class' category: 'Numeros-Parte2-Ejercicio'!
Cero class
	instanceVariableNames: ''!

!Cero class methodsFor: 'class matched' stamp: 'RV 10/24/2021 17:17:54'!
correspondsTo: aValue
	^ aValue = 0! !


!classDefinition: #EnterosMayoresAUno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnterosMayoresAUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnterosMayoresAUno methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:38:22'!
fibonacci
	
	| one two |
	
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ (self - one) fibonacci + (self - two) fibonacci
		! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnterosMayoresAUno class' category: 'Numeros-Parte2-Ejercicio'!
EnterosMayoresAUno class
	instanceVariableNames: ''!

!EnterosMayoresAUno class methodsFor: 'class matched' stamp: 'RV 10/24/2021 17:17:54'!
correspondsTo: aValue
	^aValue > 1! !


!classDefinition: #EnterosNegativos category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #EnterosNegativos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!EnterosNegativos methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:38:22'!
fibonacci
 	^self error: Entero negativeFibonacciErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EnterosNegativos class' category: 'Numeros-Parte2-Ejercicio'!
EnterosNegativos class
	instanceVariableNames: ''!

!EnterosNegativos class methodsFor: 'class matched' stamp: 'RV 10/24/2021 17:17:54'!
correspondsTo: aValue
	^ aValue < 0! !


!classDefinition: #Uno category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Uno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Uno methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:36:52'!
* aMultiplicand 
	^aMultiplicand
	! !

!Uno methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:38:59'!
fibonacci
	^ self.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Uno class' category: 'Numeros-Parte2-Ejercicio'!
Uno class
	instanceVariableNames: ''!

!Uno class methodsFor: 'class matched' stamp: 'RV 10/24/2021 17:17:54'!
correspondsTo: aValue
	^ aValue = 1! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:00:19'!
beAddedToAFraccion: anAugend

	|newDenominator newNumerator |
	
	newNumerator := (self numerator * anAugend denominator) + (self denominator * anAugend numerator).
	newDenominator := self denominator * anAugend denominator.
			
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:41:20'!
beAddedToAnEntero: anAugend
	
	| adderDenominator adderNumerator |
	adderNumerator := self numerator.
	adderDenominator := self denominator .
	^ (adderDenominator * anAugend + adderNumerator ) / 	adderDenominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 15:59:22'!
beDividedToAFraccion: aDividend

	^(aDividend numerator * self denominator) / (aDividend denominator * self numerator)! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 20:17:58'!
beDividedToAnEntero: aDividend

	| divisorDenominator divisorNumerator |

	divisorNumerator := self numerator.
	divisorDenominator := self denominator .
	
	^Fraccion with: (aDividend * divisorDenominator) over:	 divisorNumerator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'AMV 10/22/2021 20:08:21'!
beMultipliedToAFraccion: aMultiplier
	
	^(aMultiplier numerator * self numerator) / (aMultiplier denominator * self denominator)
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:41:39'!
beMultipliedToAnEntero: aMultiplier

	| multiplicandDenominator multiplicandNumerator |
	
	multiplicandNumerator := self numerator.
	multiplicandDenominator := self denominator .
	
	^ (multiplicandNumerator * aMultiplier  ) / multiplicandDenominator.
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 15:59:48'!
beSubstractedToAFraccion: aMinuend

	| newNumerator newDenominator |
	newNumerator := (aMinuend numerator * self denominator) - (aMinuend denominator * self numerator).
	newDenominator := aMinuend denominator * self denominator.
	^newNumerator / newDenominator 
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 17:41:55'!
beSubstractedToAnEntero: aMinuend
	
	| subtrahendDenominator subtrahendNumerator |
	
	subtrahendNumerator := self numerator.
	subtrahendDenominator := self denominator.
	
	^ (subtrahendDenominator * aMinuend - subtrahendNumerator ) / subtrahendDenominator.
	
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/24/2021 16:00:00'!
negated
	^self class with: self numerator * (Entero with: -1) over: self denominator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'AMV 10/22/2021 20:08:09'!
* aMultiplicand 

	^aMultiplicand beMultipliedToAFraccion: self
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AMV 10/22/2021 18:53:26'!
+ anAdder 

	^anAdder beAddedToAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'AMV 10/22/2021 19:53:12'!
- aSubtrahend 

	^aSubtrahend beSubstractedToAFraccion: self! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'RV 10/24/2021 15:59:22'!
/ aDivisor 

	^aDivisor beDividedToAFraccion: self
	! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
