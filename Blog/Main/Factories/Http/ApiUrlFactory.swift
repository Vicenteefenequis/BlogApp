//
//  ApiUrlFactory.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


func makeApiUrl(path: String) -> URL {
    return URL(string: "https://xwty58thd3.execute-api.sa-east-1.amazonaws.com/dev/\(path)")!
}
