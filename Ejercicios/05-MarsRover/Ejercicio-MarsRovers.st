!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRovers'!
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


!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:51:18'!
test05CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeAvanceAvanzaUnPasoEnDireccionY
	
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'f'  termineEnLaPosicionX: 0 Y: 1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:51:29'!
test06CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRetrocesoRetrocedeUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'b'  termineEnLaPosicionX: 0 Y: -1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:51:39'!
test07CuandoEstaApuntandoAlSurYSeMandaUnComandoDeAvanceRetrocedeUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'f'  termineEnLaPosicionX: 0 Y: -1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:51:48'!
test08CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRetrocesoAvanzaUnPasoEnDireccionY

	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'b'  termineEnLaPosicionX: 0 Y: 1.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:51:55'!
test09CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeAvanceRetrocedeUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'f'  termineEnLaPosicionX: -1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:52:03'!
test10CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRetrocesoAvanzaUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'b'  termineEnLaPosicionX: 1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:52:18'!
test11CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeAvanceAvanzaUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'f'  termineEnLaPosicionX: 1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:52:43'!
test12CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRetrocesoRetrocedeUnPasoEnDireccionX

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'b'  termineEnLaPosicionX: -1 Y: 0.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:41:59'!
test13CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionIzquierdaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Oeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:42:31'!
test14CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionDerechaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Este).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:43:02'!
test15CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Este).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:43:35'!
test16CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Oeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:44:18'!
test17CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Sur).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:45:05'!
test18CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Norte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:45:28'!
test19CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Norte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:45:48'!
test20CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: Sur).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:54:58'!
test21CuandoSeMandaUnComandoErroneoApuntadoAlNorteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlNorte recibirComando: 't']  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:55:12'!
test22CuandoSeMandaUnComandoErroneoApuntadoAlSurSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlSur recibirComando: 't']  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:55:25'!
test23CuandoSeMandaUnComandoErroneoApuntadoAlOesteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlOeste recibirComando: 't']  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/16/2021 22:55:41'!
test24CuandoSeMandaUnComandoErroneoApuntadoAlEsteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlEste recibirComando: 't']  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !


!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'RV 11/16/2021 23:18:45'!
test25

	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'fffbbb'  termineEnLaPosicionX: 0 Y: 0.! !


!TestMarsRover methodsFor: 'support' stamp: 'AMV 11/16/2021 20:11:15'!
verificarQue: unMarsRover alRecibirElComando: unComando termineEnLaPosicionX: posicionX Y: posicionY

	| unMarsRoverCorrido |
	unMarsRoverCorrido := unMarsRover recibirComando: unComando.
	
	self assert: (unMarsRoverCorrido estaEnLaPosicionX: posicionX Y: posicionY).! !


!classDefinition: #DireccionesDelMarsRover category: 'Ejercicio-MarsRovers'!
Object subclass: #DireccionesDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self subclassResponsibility ! !


!classDefinition: #Este category: 'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Este methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:01:17'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElEsteProcesar: unaListaDeComandos! !


!classDefinition: #Norte category: 'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Norte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Norte methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElNorteProcesar: unaListaDeComandos! !


!classDefinition: #Oeste category: 'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:00:54'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElOesteProcesar: unaListaDeComandos ! !


!classDefinition: #Sur category: 'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Sur methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElSurProcesar: unaListaDeComandos ! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRovers'!
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

!MarsRover methodsFor: 'private' stamp: 'RV 11/16/2021 23:38:40'!
desdeElNorteProcesar: unaListaDeComandos
	
	
	| unaListaDeComandosReducida |
	unaListaDeComandos isEmpty ifTrue: [^self].
	
	(unaListaDeComandos first) = $f ifTrue:[
		posicionXY := posicionXY + (0@1)
		].
	(unaListaDeComandos first) = $b ifTrue:[
		posicionXY :=  posicionXY + (0@-1).
		].
	(unaListaDeComandos first) = $l ifTrue: [
		direccionCardinal := Oeste new
		].
	(unaListaDeComandos first) = $r  ifTrue: [
		direccionCardinal := Este new
		].
	(unaListaDeComandos first ~= $f and: unaListaDeComandos first ~= $b and: unaListaDeComandos first ~= $r and: unaListaDeComandos first ~= $l) ifTrue: [self error: 'Comando in valido'].
	
	unaListaDeComandosReducida := unaListaDeComandos copyFrom: 2 to: (unaListaDeComandos size).
	self desdeElNorteProcesar: unaListaDeComandosReducida. 
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

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !
