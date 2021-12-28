//
//  PostModel.swift
//  Blog
//
//  Created by Vicente on 21/12/21.
//

import Foundation


public struct PostModel: Model {
    public var idPost: Int
    public var title: String
    public var description: String
    public var image: String
    
    public init(idPost:Int,title:String,description:String,image:String) {
        self.idPost = idPost
        self.title = title
        self.description = description
        self.image = image
    }
  
}


