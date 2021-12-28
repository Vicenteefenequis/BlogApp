//
//  LoadPost.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation

public protocol LoadPost {
    typealias Result = Swift.Result<PostModel,DomainError>
    func load(completion: @escaping(Result) -> Void)
}
