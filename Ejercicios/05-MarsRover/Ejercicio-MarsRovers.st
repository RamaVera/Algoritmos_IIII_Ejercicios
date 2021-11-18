!classDefinition: #TestMarsRover category: 'Ejercicio-MarsRovers'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: 'marsRoversEnElOrigenApuntandoAlNorte marsRoversEnElOrigenApuntandoAlSur marsRoversEnElOrigenApuntandoAlOeste marsRoversEnElOrigenApuntandoAlEste comandoIncorrecto'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!TestMarsRover methodsFor: 'set up' stamp: 'AMV 11/17/2021 10:16:53'!
setUp
	marsRoversEnElOrigenApuntandoAlNorte := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: $N.
	marsRoversEnElOrigenApuntandoAlSur := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: $S.
	marsRoversEnElOrigenApuntandoAlOeste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: $O.
	marsRoversEnElOrigenApuntandoAlEste := MarsRover comenzarEnLaPosicionX: 0 yEnLaPosicionY: 0 apuntadoAUnaDireccionCardinal: $E.
	
	comandoIncorrecto := 't'! !


!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:44:43'!
test01ElMarsRoversComienzaEnUnaPosicionDefinida
	
	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX:0 Y:0).! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/15/2021 00:38:15'!
test02ElMarsRoversNoComienzaEnUnaPosicionDiferenteALaDefinida

	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX: 2 Y: 6).
	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'AMV 11/17/2021 11:28:19'!
test03ElMarsRoversComienzaApuntandoALaDireccionDefinida

	self assert: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: $N).	! !

!TestMarsRover methodsFor: 'test - inicializacion' stamp: 'RV 11/18/2021 13:30:46'!
test04ElMarsRoversNoComienzaApuntandoAUnaDireccionNoDefinida
	
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: $S).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: $E).
	self deny: (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: $O).
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

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:32:28'!
test13CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionIzquierdaTerminaApuntandoAlOeste

	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'l' termineApuntandoAl: $O.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:32:52'!
test14CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionDerechaTerminaApuntandoAlEste

	
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'r' termineApuntandoAl: $E.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:33:08'!
test15CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlEste

	
	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'l' termineApuntandoAl: $E.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:33:24'!
test16CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlOeste

	
	self verificarQue: marsRoversEnElOrigenApuntandoAlSur alRecibirElComando: 'r' termineApuntandoAl: $O.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:33:49'!
test17CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlSur

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'l' termineApuntandoAl: $S.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:34:05'!
test18CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlNorte

	self verificarQue: marsRoversEnElOrigenApuntandoAlOeste alRecibirElComando: 'r' termineApuntandoAl: $N.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:34:24'!
test19CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlNorte

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'l' termineApuntandoAl: $N.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 13:34:39'!
test20CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlSur

	self verificarQue: marsRoversEnElOrigenApuntandoAlEste alRecibirElComando: 'r' termineApuntandoAl: $S.! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 14:04:45'!
test21CuandoSeMandaUnComandoErroneoApuntadoAlNorteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlNorte recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | 
				anErrorMessage messageText = MarsRover enviarMensajeDeErrorDeComandoInvalido 
	].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 14:05:01'!
test22CuandoSeMandaUnComandoErroneoApuntadoAlSurSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlSur recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | 
				anErrorMessage messageText = MarsRover enviarMensajeDeErrorDeComandoInvalido 
	].! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 14:05:09'!
test23CuandoSeMandaUnComandoErroneoApuntadoAlOesteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlOeste recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | 
				anErrorMessage messageText = MarsRover enviarMensajeDeErrorDeComandoInvalido 
	].! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'RV 11/18/2021 14:05:25'!
test24CuandoSeMandaUnComandoErroneoApuntadoAlEsteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlEste recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | 
				anErrorMessage messageText = MarsRover enviarMensajeDeErrorDeComandoInvalido 
	].! !


!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'RV 11/18/2021 13:37:18'!
test25CuandoEstaApuntandoAlNorteYSeMandaDosComandosQueSeAnulanEntreSiTerminaEnLaMismaPosicionApuntandoALaMismaDireccionCardinal
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'fb'  termineEnLaPosicionX: 0 Y: 0 yApuntandoHacia: $N.
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'lr'  termineEnLaPosicionX: 0 Y: 0 yApuntandoHacia: $N.! !

!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'RV 11/18/2021 13:42:32'!
test26PasarleTodosLosPosiblesMovimientosEnUnaListaDeComandosTerminaEnLaPosicionYDireccionCorrecta
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'frbl'  termineEnLaPosicionX: -1 Y: 1 yApuntandoHacia: $N.! !

!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'RV 11/18/2021 14:02:56'!
test27AlPasarleUnComandoInvalidoDentroDeUnaListaDeComandosEnviaUnMensajeDeComandoInvalidoEIgnoraLosSiguientesComandosYQuedaApuntandoSegunLaListaDeComandosAnterior
self should: [marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'frblxff'  ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | 
				self assert: anErrorMessage messageText = MarsRover enviarMensajeDeErrorDeComandoInvalido.
				self assert: 	(marsRoversEnElOrigenApuntandoAlNorte estaEnLaPosicionX: -1 Y: 1).
				self assert:  (marsRoversEnElOrigenApuntandoAlNorte estaApuntandoALaDireccionCardinal: $N).
			].! !


!TestMarsRover methodsFor: 'support' stamp: 'AMV 11/17/2021 11:33:23'!
verificarQue: unMarsRover alRecibirElComando: unComando termineApuntandoAl: unaDireccionCardinal

	| unMarsRoverRotado |
	unMarsRoverRotado := unMarsRover recibirComando: unComando.
	self assert: (unMarsRoverRotado estaApuntandoALaDireccionCardinal: unaDireccionCardinal).! !

!TestMarsRover methodsFor: 'support' stamp: 'AMV 11/16/2021 20:11:15'!
verificarQue: unMarsRover alRecibirElComando: unComando termineEnLaPosicionX: posicionX Y: posicionY

	| unMarsRoverCorrido |
	unMarsRoverCorrido := unMarsRover recibirComando: unComando.
	
	self assert: (unMarsRoverCorrido estaEnLaPosicionX: posicionX Y: posicionY).! !

!TestMarsRover methodsFor: 'support' stamp: 'AMV 11/17/2021 11:34:09'!
verificarQue: unMarsRover alRecibirElComando: unComando termineEnLaPosicionX: posicionX Y: posicionY yApuntandoHacia: unaDireccionCardinal

	| unMarsRoverCorrido |
	unMarsRoverCorrido := unMarsRover recibirComando: unComando.
	
	self assert: (unMarsRoverCorrido estaEnLaPosicionX: posicionX Y: posicionY).
	self assert: (unMarsRoverCorrido estaApuntandoALaDireccionCardinal: unaDireccionCardinal).! !


!classDefinition: #MarsRover category: 'Ejercicio-MarsRovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionXY sistemaDeGeolocalizacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!MarsRover methodsFor: 'initialize' stamp: 'RV 11/18/2021 13:54:03'!
comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalIncial 
	posicionXY :=  posicionXinicial @ posicionYinicial.
	sistemaDeGeolocalizacion := SistemaDeGeolocalizacionDelMarsRover seConfiguraSegunLa: direccionCardinalIncial.! !


!MarsRover methodsFor: 'donde esta' stamp: 'RV 11/15/2021 00:53:13'!
estaEnLaPosicionX: unaPosicionEnX Y: unaPosicionEnY 
	^ posicionXY = ( unaPosicionEnX @ unaPosicionEnY)! !


!MarsRover methodsFor: 'donde apunta' stamp: 'RV 11/18/2021 13:57:46'!
estaApuntandoALaDireccionCardinal: unaDireccionCardinal	
	^sistemaDeGeolocalizacion class correspondeA: unaDireccionCardinal ! !


!MarsRover methodsFor: 'comandos' stamp: 'RV 11/18/2021 14:01:19'!
procesarComando: unComando
		unComando = $f ifTrue: [
			^sistemaDeGeolocalizacion avanzarElMarsRover: self.
		].
		unComando = $b ifTrue: [
			^sistemaDeGeolocalizacion retrocederElMarsRover: self.
		].
		unComando = $l ifTrue: [
			^sistemaDeGeolocalizacion rotar90GradosALaIzquierdaElMarsRover: self
		].
		unComando = $r ifTrue: [
			^sistemaDeGeolocalizacion rotar90GradosALaDerechaElMarsRover: self
		].
		self error: self class enviarMensajeDeErrorDeComandoInvalido.
		! !

!MarsRover methodsFor: 'comandos' stamp: 'RV 11/18/2021 12:16:51'!
recibirComando: unaListaDeComandos
	unaListaDeComandos do: [ :unComando |
		self procesarComando: unComando.
	]! !


!MarsRover methodsFor: 'movimientos' stamp: 'RV 11/18/2021 13:28:20'!
apuntarHaciaElEste
	sistemaDeGeolocalizacion := SistemaDeGeolocalizacionApuntandoAlEste new! !

!MarsRover methodsFor: 'movimientos' stamp: 'RV 11/18/2021 13:56:37'!
apuntarHaciaElNorte
	sistemaDeGeolocalizacion := SistemaDeGeolocalizacionApuntandoAlNorte new! !

!MarsRover methodsFor: 'movimientos' stamp: 'RV 11/18/2021 13:56:24'!
apuntarHaciaElOeste
	sistemaDeGeolocalizacion := SistemaDeGeolocalizacionApuntandoAlOeste new! !

!MarsRover methodsFor: 'movimientos' stamp: 'RV 11/18/2021 13:29:05'!
apuntarHaciaElSur
	sistemaDeGeolocalizacion := SistemaDeGeolocalizacionApuntandoAlSur new! !

!MarsRover methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:49:47'!
moverHaciaElEste
	posicionXY := posicionXY + (1@0)
! !

!MarsRover methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:26'!
moverHaciaElNorte
	posicionXY := posicionXY + (0@1)! !

!MarsRover methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:15'!
moverHaciaElOeste
	posicionXY := posicionXY + (-1@0)! !

!MarsRover methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:01'!
moverHaciaElSur
	posicionXY := posicionXY + (0@-1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 14:01:19'!
enviarMensajeDeErrorDeComandoInvalido
	^ 'Comando Invalido'! !


!classDefinition: #SistemaDeGeolocalizacionDelMarsRover category: 'Ejercicio-MarsRovers'!
Object subclass: #SistemaDeGeolocalizacionDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!SistemaDeGeolocalizacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:38:23'!
avanzarElMarsRover: unMarsRover
	self subclassResponsibility ! !

!SistemaDeGeolocalizacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:48:37'!
retrocederElMarsRover: unMarsRover
	self subclassResponsibility ! !

!SistemaDeGeolocalizacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:00'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	self subclassResponsibility ! !

!SistemaDeGeolocalizacionDelMarsRover methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:48:54'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeGeolocalizacionDelMarsRover class' category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionDelMarsRover class
	instanceVariableNames: ''!

!SistemaDeGeolocalizacionDelMarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:56:53'!
correspondeA: unaDireccionCardinal
	self subclassResponsibility! !

!SistemaDeGeolocalizacionDelMarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:54:36'!
seConfiguraSegunLa: direccionCardinalIncial
	
	| subclasesDeDireccionDelMarsRover direccionASerDefinida |
	
	subclasesDeDireccionDelMarsRover := self subclasses.	
	direccionASerDefinida := subclasesDeDireccionDelMarsRover detect: [:cadaClase |
		cadaClase correspondeA: direccionCardinalIncial
	].
	
	^ direccionASerDefinida new! !


!classDefinition: #SistemaDeGeolocalizacionApuntandoAlEste category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionDelMarsRover subclass: #SistemaDeGeolocalizacionApuntandoAlEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!SistemaDeGeolocalizacionApuntandoAlEste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:49:47'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElEste! !

!SistemaDeGeolocalizacionApuntandoAlEste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:51:31'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElOeste ! !

!SistemaDeGeolocalizacionApuntandoAlEste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:02:11'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElSur ! !

!SistemaDeGeolocalizacionApuntandoAlEste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:58:38'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElNorte! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeGeolocalizacionApuntandoAlEste class' category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionApuntandoAlEste class
	instanceVariableNames: ''!

!SistemaDeGeolocalizacionApuntandoAlEste class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:56:01'!
correspondeA: unaDireccionCardinal
	^unaDireccionCardinal = $E! !


!classDefinition: #SistemaDeGeolocalizacionApuntandoAlNorte category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionDelMarsRover subclass: #SistemaDeGeolocalizacionApuntandoAlNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!SistemaDeGeolocalizacionApuntandoAlNorte methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:26'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElNorte! !

!SistemaDeGeolocalizacionApuntandoAlNorte methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:51:59'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElSur ! !

!SistemaDeGeolocalizacionApuntandoAlNorte methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:02:22'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElEste ! !

!SistemaDeGeolocalizacionApuntandoAlNorte methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:00:13'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElOeste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeGeolocalizacionApuntandoAlNorte class' category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionApuntandoAlNorte class
	instanceVariableNames: ''!

!SistemaDeGeolocalizacionApuntandoAlNorte class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:55:37'!
correspondeA: unaDireccionCardinal
	^unaDireccionCardinal = $N! !


!classDefinition: #SistemaDeGeolocalizacionApuntandoAlOeste category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionDelMarsRover subclass: #SistemaDeGeolocalizacionApuntandoAlOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!SistemaDeGeolocalizacionApuntandoAlOeste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:15'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElOeste! !

!SistemaDeGeolocalizacionApuntandoAlOeste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:52:15'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElEste ! !

!SistemaDeGeolocalizacionApuntandoAlOeste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:02:33'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElNorte ! !

!SistemaDeGeolocalizacionApuntandoAlOeste methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:00:26'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElSur ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeGeolocalizacionApuntandoAlOeste class' category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionApuntandoAlOeste class
	instanceVariableNames: ''!

!SistemaDeGeolocalizacionApuntandoAlOeste class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:55:50'!
correspondeA: unaDireccionCardinal
	^unaDireccionCardinal = $O! !


!classDefinition: #SistemaDeGeolocalizacionApuntandoAlSur category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionDelMarsRover subclass: #SistemaDeGeolocalizacionApuntandoAlSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!SistemaDeGeolocalizacionApuntandoAlSur methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:50:01'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElSur! !

!SistemaDeGeolocalizacionApuntandoAlSur methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 10:52:29'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElNorte! !

!SistemaDeGeolocalizacionApuntandoAlSur methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:02:41'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElOeste ! !

!SistemaDeGeolocalizacionApuntandoAlSur methodsFor: 'movimientos' stamp: 'AMV 11/17/2021 11:00:35'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElEste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SistemaDeGeolocalizacionApuntandoAlSur class' category: 'Ejercicio-MarsRovers'!
SistemaDeGeolocalizacionApuntandoAlSur class
	instanceVariableNames: ''!

!SistemaDeGeolocalizacionApuntandoAlSur class methodsFor: 'as yet unclassified' stamp: 'RV 11/18/2021 13:56:13'!
correspondeA: unaDireccionCardinal
	^unaDireccionCardinal = $S! !
