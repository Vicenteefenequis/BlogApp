//
//  BlogEndpoint.swift
//  Blog
//
//  Created by Vicente on 28/12/21.
//

import Foundation



protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}


enum BlogAPI {
    case getPosts
}

extension BlogAPI: APIBuilder {
 
    var urlRequest: URLRequest {
        var request = URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        request.setValue("3kNK1HiMH41UkI2irIWVB29AkVkWvqcH2hySl1dZ", forHTTPHeaderField: "X-Api-Key")
        return request
    }
    
    var baseUrl: URL {
        switch self {
        case .getPosts:
            return URL(string: "https://xwty58thd3.execute-api.sa-east-1.amazonaws.com/dev")!
        }
    }
    
    var path: String {
        return "/forum"
    }
    
    
}
