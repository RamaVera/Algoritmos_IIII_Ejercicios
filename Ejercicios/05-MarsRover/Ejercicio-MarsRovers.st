!classDefinition: #DireccionesDelMarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #DireccionesDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self subclassResponsibility ! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:14:42'!
esEste
	^false! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:14:29'!
esNorte
	^false! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:14:38'!
esOeste
	^false! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:14:34'!
esSur
	^false! !


!classDefinition: #Este category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Este methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:01:17'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElEsteProcesar: unaListaDeComandos! !

!Este methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:15:07'!
esEste
	^ true! !


!classDefinition: #Norte category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Norte methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElNorteProcesar: unaListaDeComandos! !

!Norte methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:40:12'!
esNorte
	^true! !


!classDefinition: #Oeste category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:00:54'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElOesteProcesar: unaListaDeComandos ! !

!Oeste methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:15:38'!
esOeste
	^true! !


!classDefinition: #Sur category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Sur methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElSurProcesar: unaListaDeComandos ! !

!Sur methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 00:15:54'!
esSur
	^true! !


!classDefinition: #MarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionXY direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!MarsRover methodsFor: 'initialize' stamp: 'AMV 11/14/2021 19:51:09'!
comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalIncial 
	posicionXY :=  posicionXinicial @ posicionYinicial.
	direccionCardinal := direccionCardinalIncial.! !


!MarsRover methodsFor: 'donde esta' stamp: 'RV 11/15/2021 00:53:13'!
estaEnLaPosicionX: unaPosicionEnX Y: unaPosicionEnY 
	^ posicionXY = ( unaPosicionEnX @ unaPosicionEnY)! !


!MarsRover methodsFor: 'donde apunta' stamp: 'AMV 11/16/2021 20:06:48'!
estaApuntandoALaDireccionCardinal: unaDireccionCardinal
	^ direccionCardinal class = unaDireccionCardinal.! !


!MarsRover methodsFor: 'comandos de movimiento' stamp: 'RV 11/15/2021 00:32:30'!
recibirComando: unaListaDeComandos
	direccionCardinal apuntadaPor: self procesarComandos: unaListaDeComandos .! !


!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 20:51:43'!
desdeElEsteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (1@0).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := Norte new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := Sur new
		].
	
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']
! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 20:51:54'!
desdeElNorteProcesar: unaListaDeComandos 
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY :=  posicionXY + (0@-1).
		].
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := Oeste new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := Este new
		]
	ifFalse: [
		self error: 'Comando Invalido'.
		].
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']
! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 20:52:08'!
desdeElOesteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (-1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (-1@0).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := Sur new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := Norte new
		].
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 20:52:12'!
desdeElSurProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY - (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (0@-1).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := Este new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := Oeste new
		].
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !


!classDefinition: #TestMarsRover category: #'Ejercicio-MarsRovers'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRoversEnElOrigenApuntandoAlNorte marsRoversEnElOrigenApuntandoAlSur marsRoversEnElOrigenApuntandoAlOeste marsRoversEnElOrigenApuntandoAlEste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!TestMarsRover methodsFor: 'set up' stamp: 'AMV 11/16/2021 20:16:08'!
setUp
	marsRoversEnElOrigenApuntandoAlNorte := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Norte new.
	marsRoversEnElOrigenApuntandoAlSur := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Sur new.
	marsRoversEnElOrigenApuntandoAlOeste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Oeste new.
	marsRoversEnElOrigenApuntandoAlEste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Este new.! !


!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:44:43'!
test01ElMarsRoversComienzaEnUnaPosicionDefinida
	
	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX:0 Y:0).! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:38:15'!
test02ElMarsRoversNoComienzaEnUnaPosicionDiferenteALaDefinida

	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX: 2 Y: 6).
	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/16/2021 20:09:07'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: Norte).	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/16/2021 20:08:24'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: Sur).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: Este).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: Oeste).
	! !


!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:45:48'!
test05CuandoEstaApuntandoAlNorteYSeMandaUnComandoFAvanzaUnPasoEnDireccionY
	
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'f'  termineEnLaPosicionX: 0 Y: 1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:46:21'!
test06CuandoEstaApuntandoAlNorteYSeMandaUnComandoBRetrocedeUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'b'  termineEnLaPosicionX: 0 Y: -1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:46:54'!
test07CuandoEstaApuntandoAlSurYSeMandaUnComandoFRetrocedeUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'f'  termineEnLaPosicionX: 0 Y: -1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:47:25'!
test08CuandoEstaApuntandoAlSurYSeMandaUnComandoBAvanzaUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'b'  termineEnLaPosicionX: 0 Y: 1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:48:35'!
test09CuandoEstaApuntandoAlOesteYSeMandaUnComandoFRetrocedeUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'f'  termineEnLaPosicionX: -1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:48:51'!
test10CuandoEstaApuntandoAlOesteYSeMandaUnComandoBAvanzaUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'b'  termineEnLaPosicionX: 1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:49:34'!
test11CuandoEstaApuntandoAlEsteYSeMandaUnComandoFAvanzaUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'f'  termineEnLaPosicionX: 1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 19:50:11'!
test12CuandoEstaApuntandoAlEsteYSeMandaUnComandoBRetrocedeUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'b'  termineEnLaPosicionX: -1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:14:24'!
test13

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Oeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:20:44'!
test14

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Este).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:25:14'!
test15

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Este).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:36:53'!
test16

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Oeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:36:13'!
test17

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Sur).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:37:08'!
test18

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Norte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:38:04'!
test19

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Norte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:39:03'!
test20

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Sur).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 20:43:51'!
test21

	self should: [marsRoversEnElOrigenApuntandoAlNorte recibirComando: 't']  raise: Error withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !


!TestMarsRover methodsFor: 'support' stamp: 'AMV 11/16/2021 20:11:15'!
verificarQue: unMarsRover alRecibirElComando: unComando termineEnLaPosicionX: posicionX Y: posicionY

	| unMarsRoverCorrido |
	unMarsRoverCorrido := unMarsRover recibirComando: unComando.
	
	self assert: (unMarsRoverCorrido estaEnLaPosicionX: posicionX Y: posicionY).! !
