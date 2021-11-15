!classDefinition: #TestMarsRover category: #'Ejercicio-MarsRovers'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRoversEnElOrigenApuntandoAlNorte marsRoversEnElOrigenApuntandoAlSur'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!TestMarsRover methodsFor: 'set up' stamp: 'AMV 11/14/2021 19:31:22'!
setUp
	marsRoversEnElOrigenApuntandoAlNorte := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Norte new.
	marsRoversEnElOrigenApuntandoAlSur := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: Sur new.! !


!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/14/2021 16:45:47'!
test01ElMarsRoversComienzaEnUnaPosicionDefinida
	
	self assert: marsRoversEnElOrigenApuntandoAlNorte posicionX = 0.
	self assert: marsRoversEnElOrigenApuntandoAlNorte posicionY = 0.

	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/14/2021 16:46:03'!
test02ElMarsRoversNoComienzaEnUnaPosicionDiferenteALaDefinida

	self deny: marsRoversEnElOrigenApuntandoAlNorte posicionX = 5.
	self deny: marsRoversEnElOrigenApuntandoAlNorte posicionY = -2.

	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/14/2021 19:39:35'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: marsRoversEnElOrigenApuntandoAlNorte direccion esNorte.

	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/14/2021 19:31:33'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: marsRoversEnElOrigenApuntandoAlNorte direccion = Sur new.

	! !


!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/14/2021 18:54:32'!
atest07

	| marsRoverRotadoALaIzquierda |
	marsRoverRotadoALaIzquierda := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: marsRoverRotadoALaIzquierda posicionX = 0.
	self assert: marsRoverRotadoALaIzquierda posicionY = 0.
	self assert: marsRoverRotadoALaIzquierda direccion = #Oeste.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/14/2021 18:54:36'!
atest08

	| marsRoverRotadoALaDerecha |
	marsRoverRotadoALaDerecha := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: marsRoverRotadoALaDerecha posicionX = 0.
	self assert: marsRoverRotadoALaDerecha posicionY = 0.
	self assert: marsRoverRotadoALaDerecha direccion = #Este.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/14/2021 19:40:42'!
test05CuandoEstaApuntandoAlNorteYSeMandaUnComandoFAvanzaUnPasoEnDireccionY

	| marsRoverUnPasoAdeltante |
	marsRoverUnPasoAdeltante := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'f'.
	
	self assert: marsRoverUnPasoAdeltante posicionX = 0.
	self assert: marsRoverUnPasoAdeltante posicionY = 1.
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/14/2021 19:45:04'!
test06CuandoEstaApuntandoAlNorteYSeMandaUnComandoBRetrocedeUnPasoEnDireccionY

	| marsRoverUnPasoAtras |
	marsRoverUnPasoAtras := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'b'.
	
	self assert: marsRoverUnPasoAtras posicionX = 0.
	self assert: marsRoverUnPasoAtras posicionY = -1.
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/14/2021 19:45:37'!
test07CuandoEstaApuntandoAlSurYSeMandaUnComandoFRetrocedeUnPasoEnDireccionY

	| marsRoverUnPasoAtras |
	marsRoverUnPasoAtras := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'f'.
	
	self assert: marsRoverUnPasoAtras posicionX = 0.
	self assert: marsRoverUnPasoAtras posicionY = -1.! !


!classDefinition: #MarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionXY direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:51:09'!
comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalIncial 
	posicionXY :=  posicionXinicial @ posicionYinicial.
	direccionCardinal := direccionCardinalIncial.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:44:38'!
desdeElNorteProcesar: unaListaDeComandos 
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY + (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := 0@-1.
		].! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:47:21'!
desdeElSurProcesar: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := posicionXY - (0@1)
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := 0@-1.
		]. 
! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:51:09'!
direccion
	^direccionCardinal! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:18:41'!
posicionX
	^posicionXY x .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:18:48'!
posicionY
	^posicionXY y ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
recibirComando: unaListaDeComandos
	direccionCardinal apuntadaPor: self procesarComandos: unaListaDeComandos .

"
	apuntoAlPuntoCardinal = #Norte ifTrue: [
		unaListaDeComandos = 'f' ifTrue:[
			posicionXY := posicionXY + (0@1)
			].
		unaListaDeComandos = 'b' ifTrue:[
			posicionXY := 0@-1.
			].
		].


	apuntoAlPuntoCardinal = #Sur ifTrue: [
		unaListaDeComandos = 'f' ifTrue:[
			posicionXY := posicionXY - (0@1)
			].
		unaListaDeComandos = 'b' ifTrue:[
			posicionXY := 0@-1.
			].
		].
"! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !


!classDefinition: #PuntosCardinales category: #'Ejercicio-MarsRovers'!
Object subclass: #PuntosCardinales
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!PuntosCardinales methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self subclassResponsibility ! !


!classDefinition: #Este category: #'Ejercicio-MarsRovers'!
PuntosCardinales subclass: #Este
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Este methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self shouldBeImplemented ! !


!classDefinition: #Norte category: #'Ejercicio-MarsRovers'!
PuntosCardinales subclass: #Norte
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
PuntosCardinales subclass: #Oeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Oeste methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	self shouldBeImplemented ! !


!classDefinition: #Sur category: #'Ejercicio-MarsRovers'!
PuntosCardinales subclass: #Sur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!Sur methodsFor: 'as yet unclassified' stamp: 'AMV 11/14/2021 19:55:45'!
apuntadaPor: unMarsRover procesarComandos: unaListaDeComandos 
	unMarsRover desdeElSurProcesar: unaListaDeComandos ! !
