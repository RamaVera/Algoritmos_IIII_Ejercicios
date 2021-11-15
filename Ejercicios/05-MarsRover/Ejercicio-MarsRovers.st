!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRovers'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRoversEnElOrigenApuntandoAlNorte'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!TestMarsRover methodsFor: 'set up' stamp: 'RV 11/14/2021 16:45:22'!
setUp
	marsRoversEnElOrigenApuntandoAlNorte := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: #Norte ! !


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

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/14/2021 16:46:15'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: marsRoversEnElOrigenApuntandoAlNorte direccion = #Norte.

	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/14/2021 16:46:23'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: marsRoversEnElOrigenApuntandoAlNorte direccion = #Sur.

	! !


!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/14/2021 16:56:49'!
test05

	| marsRoverUnPasoAdeltante |
	marsRoverUnPasoAdeltante := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'f'.
	
	self assert: marsRoverUnPasoAdeltante posicionX = 0.
	self assert: marsRoverUnPasoAdeltante posicionY = 1.
	self assert: marsRoverUnPasoAdeltante direccion = #Norte.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/14/2021 16:57:45'!
test06

	| marsRoverUnPasoAtras |
	marsRoverUnPasoAtras := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'b'.
	
	self assert: marsRoverUnPasoAtras posicionX = 0.
	self assert: marsRoverUnPasoAtras posicionY = -1.
	self assert: marsRoverUnPasoAtras direccion = #Norte.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/14/2021 16:58:28'!
test07

	| marsRoverRotadoALaIzquierda |
	marsRoverRotadoALaIzquierda := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: marsRoverRotadoALaIzquierda posicionX = 0.
	self assert: marsRoverRotadoALaIzquierda posicionY = 0.
	self assert: marsRoverRotadoALaIzquierda direccion = #Oeste.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/14/2021 17:01:49'!
test08

	| marsRoverRotadoALaDerecha |
	marsRoverRotadoALaDerecha := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: marsRoverRotadoALaDerecha posicionX = 0.
	self assert: marsRoverRotadoALaDerecha posicionY = 0.
	self assert: marsRoverRotadoALaDerecha direccion = #Este.! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionXY apuntoAlPuntoCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:36:23'!
comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalIncial 
	posicionXY :=  posicionXinicial @ posicionYinicial.
	apuntoAlPuntoCardinal := direccionCardinalIncial.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:27:17'!
direccion
	^apuntoAlPuntoCardinal! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:18:41'!
posicionX
	^posicionXY x .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:18:48'!
posicionY
	^posicionXY y ! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 17:02:07'!
recibirComando: unaListaDeComandos
	unaListaDeComandos = 'f' ifTrue:[
		posicionXY := 0@1.
		].
	unaListaDeComandos = 'b' ifTrue:[
		posicionXY := 0@-1.
		].
	unaListaDeComandos = 'l' ifTrue: [
		apuntoAlPuntoCardinal := #Oeste.
		].
	unaListaDeComandos = 'r' ifTrue: [
		apuntoAlPuntoCardinal := #Este.
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !
