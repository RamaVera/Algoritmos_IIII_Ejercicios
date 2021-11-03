!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack oneElementStack variousElementsStack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'TestWithEmptyStack' stamp: 'AMV 11/3/2021 01:35:23'!
test01CannotFindASentenceWithEmptyStack

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: emptyStack .
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestWithOnlyOneElementInStack' stamp: 'AMV 11/3/2021 01:36:06'!
test02CannotFindASentenceWithDifferentPrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'Win'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: oneElementStack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'TestWithOnlyOneElementInStack' stamp: 'AMV 11/3/2021 01:37:11'!
test03FindASingleSentenceWithTheSamePrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.	
	
	sentenceFinder := SentenceFinderByPrefix newWith: oneElementStack .
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection includes: 'winter is coming'.  
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestWithTwoOrMoreElementsInStack' stamp: 'AMV 11/3/2021 01:37:28'!
test04FindTwoSentencesWithTheSamePrefix

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.	
	
	sentenceFinder := SentenceFinderByPrefix newWith: variousElementsStack .
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection includes: 'winter is coming'.  
	self assert: findedSentenceCollection includes: 'winning eleven'.  
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'TestWithTwoOrMoreElementsInStack' stamp: 'AMV 11/3/2021 01:38:45'!
test05FindOneSentenceWithTheSamePrefixOnAStackWithMultipleDataStoraged

	| prefix findedSentenceCollection sentenceFinder |
	prefix := 'winn'.	
	
	sentenceFinder := SentenceFinderByPrefix newWith: variousElementsStack .
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection includes: 'winning eleven'.  
	self assert: findedSentenceCollection size = 1
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestBadPrefix' stamp: 'AMV 11/3/2021 01:39:04'!
test06TryToSearchWithASpacePrefix

	| prefix sentenceFinder |
	prefix := 'valar mor'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: variousElementsStack .
	
	self
		should: [ sentenceFinder find: prefix ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sendInvalidPrefixErrorMessage ]

	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'TestBadPrefix' stamp: 'AMV 11/3/2021 01:39:43'!
test07TryToSearchWithAEmptyPrefix

	| prefix sentenceFinder |
	prefix := ''.
		
	sentenceFinder := SentenceFinderByPrefix newWith: variousElementsStack .
	
	self
		should: [ sentenceFinder find: prefix ]
		raise: Error
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix sendInvalidPrefixErrorMessage ]

	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestStackOrder' stamp: 'AMV 11/3/2021 01:35:03'!
setUp
	emptyStack := OOStack new.
	
	oneElementStack := OOStack new.
	oneElementStack push: 'winter is coming'.
	
	variousElementsStack := OOStack new.
	variousElementsStack push: 'winter is coming'.
	variousElementsStack push: 'winning eleven'.
	variousElementsStack push: 'inventaron el var'.
	variousElementsStack push: 'Winter is coming'.! !

!SentenceFinderByPrefixTest methodsFor: 'TestStackOrder' stamp: 'AMV 11/3/2021 01:42:12'!
test08CheckStackWontModifyItsOrderBySearch

	| prefix sentenceFinder |
	prefix := 'win'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: variousElementsStack .
	sentenceFinder find: prefix.
	
	self assert: 'Winter is coming' equals: variousElementsStack pop.
	self assert:  'inventaron el var' equals: variousElementsStack pop.
	self assert: 'winning eleven' equals: variousElementsStack pop.
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

!OOStack methodsFor: 'public' stamp: 'AMV 11/3/2021 01:24:27'!
push: dataToStackInTheTop
	self stackNewNode: (TopNode newWith: dataToStackInTheTop).
	! !

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


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesToBeSearched'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'AMV 11/3/2021 01:20:10'!
find: prefix
	
	| allSentences |
	self validatePrefix: prefix.
	allSentences := self saveAllElemetsWithoutModifyingTheStack.
	^allSentences select: [:s | s beginsWith: prefix ].! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/3/2021 00:08:03'!
initializeAndAttach: anOOStack 
	sentencesToBeSearched := anOOStack.
! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/3/2021 01:18:17'!
saveAllElemetsWithoutModifyingTheStack
	
	| allSentences temporalStack |
	temporalStack := OOStack new.
	allSentences := OrderedCollection new.
	
	[sentencesToBeSearched isEmpty ] whileFalse: [
		temporalStack push: sentencesToBeSearched pop.
		allSentences add: temporalStack top.
		].
		
	[ temporalStack isEmpty ] whileFalse: [
		 sentencesToBeSearched push: (temporalStack pop)
		].
	
	^allSentences
	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'AMV 11/3/2021 01:09:07'!
validatePrefix: aPrefix
	((aPrefix includesSubString: ' ') or: 	(aPrefix isEmpty)) ifTrue: [^self error: self class sendInvalidPrefixErrorMessage] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'casing' stamp: 'RV 11/2/2021 20:55:48'!
newWith: anOOStack 
	^ self new initializeAndAttach: anOOStack! !


!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'AMV 11/3/2021 01:06:00'!
sendInvalidPrefixErrorMessage
	^'Invalid Prefix'! !
