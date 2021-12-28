//
//  ResultState.swift
//  Blog
//
//  Created by Vicente on 27/12/21.
//

import Foundation


enum ResultState {
    case loading
    case success(content: [Blog])
    case failed(error: Error)
}


