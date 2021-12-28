//
//  PostService.swift
//  Blog
//
//  Created by Vicente on 28/12/21.
//

import Foundation
import Combine


protocol BlogService {
    func request(from endpoint: BlogAPI) -> AnyPublisher<BlogResponse,APIError>
}


struct BlogServiceImpl: BlogService {
    func request(from endpoint: BlogAPI) -> AnyPublisher<BlogResponse, APIError> {
        return URLSession.shared.dataTaskPublisher(for: endpoint.urlRequest)
            .receive(on: DispatchQueue.main)
            .mapError { _ in APIError.unknown }
            .flatMap { data, response -> AnyPublisher<BlogResponse,APIError> in
                guard let response = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown).eraseToAnyPublisher()
                }
                
                if (200...299).contains(response.statusCode) {
                    return Just(data)
                        .decode(type: BlogResponse.self, decoder: JSONDecoder())
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.errorCode(response.statusCode)).eraseToAnyPublisher()
                }
            }
            .eraseToAnyPublisher()
    }
    
    
}
