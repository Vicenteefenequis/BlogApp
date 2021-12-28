//
//  MainQueueDispatchDecorator.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation

public final class MainQueueDispatchDecorator<T> {
    private let instance: T

    public init(_ instance: T) {
        self.instance = instance
    }

    func dispatch(completion: @escaping () -> Void) {
        guard Thread.isMainThread else { return DispatchQueue.main.async(execute: completion) }
        completion()
    }
}

extension MainQueueDispatchDecorator: LoadPost where T: LoadPost {
    public func load(completion: @escaping (LoadPost.Result) -> Void) {
        instance.load() { [weak self] result in
            self?.dispatch { completion(result) }
        }
    }
}





