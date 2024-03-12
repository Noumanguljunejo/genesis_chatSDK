//
// InfrastructureAsCodeAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation



open class InfrastructureAsCodeAPI {
    
    
    
    public enum PreferredLanguage_getInfrastructureascodeAccelerator: String { 
        case ar = "ar"
        case cs = "cs"
        case da = "da"
        case de = "de"
        case enUs = "en-US"
        case es = "es"
        case fi = "fi"
        case fr = "fr"
        case it = "it"
        case iw = "iw"
        case ko = "ko"
        case ja = "ja"
        case nl = "nl"
        case no = "no"
        case pl = "pl"
        case ptBr = "pt-BR"
        case ptPt = "pt-PT"
        case sv = "sv"
        case th = "th"
        case tr = "tr"
        case zhCn = "zh-CN"
        case zhTw = "zh-TW"
    }
    
    
    /**
     Get information about an accelerator
     
     - parameter acceleratorId: (path) Accelerator ID 
     - parameter preferredLanguage: (query) Preferred Language (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInfrastructureascodeAccelerator(acceleratorId: String, preferredLanguage: PreferredLanguage_getInfrastructureascodeAccelerator? = nil, completion: @escaping ((_ data: AcceleratorSpecification?,_ error: Error?) -> Void)) {
        let requestBuilder = getInfrastructureascodeAcceleratorWithRequestBuilder(acceleratorId: acceleratorId, preferredLanguage: preferredLanguage)
        requestBuilder.execute { (response: Response<AcceleratorSpecification>?, error) -> Void in
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
     Get information about an accelerator
     - GET /api/v2/infrastructureascode/accelerators/{acceleratorId}
     - Get the complete metadata specification for an accelerator, including requirements and parameters.
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "origin" : "Community",
  "documentation" : [ {
    "description" : "description",
    "location" : "location"
  }, {
    "description" : "description",
    "location" : "location"
  } ],
  "selfUri" : "https://openapi-generator.tech",
  "description" : "description",
  "type" : "Module",
  "classification" : "classification",
  "tags" : [ "tags", "tags" ],
  "products" : [ "products", "products" ],
  "presentation" : [ {
    "schema" : "{}",
    "title" : "title"
  }, {
    "schema" : "{}",
    "title" : "title"
  } ],
  "permissions" : [ "permissions", "permissions" ],
  "name" : "name",
  "id" : "id",
  "results" : "{}"
}, statusCode=200}]
     
     - parameter acceleratorId: (path) Accelerator ID 
     - parameter preferredLanguage: (query) Preferred Language (optional)

     - returns: RequestBuilder<AcceleratorSpecification> 
     */
    open class func getInfrastructureascodeAcceleratorWithRequestBuilder(acceleratorId: String, preferredLanguage: PreferredLanguage_getInfrastructureascodeAccelerator? = nil) -> RequestBuilder<AcceleratorSpecification> {        
        var path = "/api/v2/infrastructureascode/accelerators/{acceleratorId}"
        let acceleratorIdPreEscape = "\(acceleratorId)"
        let acceleratorIdPostEscape = acceleratorIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{acceleratorId}", with: acceleratorIdPostEscape, options: .literal, range: nil)
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        var requestUrl = URLComponents(string: URLString)
        requestUrl?.queryItems = APIHelper.mapValuesToQueryItems([
            "preferredLanguage": preferredLanguage?.rawValue
        ])

        let requestBuilder: RequestBuilder<AcceleratorSpecification>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    
    
    
    
    
    
    
    public enum SortOrder_getInfrastructureascodeAccelerators: String { 
        case asc = "asc"
        case desc = "desc"
    }
    
    
    
    
    
    
    
    public enum Origin_getInfrastructureascodeAccelerators: String { 
        case community = "community"
        case partner = "partner"
        case genesys = "genesys"
    }
    
    
    
    public enum ModelType_getInfrastructureascodeAccelerators: String { 
        case module = "module"
        case accelerator = "accelerator"
        case blueprint = "blueprint"
    }
    
    
    
    
    
    
    /**
     Get a list of available accelerators
     
     - parameter pageSize: (query) The total page size requested (optional)
     - parameter pageNumber: (query) The page number requested (optional)
     - parameter sortBy: (query) variable name requested to sort by (optional)
     - parameter sortOrder: (query) Sort order (optional)
     - parameter name: (query) Filter by name (optional)
     - parameter _description: (query) Filter by description (optional)
     - parameter origin: (query) Filter by origin (optional)
     - parameter type: (query) Filter by type (optional)
     - parameter classification: (query) Filter by classification (optional)
     - parameter tags: (query) Filter by tags (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInfrastructureascodeAccelerators(pageSize: Int? = nil, pageNumber: Int? = nil, sortBy: String? = nil, sortOrder: SortOrder_getInfrastructureascodeAccelerators? = nil, name: String? = nil, _description: String? = nil, origin: Origin_getInfrastructureascodeAccelerators? = nil, type: ModelType_getInfrastructureascodeAccelerators? = nil, classification: String? = nil, tags: String? = nil, completion: @escaping ((_ data: AcceleratorList?,_ error: Error?) -> Void)) {
        let requestBuilder = getInfrastructureascodeAcceleratorsWithRequestBuilder(pageSize: pageSize, pageNumber: pageNumber, sortBy: sortBy, sortOrder: sortOrder, name: name, _description: _description, origin: origin, type: type, classification: classification, tags: tags)
        requestBuilder.execute { (response: Response<AcceleratorList>?, error) -> Void in
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
     Get a list of available accelerators
     - GET /api/v2/infrastructureascode/accelerators
     - Search for accelerators that can be run.
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "total" : 1,
  "pageCount" : 5,
  "pageNumber" : 6,
  "entities" : [ {
    "origin" : "Community",
    "selfUri" : "https://openapi-generator.tech",
    "name" : "name",
    "description" : "description",
    "id" : "id",
    "type" : "Module",
    "classification" : "classification",
    "tags" : [ "tags", "tags" ]
  }, {
    "origin" : "Community",
    "selfUri" : "https://openapi-generator.tech",
    "name" : "name",
    "description" : "description",
    "id" : "id",
    "type" : "Module",
    "classification" : "classification",
    "tags" : [ "tags", "tags" ]
  } ],
  "firstUri" : "https://openapi-generator.tech",
  "lastUri" : "https://openapi-generator.tech",
  "selfUri" : "https://openapi-generator.tech",
  "pageSize" : 0,
  "nextUri" : "https://openapi-generator.tech",
  "previousUri" : "https://openapi-generator.tech"
}, statusCode=200}]
     
     - parameter pageSize: (query) The total page size requested (optional)
     - parameter pageNumber: (query) The page number requested (optional)
     - parameter sortBy: (query) variable name requested to sort by (optional)
     - parameter sortOrder: (query) Sort order (optional)
     - parameter name: (query) Filter by name (optional)
     - parameter _description: (query) Filter by description (optional)
     - parameter origin: (query) Filter by origin (optional)
     - parameter type: (query) Filter by type (optional)
     - parameter classification: (query) Filter by classification (optional)
     - parameter tags: (query) Filter by tags (optional)

     - returns: RequestBuilder<AcceleratorList> 
     */
    open class func getInfrastructureascodeAcceleratorsWithRequestBuilder(pageSize: Int? = nil, pageNumber: Int? = nil, sortBy: String? = nil, sortOrder: SortOrder_getInfrastructureascodeAccelerators? = nil, name: String? = nil, _description: String? = nil, origin: Origin_getInfrastructureascodeAccelerators? = nil, type: ModelType_getInfrastructureascodeAccelerators? = nil, classification: String? = nil, tags: String? = nil) -> RequestBuilder<AcceleratorList> {        
        let path = "/api/v2/infrastructureascode/accelerators"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        var requestUrl = URLComponents(string: URLString)
        requestUrl?.queryItems = APIHelper.mapValuesToQueryItems([
            "pageSize": pageSize?.encodeToJSON(), 
            "pageNumber": pageNumber?.encodeToJSON(), 
            "sortBy": sortBy, 
            "sortOrder": sortOrder?.rawValue, 
            "name": name, 
            "description": _description, 
            "origin": origin?.rawValue, 
            "type": type?.rawValue, 
            "classification": classification, 
            "tags": tags
        ])

        let requestBuilder: RequestBuilder<AcceleratorList>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    
    
    
    
    /**
     Get job status and results
     
     - parameter jobId: (path) Job ID 
     - parameter details: (query) Include details of execution, including job results or error information (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInfrastructureascodeJob(jobId: String, details: Bool? = nil, completion: @escaping ((_ data: InfrastructureascodeJob?,_ error: Error?) -> Void)) {
        let requestBuilder = getInfrastructureascodeJobWithRequestBuilder(jobId: jobId, details: details)
        requestBuilder.execute { (response: Response<InfrastructureascodeJob>?, error) -> Void in
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
     Get job status and results
     - GET /api/v2/infrastructureascode/jobs/{jobId}
     - Get the execution status of a submitted job, optionally including results and error details.
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "submittedBy" : "{}",
  "dryRun" : true,
  "selfUri" : "https://openapi-generator.tech",
  "errorInfo" : "{}",
  "id" : "id",
  "acceleratorId" : "acceleratorId",
  "results" : "results",
  "dateSubmitted" : "2000-01-23T04:56:07.000+00:00",
  "status" : "Created"
}, statusCode=200}]
     
     - parameter jobId: (path) Job ID 
     - parameter details: (query) Include details of execution, including job results or error information (optional)

     - returns: RequestBuilder<InfrastructureascodeJob> 
     */
    open class func getInfrastructureascodeJobWithRequestBuilder(jobId: String, details: Bool? = nil) -> RequestBuilder<InfrastructureascodeJob> {        
        var path = "/api/v2/infrastructureascode/jobs/{jobId}"
        let jobIdPreEscape = "\(jobId)"
        let jobIdPostEscape = jobIdPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        path = path.replacingOccurrences(of: "{jobId}", with: jobIdPostEscape, options: .literal, range: nil)
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        var requestUrl = URLComponents(string: URLString)
        requestUrl?.queryItems = APIHelper.mapValuesToQueryItems([
            "details": details
        ])

        let requestBuilder: RequestBuilder<InfrastructureascodeJob>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    
    
    
    
    
    public enum SortBy_getInfrastructureascodeJobs: String { 
        case _id = "id"
        case datesubmitted = "dateSubmitted"
        case submittedby = "submittedBy"
        case acceleratorid = "acceleratorId"
        case status = "status"
    }
    
    
    
    public enum SortOrder_getInfrastructureascodeJobs: String { 
        case asc = "asc"
        case desc = "desc"
    }
    
    
    
    
    
    
    
    public enum Status_getInfrastructureascodeJobs: String { 
        case created = "Created"
        case queued = "Queued"
        case running = "Running"
        case complete = "Complete"
        case failed = "Failed"
        case incomplete = "Incomplete"
    }
    
    
    /**
     Get job history
     
     - parameter maxResults: (query) Number of jobs to show (optional)
     - parameter includeErrors: (query) Include error messages (optional)
     - parameter sortBy: (query) Sort by (optional)
     - parameter sortOrder: (query) Sort order (optional)
     - parameter acceleratorId: (query) Find only jobs associated with this accelerator (optional)
     - parameter submittedBy: (query) Find only jobs submitted by this user (optional)
     - parameter status: (query) Find only jobs in this state (optional)
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func getInfrastructureascodeJobs(maxResults: Int? = nil, includeErrors: Bool? = nil, sortBy: SortBy_getInfrastructureascodeJobs? = nil, sortOrder: SortOrder_getInfrastructureascodeJobs? = nil, acceleratorId: String? = nil, submittedBy: String? = nil, status: Status_getInfrastructureascodeJobs? = nil, completion: @escaping ((_ data: InfrastructureascodeJob?,_ error: Error?) -> Void)) {
        let requestBuilder = getInfrastructureascodeJobsWithRequestBuilder(maxResults: maxResults, includeErrors: includeErrors, sortBy: sortBy, sortOrder: sortOrder, acceleratorId: acceleratorId, submittedBy: submittedBy, status: status)
        requestBuilder.execute { (response: Response<InfrastructureascodeJob>?, error) -> Void in
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
     Get job history
     - GET /api/v2/infrastructureascode/jobs
     - Get a history of submitted jobs, optionally including error messages.
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "submittedBy" : "{}",
  "dryRun" : true,
  "selfUri" : "https://openapi-generator.tech",
  "errorInfo" : "{}",
  "id" : "id",
  "acceleratorId" : "acceleratorId",
  "results" : "results",
  "dateSubmitted" : "2000-01-23T04:56:07.000+00:00",
  "status" : "Created"
}, statusCode=200}]
     
     - parameter maxResults: (query) Number of jobs to show (optional)
     - parameter includeErrors: (query) Include error messages (optional)
     - parameter sortBy: (query) Sort by (optional)
     - parameter sortOrder: (query) Sort order (optional)
     - parameter acceleratorId: (query) Find only jobs associated with this accelerator (optional)
     - parameter submittedBy: (query) Find only jobs submitted by this user (optional)
     - parameter status: (query) Find only jobs in this state (optional)

     - returns: RequestBuilder<InfrastructureascodeJob> 
     */
    open class func getInfrastructureascodeJobsWithRequestBuilder(maxResults: Int? = nil, includeErrors: Bool? = nil, sortBy: SortBy_getInfrastructureascodeJobs? = nil, sortOrder: SortOrder_getInfrastructureascodeJobs? = nil, acceleratorId: String? = nil, submittedBy: String? = nil, status: Status_getInfrastructureascodeJobs? = nil) -> RequestBuilder<InfrastructureascodeJob> {        
        let path = "/api/v2/infrastructureascode/jobs"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body: Data? = nil
        
        var requestUrl = URLComponents(string: URLString)
        requestUrl?.queryItems = APIHelper.mapValuesToQueryItems([
            "maxResults": maxResults?.encodeToJSON(), 
            "includeErrors": includeErrors, 
            "sortBy": sortBy?.rawValue, 
            "sortOrder": sortOrder?.rawValue, 
            "acceleratorId": acceleratorId, 
            "submittedBy": submittedBy, 
            "status": status?.rawValue
        ])

        let requestBuilder: RequestBuilder<InfrastructureascodeJob>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", url: requestUrl!, body: body)
    }

    
    
    /**
     Create a Job
     
     - parameter body: (body)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    open class func postInfrastructureascodeJobs(body: AcceleratorInput, completion: @escaping ((_ data: InfrastructureascodeJob?,_ error: Error?) -> Void)) {
        let requestBuilder = postInfrastructureascodeJobsWithRequestBuilder(body: body)
        requestBuilder.execute { (response: Response<InfrastructureascodeJob>?, error) -> Void in
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
     Create a Job
     - POST /api/v2/infrastructureascode/jobs
     - Create and submit a job for remote execution or see job planning results.
     - OAuth:
       - type: oauth2
       - name: PureCloud OAuth
     - examples: [{contentType=application/json, example={
  "submittedBy" : "{}",
  "dryRun" : true,
  "selfUri" : "https://openapi-generator.tech",
  "errorInfo" : "{}",
  "id" : "id",
  "acceleratorId" : "acceleratorId",
  "results" : "results",
  "dateSubmitted" : "2000-01-23T04:56:07.000+00:00",
  "status" : "Created"
}, statusCode=200}]
     
     - parameter body: (body)  

     - returns: RequestBuilder<InfrastructureascodeJob> 
     */
    open class func postInfrastructureascodeJobsWithRequestBuilder(body: AcceleratorInput) -> RequestBuilder<InfrastructureascodeJob> {        
        let path = "/api/v2/infrastructureascode/jobs"
        let URLString = PureCloudPlatformClientV2API.basePath + path
        let body = JSONEncodingHelper.encodingParameters(forEncodableObject: body)

        let requestUrl = URLComponents(string: URLString)

        let requestBuilder: RequestBuilder<InfrastructureascodeJob>.Type = PureCloudPlatformClientV2API.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "POST", url: requestUrl!, body: body)
    }

}