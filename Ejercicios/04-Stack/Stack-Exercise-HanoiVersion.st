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


!classDefinition: #Nodes category: 'Stack-Exercise'!
Object subclass: #Nodes
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #BaseNode category: 'Stack-Exercise'!
Nodes subclass: #BaseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseNode methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:27'!
data
	^ self error: OOStack stackEmptyErrorDescription! !

!BaseNode methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:33'!
isEmpty
	^ true! !


!classDefinition: #TopNode category: 'Stack-Exercise'!
Nodes subclass: #TopNode
	instanceVariableNames: 'storedData imOverTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!TopNode methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:15'!
data
	^ storedData ! !

!TopNode methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:20'!
isEmpty
	^ false! !

!TopNode methodsFor: 'public' stamp: 'AMV 11/3/2021 01:28:36'!
putOverTo: aNodeToBePuttedBelow
	imOverTo := aNodeToBePuttedBelow.
	! !

!TopNode methodsFor: 'public' stamp: 'RV 11/1/2021 21:11:58'!
whoIsBelowMe
	^ imOverTo 
		! !


!TopNode methodsFor: 'private' stamp: 'AMV 11/3/2021 01:28:15'!
insert: aDataToBeStoredInNode
	storedData := aDataToBeStoredInNode! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TopNode class' category: 'Stack-Exercise'!
TopNode class
	instanceVariableNames: ''!

!TopNode class methodsFor: 'as yet unclassified' stamp: 'RV 11/2/2021 00:03:00'!
newWith: dataInsideTheBox
	^self new insert: dataInsideTheBox! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stackTop size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'AMV 11/3/2021 01:24:57'!
isEmpty
	^stackTop isEmpty.! !

!OOStack methodsFor: 'public' stamp: 'AMV 11/3/2021 01:24:10'!
pop
	| dataToPop|	
	
	dataToPop := self top.
	self removeTopNode.
	^dataToPop! !

!OOStack methodsFor: 'public' stamp: 'AMV 11/4/2021 10:45:07'!
push: dataToStackInTheTop
	self subclassResponsibility ! !

!OOStack methodsFor: 'public' stamp: 'RV 11/1/2021 20:53:54'!
size
	^size! !

!OOStack methodsFor: 'public' stamp: 'AMV 11/3/2021 01:24:57'!
top
	^stackTop data! !


!OOStack methodsFor: 'private' stamp: 'AMV 11/3/2021 01:24:57'!
initialize
	stackTop := BaseNode new.
	size := 0.! !

!OOStack methodsFor: 'private' stamp: 'AMV 11/3/2021 01:24:57'!
removeTopNode
	stackTop  := stackTop whoIsBelowMe.
	size := size - 1.! !

!OOStack methodsFor: 'private' stamp: 'AMV 11/3/2021 01:27:54'!
stackNewNode: aNode
	aNode putOverTo: stackTop.
	stackTop := aNode.	
	size := size +1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !



!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'private' stamp: 'AMV 11/4/2021 10:23:30'!
initializeWith: maxSizeOfStack
	maxSize := maxSizeOfStack.! !


!OOStackLimited methodsFor: 'public' stamp: 'AMV 11/4/2021 11:09:28'!
push: dataToStackInTheTop
	(size < maxSize ) ifFalse: [^self error: self class sendLimitReachedMessage].
	
	self stackNewNode: (TopNode newWith: dataToStackInTheTop).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'AMV 11/4/2021 11:03:27'!
sendLimitReachedMessage
	^'Stack limit reached'! !

!OOStackLimited class methodsFor: 'error descriptions' stamp: 'AMV 11/4/2021 12:17:45'!
sendinvalidSizeOfStackMessage
	^'Invalid size of stack'! !


!OOStackLimited class methodsFor: 'as yet unclassified' stamp: 'AMV 11/4/2021 12:20:30'!
createLimitedBy: maxSizeOfStack
	(maxSizeOfStack <= 0) ifTrue: [^self error: self sendinvalidSizeOfStackMessage].
	
	^OOStackLimited new initializeWith: maxSizeOfStack.! !


!classDefinition: #OOStackUnlimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackUnlimited
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackUnlimited methodsFor: 'public' stamp: 'AMV 11/4/2021 10:28:01'!
push: dataToStackInTheTop
	self stackNewNode: (TopNode newWith: dataToStackInTheTop).! !


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
