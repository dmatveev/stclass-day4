Class {
	#name : #STCSubWordsTest,
	#superclass : #TestCase,
	#instVars : [
		'solver'
	],
	#category : #'StClassRus-Day4-Tests'
}

{ #category : #initialization }
STCSubWordsTest >> setUp [
	super setUp.
	solver := STCSubWords new
]

{ #category : #initialization }
STCSubWordsTest >> testLC1 [
	self
		assert: (solver solve: 'barfoothefoobarman' with: #('foo' 'bar')) asSet
		equals: #(0 9) asSet
]

{ #category : #initialization }
STCSubWordsTest >> testLC2 [
	self
		assert: (solver
			solve: 'wordgoodgoodgoodbestword'
			with: #('word' 'good' 'best' 'word')) asSet
		equals: #() asSet
]

{ #category : #initialization }
STCSubWordsTest >> testLC3 [
	self
		assert: (solver
			solve: 'barfoofoobarthefoobarman'
			with: #('bar' 'foo' 'the')) asSet
		equals: #() asSet
]
