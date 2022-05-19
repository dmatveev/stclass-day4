Class {
	#name : #STCKSortedListsTest,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'StClassRus-Day4-Tests'
}

{ #category : #initialization }
STCKSortedListsTest >> prepare: anArrayOfLists [
	^ anArrayOfLists collect: [ :list | LinkedList withAll: list ]
]

{ #category : #initialization }
STCKSortedListsTest >> setUp [
	super setUp.
	solver := STCKSortedLists new.
	
]

{ #category : #initialization }
STCKSortedListsTest >> testSolveLC1 [
	| lists |
	lists := self prepare: #((1 4 5) (1 3 4) (2 6)).
	self
		assert: (solver solve: lists)
		equals: (LinkedList withAll: #(1 1 2 3 4 4 5 6)).
]

{ #category : #initialization }
STCKSortedListsTest >> testSolveLC2 [
	| lists |
	lists := self prepare: #().
	self
		assert: (solver solve: lists)
		equals: (LinkedList withAll: #()).
]

{ #category : #initialization }
STCKSortedListsTest >> testSolveLC3 [
	| lists |
	lists := self prepare: #(()).
	self
		assert: (solver solve: lists)
		equals: (LinkedList withAll: #()).
]
