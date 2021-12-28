//
//  HttpPostClient.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation

public protocol HttpGetClient {
    func get(to url: URL, completion: @escaping (Result<Data?, HttpError>) -> Void)
}
