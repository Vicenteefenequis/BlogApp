//
//  PostResponse.swift
//  Blog
//
//  Created by Vicente on 27/12/21.
//

import Foundation


struct BlogResponse: Codable {
    let posts: [Blog]
}

// MARK: - WelcomeElement
struct Blog: Codable, Identifiable {
    let id = UUID()
    let idPost: Int?
    let title, postDescription: String?
    let image: String?


    enum CodingKeys: String, CodingKey {
        case idPost, title
        case postDescription = "description"
        case image
    }
}



extension Blog {
    static var dummyData: Blog {
        .init(idPost: 1, title: "Disney, Gina Carano Firing denounced as Hollywoord Black List, against conservatives - Fox News", postDescription: "Conservative actress Gina Carano found rare support among liberals in the mainstream media following", image: "https://s3-file-uploader-bucket-prod.s3.sa-east-1.amazonaws.com/images/2021-12-16T18%3A12%3A32.119Z.jpeg")
    }
}
