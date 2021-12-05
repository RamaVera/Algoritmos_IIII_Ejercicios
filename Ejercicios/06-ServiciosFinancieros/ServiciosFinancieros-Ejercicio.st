!classDefinition: #AccountTransaction category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'balance' stamp: 'RV 11/28/2021 18:31:25'!
affectBalance: aSubtotalBalance
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'value asking' stamp: 'RV 11/29/2021 21:33:53'!
value
	^value copy! !

!AccountTransaction methodsFor: 'value asking' stamp: 'RV 11/28/2021 23:07:13'!
wasTheAmountof: anAmountToCompare
	^ value = anAmountToCompare! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue .
	account register: transaction.
		
	^ transaction! !


!classDefinition: #CashierDeposit category: #'ServiciosFinancieros-Ejercicio'!
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


!CashierDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 12/4/2021 19:36:35'!
accept: anExpressionVisitor
	^anExpressionVisitor visitCashierDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierDeposit class' category: #'ServiciosFinancieros-Ejercicio'!
CashierDeposit class
	instanceVariableNames: ''!

!CashierDeposit class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
for: aValue  

	^ self new initializeFor: aValue ! !


!classDefinition: #CashierWithdraw category: #'ServiciosFinancieros-Ejercicio'!
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


!CashierWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 12/4/2021 19:37:02'!
accept: anExpressionVisitor
	^anExpressionVisitor visitCashierWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CashierWithdraw class' category: #'ServiciosFinancieros-Ejercicio'!
CashierWithdraw class
	instanceVariableNames: ''!

!CashierWithdraw class methodsFor: 'instance creation' stamp: 'AMV 11/24/2021 22:59:22'!
for: aValue  

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: #'ServiciosFinancieros-Ejercicio'!
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


!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AMV 12/4/2021 19:37:47'!
accept: anExpressionVisitor
	^anExpressionVisitor visitTransferDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'ServiciosFinancieros-Ejercicio'!
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


!classDefinition: #TransferWithdraw category: #'ServiciosFinancieros-Ejercicio'!
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


!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AMV 12/4/2021 19:38:06'!
accept: anExpressionVisitor
	^anExpressionVisitor visitTransferWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'ServiciosFinancieros-Ejercicio'!
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


!classDefinition: #FinancialAssets category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialAssets
	instanceVariableNames: 'containedByFinancialAsset'
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


!classDefinition: #Portfolio category: #'ServiciosFinancieros-Ejercicio'!
FinancialAssets subclass: #Portfolio
	instanceVariableNames: 'financialAssets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'AMV 11/29/2021 14:04:15'!
initialize
	financialAssets := OrderedCollection new.
	containedByFinancialAsset := OrderedCollection new.! !


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


!Portfolio methodsFor: 'portfolio behaviour' stamp: 'AMV 11/29/2021 14:18:34'!
add: aFinancialAsset
	"financial assets es activos financieros en ingles.
	Definicion de Portfolio : 	https://www.eleconomista.es/diccionario-de-economia/portfolio"
	
	self validateNewFinancialAsset: aFinancialAsset .
	
	financialAssets add: (aFinancialAsset from: self)
	! !


!Portfolio methodsFor: 'private' stamp: 'RV 11/28/2021 23:19:56'!
appendToThe: subTotalOfTransactions transactionsOf: eachFinancialAsset
	^ subTotalOfTransactions,eachFinancialAsset transactions! !

!Portfolio methodsFor: 'private' stamp: 'AMV 11/29/2021 13:54:29'!
from: containerFinancialAsset
	containedByFinancialAsset add: containerFinancialAsset ! !

!Portfolio methodsFor: 'private' stamp: 'RV 11/29/2021 02:09:51'!
iAmAlreadyContaining: aFinancialAsset

	^ financialAssets anySatisfy:[ :eachFinancialAsset | 
		eachFinancialAsset contains: aFinancialAsset.]! !

!Portfolio methodsFor: 'private' stamp: 'RV 11/29/2021 02:10:23'!
itIsMe: aFinancialAsset

	^ aFinancialAsset = self! !

!Portfolio methodsFor: 'private' stamp: 'AMV 11/29/2021 12:17:04'!
listOfFinancialAssets
	^financialAssets copy! !

!Portfolio methodsFor: 'private' stamp: 'RV 11/28/2021 23:22:03'!
obtainAllTransactionsInThePortfolio
	^ financialAssets inject: (OrderedCollection new) into: [ :subTotalOfTransactions :eachFinancialAsset |
			self appendToThe: subTotalOfTransactions transactionsOf: eachFinancialAsset.
		]! !

!Portfolio methodsFor: 'private' stamp: 'AMV 11/29/2021 14:54:44'!
validateNewFinancialAsset: aFinancialAsset
	(self itIsMe: aFinancialAsset) ifTrue: [
		self error: self class errorMessageDuplicateFinancialAsset
		].
	
	(self iAmAlreadyContaining: aFinancialAsset) ifTrue: [
		self error: self class errorMessageDuplicateFinancialAsset
		].
	
	(self myContainerFinanceAssetAlreadyContains: aFinancialAsset ) ifTrue: [
		self error: self class errorMessageDuplicateFinancialAsset
		].
	
	(self anyOfMyFinancialAssetsAreContaindedBy: aFinancialAsset) ifTrue: [
		self error: self class errorMessageDuplicateFinancialAsset
		].! !


!Portfolio methodsFor: 'including' stamp: 'AMV 11/29/2021 14:54:44'!
anyOfMyFinancialAssetsAreContaindedBy: aFinancialAsset

	^ aFinancialAsset containsAnyOfTheFinancialAssetsOf: self! !

!Portfolio methodsFor: 'including' stamp: 'RV 11/29/2021 01:46:29'!
contains: aFinancialAsset 
	^aFinancialAsset isincludedOnAPortfolio: self.! !

!Portfolio methodsFor: 'including' stamp: 'RV 11/29/2021 01:50:58'!
containsAReceptiveAccount: aReceptiveAccount
	^(financialAssets anySatisfy:[ :eachFinancialAsset | 
		eachFinancialAsset contains: aReceptiveAccount.]) ifTrue: [self error: self class errorMessageDuplicateFinancialAsset ].
	! !

!Portfolio methodsFor: 'including' stamp: 'AMV 11/29/2021 14:56:30'!
containsAnyOfTheFinancialAssetsOf: anotherPortfolio
	^((anotherPortfolio listOfFinancialAssets) anySatisfy:[ :eachFinancialAsset | 
		self iAmAlreadyContaining: eachFinancialAsset.])! !

!Portfolio methodsFor: 'including' stamp: 'RV 11/29/2021 01:54:40'!
isIncludedOnAReceptiveAccount: aReceptiveAccount 
	^ false! !

!Portfolio methodsFor: 'including' stamp: 'AMV 11/29/2021 14:52:40'!
myContainerFinanceAssetAlreadyContains: aFinancialAsset

	^ containedByFinancialAsset anySatisfy: [ :aContainerFinancialAsset | 
		aContainerFinancialAsset iAmAlreadyContaining: aFinancialAsset]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'RV 11/28/2021 23:37:48'!
errorMessageDuplicateFinancialAsset
	^ 'Error: Cuenta ya existente en el Portafolio'! !


!classDefinition: #ReceptiveAccount category: #'ServiciosFinancieros-Ejercicio'!
FinancialAssets subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'AMV 11/29/2021 14:10:34'!
initialize

	transactions := OrderedCollection new.
	containedByFinancialAsset := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'financial asset' stamp: 'RV 11/28/2021 19:32:15'!
balance
	^ transactions inject: 0*peso into: [:subtotalBalance : eachTransaction| 
		eachTransaction affectBalance: subtotalBalance.
	].
! !

!ReceptiveAccount methodsFor: 'financial asset' stamp: 'RV 11/29/2021 01:52:57'!
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


!ReceptiveAccount methodsFor: 'including' stamp: 'RV 11/29/2021 01:54:40'!
contains: aFinancialAsset
	^aFinancialAsset isIncludedOnAReceptiveAccount: self.
	! !

!ReceptiveAccount methodsFor: 'including' stamp: 'RV 11/29/2021 01:54:40'!
isIncludedOnAReceptiveAccount: aReceptiveAccount 
	^ transactions allSatisfy: [ :eachTransaction |
		aReceptiveAccount hasRegistered: eachTransaction .
		]
	! !

!ReceptiveAccount methodsFor: 'including' stamp: 'RV 11/29/2021 02:16:46'!
isincludedOnAPortfolio: aPortfolio 
	^aPortfolio containsAReceptiveAccount: self.
	! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AMV 11/29/2021 12:28:23'!
containsAnyOfTheFinancialAssetsOf: anotherPortfolio
	^false! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'AMV 11/29/2021 12:07:03'!
from: containerFinancialAsset
	containedByFinancialAsset := containerFinancialAsset ! !


!classDefinition: #FinancialVisitors category: #'ServiciosFinancieros-Ejercicio'!
Object subclass: #FinancialVisitors
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!FinancialVisitors methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:21:52'!
visitCashierDeposit: aCashierDeposit
	self subclassResponsibility ! !

!FinancialVisitors methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:21:34'!
visitCashierWithdraw: aCashierWithdraw
	self subclassResponsibility ! !

!FinancialVisitors methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:21:11'!
visitTransferDeposit: aTransferDeposit
	self subclassResponsibility ! !

!FinancialVisitors methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:20:47'!
visitTransferWithdraw: aTransferWithdraw
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FinancialVisitors class' category: #'ServiciosFinancieros-Ejercicio'!
FinancialVisitors class
	instanceVariableNames: ''!

!FinancialVisitors class methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:22:26'!
of: aFinancialAsset
	self subclassResponsibility ! !


!classDefinition: #Summary category: #'ServiciosFinancieros-Ejercicio'!
FinancialVisitors subclass: #Summary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Summary methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 09:51:44'!
visitCashierDeposit: aCashierDeposit
	^'Depósito por ',(aCashierDeposit value) asString ! !

!Summary methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 09:51:52'!
visitCashierWithdraw: aCashierWithdraw
	^'Extracción por ',(aCashierWithdraw value) asString ! !

!Summary methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 09:51:59'!
visitTransferDeposit: aTransferDeposit
	^'Entrada por transferencia de ',(aTransferDeposit value) asString ! !

!Summary methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 10:04:36'!
visitTransferWithdraw: aTransferWithdraw
	^'Salida por transferencia de ',(aTransferWithdraw value) asString ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Summary class' category: #'ServiciosFinancieros-Ejercicio'!
Summary class
	instanceVariableNames: ''!

!Summary class methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 10:58:56'!
of: aFinancialAsset
	| aSummary report |
	aSummary _ self new .
	report _ OrderedCollection new .
	aFinancialAsset transactions do: [ :eachTransaction |
		report add: (eachTransaction accept: aSummary)
		] .
	
	report add: 'Balance = ' , (aFinancialAsset balance) asString .
	^report! !


!classDefinition: #TransferNet category: #'ServiciosFinancieros-Ejercicio'!
FinancialVisitors subclass: #TransferNet
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferNet methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:47:08'!
visitCashierDeposit: aCashierDeposit
	^0 * peso! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:47:15'!
visitCashierWithdraw: aCashierWithdraw
	^0 * peso! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:42:22'!
visitTransferDeposit: aTransferDeposit
	^aTransferDeposit value! !

!TransferNet methodsFor: 'as yet unclassified' stamp: 'AMV 12/5/2021 11:42:36'!
visitTransferWithdraw: aTransferWithdraw
	^aTransferWithdraw value negated ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: #'ServiciosFinancieros-Ejercicio'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'AMV 12/5/2021 11:46:35'!
of: aFinancialAsset 
	| aTransferNet transferBalance |
	aTransferNet _ self new .
	transferBalance _ 0 * peso.
	aFinancialAsset transactions do: [:eachTransaction | 
		transferBalance _ transferBalance + (eachTransaction accept: aTransferNet) 
		] .
		
	^'Transfer Net balance = ' , (transferBalance) asString .! !


!classDefinition: #Transfer category: #'ServiciosFinancieros-Ejercicio'!
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

!classDefinition: 'Transfer class' category: #'ServiciosFinancieros-Ejercicio'!
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


!classDefinition: #PortfolioTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'oneWithdraw aPortfolio anAccountWithADepositof100 aDepositOf100 anAccountWithAWithdrawOf75 aWithdrawOf75 otherPortfolio anAccountWithADepositof25 aDepositOf25'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


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


!PortfolioTest methodsFor: 'portfolio validating' stamp: 'RV 11/28/2021 23:44:44'!
test09aPortfolioCantHaveTheSameAccount

	aPortfolio 	add: anAccountWithADepositof100 .
	
	self should: [ aPortfolio 	add: anAccountWithADepositof100 . ] raise: Error
		withExceptionDo:[ :anError |
			self assert: anError messageText equals: Portfolio errorMessageDuplicateFinancialAsset.
		] 
	
	
! !

!PortfolioTest methodsFor: 'portfolio validating' stamp: 'RV 11/29/2021 01:53:56'!
test10aPortfolioCantAddTheSameAccountOnAPreviouslyAddedPortofolioWithTheSameAccount.

	otherPortfolio 	add: anAccountWithADepositof100 .
	aPortfolio add: otherPortfolio.
	
	self should: [ aPortfolio 	add: anAccountWithADepositof100 . ] raise: Error
		withExceptionDo:[ :anError |
			self assert: anError messageText equals: Portfolio errorMessageDuplicateFinancialAsset.
		] 
! !

!PortfolioTest methodsFor: 'portfolio validating' stamp: 'RV 11/29/2021 02:02:35'!
test11aPortfolioCantBeAddedToTheirself

	self should: [ aPortfolio add: aPortfolio. ] raise: Error
		withExceptionDo:[ :anError |
			self assert: anError messageText equals: Portfolio errorMessageDuplicateFinancialAsset.
		] 
! !

!PortfolioTest methodsFor: 'portfolio validating' stamp: 'AMV 11/29/2021 15:03:12'!
test12CannotAddAnAccountToAPortfolioWhenItIsContainerPortfolioAlreadyHasTheAccount

	aPortfolio 	add: anAccountWithADepositof100 .
	aPortfolio add: otherPortfolio.
	
	self should: [ otherPortfolio 	add: anAccountWithADepositof100 . ] raise: Error
		withExceptionDo:[ :anError |
			self assert: anError messageText equals: Portfolio errorMessageDuplicateFinancialAsset.
		] 
! !

!PortfolioTest methodsFor: 'portfolio validating' stamp: 'AMV 11/29/2021 15:03:57'!
test13CannotAddAPortfolioIntoAnotherPortfolioIfTheyContainTheSameAccount

	aPortfolio 	add: anAccountWithADepositof100 .
	otherPortfolio 	add: anAccountWithADepositof100 .
	
	self should: [ aPortfolio 	add: otherPortfolio . ] raise: Error
		withExceptionDo:[ :anError |
			self assert: anError messageText equals: Portfolio errorMessageDuplicateFinancialAsset.
		] 
! !


!classDefinition: #ReceptiveAccountTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: 'anAccount aDepositOf50Pesos anAmountOf100 anAmountOfZero anAmountOf50'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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


!ReceptiveAccountTest methodsFor: 'setup' stamp: 'RV 11/28/2021 22:46:43'!
setUp
	anAccount := ReceptiveAccount new.
	
	anAmountOfZero := 0*peso.
	anAmountOf50  := 50 * peso.
	anAmountOf100 := 100*peso.! !


!ReceptiveAccountTest methodsFor: 'support' stamp: 'RV 11/29/2021 02:21:07'!
assertThatThereisOnlyOneTransactionAndItWas: aDeposit

	self assert: 1 equals: anAccount transactions size.
	self assert: (anAccount transactions includes: aDeposit)! !


!classDefinition: #ReportTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReportTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:07:23'!
test01ASummaryGivesACorrectSummaryReportOfAReceptiveAccountWithNoTransactions

	| anAccount expectedAccountSummary |
	anAccount := ReceptiveAccount new.
	expectedAccountSummary := OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: anAccount summary equals: expectedAccountSummary.! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:08:05'!
test02ASummaryGivesACorrectSummaryReportOfAReceptiveAccountWithOnlyACashierDeposit
	| anAccount expectedAccountSummary  |

	anAccount := ReceptiveAccount new.
	
	CashierDeposit register: 100 * peso on: anAccount.
	
	expectedAccountSummary := OrderedCollection 
		with: 'Depósito por 100 pesos'
		with: 'Balance = 100 pesos'.
	
	self assert: (Summary of: anAccount) equals: expectedAccountSummary
! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:09:05'!
test03ASummaryGivesACorrectSummaryReportOfAReceptiveAccountWithOnlyACashierWithdraw
	| anAccount expectedAccountSummary |
	anAccount := ReceptiveAccount new.
	

	CashierWithdraw register: 50 * peso on: anAccount.
	
	expectedAccountSummary := OrderedCollection 
		with: 'Extracción por 50 pesos'
		with: 'Balance = -50 pesos'.
	
	self assert: (Summary of: anAccount) equals: expectedAccountSummary
! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:10:08'!
test04ASummaryGivesACorrectSummaryReportOfAReceptiveAccountWithOnlyATransferWithdraw
	| anAccount expectedAccountSummary anotherAccount |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.

	Transfer from: anAccount to: anotherAccount for: 20 * peso.
	
	expectedAccountSummary := OrderedCollection 
		with: 'Salida por transferencia de 20 pesos'
		with: 'Balance = -20 pesos'.
	
	self assert: (Summary of: anAccount) equals: expectedAccountSummary
! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:10:26'!
test05ASummaryGivesACorrectSummaryReportOfAReceptiveAccountWithOnlyATransferDeposit
	| anAccount expectedAccountSummary anotherAccount |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	
	Transfer from: anotherAccount to: anAccount for: 30 * peso.
	
	expectedAccountSummary := OrderedCollection 
		with: 'Entrada por transferencia de 30 pesos'
		with: 'Balance = 30 pesos'.
	
	self assert: (Summary of: anAccount) equals: expectedAccountSummary
! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:25:45'!
test06ASummaryGivesACorrectSummaryReportOfAPortfolioWithVoriousAccounts
	| anAccount expectedAccountSummary anotherAccount aPortfolio |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.  
	
	CashierDeposit register: 100 * peso on: anAccount.
	CashierWithdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 20 * peso.
	
	Transfer from: anotherAccount to: anAccount for: 30 * peso.
	CashierDeposit register: 100 * peso on: anotherAccount .

	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount .
	
	expectedAccountSummary := OrderedCollection 
		with: 'Depósito por 100 pesos'
		with: 'Extracción por 50 pesos'
		with: 'Salida por transferencia de 20 pesos'
		with: 'Entrada por transferencia de 30 pesos'
		with: 'Entrada por transferencia de 20 pesos'
		with: 'Salida por transferencia de 30 pesos' .
	
	expectedAccountSummary
		add: 'Depósito por 100 pesos';
		add: 'Balance = 150 pesos'.
		
	
	
	self assert: (Summary of: aPortfolio) equals: expectedAccountSummary
! !

!ReportTest methodsFor: 'summary' stamp: 'AMV 12/5/2021 17:12:06'!
test07ASummaryGivesACorrectSummaryReportOfAPortfolioInsideAPortfolio
	| anAccount expectedAccountSummary anotherAccount aPortfolio anotherPorfolio |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.  	
	anotherPorfolio := Portfolio new.  
	
	CashierDeposit register: 100 * peso on: anAccount.
	CashierWithdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 20 * peso.
	Transfer from: anotherAccount to: anAccount for: 30 * peso.
	
	aPortfolio add: anAccount.
	anotherPorfolio add: aPortfolio.
	
	expectedAccountSummary := OrderedCollection 
		with: 'Depósito por 100 pesos'
		with: 'Extracción por 50 pesos'
		with: 'Salida por transferencia de 20 pesos'
		with: 'Entrada por transferencia de 30 pesos'
		with: 'Balance = 60 pesos'.
	
	self assert: (Summary of: anotherPorfolio) equals: expectedAccountSummary
! !


!ReportTest methodsFor: 'transfer net' stamp: 'AMV 12/5/2021 17:13:04'!
test08ATransferNetGivesACorrectTransferNetReportOfAReceptiveAccountWithNoTransactions
	
	| anAccount |
	anAccount _ ReceptiveAccount new .
	
	self assert: (TransferNet of: anAccount ) equals: 'Transfer Net balance = 0 pesos' .! !

!ReportTest methodsFor: 'transfer net' stamp: 'AMV 12/5/2021 17:13:53'!
test09TransferNetGivesACorrectTransferNetReportOfAReceptiveAccountWithNoTransfers
	
	| anAccount |
	anAccount _ ReceptiveAccount new .

	CashierDeposit register: 20 *peso  on: anAccount .
	CashierWithdraw register: 5 * peso on: anAccount .
	
	self assert: (TransferNet of: anAccount) equals: 'Transfer Net balance = 0 pesos' .! !

!ReportTest methodsFor: 'transfer net' stamp: 'AMV 12/5/2021 17:15:21'!
test10TransferNetGivesACorrectTransferNetReportOfAReceptiveAccountWithOnlyATransferDeposit
	
	| anAccount anotherAccount |
	anAccount _ ReceptiveAccount new .
	anotherAccount _ ReceptiveAccount new .
	
	Transfer from: anotherAccount to: anAccount for: 20 * peso.
	
	self assert: (TransferNet of: anAccount) equals: 'Transfer Net balance = 20 pesos' .! !

!ReportTest methodsFor: 'transfer net' stamp: 'AMV 12/5/2021 17:17:06'!
test11TransferNetGivesACorrectTransferNetReportOfAPortfolioWithOneReceptiveAccount
	| anAccount anotherAccount aPortfolio |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.  
	
	CashierDeposit register: 100 * peso on: anAccount.
	CashierWithdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 20 * peso.
	Transfer from: anotherAccount to: anAccount for: 30 * peso.
	
	aPortfolio add: anAccount.
	
	self assert: (TransferNet of: aPortfolio) equals: 'Transfer Net balance = 10 pesos' 
! !

!ReportTest methodsFor: 'transfer net' stamp: 'AMV 12/5/2021 17:16:53'!
test12TransferNetGivesACorrectTransferNetReportOfAPortfolioWithVariousAccounts
	| anAccount anotherAccount aPortfolio |
	anotherAccount := ReceptiveAccount new.
	anAccount := ReceptiveAccount new.
	aPortfolio := Portfolio new.  
	
	CashierDeposit register: 100 * peso on: anAccount.
	CashierWithdraw register: 50 * peso on: anAccount.
	Transfer from: anAccount to: anotherAccount for: 20 * peso.
	
	Transfer from: anotherAccount to: anAccount for: 30 * peso.
	CashierDeposit register: 100 * peso on: anotherAccount .

	aPortfolio add: anAccount.
	aPortfolio add: anotherAccount .
	
	self assert: (TransferNet of: aPortfolio) equals: 'Transfer Net balance = 0 pesos' 
! !


!classDefinition: #TransferTest category: #'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'anOriginAccount aDestinationAccount anAmountToTransfer aNegativeAmountToTransfer anZeroAmountToTransfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


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
