component {
	// Module Properties
	this.title 				= "NumVerify API Module";
	this.author 			= "Sean Daniels";
	this.description 		= "Module for interacting with Numverify APIs";
	this.version			= "1.0.3";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "numverify";
	// Model Namespace
	this.modelNamespace		= "numverify";
	// CF Mapping
	this.cfmapping			= "numverify";
	// Auto-map models
	this.autoMapModels		= true;
	// Module Dependencies
	this.dependencies 		= [];

	function configure(){
		// module settings - stored in modules.name.settings
		settings = {
			 "endpoint":"http://apilayer.net/api/" 
			
			 // api keys
			,"accessKey":""
		};
	}
}