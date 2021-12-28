//
//  DomainError.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


public enum DomainError: Error {
    case unexpected
    case emailInUse
    case expiredSession
}
