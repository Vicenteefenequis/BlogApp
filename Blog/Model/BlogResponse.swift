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
        .init(idPost: 1, title: "Disney, Gina Carano Firing denounced as Hollywoord Black List, against conservatives - Fox News", postDescription: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
              image: "https://s3-file-uploader-bucket-prod.s3.sa-east-1.amazonaws.com/images/2021-12-16T18%3A12%3A32.119Z.jpeg")
    }
}
