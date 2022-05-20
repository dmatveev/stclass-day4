Class {
	#name : #STCMissingPositiveTest,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'StClassRus-Day4-Tests'
}

{ #category : #initialization }
STCMissingPositiveTest >> createSolver [
	^STCMissingPositiveNaive new
]

{ #category : #initialization }
STCMissingPositiveTest >> setUp [
	super setUp.
	solver := self createSolver.
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveDups [
	self
		assert: (solver solve: #(1 1 1) asOrderedCollection)
		equals: 2
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC1 [
	self
		assert: (solver solve: #(1 2 0) asOrderedCollection)
		equals: 3
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC2 [
	self
		assert: (solver solve: #(3 4 -1 1) asOrderedCollection)
		equals: 2
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC3 [
	self
		assert: (solver solve: #(7 8 9 11 12) asOrderedCollection)
		equals: 1
]
