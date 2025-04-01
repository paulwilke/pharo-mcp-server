Class {
	#name : 'BaselineOfMCPFramework',
	#superclass : 'BaselineOf',
	#category : 'MCPFramework-Baseline',
	#package : 'MCPFramework-Baseline'
}

{ #category : 'as yet unclassified' }
BaselineOfMCPFramework class >> preloadForDependencies: spec [
	"You can add preloading actions here if needed for specific dependencies"
	super preloadForDependencies: spec.
]

{ #category : 'baselines' }
BaselineOfMCPFramework >> baseline: spec [
	<baseline>
	spec for: #common do: [
		"External Dependencies"
		spec baseline: 'Teapot' with: [
			 spec repository: 'github://zeroflag/Teapot:master/src' ].
		spec baseline: 'NeoJSON' with: [
			 spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		spec baseline: 'ZincHTTPComponents' with: [
			 spec repository: 'github://svenvc/zinc:master/repository' ].
		
		spec package: 'MCPFramework' with: [
			 spec repository: 'github://paulwilke/pharo-mcp-server:main/src'. 
			 spec requires: #('Teapot' 'NeoJSON' 'ZincHTTPComponents' ). "Explicit dependencies"
			 ].

		"Define Groups"
		spec group: 'Core' with: #('MCPFramework').
		
		"Optional: Add a group for tests later"
		spec group: 'Tests' with: #(). 
	].
]
