package httpstatus;

@:enum @:transitive
abstract HttpStatusCode(Int) from Int {
	
	var Continue = 100;
	var SwitchingProtocols = 101;
	var Processing = 102;
	var OK = 200;
	var Created = 201;
	var Accepted = 202;
	var NonAuthoritativeInformation = 203;
	var NoContent = 204;
	var ResetContent = 205;
	var PartialContent = 206;
	var MultiStatus = 207;
	var AlreadyReported = 208;
	var IMUsed = 226;
	var MultipleChoices = 300;
	var MovedPermanently = 301;
	var Found = 302;
	var SeeOther = 303;
	var NotModified = 304;
	var UseProxy = 305;
	var SwitchProxy = 306;
	var TemporaryRedirect = 307;
	var PermanentRedirect = 308;
	var BadRequest = 400;
	var Unauthorized = 401;
	var PaymentRequired = 402;
	var Forbidden = 403;
	var NotFound = 404;
	var MethodNotAllowed = 405;
	var NotAcceptable = 406;
	var ProxyAuthenticationRequired = 407;
	var RequestTimeout = 408;
	var Conflict = 409;
	var Gone = 410;
	var LengthRequired = 411;
	var PreconditionFailed = 412;
	var PayloadTooLarge = 413;
	var URITooLong = 414;
	var UnsupportedMediaType = 415;
	var RangeNotSatisfiable = 416;
	var ExpectationFailed = 417;
	var ImATeapot = 418;
	var MisdirectedRequest = 421;
	var UnprocessableEntity = 422;
	var Locked = 423;
	var FailedDependency = 424;
	var UpgradeRequired = 426;
	var PreconditionRequired = 428;
	var TooManyRequests = 429;
	var RequestHeaderFieldsTooLarge = 431;
	// var SessionTimeout = 440;             // see Microsoft.hx
	// var RetryWith = 449;                  // see Microsoft.hx
	// var BlockedByParentalControl = 450;   // see Microsoft.hx
	// var ExchangeActiveSyncRedirect = 451; // see Microsoft.hx
	var UnavailableForLegalReasons = 451;
	var InternalServerError = 500;
	var NotImplemented = 501;
	var BadGateway = 502;
	var ServiceUnavailable = 503;
	var GatewayTimeout = 504;
	var HTTPVersionNotSupported = 505;
	var VariantAlsoNegotiates = 506;
	var InsufficientStorage = 507;
	var LoopDetected = 508;
	var NotExtended = 510;
	var NetworkAuthenticationRequired = 511;
	
	@:to
	public inline function toMessage():HttpStatusMessage
		return new HttpStatusMessage(this);
	
	@:to
	public inline function toInt():Int
		return this;
		
	
	@:op(A>B) static function gt<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	@:op(A<B) static function lt<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	@:op(A>=B) static function gte<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	@:op(A>=B) static function lte<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	@:op(A==B) static function eq<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	@:op(A!=B) static function neq<T>(a:HttpStatusCode, b:HttpStatusCode):Bool;
	
	#if tink_core
	@:from
	public static inline function fromErrorCode(code:tink.core.Error.ErrorCode):HttpStatusCode
		return (code:Int);
	#end
	
	#if tink_web
	@:to
	public inline function toWebResponse():tink.web.routing.Response
		return toOutgoingResponse();
	#end
	
	#if tink_http
	@:to
	public function toOutgoingResponse():tink.http.Response.OutgoingResponse
		return new tink.http.Response.OutgoingResponse(
			new tink.http.Response.ResponseHeader(toInt(), toMessage(), [new tink.http.Header.HeaderField('content-length', '0')]),
			#if pure tink.io.Source.EMPTY #else '' #end
		);
	@:from
	public static inline function fromIncomingResponse(res:tink.http.Response.IncomingResponse):HttpStatusCode
		return res.header.statusCode;
	#end
}
