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


!classDefinition: #HanoiTowerBase category: 'Stack-Exercise'!
Object subclass: #HanoiTowerBase
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
Object subclass: #HanoiTowerDataRing
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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
