Class {
	#name : #STCMissingPositiveSmart,
	#superclass : #STCMissingPositive,
	#category : #'StClassRus-Day4'
}

{ #category : #'as yet unclassified' }
STCMissingPositiveSmart >> solve: anArray [
	| i |
	i := 1.
	[ i <= anArray size ] whileTrue: [| v |
		v := anArray at: i.
		(v > 0 and: [ v ~= i and: [ v <= anArray size and: [v ~= (anArray at: v)]]])
			ifTrue: [ | t | 				
				t := anArray at: v.
				anArray at: v put: v.		"v moves from :i to its right position :v in the mask."
				anArray at: i put: t]		"t goes to position :i. Procedure repeats here!"
				"- i may not exceed anArray size by definition.
				 - v may exceed anArray size, but it doesn't affect the search process"
			ifFalse: [ i := i + 1 ]].
	"After this procedure, value/index mismatch means missed element under this index."
	1 to: anArray size do: [ :mi | (anArray at: mi) ~= mi ifTrue: [^mi]].
	"Corner case: input array is a continuous sequence starting at 0 or 1"
	^anArray size+1.
]
