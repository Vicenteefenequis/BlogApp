//
//  HttpError.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


public enum HttpError: Error {
    case noConnectivity
    case badRequest
    case serverError
    case unauthorized
    case forbidden
}
