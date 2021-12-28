//
//  RemoteLoadPost.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


func makeRemoteLoadPost(httpClient: HttpGetClient) -> LoadPost {
    let remoteLoadPost = RemoteLoadPost(url: makeApiUrl(path: "/forum"), httpClient: httpClient)
    return MainQueueDispatchDecorator(remoteLoadPost)
}
