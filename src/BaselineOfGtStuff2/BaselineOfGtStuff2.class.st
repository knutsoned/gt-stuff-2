Class {
	#name : #BaselineOfGtStuff2,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStuff2
}

{ #category : #loading }
BaselineOfGtStuff2 class >> loadLepiter [
	IceRepository registry  
		detect: [ :aRepository |
			aRepository name = 'gt-stuff-2' ]
		ifFound: [ :aRepository | 
			| defaultDatabase currentProperties |
			defaultDatabase := LeDatabasesRegistry defaultLogicalDatabase.
			currentProperties := defaultDatabase properties.
			currentProperties addRegisteredDirectory: aRepository repositoryDirectory / 'lepiter'.
			defaultDatabase reload ]
		ifNone: [
			self inform: 'Repository not found.' ]
]

{ #category : #baseline }
BaselineOfGtStuff2 >> baseline: spec [
	<baseline>
		^ spec for: #common do: [
			spec package: 'GtStuff2'
		]
]
