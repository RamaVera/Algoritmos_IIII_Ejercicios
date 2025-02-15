!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'interaccionesDeCarolina frasesADesconocidos frasesAPrometedores opinionesDeCarolina'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 10/3/2021 19:28:28'!
interactuarCon: unPj
	| respuestaAUnPj |
	opinionesDeCarolina at: unPj ifAbsentPut: [ 'Desconocido' ].
	self reiniciarInteraccionSiElPuebloCambioDeOpinionSobre: unPj.	
	self opinarComoElPuebloSobre: unPj.
	self recordarInteraccionCon: unPj.
	respuestaAUnPj := self responderSegunOpinionCon: unPj.	
	(self siSeCompletaronLosDialogosCon: unPj) ifTrue:[
		self influenciarPositivamenteAlPuebloSobre: unPj.].
	
	^ respuestaAUnPj
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 9/30/2021 11:26:06'!
olvidarInteracciones
	interaccionesDeCarolina := Dictionary new! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 9/30/2021 11:25:29'!
olvidarOpiniones
	opinionesDeCarolina := Dictionary new! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 9/30/2021 11:26:06'!
decirFraseAlDesconocido: unPj
		^frasesADesconocidos at: ( (interaccionesDeCarolina at: unPj) min: frasesADesconocidos size)	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 9/30/2021 11:26:06'!
decirFraseAlPrometedor: unPj
		^frasesAPrometedores at: ( ( interaccionesDeCarolina at: unPj ) min: frasesAPrometedores size )	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:02:57'!
influenciarPositivamenteAlPuebloSobre: unPj
		PueblodeRivenwood calificarComoPrometedorA: unPj.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 9/30/2021 11:24:10'!
opinarComoElPuebloSobre: unPj
	^ opinionesDeCarolina at: unPj put: (self preguntarAlPuebloQueOpinaSobre: unPj ).
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 20:05:58'!
preguntarAlPuebloQueOpinaSobre: unPj	
	^PueblodeRivenwood queOpinanSobre: unPj.! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:08:49'!
recordarInteraccionCon: unPj
	|cantidadDeInteracciones|
	cantidadDeInteracciones := interaccionesDeCarolina at: unPj ifAbsent: [ 0 ].
	interaccionesDeCarolina at: unPj put: cantidadDeInteracciones + 1.
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:20:14'!
reiniciarInteraccionSiElPuebloCambioDeOpinionSobre: unPj
	| opinionDelPueblo |	
	
	opinionDelPueblo := self preguntarAlPuebloQueOpinaSobre: unPj.
	
	opinionDelPueblo = (opinionesDeCarolina at: unPj ) ifFalse: [ 
		interaccionesDeCarolina at: unPj put: 0]
	
	
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 18:57:29'!
responderSegunOpinionCon: unPj.
	
	((opinionesDeCarolina at: unPj)  = 'Desconocido')	 ifTrue: [		^ self decirFraseAlDesconocido: unPj].
	((opinionesDeCarolina at: unPj)  = 'Prometedor' ) ifTrue: [^ self decirFraseAlPrometedor: unPj		  ].
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:02:04'!
siSeCompletaronLosDialogosCon: unPj 
	^ (interaccionesDeCarolina at: unPj) >= (frasesADesconocidos size)! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'Rv 10/3/2021 19:29:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interaccionesDeCarolina := ((Dictionary new) add: (PjHamilton->3); add: (PjTirion->3); yourself).
	frasesADesconocidos := #('�Est�s enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicci�n, ven a verme' ).
	frasesAPrometedores := #('Salud aventurero!!' 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme' ).
	opinionesDeCarolina := ((Dictionary new) add: (PjHamilton->'Desconocido'); add: (PjTirion->'Desconocido'); yourself).! !


!classDefinition: #PjHamilton category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PjHamilton
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #PjTirion category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PjTirion
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Est�s enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ramiro99 9/29/2021 12:20:35'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeSkyrim ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ramiro99 9/29/2021 12:12:41'!
hamilton
	^ PjHamilton ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'ramiro99 9/29/2021 12:12:54'!
tirion
	^ PjTirion ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'AMV 9/30/2021 12:34:45'!
esVistoPorElPuebloComoPrometedor: unPj
	^(PueblodeRivenwood queOpinanSobre: unPj) = 'Prometedor'! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'RV 9/30/2021 12:51:18'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'RV 9/30/2021 12:51:32'!
hacerQueElGuardiaOlvideSusOpiniones
	TreborElGuardiaDeSkyrim olvidarOpiniones.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 10:22:04'!
hacerQueLaCuranderaOlvideSusInteracciones
	^ self carolinaLaCurandera olvidarInteracciones ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 11:24:51'!
hacerQueLaCuranderaOlvideSusOpiniones
	^ self carolinaLaCurandera olvidarOpiniones ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 11:27:28'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PueblodeRivenwood olvidarOpiniones ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 11:08:34'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PueblodeRivenwood calificarComoPrometedorA: PjHamilton ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'RV 9/30/2021 12:52:01'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueLaCuranderaOlvideSusOpiniones.
	self hacerQueElGuardiaOlvideSusOpiniones.
	self hacerQueElGuardiaOlvideSusInteracciones.
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'Rv 9/30/2021 10:22:04'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidarInteracciones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Alg�n problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Alg�n problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'ramiro99 9/29/2021 10:50:54'!
hamilton
	^ PjHamilton! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'ramiro99 9/29/2021 10:52:40'!
tirion
	^ PjTirion! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 10:49:51'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidarInteracciones.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 10:47:36'!
hacerQueElGuardiaOlvideSusOpiniones
	TreborElGuardiaDeSkyrim olvidarOpiniones! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'ramiro99 9/29/2021 13:07:02'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PueblodeRivenwood olvidarOpiniones ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'ramiro99 9/29/2021 13:09:02'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PueblodeRivenwood calificarComoPrometedorA: PjHamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'Rv 9/30/2021 10:50:31'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 
	self hacerQueElGuardiaOlvideSusOpiniones.
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PueblodeRivenwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PueblodeRivenwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PueblodeRivenwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PueblodeRivenwood class
	instanceVariableNames: 'opinionesDelPuebloSobreUnPj'!

!PueblodeRivenwood class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 12:59:47'!
calificarComoPrometedorA: unPj
	^ opinionesDelPuebloSobreUnPj at: unPj put: 'Prometedor'.
	! !

!PueblodeRivenwood class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 13:03:58'!
olvidarOpiniones
	 opinionesDelPuebloSobreUnPj := Dictionary new! !

!PueblodeRivenwood class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 15:51:53'!
queOpinanSobre: unPj
	^ opinionesDelPuebloSobreUnPj at: unPj ifAbsentPut: ['Desconocido'].
	! !


!PueblodeRivenwood class methodsFor: 'as yet unclassified' stamp: 'Rv 10/3/2021 19:29:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDelPuebloSobreUnPj := ((Dictionary new) add: (PjHamilton->'Desconocido'); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'interaccionesDeTrebor frasesADesconocidos frasesAPrometedores opinionesDeTrebor'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 10/3/2021 19:28:09'!
interactuarCon: unPj
	opinionesDeTrebor at: unPj ifAbsentPut: [ 'Desconocido' ].
	
	self reiniciarInteraccionSiElPuebloCambioDeOpinionSobre: unPj.	
	self opinarComoElPuebloSobre: unPj.
	self recordarInteraccionCon: unPj.	
	^ self responderSegunOpinionCon: unPj.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 9/30/2021 10:37:19'!
olvidarInteracciones
	interaccionesDeTrebor := Dictionary new.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'Rv 9/30/2021 10:42:40'!
olvidarOpiniones
	opinionesDeTrebor := Dictionary new.	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 9/30/2021 10:32:09'!
decirFraseAlDesconocido: unPj
		^frasesADesconocidos at: ( (interaccionesDeTrebor at: unPj) min: frasesADesconocidos size)	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 9/30/2021 10:52:02'!
decirFraseAlPrometedor: unPj
		^frasesAPrometedores at: ( ( interaccionesDeTrebor at: unPj ) min: frasesAPrometedores size)	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 16:58:00'!
opinarComoElPuebloSobre: unPj
	^ opinionesDeTrebor at: unPj put: (self preguntarAlPuebloQueOpinaSobre: unPj ).
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 15:54:16'!
preguntarAlPuebloQueOpinaSobre: unPj	
	^PueblodeRivenwood queOpinanSobre: unPj.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:12:53'!
recordarInteraccionCon: unPj
	|cantidadDeInteracciones |.
	cantidadDeInteracciones := interaccionesDeTrebor at: unPj ifAbsent: [ 0 ].
	interaccionesDeTrebor at: unPj put: cantidadDeInteracciones + 1! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 19:27:36'!
reiniciarInteraccionSiElPuebloCambioDeOpinionSobre: unPj
	| opinionDelPueblo |	
	
	opinionDelPueblo := self preguntarAlPuebloQueOpinaSobre: unPj.
	
	opinionDelPueblo = (opinionesDeTrebor at: unPj ) ifFalse: [
		interaccionesDeTrebor at: unPj put: 0
		]
	
	
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'Rv 10/3/2021 18:50:25'!
responderSegunOpinionCon: unPj
	((opinionesDeTrebor at: unPj)  = 'Desconocido')	 ifTrue: [ ^ self decirFraseAlDesconocido: unPj ].
	((opinionesDeTrebor at: unPj)  = 'Prometedor' ) ifTrue: [^ self decirFraseAlPrometedor: unPj		  ].
	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'Rv 10/3/2021 19:29:22'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	interaccionesDeTrebor := ((Dictionary new) add: (PjHamilton->2); yourself).
	frasesADesconocidos := #('Hola forastero' '�Todo bien?' '�Alg�n problema?' ).
	frasesAPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	opinionesDeTrebor := ((Dictionary new) add: (PjHamilton->'Desconocido'); yourself).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
PueblodeRivenwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!