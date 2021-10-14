!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AMV 10/14/2021 12:16:04'!
addCustomerNamed: aName

	aName isEmpty 
		ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) 
		ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'AMV 10/14/2021 12:01:26'!
removeCustomerNamed: aName 
	^ active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent:[
			^NotFound signal]].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AMV 10/14/2021 12:18:12'!
suspendCustomerNamed: aName 
	
	(active includes: aName) 
		ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'AMV 10/12/2021 22:30:38'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !


!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBookInstance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'test - private' stamp: 'AMV 10/14/2021 12:00:03'!
assertExecutionTimeOf: aBlock isLessThan: maxTimeToExecuteInMilliseconds
	| millisecondItTookToEvaluate |
	
	millisecondItTookToEvaluate := Time millisecondsToRun: aBlock.
	
	self assert: millisecondItTookToEvaluate < (maxTimeToExecuteInMilliseconds)! !

!CustomerBookTest methodsFor: 'test - private' stamp: 'AMV 10/14/2021 12:00:10'!
assertThatActiveCustomersNumberIs: ActiveCustomersNumber AndSuspendedCustomersNumberIs: SuspendedCustomersNumber in: CustomerBook
	
	| totalNumberOfCustomers |
	
	totalNumberOfCustomers := ActiveCustomersNumber + SuspendedCustomersNumber. 

	self assert: ActiveCustomersNumber equals: CustomerBook numberOfActiveCustomers.
	self assert: SuspendedCustomersNumber equals: CustomerBook numberOfSuspendedCustomers.
	self assert: totalNumberOfCustomers equals: CustomerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'test - private' stamp: 'AMV 10/14/2021 10:33:51'!
assertThatNumberOfTotalCustomersIs: aNumber andItIncludesCustomerNamed: customerName in: customerBook
	self assert: customerBook numberOfCustomers equals: aNumber .
	self assert: (customerBook includesCustomerNamed: customerName).! !

!CustomerBookTest methodsFor: 'test - private' stamp: 'AMV 10/14/2021 12:00:14'!
assertThatThereAreNoCustomersIn: CustomerBook  
	self assertThatActiveCustomersNumberIs: 0 AndSuspendedCustomersNumberIs: 0 in: CustomerBook.! !

!CustomerBookTest methodsFor: 'test - private' stamp: 'AMV 10/14/2021 11:47:06'!
setUp
	customerBookInstance := CustomerBook new
! !


!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:02:03'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	self assertExecutionTimeOf: [ customerBookInstance addCustomerNamed: 'John Lennon'] isLessThan: 50*millisecond.
	! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:05:41'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	
	customerBookInstance addCustomerNamed: paulMcCartney.
	  
	self assertExecutionTimeOf:  [ customerBookInstance removeCustomerNamed: paulMcCartney] isLessThan: 100 * millisecond.

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:02:47'!
test03CanNotAddACustomerWithEmptyName 

	self should: [customerBookInstance addCustomerNamed: ''.] raise: Error withExceptionDo: [:anError|
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBookInstance isEmpty].! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:02:53'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon |
			

	johnLennon := 'John Lennon'.
	customerBookInstance addCustomerNamed: johnLennon.
	
	self should: [customerBookInstance removeCustomerNamed: 'Paul McCartney'.] raise: NotFound withExceptionDo: [:anError | 
		self assertThatNumberOfTotalCustomersIs: 1 andItIncludesCustomerNamed: johnLennon in: customerBookInstance ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:03:13'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	|paulMcCartney|
	

	paulMcCartney := 'Paul McCartney'.
	
	customerBookInstance addCustomerNamed: paulMcCartney.
	customerBookInstance suspendCustomerNamed: paulMcCartney.
	
	self assertThatActiveCustomersNumberIs: 0 AndSuspendedCustomersNumberIs: 1 in: 	customerBookInstance .	
	self assert: (customerBookInstance includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:03:40'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| paulMcCartney|
	

	paulMcCartney := 'Paul McCartney'.
	
	customerBookInstance addCustomerNamed: paulMcCartney.
	customerBookInstance suspendCustomerNamed: paulMcCartney.
	customerBookInstance removeCustomerNamed: paulMcCartney.
	
	self assertThatThereAreNoCustomersIn: customerBookInstance .
	self deny: (customerBookInstance includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:04:08'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon |
			
	customerBookInstance := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBookInstance addCustomerNamed: johnLennon.
	
	self should: [customerBookInstance suspendCustomerNamed: 'Ringo Starr'.] raise: CantSuspend withExceptionDo: [:anError | 
		self assertThatNumberOfTotalCustomersIs: 1 andItIncludesCustomerNamed: johnLennon in: customerBookInstance ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AMV 10/14/2021 12:04:37'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon |

	johnLennon := 'John Lennon'.
	customerBookInstance addCustomerNamed: johnLennon.
	customerBookInstance suspendCustomerNamed: johnLennon.

	self should: [customerBookInstance suspendCustomerNamed: johnLennon.] raise: CantSuspend withExceptionDo: [:anError |
		self assertThatNumberOfTotalCustomersIs: 1 andItIncludesCustomerNamed: johnLennon in: customerBookInstance ]
! !
