!classDefinition: #CarolinaLaCuranderaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeSkyrim class
	instanceVariableNames: 'frases memoriaDeCarolina'!

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 12:14:20'!
interactuarCon: unPj
	self recordarInteraccionCon: unPj.
	^ self responderSegunCantidadDeInteraccionesCon: unPj.
	! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 12:15:49'!
olvidar
	memoriaDeCarolina := Dictionary new! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 12:16:06'!
recordarInteraccionCon: unPj
	|cantidadDeInteracciones|
	cantidadDeInteracciones := memoriaDeCarolina at: unPj ifAbsent: [ 0 ].
	memoriaDeCarolina at: unPj put: cantidadDeInteracciones + 1! !

!CarolinaLaCuranderaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 12:16:14'!
responderSegunCantidadDeInteraccionesCon: unPj.
	^ frases at: ( (memoriaDeCarolina at: unPj) min: frases size)
	! !


!CarolinaLaCuranderaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'ramiro99 9/29/2021 17:20:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frases := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	memoriaDeCarolina := ((Dictionary new)).! !


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
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

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
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
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
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
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


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/22/2021 00:09:33'!
esVistoPorElPuebloComoPrometedor: unPersonaje
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'ramiro99 9/29/2021 12:23:55'!
hacerQueLaCuranderaOlvideSusInteracciones
	^ self carolinaLaCurandera olvidar ! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 21:02:50'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	"Implementar cuando sea necesario"! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/22/2021 00:09:48'!
hacerQueRiverwoodVeaPrometedorAHamilton
	Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
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
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


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
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
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


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/21/2021 20:49:11'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'ramiro99 9/29/2021 13:07:02'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PueblodeRivenwood olvidarOpiniones ! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'ramiro99 9/29/2021 13:09:02'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PueblodeRivenwood calificarComoPrometedorA: PjHamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
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


!PueblodeRivenwood class methodsFor: 'as yet unclassified' stamp: 'ramiro99 9/29/2021 17:20:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	opinionesDelPuebloSobreUnPj := ((Dictionary new) add: (PjHamilton->'Prometedor'); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'memoriaDeTrebor frasesADesconocidos frasesAPrometedores opinionesDeTrebor'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 10:28:25'!
interactuarCon: unPj
	self recordarInteraccionCon: unPj.
	^ self responderSegunCantidadDeInteraccionesCon: unPj.
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'ramiro99 9/29/2021 17:19:46'!
olvidar
	memoriaDeTrebor := Dictionary new.
	"opinionesDeTrebor := Dictionary new."! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 16:36:30'!
decirFraseAlDesconocido: unPj
		^frasesADesconocidos at: ( (memoriaDeTrebor at: unPj) min: frasesADesconocidos size)	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 17:19:20'!
decirFraseAlPrometedor: unPj
		^frasesAPrometedores at: ( ( memoriaDeTrebor at: unPj ) min: frasesAPrometedores size )	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 16:56:52'!
olvidarInteraccionSiElPuebloCambiaDeOpinionSobre: unPj
	| opinionDelPueblo |	
	
	opinionDelPueblo := self preguntarAlPuebloQueOpinaSobre: unPj.
	
	opinionDelPueblo = (opinionesDeTrebor at: unPj ) ifFalse: [
		self olvidar.	
		]
	
	
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 16:58:00'!
opinarComoElPuebloSobre: unPj
	^ opinionesDeTrebor at: unPj put: (self preguntarAlPuebloQueOpinaSobre: unPj ).
	! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 15:54:16'!
preguntarAlPuebloQueOpinaSobre: unPj	
	^PueblodeRivenwood queOpinanSobre: unPj.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 15:48:10'!
recordarInteraccionCon: unPj
	|cantidadDeInteracciones |.
	cantidadDeInteracciones := memoriaDeTrebor at: unPj ifAbsent: [ 0 ].
	opinionesDeTrebor at: unPj ifAbsentPut: [ 'Desconocido' ].
	
	memoriaDeTrebor at: unPj put: cantidadDeInteracciones + 1! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'ramiro99 9/29/2021 17:04:51'!
responderSegunCantidadDeInteraccionesCon: unPj
		
	self olvidarInteraccionSiElPuebloCambiaDeOpinionSobre: unPj.
	self opinarComoElPuebloSobre: unPj.
	
	((opinionesDeTrebor at: unPj)  = 'Desconocido')	 ifTrue: [ ^ self decirFraseAlDesconocido: unPj ].
	((opinionesDeTrebor at: unPj)  = 'Prometedor' ) ifTrue: [^ self decirFraseAlPrometedor: unPj		  ].
	! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'ramiro99 9/29/2021 17:20:38'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	memoriaDeTrebor := ((Dictionary new) add: (PjHamilton->2); yourself).
	frasesADesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesAPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	opinionesDeTrebor := ((Dictionary new) add: (PjHamilton->'Prometedor'); yourself).! !

CarolinaLaCuranderaDeSkyrim initializeAfterFileIn!
PueblodeRivenwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!