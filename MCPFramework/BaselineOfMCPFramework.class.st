Class {
	#name : 'BaselineOfMCPFramework',
	#superclass : 'BaselineOf',
	#category : 'MCPFramework-Baseline',
	#package : 'MCPFramework',
	#tag : 'Baseline'
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
		"== External Dependencies =="
		"Load baselines of required external projects."
		
		spec baseline: 'Teapot' with: [
			 spec repository: 'github://zeroflag/Teapot:master/src' ].
		
		spec baseline: 'NeoJSON' with: [
			 spec repository: 'github://svenvc/NeoJSON:master/repository' ].
		
		spec baseline: 'ZincHTTPComponents' with: [
			 spec repository: 'github://svenvc/zinc:master/repository' ].
		
		"== Your Project Package =="
		"Define the main package for your MCP framework."
		spec package: 'MCPFramework' with: [
			"Repository containing *only* this package's code.
			 IMPORTANT: Ensure ':main/src' path is correct."
			spec repository: 'github://paulwilke/pharo-mcp-server:main/src'. 
			
			"Declare required external baselines for this package."
			spec requires: #('Teapot' 'NeoJSON' 'ZincHTTPComponents'). 
		].

		"== Group Definitions =="
		"Groups bundle packages for easier loading."
		
		"The 'Core' group contains essential functionality."
		spec group: 'Core' with: #('MCPFramework').
		
		"The 'default' group loads when no group is specified.
		 Usually includes 'Core'."
		spec group: 'default' with: #('Core'). 
		
		"The 'Tests' group for future test packages."
		spec group: 'Tests' with: #(). "Add test packages here later, e.g., 'MCPFramework-Tests'"
		
		"Optional: If tests also need Core:"
		"spec group: 'Tests' with: #('Core' 'MCPFramework-Tests')." 
	].
]
