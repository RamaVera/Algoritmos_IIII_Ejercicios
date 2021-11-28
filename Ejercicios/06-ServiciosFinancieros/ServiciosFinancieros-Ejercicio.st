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

!PortfolioTest methodsFor: 'transactions' stamp: 'RV 11/28/2021 17:09:23'!
test07aPortfolioCanGotAllAddedTransactionsOfTheirAccounts

	aPortfolio add: anAccountWithADepositof100 .
	aPortfolio add: anAccountWithAWithdrawOf75 .

	self assert: (aPortfolio has: aDepositOf100 onA: anAccountWithADepositof100).
	self assert: (aPortfolio has: aWithdrawOf75 onA:  anAccountWithAWithdrawOf75).
	
! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:34:55'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	CashierDeposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:35:08'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	CashierDeposit register: 100 * peso on: account.
	CashierWithdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:35:08'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (CashierWithdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:35:08'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := CashierDeposit register: 100 * peso on: account.
	withdraw := CashierWithdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:35:08'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  CashierDeposit for: 100 * peso .
	withdraw := CashierWithdraw for: 50 * peso .
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'RV 11/25/2021 19:34:55'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := CashierDeposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:35:15'!
test01TransferChangesBalanceTwoAccounts
	| destinationAccount originAccount |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: -10*peso equals: originAccount balance.
	self assert: 10*peso equals: destinationAccount balance.
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:37:18'!
test02ReceptiveAccountsKnowsRegisteredTransferTransaction 

	| destinationAccount originAccount transfer |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: (originAccount hasRegistered: transfer transferWithdraw).
	self assert: (destinationAccount hasRegistered: transfer transferDeposit).! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:37:37'!
test03TransferKnowsItsValue
	| destinationAccount originAccount transfer |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	self assert: 10*peso equals: transfer transferValue.
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:38:49'!
test04BothPartsOfTheTransactionKnowsItsCounterpart
	| destinationAccount originAccount transfer onePartOfTheTransfer otherPartOfTheTransfer |
	originAccount := ReceptiveAccount new.
	destinationAccount := ReceptiveAccount new.
	
	transfer := Transfer from: originAccount to: destinationAccount for: 10*peso.
	
	onePartOfTheTransfer := transfer transferDeposit.
	otherPartOfTheTransfer := transfer transferWithdraw.
	
	self assert: onePartOfTheTransfer counterpart equals: otherPartOfTheTransfer.
	self assert: otherPartOfTheTransfer counterpart equals: onePartOfTheTransfer.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'AMV 11/24/2021 23:22:19'!
value 
	self subclassResponsibility ! !

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


!CashierDeposit methodsFor: 'as yet unclassified' stamp: 'RV 11/20/2021 20:38:31'!
netValue
	^self value! !

!CashierDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:22:52'!
value
	^value! !

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


!CashierWithdraw methodsFor: 'as yet unclassified' stamp: 'RV 11/20/2021 20:38:12'!
netValue
	^ self value negated! !

!CashierWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:23:01'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
CashierWithdraw class
	instanceVariableNames: ''!

!CashierWithdraw class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
for: aValue  

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'contraparte transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'value' stamp: 'AMV 11/24/2021 23:05:08'!
initializeFor: aValue from: aTransfer 
	value := aValue.
	transfer := aTransfer.! !


!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:18:34'!
counterpart
	^transfer transferWithdraw ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 22:51:56'!
netValue
	^self value! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:22:55'!
value
	^value! !

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


!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:18:34'!
counterpart
	^transfer transferDeposit ! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 22:52:03'!
netValue
	^self value negated! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:22:58'!
value
	^value! !

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


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'financialAssets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'RV 11/25/2021 20:39:02'!
add: aReceptiveAccount 
	"financial assets es activos financieros. Definicion de Portfolio : 	https://www.eleconomista.es/diccionario-de-economia/portfolio"
	financialAssets add: aReceptiveAccount 
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'RV 11/25/2021 20:42:58'!
balance
	
	^financialAssets sum:[ :aFinancialAsset |
		aFinancialAsset balance.
		] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'RV 11/25/2021 21:37:49'!
has: aTransaction onA: aReceptiveAccount

	^(financialAssets includes:aReceptiveAccount) and:[
		(financialAssets anySatisfy:[:aSavedFinancialAsset|
			aSavedFinancialAsset hasRegistered: aTransaction])
			] .! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'RV 11/25/2021 20:38:54'!
initialize
	financialAssets := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'RV 11/28/2021 17:05:04'!
transactions
	| totalTransactions |
	totalTransactions := OrderedCollection new.
	financialAssets do:[ :eachFinancialAsset |
		totalTransactions addAllLast: eachFinancialAsset transactions.
		].
	^totalTransactions copy.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'RV 11/20/2021 20:37:16'!
balance

	^transactions sum: [ :aTransaction | 	aTransaction netValue. ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


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


!Transfer methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:12:46'!
transferDeposit
	^despositedTransfer! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 22:32:09'!
transferValue
	^transferAmount! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AMV 11/24/2021 23:13:02'!
transferWithdraw
	^withdrawTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 23:09:06'!
from: anOriginAccount to: aDestinationAccount for: anAmount
	| aNewTransfer aNewDeposit aNewWithdraw |
	aNewTransfer := self new.
	aNewWithdraw := TransferWithdraw register: anAmount on: anOriginAccount from: aNewTransfer.
	aNewDeposit := TransferDeposit register: anAmount on: aDestinationAccount from: aNewTransfer.
	aNewTransfer initializeTransferFrom: aNewDeposit to: aNewWithdraw for: anAmount.
	^aNewTransfer! !
