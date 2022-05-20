Class {
	#name : #STCSubWords,
	#superclass : #Object,
	#instVars : [
		'result',
		'words',
		'matches',
		'hitStart',
		'thisIndex',
		'hitLength',
		'banned',
		'wordLength'
	],
	#category : #'StClassRus-Day4'
}

{ #category : #private }
STCSubWords >> handleWordHit [
	"Found the full matching word in our bag.
	Add it to banned bag, continue matches without one"
	banned add: matches anyOne.
	
	"Start lookup again but reduce the search scope"
	hitLength := 0.
	matches := words copy.
	banned do: [:each | matches remove: each].
	matches ifEmpty: [ 
		"All words banned == Got the full hit"
		result add: hitStart.
		self resetMatchState ]
]

{ #category : #private }
STCSubWords >> processNext: c [
	| filter |
	filter := [ :each | (each at: hitLength + 1 ) = c ].
	matches
		ifEmpty: [ matches := words select: filter ] 
		ifNotEmpty: [ matches := matches select: filter ].
	matches
		ifEmpty: [
			hitLength > 0 ifTrue: [ matches := words select: filter ]. 
			self resetMatchState ].
	matches ifNotEmpty: [
			(hitLength = 0 and: [banned isEmpty]) ifTrue: [ hitStart := thisIndex ].
			hitLength := hitLength + 1.
			hitLength = wordLength ifTrue: [self handleWordHit]]. 
]

{ #category : #private }
STCSubWords >> resetMatchState [
	"No open (matched) hit"
	hitStart := 0.
	hitLength := 0.
	banned removeAll.
]

{ #category : #'as yet unclassified' }
STCSubWords >> solve: aString with: anArray [
	"Reset the initial state for the new search process."
	result := OrderedCollection new.
	words := Bag withAll: anArray.
	matches := Bag new.
	banned := Bag new.
	hitStart := 0.
	hitLength := 0.
	wordLength := anArray first size.
	thisIndex := 1.
	aString do: [ :c |
			self processNext: c.
			thisIndex := thisIndex + 1 ].
	^result
]
