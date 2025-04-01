Class {
	#name : 'MCPServer',
	#superclass : 'Object',
	#instVars : [
		'teapotInstance',
		'port'
	],
	#category : 'MCPFramework',
	#package : 'MCPFramework'
}

{ #category : 'public' }
MCPServer class >> startDefault [
	"Starts the server on the default port (8080)."
	^ self startOn: 8080
]

{ #category : 'public' }
MCPServer class >> startOn: aPortNumber [
	"Creates an instance, sets the port, and starts the server."
	^ self new
		port: aPortNumber;
		start;
		yourself "Return the started server instance"
]

{ #category : 'initialization' }
MCPServer >> addRoutesTo: server [
	"Define the MCP specific routes on the Teapot instance"

	"GET / - Server Information (MCP Spec Section 3.1)"
	server GET: '/' -> [ :request | " <-- Correct syntax: VERB / '/path' -> block "
		| responseData jsonString |
		responseData := Dictionary new
			at: 'name' put: 'Pharo MCP Demo Server';
			at: 'version' put: '0.1.0';
			at: 'mcp_version' put: '1.0'; "MCP Version we aim to support"
			at: 'root_context_url' put: '/context'; "Relative URL for the root context"
			yourself.
		
		jsonString := NeoJSONWriter toString: responseData.
		
		TeaResponse ok 
			contentType: ZnMimeType applicationJson; 
			entity: jsonString ].

	"GET /context - The Root Context Object (MCP Spec Section 3.2)"
	server GET: '/context' -> [ :request | " <-- Correct syntax "
		| responseData jsonString |
		"TODO: Replace this with actual context data retrieval"
		responseData := Dictionary new
			at: 'name' put: 'Root Context';
			at: 'description' put: 'The main entry point for this server.';
			"Elements should list child contexts or models"
			at: 'elements' put: #(); 
			yourself. 
			
		jsonString := NeoJSONWriter toString: responseData.
		
		TeaResponse ok
			contentType: ZnMimeType applicationJson;
			entity: jsonString ].
		
	"Add more routes here using the 'server VERB / '/path' -> block' syntax"
]

{ #category : 'initialization' }
MCPServer >> initialize [
	"Set default values."
	super initialize.
	port := 8080. "Default port"
	teapotInstance := nil.
]

{ #category : 'initialization' }
MCPServer >> isRunning [
	"Check if the Teapot instance is active."
	^ teapotInstance notNil and: [ teapotInstance isListening ]

]

{ #category : 'initialization' }
MCPServer >> port [
	^ port
]

{ #category : 'initialization' }
MCPServer >> port: aNumber [
	"Set the port number the server should listen on.
	 Should be done before starting."
	port := aNumber.
]

{ #category : 'initialization' }
MCPServer >> start [
	"Configure routes and start the Teapot server."
	self isRunning ifTrue: [ 
		Transcript show: 'MCP Server already running on port: '; show: port printString; cr.
		^ self ].

	Transcript show: 'Starting MCP Server on port: '; show: port printString; cr.
	
	"Create and configure Teapot basic options"
	teapotInstance := Teapot configure: { 
		#port -> self port.
		#debugMode -> true. "Enable for development, disable for production"
	}.
	
	"Define our MCP routes on the created instance"
	self addRoutesTo: teapotInstance. " <-- Make sure this calls the corrected method"

	"Start listening"
	teapotInstance start. 
	Transcript show: 'MCP Server started successfully.'; cr.
]

{ #category : 'initialization' }
MCPServer >> stop [
	"Stop the Teapot server."
	self isRunning ifFalse: [ 
		Transcript show: 'MCP Server is not running.'; cr.
		^ self ].
		
	Transcript show: 'Stopping MCP Server on port: '; show: port printString; cr.
	teapotInstance stop.
	teapotInstance := nil.
	Transcript show: 'MCP Server stopped.'; cr.
]
