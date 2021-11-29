!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'oneWithdraw aPortfolio anAccountWithADepositof100 aDepositOf100 anAccountWithAWithdrawOf75 aWithdrawOf75 otherPortfolio anAccountWithADepositof25 aDepositOf25'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'setup' stamp: 'RV 11/28/2021 17:02:53'!
setUp
	aPortfolio := 	Portfolio new.
	otherPortfolio := Portfolio new.
	
	anAccountWithADepositof100 := ReceptiveAccount new.
	aDepositOf100 := CashierDeposit register: 100* peso  on: anAccountWithADepositof100. 
	
	anAccountWithAWithdrawOf75 := ReceptiveAccount new.
	aWithdrawOf75 := CashierWithdraw register: 75* peso  on: anAccountWithAWithdrawOf75. 	
	
	anAccountWithADepositof25 := ReceptiveAccount new.
	aDepositOf25 := CashierDeposit register: 25* peso  on: anAccountWithADepositof25. 
	! !


!PortfolioTest methodsFor: 'balance' stamp: 'RV 11/28/2021 16:48:44'!
test01AnEmptyPortfolioHasZeroBalance
	
	self assert: 0 equals: aPortfolio balance ! !

!PortfolioTest methodsFor: 'balance' stamp: 'RV 11/28/2021 16:51:33'!
test02aPortfolioWithOneAccountHasTheSameBalanceOfTheAccount

	aPortfolio add: anAccountWithADepositof100.
	
	self assert: 100* peso equals: aPortfolio balance ! !

!PortfolioTest methodsFor: 'balance' stamp: 'RV 11/28/2021 16:53:35'!
test03aPortfolioWithManyAccountHasTheSameBalanceOfTheTotalOfAccounts

	aPortfolio add: anAccountWithADepositof100.
	aPortfolio add: anAccountWithAWithdrawOf75.
	
	self assert: 25* peso equals: aPortfolio balance ! !

!PortfolioTest methodsFor: 'balance' stamp: 'RV 11/28/2021 16:57:32'!
test04aPortfolioCanHavePortfoliosOrReceptiveAccountsAndCanGetTheTotalBalanceOfThose


	aPortfolio add: anAccountWithADepositof100 .
	aPortfolio add: anAccountWithAWithdrawOf75 .
	otherPortfolio add: anAccountWithADepositof25 .
	
	aPortfolio add: otherPortfolio.
	
	self assert: 50* peso equals: aPortfolio balance ! !


!PortfolioTest methodsFor: 'transactions' stamp: 'RV 11/28/2021 17:04:14'!
test05aPortolioKnowsRegisteredTransactionsOnAddedAccounts 

	| totalTransactions |
	
	totalTransactions := OrderedCollection with: aDepositOf100 with: aWithdrawOf75 with: aDepositOf25.
	
	aPortfolio add: anAccountWithADepositof100.
	aPortfolio add: anAccountWithAWithdrawOf75.
	aPortfolio add: anAccountWithADepositof25.

	self assert: totalTransactions equals: aPortfolio transactions.
	
! !

!PortfolioTest methodsFor: 'transactions' stamp: 'RV 11/28/2021 17:07:19'!
test06aPortolioKnowsRegisteredTransactionsOnAddedPortfoliosAndAccounts 

	| totalTransactions |
	
	totalTransactions := OrderedCollection with: aDepositOf100 with: aWithdrawOf75 with: aDepositOf25.
	
	aPortfolio add: anAccountWithADepositof100.
	aPortfolio add: anAccountWithAWithdrawOf75.
	otherPortfolio add: anAccountWithADepositof25.
	aPortfolio add: otherPortfolio.

	self assert: totalTransactions equals: aPortfolio transactions.
	
! !


!PortfolioTest methodsFor: 'registering' stamp: 'RV 11/28/2021 18:39:10'!
test07aPortfolioCanGotAllAddedTransactionsOfTheirAccounts

	aPortfolio add: anAccountWithADepositof100 .
	aPortfolio add: anAccountWithAWithdrawOf75 .

	self assert: (aPortfolio hasRegistered: aDepositOf100 ).
	self assert: (aPortfolio hasRegistered: aWithdrawOf75 ).
	
! !

!PortfolioTest methodsFor: 'registering' stamp: 'RV 11/28/2021 18:39:10'!
test08aPortfolioCanGotAllAddedTransactionsOfTheirPortfolios

	otherPortfolio 	add: anAccountWithADepositof100 .
	aPortfolio add: otherPortfolio .

	self assert: (aPortfolio hasRegistered: aDepositOf100 ).
	! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount aDepositOf50Pesos anAmountOf100 anAmountOfZero anAmountOf50'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'setup' stamp: 'RV 11/28/2021 22:46:43'!
setUp
	anAccount := ReceptiveAccount new.
	
	anAmountOfZero := 0*peso.
	anAmountOf50  := 50 * peso.
	anAmountOf100 := 100*peso.! !


!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 22:45:25'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 
	self assert: anAmountOfZero equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 22:45:43'!
test02DepositIncreasesBalanceOnTransactionValue 

	CashierDeposit register: anAmountOf100 on: anAccount.
		
	self assert: anAmountOf100 equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 22:48:16'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| amountDifference |
	CashierDeposit register: anAmountOf100 on: anAccount.
	CashierWithdraw register: anAmountOf50 on: anAccount.
	
	amountDifference := anAmountOf100  - anAmountOf50.		
	
	self assert: amountDifference equals: anAccount balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 22:58:17'!
test04WithdrawValueMustBePositive 
	
	| aWithdrawOf50 |
	aWithdrawOf50 := CashierWithdraw register: anAmountOf50 on: anAccount.
	
	self assert: (aWithdrawOf50 wasTheAmountof: anAmountOf50).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 22:59:58'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| aDeposit aWithdraw |
	aDeposit := CashierDeposit register: anAmountOf100 on: anAccount.
	aWithdraw := CashierWithdraw register: anAmountOf50 on: anAccount.
		
	self assert: (anAccount hasRegistered: aDeposit).
	self assert: (anAccount hasRegistered: aWithdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 23:05:02'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	|  aDeposit aWithdraw |
	
	aDeposit :=  CashierDeposit for: anAmountOf100 .
	aWithdraw := CashierWithdraw for: anAmountOf50 .
		
	self deny: (anAccount hasRegistered: aDeposit).
	self deny: (anAccount hasRegistered: aWithdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/28/2021 23:02:47'!
test07AccountKnowsItsTransactions 

	| aDeposit |

	aDeposit := CashierDeposit register: anAmountOf50 on: anAccount.
		
	self assertThatThereisOnlyOneTransactionAndItWas: aDeposit.! !


!ReceptiveAccountTest methodsFor: 'support' stamp: 'RV 11/28/2021 23:03:03'!
assertThatThereisOnlyOneTransactionAndItWas: aDeposit

	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: aDeposit)! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount anAmountToTransfer aNegativeAmountToTransfer anZeroAmountToTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'setup' stamp: 'RV 11/28/2021 22:37:23'!
setUp
	
	anAmountToTransfer := 10*peso.
	aNegativeAmountToTransfer  := -10 *peso.
	anZeroAmountToTransfer := 0 *peso.

	anOriginAccount := ReceptiveAccount new.
	aDestinationAccount := ReceptiveAccount new.
! !


!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:33:56'!
test01TransferChangesBalanceTwoAccounts
	
	Transfer from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer.
	
	self assert: anAmountToTransfer negated equals: anOriginAccount balance.
	self assert: anAmountToTransfer equals: aDestinationAccount balance.
! !

!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:33:56'!
test02ReceptiveAccountsKnowsRegisteredTransferTransaction 
	
	| transfer |
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer .
	
	self assert: (anOriginAccount hasRegistered: transfer transferWithdraw).
	self assert: (aDestinationAccount hasRegistered: transfer transferDeposit).! !

!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:33:56'!
test03TransferKnowsItsValue
	
	| transfer |
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer. 
	
	self assert: anAmountToTransfer equals: transfer transferValue.
! !

!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:33:56'!
test04BothPartsOfTheTransactionKnowsItsCounterpart
	
	| onePartOfTheTransfer otherPartOfTheTransfer transfer |
	transfer := Transfer from: anOriginAccount to: aDestinationAccount for: anAmountToTransfer .
	
	onePartOfTheTransfer := transfer transferDeposit.
	otherPartOfTheTransfer := transfer transferWithdraw.
	
	self assert: onePartOfTheTransfer counterpart equals: otherPartOfTheTransfer.
	self assert: otherPartOfTheTransfer counterpart equals: onePartOfTheTransfer.! !

!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:37:57'!
test05CantTranferNegativesAmount       
	
	self assertErrorMessageOnAnInvalidAmountToTransfer: aNegativeAmountToTransfer
	
	! !

!TransferTest methodsFor: 'test' stamp: 'RV 11/28/2021 22:38:21'!
test06CantTranferZeroAmount       
	
	self assertErrorMessageOnAnInvalidAmountToTransfer: anZeroAmountToTransfer
	! !


!TransferTest methodsFor: 'support' stamp: 'RV 11/28/2021 22:37:57'!
assertErrorMessageOnAnInvalidAmountToTransfer: anInvalidAmount

	^ self should: [
		Transfer from: anOriginAccount to: aDestinationAccount for: anInvalidAmount.
	] raise: Error withExceptionDo:[ :error |
		self assert: Transfer errorAmountMessage equals: error messageText.	
	]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'balance' stamp: 'RV 11/28/2021 18:31:25'!
affectBalance: aSubtotalBalance
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'value asking' stamp: 'RV 11/28/2021 23:07:13'!
wasTheAmountof: anAmountToCompare
	^ value = anAmountToCompare! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue .
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CashierDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #CashierDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!CashierDeposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!CashierDeposit methodsFor: 'account transaction' stamp: 'RV 11/28/2021 23:08:22'!
affectBalance: subtotalBalance
	 ^subtotalBalance + value
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
CashierDeposit class
	instanceVariableNames: ''!

!CashierDeposit class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
for: aValue  

	^ self new initializeFor: aValue ! !


!classDefinition: #CashierWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #CashierWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!CashierWithdraw methodsFor: 'initialization' stamp: 'RV 11/18/2021 21:33:26'!
initializeFor: aValue

	value := aValue ! !


!CashierWithdraw methodsFor: 'account transaction' stamp: 'RV 11/28/2021 23:07:59'!
affectBalance: subtotalBalance
	^ subtotalBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
CashierWithdraw class
	instanceVariableNames: ''!

!CashierWithdraw class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
for: aValue  

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'AMV 11/24/2021 23:05:08'!
initializeFor: aValue from: aTransfer 
	value := aValue.
	transfer := aTransfer.! !


!TransferDeposit methodsFor: 'transfer' stamp: 'AMV 11/24/2021 23:18:34'!
counterpart
	^transfer transferWithdraw ! !


!TransferDeposit methodsFor: 'account transaction' stamp: 'RV 11/28/2021 23:08:33'!
affectBalance: aSubtotalBalance
	^aSubtotalBalance + value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:04:55'!
for: aValue from: aTransfer   
	^ self new initializeFor: aValue from: aTransfer ! !

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:04:02'!
register: aValue on: account from: aTransfer

	| transaction |
	
	transaction := self for: aValue from: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'AMV 11/24/2021 23:05:20'!
initializeFor: aValue from: aTransfer 
	value := aValue.
	transfer := aTransfer.! !


!TransferWithdraw methodsFor: 'transfer' stamp: 'AMV 11/24/2021 23:18:34'!
counterpart
	^transfer transferDeposit ! !


!TransferWithdraw methodsFor: 'account transaction' stamp: 'RV 11/28/2021 23:08:47'!
affectBalance: aSubtotalBalance
	^aSubtotalBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:05:41'!
for: aValue from: aTransfer   
	^ self new initializeFor: aValue from: aTransfer ! !

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:06:20'!
register: aValue on: account from: aTransfer

	| transaction |
	
	transaction := self for: aValue from: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #FinancialAssets category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialAssets
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'RV 11/28/2021 19:12:02'!
balance
	self subclassResponsibility.! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'RV 11/28/2021 19:15:38'!
hasRegistered: aTransaction! !

!FinancialAssets methodsFor: 'as yet unclassified' stamp: 'RV 11/28/2021 19:15:00'!
transactions
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
FinancialAssets subclass: #Portfolio
	instanceVariableNames: 'financialAssets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'RV 11/25/2021 20:38:54'!
initialize
	financialAssets := OrderedCollection new.! !


!Portfolio methodsFor: 'financial asset' stamp: 'RV 11/28/2021 19:32:06'!
balance	
	^financialAssets sum:[ :aFinancialAsset |
		aFinancialAsset balance.
	] ifEmpty: [ 0 *peso ]! !

!Portfolio methodsFor: 'financial asset' stamp: 'RV 11/28/2021 19:13:07'!
hasRegistered: aTransaction
	^ financialAssets anySatisfy:[:aSavedFinancialAsset|
			aSavedFinancialAsset hasRegistered: aTransaction
	]
			! !

!Portfolio methodsFor: 'financial asset' stamp: 'RV 11/28/2021 23:17:25'!
transactions
	^(self obtainAllTransactionsInThePortfolio) copy! !


!Portfolio methodsFor: 'portfolio behaviour' stamp: 'RV 11/28/2021 23:10:55'!
add: aFinancialAsset
	"financial assets es activos financieros en ingles.
	Definicion de Portfolio : 	https://www.eleconomista.es/diccionario-de-economia/portfolio"
	financialAssets add: aFinancialAsset
	! !


!Portfolio methodsFor: 'private' stamp: 'RV 11/28/2021 23:19:56'!
appendToThe: subTotalOfTransactions transactionsOf: eachFinancialAsset
	^ subTotalOfTransactions,eachFinancialAsset transactions! !

!Portfolio methodsFor: 'private' stamp: 'RV 11/28/2021 23:22:03'!
obtainAllTransactionsInThePortfolio
	^ financialAssets inject: (OrderedCollection new) into: [ :subTotalOfTransactions :eachFinancialAsset |
			self appendToThe: subTotalOfTransactions transactionsOf: eachFinancialAsset.
		]! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
FinancialAssets subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'financial asset' stamp: 'RV 11/28/2021 19:32:15'!
balance
	^ transactions inject: 0*peso into: [:subtotalBalance : eachTransaction| 
		eachTransaction affectBalance: subtotalBalance.
	].
! !

!ReceptiveAccount methodsFor: 'financial asset' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'financial asset' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'receptive account behaviour' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferAmount despositedTransfer withdrawTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'AMV 11/24/2021 22:46:41'!
initializeTransferFrom: aNewDeposit to: aNewWithdraw for: anAmount 
	transferAmount := anAmount.
	despositedTransfer := aNewDeposit.
	withdrawTransfer := aNewWithdraw.! !


!Transfer methodsFor: 'transfer' stamp: 'AMV 11/24/2021 23:12:46'!
transferDeposit
	^despositedTransfer! !

!Transfer methodsFor: 'transfer' stamp: 'AMV 11/24/2021 22:32:09'!
transferValue
	^transferAmount! !

!Transfer methodsFor: 'transfer' stamp: 'AMV 11/24/2021 23:13:02'!
transferWithdraw
	^withdrawTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'RV 11/28/2021 22:29:54'!
errorAmountMessage
	^ 'El monto debe ser positivo'! !

!Transfer class methodsFor: 'instance creation' stamp: 'RV 11/28/2021 22:41:44'!
from: anOriginAccount to: aDestinationAccount for: anAmount
	| aNewTransfer aNewDeposit aNewWithdraw |
	
	anAmount <= 0 ifTrue: [^self error: self errorAmountMessage].
	
	aNewTransfer := self new.
	aNewWithdraw := TransferWithdraw register: anAmount on: anOriginAccount from: aNewTransfer.
	aNewDeposit := TransferDeposit register: anAmount on: aDestinationAccount from: aNewTransfer.
	aNewTransfer initializeTransferFrom: aNewDeposit to: aNewWithdraw for: anAmount.
	^aNewTransfer! !
