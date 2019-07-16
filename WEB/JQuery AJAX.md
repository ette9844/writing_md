`$.get(_URL,callback_);`

`$.post(_URL,data,callback_);`


#### [jQuery.ajax( [settings ] )](https://api.jquery.com/jquery.ajax/#jQuery-ajax-settings)

-   **url**
    
    Type:  [String](http://api.jquery.com/Types/#String)
    
    A string containing the URL to which the request is sent.
    
-   **settings**
    
    Type:  [PlainObject](http://api.jquery.com/Types/#PlainObject) 객체 형태
   
    A set of key/value pairs that configure the Ajax request. All settings are optional. A default can be set for any option with  [$.ajaxSetup()](https://api.jquery.com/jQuery.ajaxSetup/). See  [jQuery.ajax( settings )](https://api.jquery.com/jquery.ajax/#jQuery-ajax-settings)  below for a complete list of all settings.

```js
$.ajax({
 accepts: {
 mycustomtype: 'application/x-some-custom-type'
 },

 ``// Instructions for how to deserialize a `mycustomtype` ``

 `converters: {`

 `'text mycustomtype': function(result) {`

 `// Do Stuff`

 `return newresult;`

 `}`

 `},`

 ``// Expect a `mycustomtype` back from server``

 `dataType: 'mycustomtype'`

`});`
```

<!--stackedit_data:
eyJoaXN0b3J5IjpbMTAwODcxMDg4OF19
-->