//
//  RemoteLoadPost.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


public final class RemoteLoadPost: LoadPost {
    private let url: URL
    private let httpClient: HttpGetClient

    public init(url: URL, httpClient: HttpGetClient) {
        self.url = url
        self.httpClient = httpClient
    }

    public func load(completion: @escaping (LoadPost.Result) -> Void)  {
        httpClient.get(to: url) { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let data):
                if let model: PostModel = data?.toModel() {
                    completion(.success(model))
                } else {
                    completion(.failure(.unexpected))
                }
            case .failure(let error):
                switch error {
                case .forbidden:
                    completion(.failure(.emailInUse))
                default:
                    completion(.failure(.unexpected))
                }
            }
        }
    }
}
