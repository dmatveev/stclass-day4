Class {
	#name : #STCKSortedListsStreams,
	#superclass : #STCKSortedLists,
	#category : #'StClassRus-Day4'
}

{ #category : #'as yet unclassified' }
STCKSortedListsStreams >> solve: anArray [
	| streams result |
	result := LinkedList new.
	streams := (anArray collect: [ :each | each readStream ])
		reject: [ :each | each atEnd ].
	streams := streams asSet.
	[ streams isEmpty ] whileFalse: [ 
		| pick |
		pick := streams detectMin: [ :s | s peek ].
		result add: pick next.
		pick atEnd ifTrue: [ streams remove: pick ]].
	^result
]
