'From Cuis 5.0 [latest update: #4528] on 6 February 2021 at 1:45:10 pm'!
'Description Extensible World keystrokes.
Author: Mariano Montone <marianomontone@gmail.com>'!
!provides: 'WorldKeyStrokes' 1 2!
SystemOrganization addCategory: 'WorldKeyStrokes'!


!classDefinition: #WorldKeyStrokes category: 'WorldKeyStrokes'!
Object subclass: #WorldKeyStrokes
	instanceVariableNames: ''
	classVariableNames: 'KeyStrokesHandlers KeyStrokesMapping'
	poolDictionaries: ''
	category: 'WorldKeyStrokes'!
!classDefinition: 'WorldKeyStrokes class' category: 'WorldKeyStrokes'!
WorldKeyStrokes class
	instanceVariableNames: ''!


!WorldKeyStrokes commentStamp: '<historical>' prior: 0!
Holds keystoke handlers for Smalltalk World.

Use WorldKeyStrokes>>addKeyStroke:handler: for adding a handler for a particular key stroke.

You can also add a key stroke handler for a key stroke event with WorldKeyStrokes>>addKeyStrokeHandler:.
The block passed as argument is passed the key stroke event and should return a boolean that indicates if the event was handled or not.

For example, use this to install a handler for Cmd-p for opening preferences inspector:

WorldKeyStrokes 
	addKeyStroke: [:ev | (ev commandAltKeyPressed or: [ ev controlKeyPressed ]) and: [ev keyCharacter = $p]]
	handler: [Preferences openPreferencesInspector]. !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:43:09'!
addKeyStroke: aKeyStroke handler: aBlock
	KeyStrokesMapping at: aKeyStroke put: aBlock! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 13:40:21'!
addKeyStrokeHandler: aBlock
	KeyStrokesHandlers addFirst: aBlock! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:45:09'!
defaultWorldKeyStrokeHandler: aKeyboardEvent
	(aKeyboardEvent commandAltKeyPressed or: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [
			aKeyboardEvent keyCharacter = $b ifTrue: [ BrowserWindow openBrowser . ^true].
			aKeyboardEvent keyCharacter = $f ifTrue: [ BrowserWindow findClass.^true ].
			aKeyboardEvent keyCharacter = $F ifTrue: [ MessageSetWindow findInSourceCode. ^true ]		].
	^false! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:49:43'!
handleKeyStroke: aKeyboardEvent
	KeyStrokesHandlers do: [:handler |
		(handler value: aKeyboardEvent) ifTrue: [^true]].
	^ false! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 13:38:56'!
initialize
	"self initialize"
	KeyStrokesHandlers _ OrderedCollection new.
	KeyStrokesMapping _ Dictionary new.
	WorldKeyStrokes addKeyStrokeHandler: [:ev | WorldKeyStrokes defaultWorldKeyStrokeHandler: ev].
	WorldKeyStrokes addKeyStrokeHandler: [:ev | WorldKeyStrokes keyStrokeMappingsHandler: ev].! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:48:34'!
keyStrokeMappingsHandler: aKeyboardEvent
	KeyStrokesMapping keysAndValuesDo: [:ks :handler |
		(ks value: aKeyboardEvent) ifTrue: [
			handler value. ^true]].
	^false! !

!WorldMorph methodsFor: '*WorldKeyStrokes' stamp: 'MM 2/6/2021 13:36:38'!
keyStroke: aKeyboardEvent
	"Handle a keystroke event."
	
	^ (WorldKeyStrokes handleKeyStroke: aKeyboardEvent)
		ifFalse: [ super keyStroke: aKeyboardEvent ]! !
WorldKeyStrokes initialize!
