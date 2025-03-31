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
		
		"Voyage - Core is always needed"
 		spec baseline: 'Voyage' with: [
			 spec repository: 'github://pharo-nosql/voyage:master/mc' ].
		
		"Your MCP Framework Package - TODO: Update repository URL!"
		spec package: 'MCPFramework' with: [
			 spec repository: 'github://paulwilke/pharo-mcp-server:main/src'. 
			 spec requires: #('Teapot' 'NeoJSON' 'ZincHTTPComponents' 'Voyage' ). "Explicit dependencies"
			 ].

		"Define Groups"
		spec group: 'Core' with: #('MCPFramework').
		spec group: 'Mongo' with: #('mongo' 'tests'). "Load Core + Mongo by default"
		
		"Optional: Add a group for tests later"
		spec group: 'Tests' with: #(). 
	].
]
