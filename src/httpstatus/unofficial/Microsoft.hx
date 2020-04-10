package httpstatus.unofficial;

import httpstatus.HttpStatusCode;
import httpstatus.HttpStatusMessage;

@:enum
abstract Microsoft(HttpStatusCode) from HttpStatusCode {

    var SessionTimeout             = 440; // The client's session has expired and must log in again
    var RetryWith                  = 449; // The server cannot honour the request because the user has not provided the required information
    var BlockedByParentalControl   = 450; // When Windows Parental Controls are turned on and are blocking access
    var ExchangeActiveSyncRedirect = 451; // Used in Exchange ActiveSync when either a more efficient server is available or the server cannot access the users' mailbox.[84] The client is expected to re-run the HTTP AutoDiscover operation to find a more appropriate server.

    @:to public function toInt() : Int return this;

    @:to public function toStatusCode():HttpStatusCode return this;
    @:to public function toStatusMessage():HttpStatusMessage {
        return switch this {
            case 440: 'Client Session Expired Must Log In Again';
            case 449: 'User Has Not Provided The Required Information';
            case 450: 'Blocked By Parental Control';
            case 451: 'Exchange ActiveSync Redirect'; 
            default: this.toMessage();
        }
    }

    #if tink_core
    @:from public static inline function fromErrorCode(code:tink.core.Error.ErrorCode):Microsoft return (code:Int);
    #end

}
