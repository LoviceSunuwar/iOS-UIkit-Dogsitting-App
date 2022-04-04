//
//  Session+Extension.swift
//  Pawsome
//
//  Created by Roch on 4/3/22.
//

import Foundation
import Alamofire

extension Session {
    
    public static func nsRequest(_ convertible: URLConvertible,
                               method: HTTPMethod = .get,
                               parameters: Parameters? = nil,
                               encoding: ParameterEncoding = URLEncoding.default,
                               headers: HTTPHeaders? = nil,
                               interceptor: RequestInterceptor? = nil,
                               requestModifier: RequestModifier? = nil) -> DataRequest {
        let apiToken = GlobalConstants.KeyValues.token ?? ""
        let header = [
            "Authorization" : "Bearer \(apiToken)",
            "Accept" : "application/json"
        ]
        return AF.request(convertible,
                          method: method,
                          parameters: parameters,
                          encoding: encoding,
                          headers: HTTPHeaders.init(header),
                          interceptor: interceptor,
                          requestModifier: requestModifier)
    }
    
}