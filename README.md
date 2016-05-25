# http-status

List of HTTP status codes and reasons.

## Usage

```haxe
var code:HttpStatusCode = OK;
var reason = new HttpStatusMessage(code);
// or use implicit cast
var reason:HttpStatusMessage = code;
```