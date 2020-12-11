component {
	processingdirective preserveCase=true;

	property name="settings" inject="coldbox:moduleSettings:numverify";	

	public struct function validate(required string phone, string countryCode) {
		var params = { number:arguments.phone }
		if (!isnull(arguments.countryCode))
			params.country_code = arguments.countryCode;

		return call( "validate", params );
	}

	public struct function countries() {
		return call( "countries" );
	}

	private struct function call( required string path, struct params={} ){
		var params = arguments.params;
		http url="#settings.endpoint#/#arguments.path#" method="get" result="local.cfhttp" {
			httpparam type="url" name="access_key" value="#settings.accessKey#";
			loop collection="#params#" item="local.val" index="local.key" {
				httpparam type="url" name="#local.key#" value="#local.val#";
			}
		}

		var result = parseResponse( local.cfhttp );
		return result;
	}

	private any function parseResponse(required struct response) {
		var exception = { type:"Numverify" }
		
		try {
			var apiResult = deserializeJSON(arguments.response.filecontent);
		} catch (Any e) {
			exception.message = "Deserialization Error"
			exception.detail = serializeJSON(arguments.response);
			throw(argumentCollection:exception);
		}

		return apiResult;
	}	
}