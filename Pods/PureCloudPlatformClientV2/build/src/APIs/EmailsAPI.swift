//
// EmailsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class EmailsAPI {
    /**
     Get email Contact Center settings
     
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getEmailsSettings(completion: @escaping ((_ data: EmailSettings?,_ error: Error?) -> Void)) {
        let requestBuilder = getEmailsSettingsWithRequestBuilder()
        requestBuilder.execute { (response: Response<EmailSettings>?, error) -> Void in
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
     Get email Contact Center settings
     - GET /api/v2/emails/settings
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "multipleRouteDestinationsOnInboundEmailEnabled" : true
}, statusCode=200}]

     - returns: RequestBuilder<EmailSettings> 
     */
    open class func getEmailsSettingsWithRequestBuilder() -> RequestBuilder<EmailSettings> {        
        let path = "/api/v2/emails/settings"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<EmailSettings>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    
    
    /**
     Patch email Contact Center settings
     
     - parameter body: (body)  (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func patchEmailsSettings(body: EmailSettings? = nil, completion: @escaping ((_ data: EmailSettings?,_ error: Error?) -> Void)) {
        let requestBuilder = patchEmailsSettingsWithRequestBuilder(body: body)
        requestBuilder.execute { (response: Response<EmailSettings>?, error) -> Void in
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
     Patch email Contact Center settings
     - PATCH /api/v2/emails/settings
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "multipleRouteDestinationsOnInboundEmailEnabled" : true
}, statusCode=200}]
     
     - parameter body: (body)  (optional)

     - returns: RequestBuilder<EmailSettings> 
     */
    open class func patchEmailsSettingsWithRequestBuilder(body: EmailSettings? = nil) -> RequestBuilder<EmailSettings> {        
        let path = "/api/v2/emails/settings"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<EmailSettings>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "PATCH", url: requestUrl!, body: body)
    }

}
