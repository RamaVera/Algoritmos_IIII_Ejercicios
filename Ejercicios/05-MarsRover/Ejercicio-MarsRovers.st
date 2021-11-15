!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRovers'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRoversEnElOrigenApuntandoAlNorte marsRoversEnElOrigenApuntandoAlSur marsRoversEnElOrigenApuntandoAlOeste marsRoversEnElOrigenApuntandoAlEste'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!TestMarsRover methodsFor: 'set up' stamp: 'RV 11/15/2021 00:50:25'!
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

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:57:06'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: marsRoversEnElOrigenApuntandoAlNorte esAlNorteAQuienApunta.	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:57:33'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: marsRoversEnElOrigenApuntandoAlNorte esAlSurAQuienApunta.
	self deny: marsRoversEnElOrigenApuntandoAlNorte esAlOesteAQuienApunta.
	self deny: marsRoversEnElOrigenApuntandoAlNorte esAlEsteAQuienApunta.

	! !


!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 00:45:40'!
test05CuandoEstaApuntandoAlNorteYSeMandaUnComandoFAvanzaUnPasoEnDireccionY

	| marsRoverUnPasoAdeltante |
	marsRoverUnPasoAdeltante := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'f'.
	
	self assert: (marsRoverUnPasoAdeltante estaEnLaPosicionX: 0 Y: 1).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 00:46:47'!
test06CuandoEstaApuntandoAlNorteYSeMandaUnComandoBRetrocedeUnPasoEnDireccionY

	| marsRoverUnPasoAtras |
	marsRoverUnPasoAtras := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'b'.
	
	self assert: (marsRoverUnPasoAtras estaEnLaPosicionX: 0 Y: -1)
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 00:49:36'!
test07CuandoEstaApuntandoAlSurYSeMandaUnComandoFRetrocedeUnPasoEnDireccionY

	| marsRoverUnPasoDelante |
	marsRoverUnPasoDelante := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'f'.
	
	self assert: (marsRoverUnPasoDelante estaEnLaPosicionX: 0 Y: -1)! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 00:47:53'!
test08CuandoEstaApuntandoAlSurYSeMandaUnComandoBAvanzaUnPasoEnDireccionY

	| marsRoverUnPasoAtras |
	marsRoverUnPasoAtras := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'b'.
	
	self assert: (marsRoverUnPasoAtras estaEnLaPosicionX: 0 Y: 1)! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 01:09:00'!
test09CuandoEstaApuntandoAlOesteYSeMandaUnComandoFRetrocedeUnPasoEnDireccionX

	| marsRoverUnPasoAdeltante |
	marsRoverUnPasoAdeltante := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'f'.
	
	self assert: (marsRoverUnPasoAdeltante estaEnLaPosicionX: -1 Y: 0).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/15/2021 01:11:23'!
test10CuandoEstaApuntandoAlOesteYSeMandaUnComandoBAvanzaUnPasoEnDireccionX

	| marsRoverUnPasoDetras |
	marsRoverUnPasoDetras := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'b'.
	
	self assert: (marsRoverUnPasoDetras estaEnLaPosicionX: 1 Y: 0).! !


!classDefinition: #DireccionesDelMarsRover category: 'Ejercicio-MarsRovers'!
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


!classDefinition: #Este category: 'Ejercicio-MarsRovers'!
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


!classDefinition: #Norte category: 'Ejercicio-MarsRovers'!
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


!classDefinition: #Oeste category: 'Ejercicio-MarsRovers'!
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


!classDefinition: #Sur category: 'Ejercicio-MarsRovers'!
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


!MarsRover methodsFor: 'donde apunta' stamp: 'RV 11/15/2021 00:32:12'!
esAlEsteAQuienApunta
	^ direccionCardinal esEste .! !

!MarsRover methodsFor: 'donde apunta' stamp: 'RV 11/15/2021 00:57:06'!
esAlNorteAQuienApunta
	^ direccionCardinal esNorte .! !

!MarsRover methodsFor: 'donde apunta' stamp: 'RV 11/15/2021 00:32:06'!
esAlOesteAQuienApunta
	^ direccionCardinal esOeste .! !

!MarsRover methodsFor: 'donde apunta' stamp: 'RV 11/15/2021 00:57:17'!
esAlSurAQuienApunta
	^ direccionCardinal esSur.! !


!MarsRover methodsFor: 'comandos de movimiento' stamp: 'RV 11/15/2021 00:32:30'!
recibirComando: unaListaDeComandos
	direccionCardinal apuntadaPor: self procesarComandos: unaListaDeComandos .! !


!MarsRover methodsFor: 'private' stamp: 'RV 11/15/2021 01:07:32'!
desdeElEsteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (1@0).
		]. 
! !

!MarsRover methodsFor: 'private' stamp: 'RV 11/15/2021 01:06:43'!
desdeElNorteProcesar: unaListaDeComandos 
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY :=  posicionXY + (0@-1).
		]! !

!MarsRover methodsFor: 'private' stamp: 'RV 11/15/2021 01:07:57'!
desdeElOesteProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (-1@0)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (-1@0).
		]. 
! !

!MarsRover methodsFor: 'private' stamp: 'RV 11/15/2021 00:19:44'!
desdeElSurProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY - (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := posicionXY - (0@-1).
		]. 
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !
