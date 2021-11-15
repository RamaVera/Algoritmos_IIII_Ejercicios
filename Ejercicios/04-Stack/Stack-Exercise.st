!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:07:58'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStackUnlimited new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:10'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:20'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:30'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:46'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStackUnlimited new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:50'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:53'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStackUnlimited new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:08:56'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackUnlimited new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:09:01'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStackUnlimited new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:09:04'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStackUnlimited new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 12:22:08'!
test11CanNotPushMoreThanTheLimitOfElementsOnALimitedStack
	| stack  |
	
	stack := OOStackLimited createLimitedBy: 1.
	stack push: 'first'.
	
	self 
		should: [ stack push: 'second' ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited sendLimitReachedMessage]
		! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 15:06:30'!
test12AfterEmptyingStackLimitBehavesTheSame
	| stack  |
	
	stack := OOStackLimited createLimitedBy: 2.
	stack push: 'first'.
	stack push: 'second'.
	stack pop.	
	stack pop.
	stack push: 'first'.
	stack push: 'second'.
	self 
		should: [stack push: 'third']
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited sendLimitReachedMessage]
		! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 15:06:44'!
test13AfterPopingStackLimitBehavesTheSame
	| stack  |
	
	stack := OOStackLimited createLimitedBy: 2.
	stack push: 'first'.
	stack push: 'second'.
	stack pop.
	stack push: 'second'.
	self 
		should: [stack push: 'third']
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited sendLimitReachedMessage]
		! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 15:06:51'!
test14CanNotCreateAStackLimitedByCero
	self 
		should: [ OOStackLimited createLimitedBy: 0]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited sendinvalidSizeOfStackMessage ]
		! !

!OOStackTest methodsFor: 'test' stamp: 'AMV 11/4/2021 15:07:00'!
test15CanNotCreateStackLimitedWithANegativeNumber
	self 
		should: [ OOStackLimited createLimitedBy: -1]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited sendinvalidSizeOfStackMessage ]
		! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack oneElementStack variousElementsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'AMV 11/4/2021 12:10:08'!
setUp
	emptyStack := OOStackUnlimited new.
	
	oneElementStack := OOStackUnlimited new.
	oneElementStack push: 'winter is coming'.
	
	variousElementsStack := OOStackUnlimited new.
	variousElementsStack push: 'winter is coming'.
	variousElementsStack push: 'valar morgulis'.
	variousElementsStack push: 'winning eleven'.
	variousElementsStack push: 'inventaron el var'.
	variousElementsStack push: 'Winter is coming'.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test01CannotFindASentenceWithEmptyStack

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	findedSentenceCollection := sentenceFinder find: prefix on: emptyStack .
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test02CannotFindASentenceWithDifferentPrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'Win'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	findedSentenceCollection := sentenceFinder find: prefix on: oneElementStack.
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test03FindASingleSentenceWithTheSamePrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.	
	
	sentenceFinder := SentenceFinderByPrefix new.
	findedSentenceCollection := sentenceFinder find: prefix on: oneElementStack.
	
	self assert: findedSentenceCollection includes: 'winter is coming'.  
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test04FindTwoSentencesWithTheSamePrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.	
	
	sentenceFinder := SentenceFinderByPrefix new.
	findedSentenceCollection := sentenceFinder find: prefix on: variousElementsStack.
	
	self assert: findedSentenceCollection includes: 'winter is coming'.  
	self assert: findedSentenceCollection includes: 'winning eleven'.  
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test05FindOneSentenceWithTheSamePrefixOnAStackWithMultipleDataStoraged

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'winn'.	
	
	sentenceFinder := SentenceFinderByPrefix new.
	findedSentenceCollection := sentenceFinder find: prefix on: variousElementsStack.
	
	self assert: findedSentenceCollection includes: 'winning eleven'.  
	self assert: findedSentenceCollection size = 1
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test06TryToSearchWithASpacePrefix

	| prefix sentenceFinder |
	prefix := 'valar mor'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ sentenceFinder find: prefix on: variousElementsStack]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sendInvalidPrefixErrorMessage ]

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test07TryToSearchWithAEmptyPrefix

	| prefix sentenceFinder |
	prefix := ''.
		
	sentenceFinder := SentenceFinderByPrefix new.
	
	self
		should: [ sentenceFinder find: prefix on: variousElementsStack ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sendInvalidPrefixErrorMessage ]

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'RV 11/3/2021 21:49:01'!
test08CheckStackWontModifyItsOrderBySearch

	| prefix sentenceFinder |
	prefix := 'win'.
	
	sentenceFinder := SentenceFinderByPrefix new.
	sentenceFinder find: prefix on: variousElementsStack.
	
	self assert: 'Winter is coming' equals: variousElementsStack pop.
	self assert:  'inventaron el var' equals: variousElementsStack pop.
	self assert: 'winning eleven' equals: variousElementsStack pop.
	self assert: 'valar morgulis' equals: variousElementsStack pop.
	self assert: 'winter is coming' equals: variousElementsStack pop.
	
	"volvemos a pushear los elementos para poder seguir generando futuros tests"
	variousElementsStack push: 'winter is coming'.
	variousElementsStack push: 'winning eleven'.
	variousElementsStack push: 'inventaron el var'.
	variousElementsStack push: 'Winter is coming'.
	
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content stateOfStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialize' stamp: 'RV 11/4/2021 13:05:05'!
initialize
	content := OrderedCollection new.
	stateOfStack := EmptyStackState new.! !


!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 01:20:24'!
isEmpty
	^content isEmpty.! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 18:12:25'!
isFull
	self subclassResponsibility .! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 15:41:55'!
pop 
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 15:42:07'!
push: aString 
	self subclassResponsibility.! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 01:30:18'!
size
	^content size.! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 13:02:20'!
top
	^ stateOfStack allowsATopOn: self.! !


!OOStack methodsFor: 'private' stamp: 'RV 11/4/2021 13:06:20'!
popWithElements
	^content removeLast. 
		! !

!OOStack methodsFor: 'private' stamp: 'RV 11/4/2021 12:52:20'!
popWithNoElements
	^self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'RV 11/4/2021 12:54:31'!
topWithElements
	^content last.! !

!OOStack methodsFor: 'private' stamp: 'RV 11/4/2021 12:55:17'!
topWithNoElements.
	^self error: self class stackEmptyErrorDescription.
	! !

!OOStack methodsFor: 'private' stamp: 'RV 11/4/2021 13:12:16'!
verifyIsStackEmptyAfterPoping
	^ self isEmpty ifTrue:[ 	stateOfStack := EmptyStackState new.	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: 'maxElementsAllowed'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'public' stamp: 'RV 11/4/2021 14:36:06'!
isFull
	^ content size = maxElementsAllowed ! !

!OOStackLimited methodsFor: 'public' stamp: 'RV 11/4/2021 18:15:17'!
pop
	| dataToBePopped |
	
	dataToBePopped := stateOfStack allowsAPopOn: self.
	
	stateOfStack := StackState toWhichItCorresponds: self.

	^dataToBePopped! !

!OOStackLimited methodsFor: 'public' stamp: 'RV 11/4/2021 18:15:36'!
push: aDataToBePushed
	stateOfStack allowsToPush: aDataToBePushed On: self.
	stateOfStack := StackState toWhichItCorresponds: self.! !


!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 15:44:18'!
initializeWith: maxSizeOfStack
	super initialize.
	maxElementsAllowed := maxSizeOfStack ! !

!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 14:33:50'!
pushWithMaxElements: aDataToBePushed
	^self error: self class sendLimitReachedMessage .! !

!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 13:55:52'!
pushWithSpaceOnStack: aDataToBePushed
	content add: aDataToBePushed
	! !

!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 13:56:56'!
verifyIsStackIsFullAfterPushing
	^ self isFull ifTrue:[ 	stateOfStack := FullStackState new.	]! !

!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 15:47:40'!
verifyIsStackIsWithDataAfterPopingAFullStack
	^ self isFull ifFalse:[ 	stateOfStack := StackStateWithData new.	]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'RV 11/4/2021 14:21:08'!
sendLimitReachedMessage
	^ 'Stack limit reached'.! !

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'RV 11/4/2021 14:10:33'!
sendinvalidSizeOfStackMessage
	^ 'Invalid size of stack'.! !

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'RV 11/4/2021 13:55:52'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!OOStackLimited class methodsFor: 'initialize' stamp: 'RV 11/4/2021 14:10:23'!
createLimitedBy: maxSizeOfStack
	maxSizeOfStack<= 0 ifTrue: [ ^ self error: self sendinvalidSizeOfStackMessage ].
	^ OOStackLimited new initializeWith: maxSizeOfStack.! !


!classDefinition: #OOStackUnlimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackUnlimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimited methodsFor: 'public' stamp: 'RV 11/4/2021 18:12:04'!
isFull
	^false! !

!OOStackUnlimited methodsFor: 'public' stamp: 'RV 11/4/2021 18:14:02'!
pop 
	| dataToBePopped |
	dataToBePopped := stateOfStack allowsAPopOn: self.
	stateOfStack := StackState toWhichItCorresponds: self.

	^dataToBePopped! !

!OOStackUnlimited methodsFor: 'public' stamp: 'RV 11/4/2021 15:40:44'!
push: aString 
	content add: aString.
	stateOfStack := StackStateWithData new! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackUnlimited class' category: 'Stack-Exercise'!
OOStackUnlimited class
	instanceVariableNames: ''!

!OOStackUnlimited class methodsFor: 'error descriptions' stamp: 'RV 11/4/2021 15:40:45'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'finder' stamp: 'AMV 11/4/2021 12:33:03'!
find: aPrefix on: aStackWithSenteces 
	
	| allSentences |
	self validatePrefix: aPrefix.
	allSentences := self saveAllElementsWithoutModifying: aStackWithSenteces.
	^self selectSentencesFrom: allSentences withThePrefix: aPrefix.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/4/2021 12:39:23'!
isASpaceCharacterIn: aPrefix

	^ aPrefix includesSubString: ' '! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RV 11/3/2021 22:26:02'!
moveElementsFrom: anStackSender to: anStackReciever
	self moveElementsFrom: anStackSender to: anStackReciever andDo:[: elementFromStack | ].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/4/2021 12:35:01'!
moveElementsFrom: anStackSender to: anStackReciever andDo: anActionToDoDuringTheTransfer 
	|temporalData |
	
	[anStackSender isEmpty ] whileFalse: [
		temporalData := anStackSender pop.
		
		anActionToDoDuringTheTransfer value: temporalData.		
		
		anStackReciever push: temporalData.
	].! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/4/2021 12:09:37'!
saveAllElementsWithoutModifying: aStack
	
	| allSentences temporalStack |
	temporalStack := OOStackUnlimited new.
	allSentences := OrderedCollection new.
	
	self moveElementsFrom: aStack to: temporalStack andDo:[: elementFromStack | allSentences add: elementFromStack].
	self moveElementsFrom: temporalStack to: aStack.
	
	^allSentences
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/4/2021 12:30:36'!
selectSentencesFrom: allSentences withThePrefix: aPrefix

	^ allSentences select: [:singleSentence | singleSentence beginsWith: aPrefix ]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/4/2021 12:39:23'!
validatePrefix: aPrefix
	((self isASpaceCharacterIn: aPrefix) or: 	aPrefix isEmpty ) ifTrue: [^self error: self class sendInvalidPrefixErrorMessage] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AMV 11/3/2021 01:06:00'!
sendInvalidPrefixErrorMessage
	^'Invalid Prefix'! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:16:45'!
allowsAPopOn: anOOstack
	self subclassResponsibility.! !

!StackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:16:56'!
allowsATopOn: anOOstack
	self subclassResponsibility.! !

!StackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:47:50'!
allowsToPush: aDataToBePushed On: anOOstack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 18:13:11'!
toWhichItCorresponds: anOOStack 
	| allSubclassesOfAnState classToBeIntanciated |
	allSubclassesOfAnState := self subclasses .	
	classToBeIntanciated := allSubclassesOfAnState detect: [:eachClass |
		eachClass correspondsTo: anOOStack
		 ].
	
	^ classToBeIntanciated new
	
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


!classDefinition: #EmptyStackState category: 'Stack-Exercise'!
StackState subclass: #EmptyStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:01:24'!
allowsAPopOn: anEmptyOOStack
	^anEmptyOOStack popWithNoElements.
 	! !

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:02:29'!
allowsATopOn: anEmptyOOStack
	^ anEmptyOOStack topWithNoElements.
 	! !

!EmptyStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:52:13'!
allowsToPush: aDataToBePushed On: anEmptyOOstack
	anEmptyOOstack pushWithSpaceOnStack: aDataToBePushed.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EmptyStackState class' category: 'Stack-Exercise'!
EmptyStackState class
	instanceVariableNames: ''!

!EmptyStackState class methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 17:58:27'!
correspondsTo: anOOStack
	^ anOOStack isEmpty.! !


!classDefinition: #FullStackState category: 'Stack-Exercise'!
StackState subclass: #FullStackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FullStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:43:20'!
allowsAPopOn: aFullOOStack
	^aFullOOStack popWithElements.
 	! !

!FullStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:34:11'!
allowsATopOn: anFullOOStack
	^ anFullOOStack topWithElements .
 	! !

!FullStackState methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:48:59'!
allowsToPush: aDataToBePushed On: anFullOOstack
	^ anFullOOstack pushWithMaxElements: aDataToBePushed.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FullStackState class' category: 'Stack-Exercise'!
FullStackState class
	instanceVariableNames: ''!

!FullStackState class methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 18:05:29'!
correspondsTo: anOOStack
	^ anOOStack isFull.! !


!classDefinition: #StackStateWithData category: 'Stack-Exercise'!
StackState subclass: #StackStateWithData
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStateWithData methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:00:04'!
allowsAPopOn: anOOstackWithElements
	^anOOstackWithElements popWithElements.
 ! !

!StackStateWithData methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:02:37'!
allowsATopOn: anOOstackWithElements
	^ anOOstackWithElements topWithElements.
 ! !

!StackStateWithData methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 13:52:07'!
allowsToPush: aDataToBePushed On: anOOstackWithElements
	anOOstackWithElements pushWithSpaceOnStack: aDataToBePushed! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStateWithData class' category: 'Stack-Exercise'!
StackStateWithData class
	instanceVariableNames: ''!

!StackStateWithData class methodsFor: 'as yet unclassified' stamp: 'RV 11/4/2021 17:59:01'!
correspondsTo: anOOStack
	^ anOOStack isEmpty not.! !
