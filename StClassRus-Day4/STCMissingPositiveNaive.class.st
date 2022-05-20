Class {
	#name : #STCMissingPositiveNaive,
	#superclass : #STCMissingPositive,
	#category : #'StClassRus-Day4'
}

{ #category : #'as yet unclassified' }
STCMissingPositiveNaive >> solve: anArray [
	1 to: anArray size do: [ :i | (anArray includes: i) ifFalse: [ ^i ] ].
	^anArray size + 1.
]
