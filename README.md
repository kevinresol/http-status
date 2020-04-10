# http-status

List of HTTP status codes and reasons.

## Usage

```haxe
var code:HttpStatusCode = OK;
var reason = new HttpStatusMessage(code);
// or use implicit cast
var reason:HttpStatusMessage = code;
```

## Unofficial codes

HttpStatusCode contains the current official specifications for HTTP status code.

There exist other unofficial codes, that can be regrouped by categories (Microsoft, Nginx and so on). Overlap is very small right now but there are added in the `httpstatus.unofficial` package anyway.

Only the `Microsoft.hx` http status codes are implemented right now.
Feel free to PR for others.

```haxe
import httpstatus.HttpStatusCode;
import httpstatus.HttpStatusMessage;
import httpstatus.unofficial.Microsoft;

var code    : Microsoft         = SessionTimeout;   // 440
var code2   : HttpStatusCode    = SessionTimeout;   // 440

var reason  : HttpStatusMessage = SessionTimeout;   // "Client Session Expired Must Log In Again"
var reason2 : HttpStatusMessage = code;             // "Client Session Expired Must Log In Again"
// but:
var reason3 : HttpStatusMessage = code2;            // "Unknown Status". This is a limitation 
```

## With tink

There are automatic `#if tink_core` fences in the code, so this does not require it.

Producing these error codes on a server using [tink](https://github.com/haxetink/tink_core) is straightforward.
When getting a `tink.core.Error` on the client, one can use `switch (e.code : HttpStatusCode)`.
If your server chose to use some exotic status code such as 440 SessionTimeout (Microsoft), you can use something like:

```haxe
switch (e.code : httpstatus.unofficial.Microsoft) {
    case SessionTimeout:
    case Forbidden:         // regular codes from HttpStatusCode are also available
}
```
