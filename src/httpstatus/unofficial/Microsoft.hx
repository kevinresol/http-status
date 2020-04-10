package httpstatus.unofficial;

import httpstatus.HttpStatusCode;
import httpstatus.HttpStatusMessage;

@:enum
abstract Microsoft(HttpStatusCode) from HttpStatusCode {

    var SessionTimeout = 440;

    @:to public function toStatusCode():HttpStatusCode return this;
    @:to public function toStatusMessage():HttpStatusMessage {
        return switch this {
            case 440: 'Client Session Expired Must Log In Again';
            default: this.toMessage();
        } 
    }
}
