!classDefinition: #DireccionesDelMarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #DireccionesDelMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:38:23'!
avanzarElMarsRover: unMarsRover
	self subclassResponsibility ! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:48:37'!
retrocederElMarsRover: unMarsRover
	self subclassResponsibility ! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:00'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	self subclassResponsibility ! !

!DireccionesDelMarsRover methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:57:29'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionesDelMarsRover class' category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover class
	instanceVariableNames: ''!

!DireccionesDelMarsRover class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:11:33'!
aQueCorresponda: direccionCardinalIncial
	
	| subclasesDeDireccionDelMarsRover claseASerInstanciada |
	
	subclasesDeDireccionDelMarsRover := self subclasses.	
	claseASerInstanciada := subclasesDeDireccionDelMarsRover detect: [:cadaClase |
		cadaClase correspondeA: direccionCardinalIncial
	].
	
	^ claseASerInstanciada new! !

!DireccionesDelMarsRover class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:12:23'!
correspondeA: direccionCardinalIncial
	self subclassResponsibility! !


!classDefinition: #DireccionEste category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:49:47'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElEste! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:51:31'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElOeste ! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:11'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElSur ! !

!DireccionEste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:58:38'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElNorte! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionEste class' category: #'Ejercicio-MarsRovers'!
DireccionEste class
	instanceVariableNames: ''!

!DireccionEste class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:12:57'!
correspondeA: direccionCardinalIncial
	^direccionCardinalIncial = $E! !


!classDefinition: #DireccionNorte category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:50:26'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElNorte! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:51:59'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElSur ! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:22'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElEste ! !

!DireccionNorte methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:00:13'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElOeste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionNorte class' category: #'Ejercicio-MarsRovers'!
DireccionNorte class
	instanceVariableNames: ''!

!DireccionNorte class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:13:09'!
correspondeA: direccionCardinalIncial
	^direccionCardinalIncial = $N! !


!classDefinition: #DireccionOeste category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:50:15'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElOeste! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:52:15'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElEste ! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:33'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElNorte ! !

!DireccionOeste methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:00:26'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElSur ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionOeste class' category: #'Ejercicio-MarsRovers'!
DireccionOeste class
	instanceVariableNames: ''!

!DireccionOeste class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:13:13'!
correspondeA: direccionCardinalIncial
	^direccionCardinalIncial = $O! !


!classDefinition: #DireccionSur category: #'Ejercicio-MarsRovers'!
DireccionesDelMarsRover subclass: #DireccionSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:50:01'!
avanzarElMarsRover: unMarsRover
	unMarsRover moverHaciaElSur! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:52:29'!
retrocederElMarsRover: unMarsRover
	unMarsRover moverHaciaElNorte! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:02:41'!
rotar90GradosALaDerechaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElOeste ! !

!DireccionSur methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 11:00:35'!
rotar90GradosALaIzquierdaElMarsRover: unMarsRover
	unMarsRover apuntarHaciaElEste ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DireccionSur class' category: #'Ejercicio-MarsRovers'!
DireccionSur class
	instanceVariableNames: ''!

!DireccionSur class methodsFor: 'as yet unclassified' stamp: 'AMV 11/17/2021 10:13:19'!
correspondeA: direccionCardinalIncial
	^direccionCardinalIncial = $S! !


!classDefinition: #MarsRover category: #'Ejercicio-MarsRovers'!
Object subclass: #MarsRover
	instanceVariableNames: 'posicionXY direccionCardinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio-MarsRovers'!

!MarsRover methodsFor: 'initialize' stamp: 'AMV 11/17/2021 10:04:58'!
comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalIncial 
	posicionXY :=  posicionXinicial @ posicionYinicial.
	direccionCardinal := DireccionesDelMarsRover aQueCorresponda: direccionCardinalIncial.! !


!MarsRover methodsFor: 'donde esta' stamp: 'RV 11/15/2021 00:53:13'!
estaEnLaPosicionX: unaPosicionEnX Y: unaPosicionEnY 
	^ posicionXY = ( unaPosicionEnX @ unaPosicionEnY)! !


!MarsRover methodsFor: 'donde apunta' stamp: 'AMV 11/17/2021 11:28:09'!
estaApuntandoALaDireccionCardinal: unaDireccionCardinal
	
	^direccionCardinal class correspondeA: unaDireccionCardinal ! !


!MarsRover methodsFor: 'comandos de movimiento' stamp: 'AMV 11/17/2021 11:07:56'!
recibirComando: unaListaDeComandos
	unaListaDeComandos do: [ :unComando |
		unComando = $f ifTrue: [
			direccionCardinal avanzarElMarsRover: self.
		].
		unComando = $b ifTrue: [
			direccionCardinal retrocederElMarsRover: self.
		].
		unComando = $l ifTrue: [
			direccionCardinal  rotar90GradosALaIzquierdaElMarsRover: self
		].
		unComando = $r ifTrue: [
			direccionCardinal rotar90GradosALaDerechaElMarsRover: self
		].
		(unComando ~= $f and: unComando ~= $b and: unComando ~= $r and: unComando ~= $l) ifTrue: [self error: 'Comando in valido'].
		
		"comando := procesarComando unComando."
		"proceso el comando y sabemos que accion tiene que hacer comando := 'avanzar'  'retroceder' 'rodarizq' 'rotarder' "
		"direccionCardinal comando"
	]! !


!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:59:45'!
apuntarHaciaElEste
	direccionCardinal := DireccionEste new! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:59:12'!
apuntarHaciaElNorte
	direccionCardinal := DireccionNorte new! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:59:52'!
apuntarHaciaElOeste
	direccionCardinal := DireccionOeste new! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:59:37'!
apuntarHaciaElSur
	direccionCardinal := DireccionSur new! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:49:47'!
moverHaciaElEste
	posicionXY := posicionXY + (1@0)
! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:50:26'!
moverHaciaElNorte
	posicionXY := posicionXY + (0@1)! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:50:15'!
moverHaciaElOeste
	posicionXY := posicionXY + (-1@0)! !

!MarsRover methodsFor: 'private' stamp: 'AMV 11/17/2021 10:50:01'!
moverHaciaElSur
	posicionXY := posicionXY + (0@-1)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Ejercicio-MarsRovers'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'as yet unclassified' stamp: 'RV 11/14/2021 16:35:46'!
comenzarEnLaPosicionX: posicionXinicial yEnLaPosicionY: posicionYinicial apuntadoAUnaDireccionCardinal: direccionCardinalInicial     
	^self new comenzarEnX: posicionXinicial yEnY: posicionYinicial apuntandoALaDireccionCardinal: direccionCardinalInicial.! !


!classDefinition: #TestMarsRover category: #'Ejercicio-MarsRovers'!
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

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:25:59'!
test13CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionIzquierdaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $O).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:26:20'!
test14CuandoEstaApuntandoAlNorteYSeMandaUnComandoDeRotacionDerechaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlNorte recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $E).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:26:28'!
test15CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlEste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $E).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:26:39'!
test16CuandoEstaApuntandoAlSurYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlOeste

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlSur recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $O).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:26:52'!
test17CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $S).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:27:01'!
test18CuandoEstaApuntandoAlOesteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlOeste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $N).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:27:09'!
test19CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoIzquierdaTerminaApuntandoAlNorte

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'l'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $N).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 11:27:14'!
test20CuandoEstaApuntandoAlEsteYSeMandaUnComandoDeRotacionoDerechaTerminaApuntandoAlSur

	| unMarsRover |
	
	unMarsRover := marsRoversEnElOrigenApuntandoAlEste recibirComando: 'r'.
	
	self assert: (unMarsRover estaApuntandoALaDireccionCardinal: $S).! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 10:17:31'!
test21CuandoSeMandaUnComandoErroneoApuntadoAlNorteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlNorte recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 10:17:26'!
test22CuandoSeMandaUnComandoErroneoApuntadoAlSurSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlSur recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 10:17:21'!
test23CuandoSeMandaUnComandoErroneoApuntadoAlOesteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlOeste recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !

!TestMarsRover methodsFor: 'test - un comando' stamp: 'AMV 11/17/2021 10:17:06'!
test24CuandoSeMandaUnComandoErroneoApuntadoAlEsteSeEnviaUnMensajeDeError

	self should: [marsRoversEnElOrigenApuntandoAlEste recibirComando: comandoIncorrecto ]  
		raise: Error 
			withExceptionDo: [:anErrorMessage | anErrorMessage = 'Comando invalido' ].
! !


!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'AMV 11/17/2021 11:35:09'!
test25
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'fb'  termineEnLaPosicionX: 0 Y: 0 yApuntandoHacia: $N.! !

!TestMarsRover methodsFor: 'test - mas de un comando' stamp: 'AMV 11/17/2021 11:36:05'!
test26
	self verificarQue: marsRoversEnElOrigenApuntandoAlNorte alRecibirElComando: 'fbllr'  termineEnLaPosicionX: 0 Y: 0 yApuntandoHacia: $O.! !


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
