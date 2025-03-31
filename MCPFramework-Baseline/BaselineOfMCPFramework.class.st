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
			 spec repository: 'github://pharo-web/teapot:master/src' ].
		spec baseline: 'NeoJSON' with: [
			 spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		spec baseline: 'ZincHTTPComponents' with: [
			 spec repository: 'github://svenvc/zinc:master/repository' ].
		
		"Voyage - Core is always needed"
 		spec baseline: 'VoyageCore' with: [
			 spec repository: 'github://pharo-nosql/voyage:master/mc' ].
		
		"Voyage - MongoDB backend (add others if needed)"
		spec baseline: 'VoyageMongo' with: [
			 spec repository: 'github://pharo-nosql/voyage-mongodb:master/mc' ].
			 
		"Your MCP Framework Package - TODO: Update repository URL!"
		spec package: 'MCPFramework' with: [
			 spec repository: 'github://YOUR_USERNAME/YOUR_REPOSITORY:main/src'. 
			 spec requires: #('Teapot' 'NeoJSON' 'ZincHTTPComponents' 'VoyageCore' ). "Explicit dependencies"
			 ].

		"Define Groups"
		spec group: 'Core' with: #('MCPFramework').
		spec group: 'Mongo' with: #('VoyageMongo'). "MongoDB Backend"
		spec group: 'default' with: #('Core' 'Mongo'). "Load Core + Mongo by default"
		
		"Optional: Add a group for tests later"
		spec group: 'Tests' with: #(). 
	].
]
