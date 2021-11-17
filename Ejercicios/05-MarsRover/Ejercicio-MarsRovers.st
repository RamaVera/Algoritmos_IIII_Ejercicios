!classDefinition: #DireccionesDelMarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #DireccionesDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self subclassResponsibility ! !


!classDefinition: #DireccionEste category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:01:17'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElEsteProcesar: unaListaDeComandos! !


!classDefinition: #DireccionNorte category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElNorteProcesar: unaListaDeComandos! !


!classDefinition: #DireccionOeste category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'RV 11/15/2021 01:00:54'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElOesteProcesar: unaListaDeComandos ! !


!classDefinition: #DireccionSur category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElSurProcesar: unaListaDeComandos ! !


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


!MarsRover methodsFor: 'comandos de movimiento' stamp: 'AMV 11/17/2021 00:52:14'!
recibirComando: unaListaDeComandos

	unaListaDeComandos do: [
		"proceso el comando y sabemos que accion tiene que hacer comando := 'avanzar'  'retroceder' 'rodarizq' 'rotarder' "
		"direccionCardinal comando"
	].
		
	direccionCardinal apuntadaPor: self procesarComandos: unaListaDeComandos .! !


!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 23:51:43'!
desdeElEsteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (1@0).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := DireccionNorte new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := DireccionSur new
		].
	
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']
! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 23:51:37'!
desdeElNorteProcesar: unaListaDeComandos

	unaListaDeComandos do: [ :unComando |
		unComando = $f ifTrue:[
			posicionXY := posicionXY + (0@1)
			].
		unComando = $b ifTrue:[
			posicionXY :=  posicionXY + (0@-1).
			].
		unComando = $l ifTrue: [
			direccionCardinal := DireccionOeste new
			].
		unComando = $r  ifTrue: [
			direccionCardinal := DireccionEste new
			].
		(unComando ~= $f and: unComando ~= $b and: unComando ~= $r and: unComando ~= $l) ifTrue: [self error: 'Comando in valido'].
	]	
	
	! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 23:51:43'!
desdeElOesteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (-1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (-1@0).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := DireccionSur new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := DireccionNorte new
		].
	(unaListaDeComandos ~= 'f' and: unaListaDeComandos ~= 'b' and: unaListaDeComandos ~= 'r' and: unaListaDeComandos ~= 'l') ifTrue: [self error: 'Comando invalido']! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/16/2021 23:51:37'!
desdeElSurProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY - (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (0@-1).
		]. 
	unaListaDeComandos = 'l' ifTrue: [
		direccionCardinal := DireccionEste new
		].
	unaListaDeComandos = 'r' ifTrue: [
		direccionCardinal := DireccionOeste new
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

!TestMarsRover methodsFor: 'set up' stamp: 'AMV 11/16/2021 23:51:43'!
setUp
	marsRoversEnElOrigenApuntandoAlNorte := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: DireccionNorte new.
	marsRoversEnElOrigenApuntandoAlSur := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: DireccionSur new.
	marsRoversEnElOrigenApuntandoAlOeste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: DireccionOeste new.
	marsRoversEnElOrigenApuntandoAlEste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: DireccionEste new.! !


!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:44:43'!
test01ElMarsRoversComienzaEnUnaPosicionDefinida
	
	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX:0 Y:0).! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:38:15'!
test02ElMarsRoversNoComienzaEnUnaPosicionDiferenteALaDefinida

	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX: 2 Y: 6).
	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/16/2021 23:51:31'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: DireccionNorte).	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/16/2021 23:51:43'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: DireccionSur).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: DireccionEste).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: DireccionOeste).
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

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:37'!
test13CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionIzquierdaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionOeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:03'!
test14CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionDerechaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionEste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:03'!
test15CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionEste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:37'!
test16CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionOeste).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:43'!
test17CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionSur).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:31'!
test18CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionNorte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:31'!
test19CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionNorte).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/16/2021 23:51:43'!
test20CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: DireccionSur).! !

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
