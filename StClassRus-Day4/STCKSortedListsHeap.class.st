Class {
	#name : #STCKSortedListsHeap,
	#superclass : #STCKSortedLists,
	#category : #'StClassRus-Day4'
}

{ #category : #'as yet unclassified' }
STCKSortedListsHeap >> solve: anArray [
	| heap result |
	result := LinkedList new.
	heap := Heap new
		sortBlock: [ :a :b | a peek < b peek ];
		addAll: (anArray reject: #isEmpty thenCollect: #readStream);
		yourself.
	[ heap isEmpty ] whileFalse: [ 
		| pick |
		pick := heap first.
		result add: pick next.
		pick atEnd
			ifTrue: [ heap remove: pick ]
			ifFalse: [heap reSort]].
	^result
]
