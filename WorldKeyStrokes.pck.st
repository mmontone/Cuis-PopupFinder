'From Cuis 5.0 [latest update: #4528] on 8 February 2021 at 3:18:13 pm'!
'Description Extensible World keystrokes.
Author: Mariano Montone <marianomontone@gmail.com>'!
!provides: 'WorldKeyStrokes' 1 5!
SystemOrganization addCategory: 'WorldKeyStrokes'!


!classDefinition: #KeyCombination category: 'WorldKeyStrokes'!
Object subclass: #KeyCombination
	instanceVariableNames: 'shift alt control keyCharacter keyValue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'WorldKeyStrokes'!
!classDefinition: 'KeyCombination class' category: 'WorldKeyStrokes'!
KeyCombination class
	instanceVariableNames: ''!

!classDefinition: #WorldKeyStrokes category: 'WorldKeyStrokes'!
Object subclass: #WorldKeyStrokes
	instanceVariableNames: ''
	classVariableNames: 'KeyStrokesHandlers KeyStrokesInterceptors KeyStrokesMapping'
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

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
alt
	"Answer the value of alt"

	^ alt! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
alt: anObject
	"Set the value of alt"

	alt _ anObject! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
control
	"Answer the value of control"

	^ control! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
control: anObject
	"Set the value of control"

	control _ anObject! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:17:43'!
keyCharacter
	"Answer the value of character"

	^ keyCharacter! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:17:08'!
keyCharacter: anObject
	"Set the value of character"

	keyCharacter _ anObject! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:10:18'!
keyValue
	"Answer the value of keyValue"

	^ keyValue! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:10:18'!
keyValue: anObject
	"Set the value of keyValue"

	keyValue _ anObject! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
shift
	"Answer the value of shift"

	^ shift! !

!KeyCombination methodsFor: 'accessing' stamp: 'MM 2/8/2021 15:09:19'!
shift: anObject
	"Set the value of shift"

	shift _ anObject! !

!KeyCombination methodsFor: 'testing' stamp: 'MM 2/8/2021 15:16:50'!
value: aKeyboardEvent

	^ ((shift and: [aKeyboardEvent shiftPressed]) or: [
		shift not and: [aKeyboardEvent shiftPressed not]])
		and: [(control and: [aKeyboardEvent controlKeyPressed]) or: [
				control not and: [aKeyboardEvent controlKeyPressed not]]]
		and: [(alt and: [aKeyboardEvent commandAltKeyPressed]) or: [
				alt not and: [aKeyboardEvent commandAltKeyPressed not]]]
		and: [keyValue isNil not and: [aKeyboardEvent keyValue == keyValue]]
		and: [keyCharacter isNil not and: [aKeyboardEvent keyCharacter == keyCharacter]]! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:43:09'!
addKeyStroke: aKeyStroke handler: aBlock
	KeyStrokesMapping at: aKeyStroke put: aBlock! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 13:40:21'!
addKeyStrokeHandler: aBlock
	KeyStrokesHandlers addFirst: aBlock! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:28:41'!
addKeyStrokeInterceptor: aBlock
	KeyStrokesInterceptors addFirst: aBlock! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:45:09'!
defaultWorldKeyStrokeHandler: aKeyboardEvent
	(aKeyboardEvent commandAltKeyPressed or: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [
			aKeyboardEvent keyCharacter = $b ifTrue: [ BrowserWindow openBrowser . ^true].
			aKeyboardEvent keyCharacter = $f ifTrue: [ BrowserWindow findClass.^true ].
			aKeyboardEvent keyCharacter = $F ifTrue: [ MessageSetWindow findInSourceCode. ^true ]		].
	^false! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:32:25'!
defaultWorldKeyStrokeInterceptor: aKeyboardEvent morph: aMorph

	aKeyboardEvent isFindClassShortcut
			ifTrue: [ Preferences classFinder value. ^ true ].
	aKeyboardEvent isCloseWindowShortcut
			ifTrue: [ aKeyboardEvent closeCurrentWindowOf: aMorph. ^ true ].
			
	^ false! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 8/16/2020 11:49:43'!
handleKeyStroke: aKeyboardEvent
	KeyStrokesHandlers do: [:handler |
		(handler value: aKeyboardEvent) ifTrue: [^true]].
	^ false! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:33:08'!
initialize
	"self initialize"
	KeyStrokesHandlers _ OrderedCollection new.
	KeyStrokesInterceptors _ OrderedCollection new.
	KeyStrokesMapping _ Dictionary new.
	WorldKeyStrokes addKeyStrokeHandler: [:ev | WorldKeyStrokes defaultWorldKeyStrokeHandler: ev].
	WorldKeyStrokes addKeyStrokeHandler: [:ev | WorldKeyStrokes keyStrokeMappingsHandler: ev].
	WorldKeyStrokes addKeyStrokeInterceptor: [:ev :morph | WorldKeyStrokes defaultWorldKeyStrokeInterceptor: ev morph: morph]. ! !

!WorldKeyStrokes class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:34:55'!
interceptKeyStroke: aKeyboardEvent morph: aMorph
	KeyStrokesInterceptors do: [:handler |
		(handler value: aKeyboardEvent value: aMorph) ifTrue: [^true]].
	^ false! !

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

!KeyboardEvent methodsFor: '*WorldKeyStrokes' stamp: 'MM 2/6/2021 16:34:13'!
sendEventTo: aMorph
	"Dispatch the receiver into anObject"
	type == #keystroke ifTrue: [
		(WorldKeyStrokes interceptKeyStroke: self morph: aMorph)
			ifTrue: [^self].
		^ aMorph processKeystroke: self ].
	type == #keyDown ifTrue: [
		^ aMorph processKeyDown: self ].
	type == #keyUp ifTrue: [ 
		^ aMorph processKeyUp: self ].
	^ super sendEventTo: aMorph.! !
WorldKeyStrokes initialize!
