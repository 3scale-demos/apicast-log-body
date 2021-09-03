# Log Body Policy

This policy allows users to log both request and response payload in the log.
It also contains a parameter which allows you to define how many characters 
to log from the response (in case you expect a very long response).
 
## Caveats

This policy is using body_filter_by_lua directive and can result in blocking 
behavior when waiting for the response body data stream to end.