Class {
	#name : #STCMissingPositiveTest,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'StClassRus-Day4-Tests'
}

{ #category : #initialization }
STCMissingPositiveTest >> setUp [
	super setUp.
	solver := STCMissingPositive new.
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC1 [
	self
		assert: (solver solve: #(1 2 0))
		equals: 3
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC2 [
	self
		assert: (solver solve: #(3 4 -1 1))
		equals: 2
]

{ #category : #initialization }
STCMissingPositiveTest >> testSolveLC3 [
	self
		assert: (solver solve: #(7 8 9 11 12))
		equals: 1
]
