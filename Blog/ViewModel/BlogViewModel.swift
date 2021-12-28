//
//  PostViewModel.swift
//  Blog
//
//  Created by Vicente on 28/12/21.
//

import Foundation
import Combine

protocol BlogViewModel {
    func getPosts()
}


class BlogViewModelImpl : ObservableObject, BlogViewModel {
    private let service: BlogService
    
    private(set) var posts = [Blog]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: BlogService) {
        self.service = service
    }
    
    func getPosts() {
        self.state = .loading
        let cancellable = service
            .request(from: .getPosts)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.posts)
                case .failure(let error):
                    self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.posts = response.posts
            }
        
        self.cancellables.insert(cancellable)
    }
    
    
}
