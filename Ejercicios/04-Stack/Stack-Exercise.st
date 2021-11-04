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

!OOStackTest methodsFor: 'test' stamp: 'RV 11/4/2021 14:37:54'!
test11CanNotPushMoreThanTheLimitOfElementsOnALimitedStack
	| limitedStack |
	limitedStack _ OOStackLimited createLimitedBy: 1.
	limitedStack push: 'first'.
	self
		should: [ limitedStack push: 'second' ]
		raise: Error
		withExceptionDo: [ :arg2 |
			self assert: arg2 messageText = OOStackLimited sendLimitReachedMessage ].! !

!OOStackTest methodsFor: 'test' stamp: 'RV 11/4/2021 14:38:09'!
test12AfterPopingStackLimitBehavesTheSame
	| limitedStack |
	limitedStack _ OOStackLimited createLimitedBy: 2.
	limitedStack push: 'first'.
	limitedStack push: 'second'.
	limitedStack pop.
	limitedStack push: 'second'.
	self
		should: [ limitedStack push: 'third' ]
		raise: Error
		withExceptionDo: [ :arg2 |
			self assert: arg2 messageText = OOStackLimited sendLimitReachedMessage ].! !

!OOStackTest methodsFor: 'test' stamp: 'RV 11/4/2021 14:16:14'!
test13CanNotCreateAStackLimitedByCero
	self
		should: [ OOStackLimited createLimitedBy: 0 ]
		raise: Error
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = OOStackLimited sendinvalidSizeOfStackMessage ].! !

!OOStackTest methodsFor: 'test' stamp: 'RV 11/4/2021 14:16:35'!
test14CanNotCreateStackLimitedWithANegativeNumber
	self
		should: [ OOStackLimited createLimitedBy: -1 ]
		raise: Error
		withExceptionDo: [ :arg1 |
			self assert: arg1 messageText = OOStackLimited sendinvalidSizeOfStackMessage ].! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


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

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 13:11:51'!
pop 
	| dataToBePopped |
	dataToBePopped := stateOfStack allowsAPopOn: self.
	
	self verifyIsStackEmptyAfterPoping.

	^dataToBePopped! !

!OOStack methodsFor: 'public' stamp: 'RV 11/4/2021 12:56:36'!
push: aString 
	content add: aString.
	stateOfStack := StackStateWithData new! !

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

!OOStackLimited methodsFor: 'public' stamp: 'RV 11/4/2021 14:36:00'!
pop
	stateOfStack := StackStateWithData new.
	^ super pop.
! !

!OOStackLimited methodsFor: 'public' stamp: 'RV 11/4/2021 14:19:23'!
push: aDataToBePushed
	stateOfStack allowsToPush: aDataToBePushed On: self.
	self verifyIsStackIsFullAfterPushing.! !


!OOStackLimited methodsFor: 'private' stamp: 'RV 11/4/2021 14:12:38'!
initializeWith: maxSizeOfStack
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


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


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
