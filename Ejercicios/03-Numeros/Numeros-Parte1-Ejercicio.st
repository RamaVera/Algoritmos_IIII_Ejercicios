!classDefinition: #Numero category: #'Numeros-Parte1-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/19/2021 19:35:54'!
* aMultiplier 
	self subclassResponsibility.
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/19/2021 01:36:30'!
+ anAdder 
	self subclassResponsibility.
	! !

!Numero methodsFor: 'arithmetic operations' stamp: 'RV 10/19/2021 01:41:58'!
negated
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'RV 10/19/2021 01:43:17'!
isNegative
	self subclassResponsibility.! !

!Numero methodsFor: 'testing' stamp: 'RV 10/19/2021 01:28:44'!
isOne
	self subclassResponsibility .! !

!Numero methodsFor: 'testing' stamp: 'RV 10/19/2021 01:22:30'!
isZero
	self subclassResponsibility.! !




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


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: #'Numeros-Parte1-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2016 22:45'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero'! !




!classDefinition: #Entero category: #'Numeros-Parte1-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:39:43'!
* aMultiplier 
	^self class with: value * aMultiplier integerValue.
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:31:06'!
+ anAdder 
	 ^self class with: value + anAdder integerValue.
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 22:30:15'!
// aDivisor 
	aDivisor isZero ifTrue: [ self error: super class canNotDivideByZeroErrorDescription ].
	^self class with: value // aDivisor integerValue
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:25:03'!
= anObject
	^value = anObject integerValue 

	 ! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:40:28'!
greatestCommonDivisorWith: anEntero 
	^self class with: (value gcd: anEntero integerValue)! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:36:21'!
hash
	^value hash
! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:43:02'!
initializeWith: aValue
	
	value := aValue! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:37:32'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:42:31'!
isNegative
	^value < 0 
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:28:55'!
isOne
	^ value = 1! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/18/2021 23:30:39'!
isZero
	^ value = 0! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:41:22'!
negated
	^self * (self class with: -1).
		
	! !

!Entero methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 19:24:16'!
printOn: aStream	
	^aStream print: value.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: #'Numeros-Parte1-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:46:31'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initializeWith: aValue! !


!classDefinition: #Fraccion category: #'Numeros-Parte1-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:40:03'!
* aMultiplier 
	^self class with: (numerator * aMultiplier numerator) over: (denominator * aMultiplier denominator).
		! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:31:40'!
+ anAdder 
	| newNumerator newDenominator |
		
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	
	^ self class with: newNumerator over: newDenominator
! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:26:01'!
= anObject
	 ^(numerator * anObject denominator) = (denominator * anObject numerator).! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:35:07'!
denominator

	^denominator! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:36:32'!
hash
	^(numerator hash / denominator hash) hash ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:43:38'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	.
	numerator := aNumerator.
	denominator := aDenominator ! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:42:46'!
isNegative
	 ^denominator < 0 .! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 01:29:02'!
isOne
	^false! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/18/2021 23:30:57'!
isZero
	^false! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 22:19:37'!
negated
	^self class with: numerator * (Entero with: -1) over: denominator.! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 21:37:58'!
numerator

	^numerator! !

!Fraccion methodsFor: 'as yet unclassified' stamp: 'RV 10/19/2021 19:24:48'!
printOn: aStream	
	aStream 		print: numerator;
			nextPut: $/;
			print: denominator.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: #'Numeros-Parte1-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'as yet unclassified' stamp: 'RV 10/20/2021 22:30:38'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: super canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue: [ ^self with: aDividend negated over: aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^ self new initializeWith: numerator over: denominator! !


!classDefinition: #NumeroTest category: #'Numeros-Parte1-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte1-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/19/2021 01:17:59'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero.! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 15:15:53'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:09:55'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:04'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/19/2021 01:33:39'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:10:25'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

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

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:12:46'!
test10AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/19/2021 01:48:05'!
test11MultiplyingFraccionesCanReturnAnEntero

	self assert: (twoFifth) * (fiveHalfs) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:21'!
test12AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:13:30'!
test13AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/8/2019 21:14:16'!
test14NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:04'!
test15NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: (Fraccion with: negativeOne over: two)! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:11'!
test16SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (Fraccion with: negativeOne over: negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'RV 10/20/2021 22:33:21'!
test17SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (Fraccion with: one over: negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'RV 10/20/2021 22:31:18'!
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
	
	oneHalf := Fraccion with: one over: two.
	oneFifth := Fraccion with: one over: five.
	twoFifth := Fraccion with: two over: five.
	twoTwentyfifth := Fraccion with: two over: (Entero with: 25).
	fiveHalfs := Fraccion with: five over: two.
	! !
