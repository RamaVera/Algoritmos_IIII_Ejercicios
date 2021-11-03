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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'TestWithEmptyStack' stamp: 'RV 11/2/2021 20:45:16'!
test01CannotFindASentenceWithEmptyStack

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestWithOnlyOneElementInStack' stamp: 'RV 11/2/2021 20:37:13'!
test02CannotFindASentenceWithDifferentPrefix

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	stack push: 'Winter is coming'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection isEmpty.
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'TestWithOnlyOneElementInStack' stamp: 'RV 11/2/2021 20:36:44'!
test03FindASingleSentenceWithTheSamePrefix

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: 'winter is coming' equals: (findedSentenceCollection at:1). 
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestWithTwoOrMoreElementsInStack' stamp: 'RV 11/2/2021 20:37:24'!
test04FindTwoSentencesWithTheSamePrefix

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	stack push: 'winter is coming'.
	stack push: 'winning eleven'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: 'winning eleven' equals: (findedSentenceCollection at:1). 
	self assert: 'winter is coming'  equals: (findedSentenceCollection at:2). 
	
	
	! !

!SentenceFinderByPrefixTest methodsFor: 'TestWithTwoOrMoreElementsInStack' stamp: 'RV 11/2/2021 21:28:58'!
test05FindOneSentenceWithTheSamePrefixOnAStackWithMultipleDataStoraged

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	stack push: 'not today'.
	stack push: 'winning eleven'.
	stack push: 'valar morghulis'.
	stack push: 'Winter is coming'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: 'winning eleven' equals: (findedSentenceCollection at:1). 
	self assert: findedSentenceCollection size = 1
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestBadPrefix' stamp: 'RV 11/2/2021 21:31:47'!
test06TryToSearchWithASpacePrefix

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'valar mor'.
	
	stack := OOStack new.
	stack push: 'not today'.
	stack push: 'winning eleven'.
	stack push: 'valar morghulis'.
	stack push: 'Winter is coming'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: findedSentenceCollection isEmpty.

	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'TestStackOrder' stamp: 'RV 11/2/2021 21:01:20'!
test06xxx

	| stack prefix findedSentenceCollection sentenceFinder |
	prefix := 'win'.
	
	stack := OOStack new.
	stack push: 'not today'.
	stack push: 'winning eleven'.
	stack push: 'valar morghulis'.
	stack push: 'Winter is coming'.
	
	sentenceFinder := SentenceFinderByPrefix newWith: stack.
	findedSentenceCollection := sentenceFinder find: prefix.
	
	self assert: 'Winter is coming' equals: stack pop.
	self assert:  'valar morghulis' equals: stack pop.
	self assert: 'winning eleven' equals: stack pop.
	self assert: 'not today' equals: stack pop.
	
	
	! !


!classDefinition: #HanoiTowerElement category: 'Stack-Exercise'!
Object subclass: #HanoiTowerElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #HanoiTowerBase category: 'Stack-Exercise'!
HanoiTowerElement subclass: #HanoiTowerBase
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!HanoiTowerBase methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:27'!
data
	^ self error: OOStack stackEmptyErrorDescription! !

!HanoiTowerBase methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:33'!
isEmpty
	^ true! !


!classDefinition: #HanoiTowerDataRing category: 'Stack-Exercise'!
HanoiTowerElement subclass: #HanoiTowerDataRing
	instanceVariableNames: 'storedData imOverTo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!HanoiTowerDataRing methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:15'!
data
	^ storedData ! !

!HanoiTowerDataRing methodsFor: 'public' stamp: 'RV 11/1/2021 21:33:20'!
isEmpty
	^ false! !

!HanoiTowerDataRing methodsFor: 'public' stamp: 'RV 11/1/2021 23:44:13'!
putOverTo: aHanoiDataRingToBePuttedBelow
	imOverTo := aHanoiDataRingToBePuttedBelow.
	! !

!HanoiTowerDataRing methodsFor: 'public' stamp: 'RV 11/1/2021 21:11:58'!
whoIsBelowMe
	^ imOverTo 
		! !


!HanoiTowerDataRing methodsFor: 'private' stamp: 'RV 11/2/2021 01:11:15'!
insert: aDataToBeStoredInTheDataRing
	storedData := aDataToBeStoredInTheDataRing! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'HanoiTowerDataRing class' category: 'Stack-Exercise'!
HanoiTowerDataRing class
	instanceVariableNames: ''!

!HanoiTowerDataRing class methodsFor: 'as yet unclassified' stamp: 'RV 11/2/2021 00:03:00'!
newWith: dataInsideTheBox
	^self new insert: dataInsideTheBox! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topHanoiElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'public' stamp: 'RV 11/2/2021 01:25:45'!
isEmpty
	^topHanoiElement isEmpty.! !

!OOStack methodsFor: 'public' stamp: 'RV 11/2/2021 01:21:26'!
pop
	| dataToPop|	
	
	dataToPop := self top.
	self removeTopDataRing.
	^dataToPop! !

!OOStack methodsFor: 'public' stamp: 'RV 11/2/2021 01:15:55'!
push: dataToStackInTheTop
	self stackNewDataRing: (HanoiTowerDataRing newWith: dataToStackInTheTop).
	! !

!OOStack methodsFor: 'public' stamp: 'RV 11/1/2021 20:53:54'!
size
	^size! !

!OOStack methodsFor: 'public' stamp: 'RV 11/2/2021 01:25:45'!
top
	^topHanoiElement data! !


!OOStack methodsFor: 'private' stamp: 'RV 11/2/2021 01:25:45'!
initialize
	topHanoiElement := HanoiTowerBase new.
	size := 0.! !

!OOStack methodsFor: 'private' stamp: 'RV 11/2/2021 01:25:45'!
removeTopDataRing
	topHanoiElement  := topHanoiElement whoIsBelowMe.
	size := size - 1.! !

!OOStack methodsFor: 'private' stamp: 'RV 11/2/2021 01:25:45'!
stackNewDataRing: newDataRing
	newDataRing putOverTo: topHanoiElement.
	topHanoiElement := newDataRing.	
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

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'RV 11/2/2021 21:34:07'!
find: prefix

	| sentenceToAnalize sentencesWithSamePrefix temporalStack|
	(self validatePrefix: prefix) ifFalse:[
		^OrderedCollection new
		].
	temporalStack := OOStack new.
	sentencesWithSamePrefix := OrderedCollection new.
	
	[sentencesToBeSearched isEmpty ] whileFalse: [
		sentenceToAnalize := sentencesToBeSearched pop.
		prefix = (sentenceToAnalize copyFrom: 1 to: (prefix size)) ifTrue: [
					sentencesWithSamePrefix			add: sentenceToAnalize.
				].
		temporalStack push: sentenceToAnalize.
		].
	
	[ temporalStack isEmpty ] whileFalse: [
		 sentencesToBeSearched push: (temporalStack pop)
		] .
	
	^sentencesWithSamePrefix
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'RV 11/2/2021 21:39:08'!
validatePrefix: aPrefix
	aPrefix indexOf: $  ifAbsent: [^true].
	^ false! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'RV 11/2/2021 20:55:48'!
initializeAndAttach: anOOStack 
	sentencesToBeSearched := anOOStack .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'casing' stamp: 'RV 11/2/2021 20:55:48'!
newWith: anOOStack 
	^ self new initializeAndAttach: anOOStack! !
