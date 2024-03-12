// APIs.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation

open class PureCloudPlatformClientV2API {
    /// Defaults to https://api.mypurecloud.com. Specify the full base url if not using the default.
    public static var basePath = "https://api.mypurecloud.com"
    public static var credential: URLCredential?
    public static var customHeaders: [String:String] = [:]
    public static var requestBuilderFactory: RequestBuilderFactory = UrlSessionRequestBuilderFactory()

    /// The PureCloud access token to use for API requests.
    public static var accessToken: String?
    public static let userAgent = "PureCloud SDK/swift"
}

open class RequestBuilder<T> {
    var credential: URLCredential?
    var headers: [String:String]
    public let body: Data?
    public let method: String
    public let url: URLComponents

    /// Optional block to obtain a reference to the request's progress instance when available.
    public var onProgressReady: ((Progress) -> ())?

    required public init(method: String, url: URLComponents, body: Data?, headers: [String:String] = [:]) {
        self.method = method
        self.url = url
        self.body = body
        self.headers = headers

        addHeaders(PureCloudPlatformClientV2API.customHeaders)
        addHeadersFromPlatformClient()
    }

    open func addHeaders(_ aHeaders:[String:String]) {
        for (header, value) in aHeaders {
            headers[header] = value
        }
    }

    open func addHeadersFromPlatformClient() {
        if let token = PureCloudPlatformClientV2API.accessToken {
            headers["Authorization"] = "bearer " + token
        }
        headers["User-Agent"] = PureCloudPlatformClientV2API.userAgent        
    }

    open func execute(_ completion: @escaping (_ response: Response<T>?, _ error: Error?) -> Void) { }

    open func decode<T: Decodable>(_ response: Response<T>) throws -> Void { }

    public func addHeader(name: String, value: String) -> Self {
        if !value.isEmpty {
            headers[name] = value
        }
        return self
    }

    open func addCredential() -> Self {
        self.credential = PureCloudPlatformClientV2API.credential
        return self
    }
}

public protocol RequestBuilderFactory {
    func getBuilder<T>() -> RequestBuilder<T>.Type
}
