Class {
	#name : #STCKSortedListsNaive,
	#superclass : #STCKSortedLists,
	#category : #'StClassRus-Day4'
}

{ #category : #'as yet unclassified' }
STCKSortedListsNaive >> solve: anArray [
	"A single statement, but is highly inefficient"
	^LinkedList withAll: (anArray
		inject: LinkedList new
		into: [:acc :each | acc, each]) asSortedCollection
]
