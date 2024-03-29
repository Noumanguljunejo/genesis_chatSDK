//
// TokensAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class TokensAPI {
    
    
    /**
     Delete all auth tokens for the specified user.
     
     - parameter userId: (path) User ID 
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteToken(userId: String, completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        let requestBuilder = deleteTokenWithRequestBuilder(userId: userId)
        requestBuilder.execute { (response: Response<Void>?, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete all auth tokens for the specified user.
     - DELETE /api/v2/tokens/{userId}
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     
     - parameter userId: (path) User ID 

     - returns: RequestBuilder<Void> 
     */
    open class func deleteTokenWithRequestBuilder(userId: String) -> RequestBuilder<Void> {        
        var path = "/api/v2/tokens/{userId}"
        let userIdPreEscape = "\(userId)"
        let userIdPostEscape = userIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{userId}", with: userIdPostEscape, options: .literal, range: nil)
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", url: requestUrl!, body: body)
    }

    /**
     Delete auth token used to make the request.
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func deleteTokensMe(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        let requestBuilder = deleteTokensMeWithRequestBuilder()
        requestBuilder.execute { (response: Response<Void>?, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Delete auth token used to make the request.
     - DELETE /api/v2/tokens/me
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth

     - returns: RequestBuilder<Void> 
     */
    open class func deleteTokensMeWithRequestBuilder() -> RequestBuilder<Void> {        
        let path = "/api/v2/tokens/me"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "DELETE", url: requestUrl!, body: body)
    }

    
    
    /**
     Fetch information about the current token
     
     - parameter preserveIdleTTL: (query) preserveIdleTTL indicates whether the idle token timeout should be reset or preserved. If preserveIdleTTL is true, then TTL value is not reset. If unset or false, the value is reset. (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTokensMe(preserveIdleTTL: Bool? = nil, completion: @escaping ((_ data: TokenInfo?,_ error: Error?) -> Void)) {
        let requestBuilder = getTokensMeWithRequestBuilder(preserveIdleTTL: preserveIdleTTL)
        requestBuilder.execute { (response: Response<TokenInfo>?, error) -> Void in
            do {
                if let e = error {
                    completion(nil, e)
                } else if let r = response {
                    try requestBuilder.decode(r)
                    completion(response?.body, error)
                } else {
                    completion(nil, error)
                }
            } catch {
                completion(nil, error)
            }
        }
    }

    /**
     Fetch information about the current token
     - GET /api/v2/tokens/me
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "OAuthClient" : {
    "authorizedGrantType" : "CODE",
    "dateToDelete" : "2000-01-23T04:56:07.000+00:00",
    "dateCreated" : "2000-01-23T04:56:07.000+00:00",
    "createdBy" : "{}",
    "scope" : [ "scope", "scope" ],
    "organization" : "{}",
    "name" : "name",
    "dateModified" : "2000-01-23T04:56:07.000+00:00",
    "modifiedBy" : "{}",
    "id" : "id",
    "state" : "active",
    "roleDivisions" : [ {
      "roleId" : "roleId",
      "divisionId" : "divisionId"
    }, {
      "roleId" : "roleId",
      "divisionId" : "divisionId"
    } ]
  },
  "organization" : "{}",
  "homeOrganization" : "{}",
  "authorizedScope" : [ "authorizedScope", "authorizedScope" ],
  "clonedUser" : "{}"
}, statusCode=200}]
     
     - parameter preserveIdleTTL: (query) preserveIdleTTL indicates whether the idle token timeout should be reset or preserved. If preserveIdleTTL is true, then TTL value is not reset. If unset or false, the value is reset. (optional)

     - returns: RequestBuilder<TokenInfo> 
     */
    open class func getTokensMeWithRequestBuilder(preserveIdleTTL: Bool? = nil) -> RequestBuilder<TokenInfo> {        
        let path = "/api/v2/tokens/me"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        var requestUrl = URLComponents(string: URLString)
        requestUrl?.queryItems = APIHelper.mapValuesToQueryItems([
            "preserveIdleTTL": preserveIdleTTL
        ])

        let requestBuilder: RequestBuilder<TokenInfo>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    /**
     Get the current Idle Token Timeout Value
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getTokensTimeout(completion: @escaping ((_ data: IdleTokenTimeout?,_ error: Error?) -> Void)) {
        let requestBuilder = getTokensTimeoutWithRequestBuilder()
        requestBuilder.execute { (response: Response<IdleTokenTimeout>?, error) -> Void in
            do {
                if let e = error {
                    completion(nil, e)
                } else if let r = response {
                    try requestBuilder.decode(r)
                    completion(response?.body, error)
                } else {
                    completion(nil, error)
                }
            } catch {
                completion(nil, error)
            }
        }
    }

    /**
     Get the current Idle Token Timeout Value
     - GET /api/v2/tokens/timeout
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "idleTokenTimeoutSeconds" : 300,
  "enableIdleTokenTimeout" : true
}, statusCode=200}]

     - returns: RequestBuilder<IdleTokenTimeout> 
     */
    open class func getTokensTimeoutWithRequestBuilder() -> RequestBuilder<IdleTokenTimeout> {        
        let path = "/api/v2/tokens/timeout"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<IdleTokenTimeout>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    /**
     Verify user token
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func headTokensMe(completion: @escaping ((_ data: Void?,_ error: Error?) -> Void)) {
        let requestBuilder = headTokensMeWithRequestBuilder()
        requestBuilder.execute { (response: Response<Void>?, error) -> Void in
            if error == nil {
                completion((), error)
            } else {
                completion(nil, error)
            }
        }
    }

    /**
     Verify user token
     - HEAD /api/v2/tokens/me
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth

     - returns: RequestBuilder<Void> 
     */
    open class func headTokensMeWithRequestBuilder() -> RequestBuilder<Void> {        
        let path = "/api/v2/tokens/me"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<Void>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "HEAD", url: requestUrl!, body: body)
    }

    
    
    /**
     Update or Enable/Disable the Idle Token Timeout
     
     - parameter body: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func putTokensTimeout(body: IdleTokenTimeout? = nil, completion: @escaping ((_ data: IdleTokenTimeout?,_ error: Error?) -> Void)) {
        let requestBuilder = putTokensTimeoutWithRequestBuilder(body: body)
        requestBuilder.execute { (response: Response<IdleTokenTimeout>?, error) -> Void in
            do {
                if let e = error {
                    completion(nil, e)
                } else if let r = response {
                    try requestBuilder.decode(r)
                    completion(response?.body, error)
                } else {
                    completion(nil, error)
                }
            } catch {
                completion(nil, error)
            }
        }
    }

    /**
     Update or Enable/Disable the Idle Token Timeout
     - PUT /api/v2/tokens/timeout
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "idleTokenTimeoutSeconds" : 300,
  "enableIdleTokenTimeout" : true
}, statusCode=200}]
     
     - parameter body: (body)  (optional)

     - returns: RequestBuilder<IdleTokenTimeout> 
     */
    open class func putTokensTimeoutWithRequestBuilder(body: IdleTokenTimeout? = nil) -> RequestBuilder<IdleTokenTimeout> {        
        let path = "/api/v2/tokens/timeout"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<IdleTokenTimeout>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PUT", url: requestUrl!, body: body)
    }

}
