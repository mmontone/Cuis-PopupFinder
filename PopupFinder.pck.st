'From Cuis 6.0 [latest update: #5861] on 16 June 2023 at 6:42:16 pm'!
'Description This is a variation of Cuis Finder by Nicolas Papagna, that uses a popup morph as user interface.

Finder is a system-wide search tool for Cuis Smalltalk.

You can use it to search for classes, methods, senders, implementors, system categories... you name it!!

It is inspired by Pharo''s Spotter and the search feature provided by JetBrains tools, such as IntelliJ IDEA.

Use shift + enter key to open the finder.

tab or left arrow and right arrow keys to change catalog.

Also, you can use catalog specific shortcuts:

    alt-c : Classes catalog.
    alt-n : Senders catalog.
    alt-m : Implementors catalog.
    alt-s : Selectors catalog.
    alt-p : System categories catalog.
    alt-t : Tools catalog.'!
!provides: 'PopupFinder' 1 60!
!requires: 'WorldKeyStrokes' 1 4 nil!
SystemOrganization addCategory: 'PopupFinder-Model'!
SystemOrganization addCategory: 'PopupFinder-UI'!
SystemOrganization addCategory: 'PopupFinder-UI-Model'!


!classDefinition: #FinderMorph category: 'PopupFinder-UI'!
LayoutMorph subclass: #FinderMorph
	instanceVariableNames: 'toolbar searchBar results model focusFollowsMouse'
	classVariableNames: 'CurrentFinder'
	poolDictionaries: ''
	category: 'PopupFinder-UI'!
!classDefinition: 'FinderMorph class' category: 'PopupFinder-UI'!
FinderMorph class
	instanceVariableNames: ''!

!classDefinition: #FinderSearchInnerTextMorph category: 'PopupFinder-UI'!
InnerTextMorph subclass: #FinderSearchInnerTextMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI'!
!classDefinition: 'FinderSearchInnerTextMorph class' category: 'PopupFinder-UI'!
FinderSearchInnerTextMorph class
	instanceVariableNames: ''!

!classDefinition: #FinderResultsListMorph category: 'PopupFinder-UI'!
PluggableListMorph subclass: #FinderResultsListMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI'!
!classDefinition: 'FinderResultsListMorph class' category: 'PopupFinder-UI'!
FinderResultsListMorph class
	instanceVariableNames: ''!

!classDefinition: #FinderSearchTextModelMorph category: 'PopupFinder-UI'!
TextModelMorph subclass: #FinderSearchTextModelMorph
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI'!
!classDefinition: 'FinderSearchTextModelMorph class' category: 'PopupFinder-UI'!
FinderSearchTextModelMorph class
	instanceVariableNames: ''!

!classDefinition: #FinderSearchBarMorph category: 'PopupFinder-UI'!
BoxedMorph subclass: #FinderSearchBarMorph
	instanceVariableNames: 'layoutMorph searchBox changeHandler keyPressedHandler dateAndTimeOfLastKeyStroke timeToWaitBeforeNotifyingChanges'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI'!
!classDefinition: 'FinderSearchBarMorph class' category: 'PopupFinder-UI'!
FinderSearchBarMorph class
	instanceVariableNames: ''!

!classDefinition: #Catalog category: 'PopupFinder-Model'!
Object subclass: #Catalog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'Catalog class' category: 'PopupFinder-Model'!
Catalog class
	instanceVariableNames: ''!

!classDefinition: #ClassNamesCatalog category: 'PopupFinder-Model'!
Catalog subclass: #ClassNamesCatalog
	instanceVariableNames: 'results selectedResultIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'ClassNamesCatalog class' category: 'PopupFinder-Model'!
ClassNamesCatalog class
	instanceVariableNames: ''!

!classDefinition: #CompositeCatalog category: 'PopupFinder-Model'!
Catalog subclass: #CompositeCatalog
	instanceVariableNames: 'catalogs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'CompositeCatalog class' category: 'PopupFinder-Model'!
CompositeCatalog class
	instanceVariableNames: ''!

!classDefinition: #ImplementedSelectorsCatalog category: 'PopupFinder-Model'!
Catalog subclass: #ImplementedSelectorsCatalog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'ImplementedSelectorsCatalog class' category: 'PopupFinder-Model'!
ImplementedSelectorsCatalog class
	instanceVariableNames: ''!

!classDefinition: #ImplementorsCatalog category: 'PopupFinder-Model'!
Catalog subclass: #ImplementorsCatalog
	instanceVariableNames: 'resultsSorter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'ImplementorsCatalog class' category: 'PopupFinder-Model'!
ImplementorsCatalog class
	instanceVariableNames: ''!

!classDefinition: #PackagesCatalog category: 'PopupFinder-Model'!
Catalog subclass: #PackagesCatalog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'PackagesCatalog class' category: 'PopupFinder-Model'!
PackagesCatalog class
	instanceVariableNames: ''!

!classDefinition: #SendersCatalog category: 'PopupFinder-Model'!
Catalog subclass: #SendersCatalog
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'SendersCatalog class' category: 'PopupFinder-Model'!
SendersCatalog class
	instanceVariableNames: ''!

!classDefinition: #ToolsCatalog category: 'PopupFinder-Model'!
Catalog subclass: #ToolsCatalog
	instanceVariableNames: 'tools implementorsCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'ToolsCatalog class' category: 'PopupFinder-Model'!
ToolsCatalog class
	instanceVariableNames: ''!

!classDefinition: #CompositeCatalogResult category: 'PopupFinder-Model'!
Object subclass: #CompositeCatalogResult
	instanceVariableNames: 'catalog result'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'CompositeCatalogResult class' category: 'PopupFinder-Model'!
CompositeCatalogResult class
	instanceVariableNames: ''!

!classDefinition: #Finder category: 'PopupFinder-Model'!
Object subclass: #Finder
	instanceVariableNames: 'results selectedResultIndex selectedCatalog catalogs currentQuery changeSelectedCatalogSelectorPrefix isSelectedCatalogSelectorPrefix selectedCatalogChangeEvent browseSelectedResultEvent closeEvent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'Finder class' category: 'PopupFinder-Model'!
Finder class
	instanceVariableNames: ''!

!classDefinition: #ResultsSorter category: 'PopupFinder-Model'!
Object subclass: #ResultsSorter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'ResultsSorter class' category: 'PopupFinder-Model'!
ResultsSorter class
	instanceVariableNames: ''!

!classDefinition: #AlphabeticalResultsSorter category: 'PopupFinder-Model'!
ResultsSorter subclass: #AlphabeticalResultsSorter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'AlphabeticalResultsSorter class' category: 'PopupFinder-Model'!
AlphabeticalResultsSorter class
	instanceVariableNames: ''!

!classDefinition: #SelectorSizeResultsSorter category: 'PopupFinder-Model'!
ResultsSorter subclass: #SelectorSizeResultsSorter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'SelectorSizeResultsSorter class' category: 'PopupFinder-Model'!
SelectorSizeResultsSorter class
	instanceVariableNames: ''!

!classDefinition: #SequentialResultsSorter category: 'PopupFinder-Model'!
ResultsSorter subclass: #SequentialResultsSorter
	instanceVariableNames: 'renameMe1 resultsSorters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'SequentialResultsSorter class' category: 'PopupFinder-Model'!
SequentialResultsSorter class
	instanceVariableNames: ''!

!classDefinition: #SizeResultsSorter category: 'PopupFinder-Model'!
ResultsSorter subclass: #SizeResultsSorter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'SizeResultsSorter class' category: 'PopupFinder-Model'!
SizeResultsSorter class
	instanceVariableNames: ''!

!classDefinition: #SubstringMatcher category: 'PopupFinder-Model'!
Object subclass: #SubstringMatcher
	instanceVariableNames: 'collection substring resultsSorter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-Model'!
!classDefinition: 'SubstringMatcher class' category: 'PopupFinder-Model'!
SubstringMatcher class
	instanceVariableNames: ''!

!classDefinition: #CatalogButton category: 'PopupFinder-UI-Model'!
Object subclass: #CatalogButton
	instanceVariableNames: 'catalog model'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI-Model'!
!classDefinition: 'CatalogButton class' category: 'PopupFinder-UI-Model'!
CatalogButton class
	instanceVariableNames: ''!

!classDefinition: #SearchBoxEditor category: 'PopupFinder-UI-Model'!
Object subclass: #SearchBoxEditor
	instanceVariableNames: 'textEditor model keyStrokeHandler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PopupFinder-UI-Model'!
!classDefinition: 'SearchBoxEditor class' category: 'PopupFinder-UI-Model'!
SearchBoxEditor class
	instanceVariableNames: ''!


!FinderResultsListMorph commentStamp: '<historical>' prior: 0!
Custom list morph for showing finder results that disables keyboard focus.!

!FinderSearchBarMorph commentStamp: 'NPM 5/9/2020 13:51:51' prior: 0!
I am responsible for capturing the query to be performed.

Performance
=========

To avoid notifying changes every time a key is pressed, I keep track of the date and time of the last keystroke (see #processKeyStroke).
I use that information in my #stepAt: method to check whether I should notify #query has changed or not, using my #timeToWaitBeforeNotifyingChanges instance variable.

Hacks
====
To implement shortcuts, I use SearchBoxEditor (see #initializeSearchBoxEditor and comments in SearchBoxEditor class).


!

!ToolsCatalog commentStamp: '<historical>' prior: 0!
I am a catalog that contains all tools available in the World > Open... menu.

To avoid hardcoding them, I look for implementors of #worldMenuForOpenGroup and evaluate them to retrieve each menu item (see #initializeTools).!

!CatalogButton commentStamp: 'NPM 4/2/2020 00:48:04' prior: 0!
I represent a catalog button's model.

The way catatalog buttons work in FinderWindow is similar to radio buttons: only
one can be active at a time, and once one is selected the previous catalog button
is deselected.

To react to selected catalog change events, I subscribe to my finder to determine whether 
I am the selected catalog or not (see #isSelected).

When I am clicked, I set myself as the selected catalog (see #value).!

!SearchBoxEditor commentStamp: '<historical>' prior: 0!
My purpose is wrapping instances of TextEditor to override keyboard shortcuts.

If I cannot handle a keyboard event, I forward it to my wrapped text editor.

Any message I do not override is forwarded to my wrapped editor as well.

I also forward event to the results list, so it can be browsed from the editor (see)

Note
===
I exist as a hack, only to allow overriding keyboard handlers.

The way I am installed, and replace, an InnerTextMorph's editor is by assigning 
its #editor instance variable using reflection (see #installOn:mode: in my class).

Currently, TextEditor's keyboard shortcut mappings are shared among all instances and 
cannot be modified/overriden for a particular instance (see Editor>>#shortcuts).!

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 11:38:33'!
addToolbarButtonFor: catalog

	^ toolbar addMorph: (self toolbarButtonFor: catalog )! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 11:38:33'!
buildLayout

	^ self layoutMorph
		beColumn
		addMorph: toolbar fixedHeight: self defaultButtonPaneHeight;
		addMorph: searchBar fixedHeight: self defaultButtonPaneHeight;
		addMorphUseAll: results! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 12:39:19'!
buildMorphicWindow
	self buildToolbar.
	self buildSearchBar.
	self buildResults.
	self buildLayout.! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 11/9/2021 14:28:26'!
buildResults

	results := (FinderResultsListMorph 
		model: model
		listGetter: #results
		indexGetter: #selectedResultIndex
		indexSetter: #selectedResultIndex:)
		color: Color veryVeryLightGray ;
		autoDeselect: false;
		setProperty: #click:localPosition:
		toValue: [ :aMouseEvent :localEventPosition | self browseResultAt: localEventPosition ];
		yourself! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 2/6/2021 12:49:39'!
buildSearchBar
	
	searchBar := FinderSearchBarMorph
		onChanged: [ :query | model search: query ]
		onKeyPressed: [ :event | self processKeyStroke: event ]
		notifyingChangesAfter: 250 milliSeconds
	
	
	
	
	! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 12:35:28'!
buildToolbar
	
	toolbar := LayoutMorph newRow color: Color veryVeryLightGray ; yourself.
	
	self buildToolbarButtonsForCatalogs.! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 11:38:33'!
buildToolbarButtonsForCatalogs

	^ model catalogsDo: [ :catalog | self addToolbarButtonFor: catalog ]! !

!FinderMorph methodsFor: 'GUI building' stamp: 'MM 9/7/2020 12:40:13'!
toolbarButtonFor: aCatalog

	^ (PluggableButtonMorph
		model: (CatalogButton for: aCatalog model: model)
		stateGetter: #isSelected
		action: #value
		label: aCatalog name)
		color: Color veryLightGray; 
		yourself! !

!FinderMorph methodsFor: 'top window' stamp: 'MM 9/7/2020 11:38:33'!
submorphToFocusKeyboard

	^ searchBar searchField! !

!FinderMorph methodsFor: 'events-old protocol' stamp: 'MM 9/7/2020 11:38:33'!
update: aSymbol

	model
		isBrowseSelectedResultEvent: aSymbol
		ifTrue:  [ ^ self closeBoxHit ].
		
	model
		isCloseEvent: aSymbol
		ifTrue:  [ ^ self closeBoxHit ].! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 11:38:33'!
forwardToResults: aKeyboardEvent

	^ (results arrowKey: aKeyboardEvent)
		isNil not
! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 20:35:32'!
processArrowLeftOrRight: aKeyboardEvent 
	
	aKeyboardEvent isArrowLeft 
		ifTrue: [ 
			model selectPreviousCatalog.
			^ true ].
		
	aKeyboardEvent isArrowRight 
		ifTrue: [ 
			model selectNextCatalog.
			^ true ].

	^ false
	! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 11:38:33'!
processArrowUpOrDown: aKeyboardEvent 
	
	aKeyboardEvent isArrowUp 
		ifTrue: [ 
			model selectPreviousResult.
			^ true ].
		
	aKeyboardEvent isArrowDown 
		ifTrue: [ 
			model selectNextResult.
			^ true ].

	^ false
	! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 2/6/2021 15:17:27'!
processCatalogKey: aKeyboardEvent

	(aKeyboardEvent commandAltKeyPressed)
		ifTrue: [
			model catalogsDo: [:catalog |
				(catalog keyStrokeCharacter == aKeyboardEvent keyCharacter)
					ifTrue: [model changeSelectedCatalog: catalog. ^ true]]].
	^ false! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 12:08:12'!
processEscKey: aKeyboardEvent

	(aKeyboardEvent isEsc)
		ifTrue: [ 
			model close. 
			self delete. 
			self runningWorld activeHand newKeyboardFocus: self runningWorld.
			FinderMorph current: nil].
		
	^ aKeyboardEvent isEsc! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 2/6/2021 15:02:02'!
processKeyStroke: aKeyboardEvent 
	
	(self processTab: aKeyboardEvent)
		ifTrue: [ ^ true ].
	
	(self processArrowUpOrDown: aKeyboardEvent)
		ifTrue: [ ^ true ].
		
	(self processArrowLeftOrRight: aKeyboardEvent)
		ifTrue: [^true].
		
	(self processReturnKey: aKeyboardEvent)
		ifTrue: [ ^ true ].
		
	(self processEscKey: aKeyboardEvent)
		ifTrue: [ ^ true ].
		
	(self processCatalogKey: aKeyboardEvent)
		ifTrue: [^ true].

	(self forwardToResults: aKeyboardEvent)
		ifTrue: [ ^ true ].
		
	^ false! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 12:28:27'!
processReturnKey: aKeyboardEvent

	(aKeyboardEvent isReturnKey)
		ifTrue: [ 
			searchBar notifyQueryChanged.
			self browseSelectedResult ].
		
	^ aKeyboardEvent isReturnKey! !

!FinderMorph methodsFor: 'shortcuts' stamp: 'MM 9/7/2020 11:38:33'!
processTab: aKeyboardEvent 
	
	aKeyboardEvent isTab
		ifTrue: [ 
			aKeyboardEvent shiftPressed
				ifTrue: [ model selectPreviousCatalog ]
				ifFalse: [ model selectNextCatalog ]].
	
	^ aKeyboardEvent isTab! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 12:30:44'!
browseResultAt: aPosition 
	
	model
		selectedResultIndex: (results rowAtLocation: aPosition).
	self	browseSelectedResult
			
			! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 12:28:56'!
browseSelectedResult
	self delete.
	model browseSelectedResult.! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 11:43:47'!
defaultButtonPaneHeight
	"Answer the user's preferred default height for new button panes."

	^ Theme current buttonPaneHeight! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 22:40:48'!
defaultColor
	^ Color veryVeryLightGray! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/24/2022 10:10:03'!
delete
	super delete.
	FinderMorph current: nil.
	focusFollowsMouse ifTrue: [Preferences at: #focusFollowsMouse put: true].
	Display restore.! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:39:28'!
handlesKeyboard
	^ true! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 11:38:54'!
layoutMorph
	^ self! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 11:42:16'!
model
	
	^ model! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 11:42:06'!
model: anObject

	model _ anObject
	! !

!FinderMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/24/2022 10:09:29'!
openInWorld
	super openInWorld.
	self morphHeight: 300.
	self morphPositionInWorld: ((self runningWorld morphWidth / 2)  - (self morphWidth / 2)) @ 200.
	self comeToFront.

	"Disable focusFollowsMouse while the finder is open."
	focusFollowsMouse _ Preferences focusFollowsMouse.
	focusFollowsMouse ifTrue: [Preferences at: #focusFollowsMouse put: false].
	"Set keyboard focus"
	self world ifNotNil: [ :w |
		w activeHand newKeyboardFocus: self submorphToFocusKeyboard ].
	FinderMorph current: self.! !

!FinderMorph class methodsFor: 'class initialization' stamp: 'MM 11/9/2021 14:29:49'!
initialize

	self configureAsClassFinder.
	
	self inform:  'Finder morph installed. Use cmd+f to open.'! !

!FinderMorph class methodsFor: 'instance creation' stamp: 'MM 2/8/2021 09:54:23'!
open
	
	^ self openOn: Finder withDefaultCatalogs! !

!FinderMorph class methodsFor: 'instance creation' stamp: 'MM 2/8/2021 09:56:20'!
openOn: aFinder
	
	^ self newColumn 
		model: aFinder;
		buildMorphicWindow;
		openInWorld! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:46:23'!
configureAsClassFinder
	"self configureAsClassFinder"
	
	WorldKeyStrokes addKeyStrokeHandler: [:ev | self worldKeystrokeHandler: ev].
	WorldKeyStrokes addKeyStrokeInterceptor: [:ev :morph | self worldKeystrokeInterceptor: ev].

	! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 12:10:49'!
current
	^ CurrentFinder! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 9/7/2020 12:11:06'!
current: anInstance
	CurrentFinder _ anInstance! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 9/8/2020 17:48:34'!
isFindClassShortcut: aKeyboardEvent

	^ aKeyboardEvent shiftPressed and: [ aKeyboardEvent isReturnKey ]! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 13:43:49'!
worldKeystrokeHandler: aKeyboardEvent
	(aKeyboardEvent commandAltKeyPressed or: [ aKeyboardEvent controlKeyPressed ])
		ifTrue: [
			aKeyboardEvent keyCharacter = $f ifTrue: [ self open. ^true ]].
	^false! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 16:47:37'!
worldKeystrokeInterceptor: aKeyboardEvent
	(aKeyboardEvent shiftPressed and: [ aKeyboardEvent isReturnKey ])
		ifTrue: [self open. ^ true].
	^false! !

!FinderMorph class methodsFor: 'as yet unclassified' stamp: 'MM 9/24/2022 10:20:45'!
worldMenuOptions
	^ `{{
			#submenuOf -> TheWorldMenu openLabel.
			#itemGroup 		-> 		10.
			#itemOrder 		-> 		40.
			#label 			->	'System finder'.
			#object 			-> 	FinderMorph.
			#selector 		-> 		#open.
			#icon 			-> 	#inspectIcon.
			#balloonText 	-> 		'The system finder'.
		} asDictionary}`! !

!FinderSearchInnerTextMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:49:37'!
keyboardFocusChange: aBoolean
	"Notify change due to green border for keyboard focus"
	aBoolean ifFalse: [
		"Not pretty at all, but works. Delete the FinderMorph"
		self owner owner owner owner delete].! !

!FinderResultsListMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:23:26'!
gainFocusFrom: aHand
! !

!FinderResultsListMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:15:57'!
handlesKeyboard
	^ false! !

!FinderResultsListMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:20:15'!
mouseEnter: event! !

!FinderResultsListMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:21:34'!
mouseLeave: evt! !

!FinderSearchTextModelMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:43:52'!
innerMorphClass
	^ FinderSearchInnerTextMorph! !

!FinderSearchTextModelMorph methodsFor: 'as yet unclassified' stamp: 'MM 9/25/2020 14:48:53'!
mouseLeave: evt! !

!FinderSearchBarMorph methodsFor: 'key stroke handling' stamp: 'HAW 6/30/2020 09:31:20'!
notifyQueryChanged

	self stopStepping.
	^ changeHandler value: self query! !

!FinderSearchBarMorph methodsFor: 'key stroke handling' stamp: 'NPM 5/9/2020 13:23:26'!
processKeyStroke
	
	dateAndTimeOfLastKeyStroke  := DateAndTime now.
	
	self startStepping! !

!FinderSearchBarMorph methodsFor: 'key stroke handling' stamp: 'MM 11/9/2021 14:27:13'!
registerKeyStrokeHandler

	^ searchBox innerTextMorph
		setProperty: #'keyStroke:'
		toValue: [ :event | self processKeyStroke ]! !

!FinderSearchBarMorph methodsFor: 'key stroke handling' stamp: 'NPM 5/9/2020 13:04:54'!
unregisterKeyStrokeHandler

	searchBox textMorph
		removeProperty: #'keyStroke:'! !

!FinderSearchBarMorph methodsFor: 'initialization' stamp: 'NPM 5/9/2020 13:16:37'!
initializeHandlingChangesWith: aChangeHandler handlingKeysPressedWith: aKeyPressedHandler notifyingChangesAfter: anAmountOfTime  
	
	changeHandler := aChangeHandler.
	keyPressedHandler := aKeyPressedHandler.
	timeToWaitBeforeNotifyingChanges := anAmountOfTime.
	
	self initializeLayout.
	self initializeSearchBox.
	self initializeSearchBoxEditor.
	self registerKeyStrokeHandler.! !

!FinderSearchBarMorph methodsFor: 'initialization' stamp: 'NPM 5/3/2020 20:24:51'!
initializeLayout

	layoutMorph := LayoutMorph newColumn.
	
	self addMorph: layoutMorph.! !

!FinderSearchBarMorph methodsFor: 'initialization' stamp: 'MM 9/25/2020 14:44:13'!
initializeSearchBox

	searchBox := (FinderSearchTextModelMorph withText: '').
	searchBox askBeforeDiscardingEdits: false.
	
	layoutMorph addMorphUseAll: searchBox.! !

!FinderSearchBarMorph methodsFor: 'initialization' stamp: 'NPM 5/3/2020 21:02:26'!
initializeSearchBoxEditor
	
	^ SearchBoxEditor
		installOn: searchBox
		handlingKeyStrokesWith: keyPressedHandler
		! !

!FinderSearchBarMorph methodsFor: 'accessing' stamp: 'NPM 5/3/2020 20:22:39'!
query
	
	^ searchBox text asString! !

!FinderSearchBarMorph methodsFor: 'accessing' stamp: 'MM 11/9/2021 14:28:41'!
searchField
	
	^ searchBox innerTextMorph! !

!FinderSearchBarMorph methodsFor: 'accessing' stamp: 'NPM 5/9/2020 13:11:44'!
timeSinceLastKeyStroke

	^ DateAndTime now - dateAndTimeOfLastKeyStroke! !

!FinderSearchBarMorph methodsFor: 'submorphs-add/remove' stamp: 'NPM 5/9/2020 13:04:54'!
delete

	self unregisterKeyStrokeHandler.
	
	^ super delete.! !

!FinderSearchBarMorph methodsFor: 'layout' stamp: 'MM 9/25/2020 14:41:12'!
layoutSubmorphs
	
	layoutMorph
		morphPosition: 0@0
		extent: self morphExtent.! !

!FinderSearchBarMorph methodsFor: 'stepping' stamp: 'HAW 6/30/2020 09:31:12'!
stepAt: millisecondSinceLast

	self shouldNotifyQueryChanged
		ifTrue: [ self notifyQueryChanged ]
	
	

	
	! !

!FinderSearchBarMorph methodsFor: 'testing' stamp: 'NPM 5/9/2020 13:17:30'!
shouldNotifyQueryChanged

	^ self timeSinceLastKeyStroke >= timeToWaitBeforeNotifyingChanges! !

!FinderSearchBarMorph methodsFor: 'testing' stamp: 'NPM 5/9/2020 13:21:53'!
stepTime

	^ timeToWaitBeforeNotifyingChanges totalMilliseconds! !

!FinderSearchBarMorph class methodsFor: 'instance creation' stamp: 'NPM 5/9/2020 13:31:18'!
onChanged: aChangeHandler onKeyPressed: aKeyPressedHandler notifyingChangesAfter: anAmountOfTime  
	
	^ self
		new
			initializeHandlingChangesWith: aChangeHandler
			handlingKeysPressedWith: aKeyPressedHandler
			notifyingChangesAfter: anAmountOfTime! !

!Catalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 02:38:49'!
name

	self subclassResponsibility! !

!Catalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:29:31'!
processEmptySearchQuery
	
	^ OrderedCollection new! !

!Catalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery

	self subclassResponsibility! !

!Catalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
search: aQuery

	^ aQuery
		ifEmpty: [ self processEmptySearchQuery ]
		ifNotEmpty: [ self processNonEmptySearchQuery: aQuery ]! !

!Catalog methodsFor: 'testing' stamp: 'NPM 3/29/2020 01:40:37'!
isNamed: aName 
	
	^ self name = aName! !

!Catalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aResult

	self subclassResponsibility! !

!Catalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:10:54'!
keyStrokeCharacter
	"Keystroke to use in finder to switch to this catalog. If nil, no keystroke is used. Override in subclasses."
	^ nil! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:34'!
classNames
	
	^ ClassNamesCatalog create! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/4/2020 02:01:12'!
composite: children 
	
	^ CompositeCatalog withAll: children ! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:37'!
implementedSelectors
	
	^ ImplementedSelectorsCatalog create! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:40'!
implementors
	
	^ ImplementorsCatalog create! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:45'!
senders
	
	^ SendersCatalog create! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:51'!
systemCategories
	
	^ PackagesCatalog create! !

!Catalog class methodsFor: 'known instances' stamp: 'NPM 4/22/2020 19:31:53'!
tools
	
	^ ToolsCatalog create! !

!Catalog class methodsFor: 'instance creation' stamp: 'NPM 4/4/2020 02:01:53'!
create
	
	^ self new! !

!ClassNamesCatalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 02:39:01'!
name
	
	^ 'Classes'! !

!ClassNamesCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery

	^ SubstringMatcher
		valueFiltering: Smalltalk classNames
		with: aQuery! !

!ClassNamesCatalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aClassName 
	
	| class |
	class := (Smalltalk classNamed: aClassName).
	
	BrowserWindow
		fullOnClass: class! !

!ClassNamesCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:11:15'!
keyStrokeCharacter
	^ $c! !

!CompositeCatalog methodsFor: 'accessing' stamp: 'NPM 4/1/2020 00:31:00'!
name
	
	^ 'All'! !

!CompositeCatalog methodsFor: 'initialization' stamp: 'NPM 4/1/2020 00:30:46'!
initializeWithAll: children

	catalogs := children! !

!CompositeCatalog methodsFor: 'browsing' stamp: 'NPM 4/20/2020 16:31:26'!
browse: aResult

	aResult browse
	! !

!CompositeCatalog methodsFor: 'searching' stamp: 'NPM 4/20/2020 16:47:20'!
processNonEmptySearchQuery: aQuery
	
	^ catalogs
		inject: OrderedCollection new
		into: [ :results :catalog |
			results
				addAll: (self search: aQuery using: catalog);
				yourself ]! !

!CompositeCatalog methodsFor: 'searching' stamp: 'NPM 4/20/2020 16:53:30'!
search: aQuery using: aCatalog
	
	^ (aCatalog search: aQuery)
		collect: [ :result | CompositeCatalogResult with: aCatalog from: result ]! !

!CompositeCatalog class methodsFor: 'instance creation' stamp: 'NPM 4/1/2020 00:30:33'!
withAll: children 
	
	^ self
		new
		initializeWithAll: children! !

!ImplementedSelectorsCatalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 02:39:13'!
name
	
	^ 'Selectors'! !

!ImplementedSelectorsCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery

	^ SubstringMatcher
		valueFiltering: Smalltalk allImplementedMessages
		with: aQuery! !

!ImplementedSelectorsCatalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aSelector

	Smalltalk browseAllImplementorsOf: aSelector! !

!ImplementedSelectorsCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:24:02'!
keyStrokeCharacter
	^ $s! !

!ImplementorsCatalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 02:47:38'!
name
	
	^ 'Implementors'! !

!ImplementorsCatalog methodsFor: 'searching' stamp: 'NPM 5/24/2020 13:40:14'!
processNonEmptySearchQuery: aQuery

	| implementors |
	implementors _ OrderedCollection new.
	
	Smalltalk allBehaviorsDo: [ :class | 
		class selectors
			select: [ :selector | selector includesSubstring: aQuery caseSensitive: false ]
			thenDo: [ :selector | implementors add: (MethodReference class: class selector: selector) ] ].
		
	^ resultsSorter value: implementors! !

!ImplementorsCatalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aMethodReference 

	HierarchyBrowserWindow
		onClass: aMethodReference methodClass
		selector: aMethodReference selector! !

!ImplementorsCatalog methodsFor: 'as yet unclassified' stamp: 'NPM 5/24/2020 13:49:04'!
initialize

	super initialize.
	
	resultsSorter := ResultsSorter alphabetically, ResultsSorter bySelectorSize ! !

!ImplementorsCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:11:37'!
keyStrokeCharacter
	^ $m! !

!PackagesCatalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 03:12:11'!
name
	
	^ 'System categories'! !

!PackagesCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery 
	
	^ SubstringMatcher
		valueFiltering: SystemOrganization categories
		with: aQuery! !

!PackagesCatalog methodsFor: 'browsing' stamp: 'MM 6/16/2023 18:33:19'!
browse: aSystemCategoryName 
	
	
	| newBrowser |
	newBrowser := Browser new.
	newBrowser setSelectedSystemCategory: aSystemCategoryName.

	BrowserWindow			open: newBrowser label: newBrowser defaultBrowserTitle! !

!PackagesCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:11:50'!
keyStrokeCharacter
	^ $p! !

!SendersCatalog methodsFor: 'accessing' stamp: 'NPM 3/28/2020 02:54:18'!
name
	
	^ 'Senders'! !

!SendersCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery 
	
	^ (Smalltalk allCallsOn: aQuery asString asSymbol) asArray sort! !

!SendersCatalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aMethodReference 
	
	HierarchyBrowserWindow
		onClass: aMethodReference methodClass
		selector: aMethodReference selector! !

!SendersCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:12:02'!
keyStrokeCharacter
	^ $n! !

!ToolsCatalog methodsFor: 'accessing' stamp: 'NPM 3/31/2020 19:09:53'!
name
	
	^ 'Tools'! !

!ToolsCatalog methodsFor: 'initialization' stamp: 'NPM 4/4/2020 02:04:59'!
initializeTools

	self
		menuItemsForOpenGroup
		sort: self blockForSortingItemsByLabel;
		do: [ :menuItem | self addToolFrom: menuItem ]! !

!ToolsCatalog methodsFor: 'initialization' stamp: 'NPM 4/4/2020 02:05:05'!
initializeWith: anImplementorsCatalog

	super initialize.
	
	implementorsCatalog := anImplementorsCatalog.
	tools := OrderedDictionary new.
	
	self initializeTools.! !

!ToolsCatalog methodsFor: 'browsing' stamp: 'NPM 4/2/2020 02:25:34'!
browse: aToolName

	(tools at: aToolName) value! !

!ToolsCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:08'!
processEmptySearchQuery
	
	^ self toolNames! !

!ToolsCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:30:48'!
processNonEmptySearchQuery: aQuery

	^ SubstringMatcher
		valueFiltering: self toolNames
		with: aQuery! !

!ToolsCatalog methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:29:52'!
toolNames

	^ tools keysSortedSafely! !

!ToolsCatalog methodsFor: 'tools' stamp: 'NPM 4/4/2020 01:48:12'!
addToolFrom: aMenuItem 
	
	tools
		at: (self labelFor: aMenuItem)
		put: [ (aMenuItem first at: #object) perform: (aMenuItem first at: #selector) ]! !

!ToolsCatalog methodsFor: 'tools' stamp: 'NPM 4/4/2020 01:47:55'!
blockForSortingItemsByLabel
	
	^ [ :aMenuItem :anotherMenuItem | (self labelFor: aMenuItem) <= (self labelFor: anotherMenuItem) ]! !

!ToolsCatalog methodsFor: 'tools' stamp: 'NPM 4/4/2020 01:47:24'!
labelFor: aMenuItem

	^ aMenuItem first at: #label! !

!ToolsCatalog methodsFor: 'tools' stamp: 'MM 6/16/2023 18:41:10'!
menuItemsForOpenGroup

	^ (ImplementorsCatalog new search: #worldMenuOptions)
		collect: [ :implementor |
				implementor compiledMethod
					valueWithReceiver: implementor
					methodClass arguments: {} ]! !

!ToolsCatalog methodsFor: 'as yet unclassified' stamp: 'MM 2/6/2021 15:12:14'!
keyStrokeCharacter
	^ $t! !

!ToolsCatalog class methodsFor: 'instance creation' stamp: 'NPM 4/4/2020 02:04:14'!
create

	^ self
		new
		initializeWith: ImplementorsCatalog create! !

!CompositeCatalogResult methodsFor: 'browsing' stamp: 'NPM 4/20/2020 16:31:40'!
browse
	
	catalog browse: result! !

!CompositeCatalogResult methodsFor: 'initialization' stamp: 'NPM 4/20/2020 16:54:28'!
initializeWith: aResult from: aCatalog

	catalog := aCatalog.
	result := aResult.! !

!CompositeCatalogResult methodsFor: 'printing' stamp: 'NPM 4/20/2020 16:24:02'!
catalogNamePrefix
	
	^ '[', catalog name, ']'! !

!CompositeCatalogResult methodsFor: 'printing' stamp: 'NPM 4/20/2020 16:29:57'!
displayStringOrText

	^ self catalogNamePrefix, ' ', result displayStringOrText! !

!CompositeCatalogResult class methodsFor: 'instance creation' stamp: 'NPM 4/20/2020 16:54:28'!
with: aResult from: aCatalog

	^ self
		new
		initializeWith: aCatalog
		from: aResult! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 01:20:03'!
catalogAfterSelectedCatalog

	^ (catalogs last = selectedCatalog)
		ifTrue: [ catalogs first ]
		ifFalse: [ catalogs at: (catalogs indexOf: selectedCatalog) + 1 ]! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 01:19:40'!
catalogBeforeSelectedCatalog

	^ (catalogs first = selectedCatalog)
		ifTrue: [ catalogs last ]
		ifFalse: [ catalogs at: (catalogs indexOf: selectedCatalog) - 1 ]! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 00:29:28'!
catalogsDo: aBlock
	
	catalogs do: aBlock! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 3/29/2020 13:05:43'!
changeSelectedCatalog: aCatalog

	self selectCatalog: aCatalog.
	self refreshSearchResults.
		
	! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 3/29/2020 13:03:03'!
isSelectedCatalog: aCatalog

	^ selectedCatalog = aCatalog
		
	! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 01:04:44'!
selectCatalog: aCatalog

	selectedCatalog := aCatalog.
	
	self changed: selectedCatalogChangeEvent.
	! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 01:20:35'!
selectNextCatalog
	
	self changeSelectedCatalog: self catalogAfterSelectedCatalog! !

!Finder methodsFor: 'catalogs' stamp: 'NPM 4/2/2020 01:19:50'!
selectPreviousCatalog
	
	self changeSelectedCatalog: self catalogBeforeSelectedCatalog! !

!Finder methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:33:58'!
refreshSearchResults

	self searchForResults! !

!Finder methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:33:25'!
search: aQuery

	currentQuery = aQuery
		ifTrue: [ ^ self ].

	currentQuery := aQuery.
	self searchForResults.
	! !

!Finder methodsFor: 'searching' stamp: 'NPM 4/2/2020 02:33:29'!
searchForResults

	results := selectedCatalog search: currentQuery.
	
	selectedResultIndex := results
		ifEmpty: 0
		ifNotEmpty: 1.
		
	self changed: #results.! !

!Finder methodsFor: 'initialization' stamp: 'NPM 3/29/2020 01:59:55'!
initializeCatalogs: aCollectionOfCatalogs

	catalogs := aCollectionOfCatalogs.
	selectedCatalog := catalogs first.! !

!Finder methodsFor: 'initialization' stamp: 'NPM 4/20/2020 17:03:35'!
initializeEventNames

	selectedCatalogChangeEvent := #selectedCatalog.
	browseSelectedResultEvent := #browseSelectedResult.
	closeEvent := #close.! !

!Finder methodsFor: 'initialization' stamp: 'NPM 5/24/2020 13:27:54'!
initializeResults
	
	currentQuery := ''.
	results := OrderedCollection new.
	selectedResultIndex := 0.! !

!Finder methodsFor: 'initialization' stamp: 'NPM 5/24/2020 13:26:37'!
initializeWithAll: aCollectionOfCatalogs

	super initialize.
	
	self initializeResults.
	self initializeCatalogs: aCollectionOfCatalogs.	
	self initializeEventNames.! !

!Finder methodsFor: 'events-old protocol' stamp: 'NPM 4/2/2020 01:04:08'!
isBrowseSelectedResultEvent: anEvent ifTrue: aBlock
	
	anEvent = browseSelectedResultEvent
		ifTrue: aBlock! !

!Finder methodsFor: 'events-old protocol' stamp: 'NPM 4/20/2020 17:06:25'!
isCloseEvent: anEvent ifTrue: aBlock

	anEvent = closeEvent
		ifTrue: aBlock! !

!Finder methodsFor: 'events-old protocol' stamp: 'NPM 4/2/2020 01:05:06'!
isSelectedCatalogChange: anEvent ifTrue: aBlock

	anEvent = selectedCatalogChangeEvent
		ifTrue: aBlock! !

!Finder methodsFor: 'results' stamp: 'HAW 6/30/2020 09:32:42'!
browseSelectedResult
	
	| selected |
	
	selected := results at: selectedResultIndex ifAbsent: [^self].
	selectedCatalog browse: selected.
	
	self changed: browseSelectedResultEvent! !

!Finder methodsFor: 'results' stamp: 'NPM 4/20/2020 17:03:53'!
close
	
	self changed: closeEvent! !

!Finder methodsFor: 'results' stamp: 'NPM 3/28/2020 01:43:57'!
results
	
	^ results! !

!Finder methodsFor: 'results' stamp: 'NPM 4/2/2020 01:09:49'!
selectNextResult
	
	results ifEmpty: [ ^ self ].
	
	selectedResultIndex = results size
		ifTrue: [ self selectedResultIndex: 1 ]
		ifFalse: [ self selectedResultIndex: selectedResultIndex + 1].! !

!Finder methodsFor: 'results' stamp: 'NPM 4/26/2020 22:20:18'!
selectPreviousResult

	results ifEmpty: [ ^ self ].
	
	selectedResultIndex = 1
		ifTrue: [ self selectedResultIndex: results size ]
		ifFalse: [ self selectedResultIndex: selectedResultIndex - 1].
	! !

!Finder methodsFor: 'results' stamp: 'NPM 3/28/2020 01:44:05'!
selectedResultIndex
	
	^ selectedResultIndex! !

!Finder methodsFor: 'results' stamp: 'NPM 4/2/2020 01:07:20'!
selectedResultIndex: anIndex 
	
	selectedResultIndex _ anIndex.
	self changed: #selectedResultIndex.! !

!Finder class methodsFor: 'instance creation' stamp: 'MM 9/8/2020 12:10:07'!
availableCatalogs

	^ OrderedCollection new
		add: Catalog classNames;
		add: Catalog implementors;
		add: Catalog implementedSelectors;
		add: Catalog senders;
		add: Catalog systemCategories;
		add: Catalog tools;
		yourself! !

!Finder class methodsFor: 'instance creation' stamp: 'NPM 4/22/2020 19:35:35'!
defaultCatalogs
	
	| catalogs |
	catalogs := self availableCatalogs.
		
	catalogs addFirst: (Catalog composite: catalogs copy).
	
	^ catalogs! !

!Finder class methodsFor: 'instance creation' stamp: 'NPM 4/22/2020 19:33:33'!
withDefaultCatalogs
	
	^ self
		new
		initializeWithAll: self defaultCatalogs! !

!ResultsSorter methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 14:02:25'!
value: results
	
	self subclassResponsibility! !

!ResultsSorter methodsFor: 'combining' stamp: 'NPM 5/24/2020 14:11:31'!
, other
	
	^ SequentialResultsSorter with: self with: other! !

!ResultsSorter class methodsFor: 'known instances' stamp: 'NPM 5/24/2020 13:40:30'!
alphabetically
	
	^ AlphabeticalResultsSorter new! !

!ResultsSorter class methodsFor: 'known instances' stamp: 'NPM 5/24/2020 14:09:38'!
bySelectorSize
	
	^ SelectorSizeResultsSorter new! !

!ResultsSorter class methodsFor: 'known instances' stamp: 'NPM 5/24/2020 14:09:28'!
bySize
	
	^ SizeResultsSorter new! !

!AlphabeticalResultsSorter methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 13:46:23'!
value: results

	^ results sort: [ :result :otherResult | result <= otherResult ]! !

!SelectorSizeResultsSorter methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 14:09:59'!
value: results

	^ results sort: [ :result :otherResult | result selector size <= otherResult selector size ]! !

!SequentialResultsSorter methodsFor: 'initialization' stamp: 'NPM 5/24/2020 14:03:38'!
initializeWithAll: aCollectionOfResultsSorters 
	
	resultsSorters := aCollectionOfResultsSorters.! !

!SequentialResultsSorter methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 14:03:21'!
value: results
	
	^ resultsSorters
		inject: results
		into: [ :partiallySortedResults :resultsSorter | resultsSorter value: partiallySortedResults ]! !

!SequentialResultsSorter class methodsFor: 'instance creation' stamp: 'NPM 5/24/2020 13:43:10'!
with: firstResultsSorter with: secondResultsSorter 
	
	^ self
		new
		initializeWithAll: (Array with: firstResultsSorter with: secondResultsSorter)! !

!SizeResultsSorter methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 14:08:43'!
value: results

	^ results sort: [ :result :otherResult | result size <= otherResult size ]! !

!SubstringMatcher methodsFor: 'filtering' stamp: 'NPM 4/2/2020 01:25:02'!
filterCollection

	^ collection select: [ :item | item includesSubstring: substring caseSensitive: false ]! !

!SubstringMatcher methodsFor: 'evaluating' stamp: 'NPM 5/24/2020 13:59:04'!
value

	^ resultsSorter value: (self filterCollection asOrderedCollection)! !

!SubstringMatcher methodsFor: 'initialization' stamp: 'NPM 5/24/2020 13:57:53'!
initializeFiltering: aCollection with: aSubstring 
	
	collection := aCollection.
	substring := aSubstring.
	resultsSorter := ResultsSorter alphabetically, ResultsSorter bySize.! !

!SubstringMatcher class methodsFor: 'evaluating' stamp: 'NPM 4/2/2020 01:25:22'!
valueFiltering: aCollection with: aSubstring 
	
	^ (self forFiltering: aCollection with: aSubstring)
		value
		! !

!SubstringMatcher class methodsFor: 'instance creation' stamp: 'NPM 4/2/2020 01:25:18'!
forFiltering: aCollection with: aSubstring 
	
	^ self
		new
		initializeFiltering: aCollection
		with: aSubstring ! !

!CatalogButton methodsFor: 'evaluating' stamp: 'NPM 3/29/2020 13:13:43'!
value
	
	model changeSelectedCatalog: catalog! !

!CatalogButton methodsFor: 'events-old protocol' stamp: 'NPM 4/2/2020 00:45:07'!
handleSelectedCatalogChange: anEvent

	^ model
		isSelectedCatalogChange: anEvent
		ifTrue: [ self changed: #isSelected ]! !

!CatalogButton methodsFor: 'events-old protocol' stamp: 'NPM 4/2/2020 00:45:01'!
update: anEvent

	super update: anEvent.
	
	self handleSelectedCatalogChange: anEvent! !

!CatalogButton methodsFor: 'initialization' stamp: 'NPM 4/2/2020 00:48:35'!
initializeFor: aCatalog model: aFinder 
	
	catalog := aCatalog .
	model := aFinder.
	model addDependent: self.! !

!CatalogButton methodsFor: 'testing' stamp: 'NPM 3/29/2020 13:02:57'!
isSelected

	^ model isSelectedCatalog: catalog! !

!CatalogButton class methodsFor: 'instance creation' stamp: 'NPM 4/2/2020 00:48:35'!
for: aCatalog model: aFinder 
	
	^ self
		new
		initializeFor: aCatalog
		model: aFinder ! !

!SearchBoxEditor methodsFor: 'event handling' stamp: 'MM 2/6/2021 13:24:06'!
forwardToEditor: aKeyboardEvent

	textEditor processKeystrokeEvent: aKeyboardEvent! !

!SearchBoxEditor methodsFor: 'event handling' stamp: 'MM 2/6/2021 13:23:37'!
handleKeyStroke: aKeyboardEvent
	
	^ keyStrokeHandler value: aKeyboardEvent
! !

!SearchBoxEditor methodsFor: 'event handling' stamp: 'MM 2/6/2021 13:23:13'!
processKeystrokeEvent: aKeyboardEvent
	
	(self handleKeyStroke: aKeyboardEvent)
		ifTrue: [ ^ self ].
	
	self forwardToEditor: aKeyboardEvent! !

!SearchBoxEditor methodsFor: 'initialization' stamp: 'NPM 5/3/2020 20:53:48'!
initializeFor: aTextEditor handlingKeyStrokesWith: aKeyStrokeHandler 

	textEditor := aTextEditor.
	keyStrokeHandler := aKeyStrokeHandler.! !

!SearchBoxEditor methodsFor: 'error handling' stamp: 'NPM 4/2/2020 00:39:43'!
doesNotUnderstand: aMessage

	^ aMessage sendTo: textEditor! !

!SearchBoxEditor class methodsFor: 'installing' stamp: 'MM 11/9/2021 14:27:03'!
installOn: aTextModelMorph handlingKeyStrokesWith: aKeyStrokeHandler  
	
	| newEditor textMorph |
	textMorph _ aTextModelMorph innerTextMorph.
	
	newEditor _ self
		forEditor: textMorph editor
		handlingKeyStrokesWith: aKeyStrokeHandler
		.
	textMorph
		instVarNamed: #editor
		put: newEditor.
	! !

!SearchBoxEditor class methodsFor: 'instance creation' stamp: 'NPM 5/3/2020 20:55:32'!
forEditor: aTextEditor handlingKeyStrokesWith: aKeyStrokeHandler  
	
	^ self
		new
		initializeFor: aTextEditor
		handlingKeyStrokesWith: aKeyStrokeHandler
		! !
FinderMorph initialize!
